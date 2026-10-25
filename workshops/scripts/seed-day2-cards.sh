#!/usr/bin/env bash
# สร้าง Label · Milestone · การ์ด (Issue) ของวันที่ 2 ใน ubu-biolink: การ์ด Design Doc กลุ่มละ 1 + การ์ดโมดูล 16 ใบ
# ใช้: bash workshops/scripts/seed-day2-cards.sh <OWNER>/ubu-biolink [เลข Project ของผู้สอน]
# รันจากรากของ repo หลักสูตร · ต้องมี gh (login แล้ว และมีสิทธิ์ Write ใน repo ปลายทาง)
# ถ้าใส่เลข Project จะเพิ่มทุกการ์ดเข้า Board ให้ด้วย (gh ต้องมี scope project: gh auth refresh -s project)
set -euo pipefail

REPO="${1:?ระบุ repo เช่น ocka1234/ubu-biolink}"
PROJECT="${2:-}"
OWNER="${REPO%%/*}"
CARDS="$(dirname "$0")/../day2/cards"
MILESTONE="BioLink Workshop (29 ต.ค.)"

label() { gh label create "$1" -R "$REPO" --color "$2" --description "$3" --force >/dev/null; }
label "type: feature" 1D76DB "ฟีเจอร์ใหม่"
label "type: design"  C5DEF5 "งานออกแบบ (Design Doc ของกลุ่ม)"
label "extra"         FEF2C0 "Extra Feature หลังถึง Core Done"
label "group: 1-academic" 0E8A16 "กลุ่ม 1 Academic Portfolio"
label "group: 2-teaching" 0E8A16 "กลุ่ม 2 Teaching Documents"
label "group: 3-services" 0E8A16 "กลุ่ม 3 Services & Contact"
label "group: 4-community" 0E8A16 "กลุ่ม 4 Activities & Community"

gh api "repos/$REPO/milestones" -f title="$MILESTONE" >/dev/null 2>&1 || true   # มีอยู่แล้วก็ข้าม

add() {   # add <ไฟล์การ์ด> <label...> → พิมพ์ URL ของ Issue
  local file="$1"; shift
  local title; title="$(head -n 1 "$file" | sed 's/^# //')"
  local args=(); for l in "$@"; do args+=(--label "$l"); done
  local url; url="$(gh issue create -R "$REPO" --title "$title" --body-file "$file" --milestone "$MILESTONE" "${args[@]}")"
  echo "$url"
  if [ -n "$PROJECT" ]; then gh project item-add "$PROJECT" --owner "$OWNER" --url "$url" >/dev/null; fi
}

add "$CARDS/G1-0-design.md" "type: design" "group: 1-academic"
add "$CARDS/G1-A-research.md" "type: feature" "group: 1-academic"
add "$CARDS/G1-B-cv.md" "type: feature" "group: 1-academic"
add "$CARDS/G1-C-credentials.md" "type: feature" "group: 1-academic"
add "$CARDS/G1-D-awards.md" "type: feature" "group: 1-academic"

add "$CARDS/G2-0-design.md" "type: design" "group: 2-teaching"
add "$CARDS/G2-A-courses.md" "type: feature" "group: 2-teaching"
add "$CARDS/G2-B-materials.md" "type: feature" "group: 2-teaching"
add "$CARDS/G2-C-schedule.md" "type: feature" "group: 2-teaching"
add "$CARDS/G2-D-notices.md" "type: feature" "group: 2-teaching"

add "$CARDS/G3-0-design.md" "type: design" "group: 3-services"
add "$CARDS/G3-A-contacts.md" "type: feature" "group: 3-services"
add "$CARDS/G3-B-services.md" "type: feature" "group: 3-services"
add "$CARDS/G3-C-faq.md" "type: feature" "group: 3-services"
add "$CARDS/G3-D-messages.md" "type: feature" "group: 3-services"

add "$CARDS/G4-0-design.md" "type: design" "group: 4-community"
add "$CARDS/G4-A-talks.md" "type: feature" "group: 4-community"
add "$CARDS/G4-B-students.md" "type: feature" "group: 4-community"
add "$CARDS/G4-C-gallery.md" "type: feature" "group: 4-community"
add "$CARDS/G4-D-news.md" "type: feature" "group: 4-community"

echo "สร้างการ์ด 20 ใบใน $REPO แล้ว (Milestone: $MILESTONE)"
