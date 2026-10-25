# WS3.1 — Issue Template และ Label ของทีม

| | |
|---|---|
| **ตำแหน่ง** | Day 1 · Session 3 |
| **เวลา** | 25 นาที |
| **รูปแบบ** | ทีม (คนที่ 1 ทำไฟล์ template · คนที่ 2 ทำ label · คนที่ 3 ทำ PR/Review · ที่เหลือเขียน Issue จริง) |
| **สไลด์** | หน้า 46 |
| **ผลลัพธ์** | repo ทีมมีแม่แบบ Issue 3 แบบ + ชุด Label มาตรฐาน และมี Issue จริง 1 ใบต่อคน |

## 🎯 เป้าหมาย

ทำให้ทุก Issue ของทีมมี **โครงสร้างเดียวกัน** (story + Acceptance Criteria + label) — เพราะวันพรุ่งนี้ทั้งคนและ AI จะอ่าน Issue เพื่อรู้ว่าต้องสร้างอะไร

## 📋 ต้องมีก่อนเริ่ม

- ผ่าน WS2.x (repo ทีมมี Ruleset: ต้องเปิด PR) — งานนี้ทำผ่านกิ่ง + PR
- `gh` ล็อกอินแล้ว

## 👉 ขั้นตอน

### ขั้นที่ 1 — สร้างกิ่งและแม่แบบ Issue (Feature)

```bash
git switch main && git pull
git switch -c chore/issue-templates
mkdir -p .github/ISSUE_TEMPLATE
```

สร้างไฟล์ **`.github/ISSUE_TEMPLATE/feature.yml`**:

```yaml
name: Feature
description: ฟีเจอร์ใหม่ของโมดูล
title: "[Feature]: "
labels: ["type: feature"]
body:
  - type: textarea
    id: story
    attributes:
      label: User story
      description: ในฐานะ ... ฉันต้องการ ... เพื่อ ...
    validations:
      required: true
  - type: textarea
    id: ac
    attributes:
      label: Acceptance Criteria
      description: เขียนให้ตรวจได้ว่า "ผ่าน" หรือ "ไม่ผ่าน"
      value: "- [ ] "
    validations:
      required: true
  - type: textarea
    id: scope
    attributes:
      label: ขอบเขต (ทำ / ไม่ทำ)
  - type: dropdown
    id: module
    attributes:
      label: โมดูล
      options: [edit, search, pin, category, stats, ack, export, theme]
    validations:
      required: true
```

### ขั้นที่ 2 — เพิ่ม `bug.yml` และ `task.yml`

**`.github/ISSUE_TEMPLATE/bug.yml`**

```yaml
name: Bug
description: แจ้งปัญหาที่พบ
title: "[Bug]: "
labels: ["type: bug"]
body:
  - type: textarea
    id: steps
    attributes:
      label: ขั้นตอนทำซ้ำ
      value: "1. \n2. \n3. "
    validations:
      required: true
  - type: textarea
    id: actual
    attributes:
      label: ผลที่เห็น
    validations:
      required: true
  - type: textarea
    id: expected
    attributes:
      label: ผลที่คาดหวัง
    validations:
      required: true
  - type: dropdown
    id: module
    attributes:
      label: โมดูล
      options: [edit, search, pin, category, stats, ack, export, theme]
```

**`.github/ISSUE_TEMPLATE/task.yml`**

```yaml
name: Task
description: งานย่อยที่ต้องทำ (เอกสาร ตั้งค่า งานเทคนิค)
title: "[Task]: "
labels: ["type: task"]
body:
  - type: textarea
    id: what
    attributes:
      label: ต้องทำอะไร
    validations:
      required: true
  - type: textarea
    id: done
    attributes:
      label: เสร็จเมื่อ
      value: "- [ ] "
    validations:
      required: true
```

และไฟล์ **`.github/ISSUE_TEMPLATE/config.yml`** (ปิดการเปิด Issue ว่างเปล่า):

```yaml
blank_issues_enabled: false
```

### ขั้นที่ 3 — สร้างชุด Label

คนที่ 2 รันสคริปต์ใน repo ของทีม (ใช้ `--force` เพื่ออัปเดตถ้ามีอยู่แล้ว):

**macOS / Git Bash**

```bash
R=<OWNER>/<REPO>
gh label create "type: feature"   -R $R --color 1D76DB --description "ฟีเจอร์ใหม่" --force
gh label create "type: bug"       -R $R --color D73A4A --description "แก้บั๊ก" --force
gh label create "type: task"      -R $R --color 0E8A16 --description "งานย่อย/เอกสาร/ตั้งค่า" --force
gh label create "priority: high"   -R $R --color B60205 --description "ทำก่อน" --force
gh label create "priority: medium" -R $R --color FBCA04 --description "ปกติ" --force
gh label create "priority: low"    -R $R --color C2E0C6 --description "ทำทีหลัง" --force
for m in edit search pin category stats ack export theme; do
  gh label create "module: $m" -R $R --color BFD4F2 --description "โมดูล $m" --force
done
gh label create "good first issue" -R $R --color 7057FF --description "เหมาะกับคนเริ่มต้น" --force
gh label create "blocked"          -R $R --color 000000 --description "ติดอยู่ รออย่างอื่น" --force
gh label create "ai-review"        -R $R --color 5319E7 --description "สั่งให้ AI Review bot รีวิว PR นี้" --force
```

**Windows PowerShell**

```powershell
$R = "<OWNER>/<REPO>"
gh label create "type: feature" -R $R --color 1D76DB --description "ฟีเจอร์ใหม่" --force
gh label create "type: bug" -R $R --color D73A4A --description "แก้บั๊ก" --force
gh label create "type: task" -R $R --color 0E8A16 --description "งานย่อย/เอกสาร/ตั้งค่า" --force
gh label create "priority: high" -R $R --color B60205 --description "ทำก่อน" --force
gh label create "priority: medium" -R $R --color FBCA04 --description "ปกติ" --force
gh label create "priority: low" -R $R --color C2E0C6 --description "ทำทีหลัง" --force
foreach ($m in "edit","search","pin","category","stats","ack","export","theme") {
  gh label create "module: $m" -R $R --color BFD4F2 --description "โมดูล $m" --force
}
gh label create "good first issue" -R $R --color 7057FF --description "เหมาะกับคนเริ่มต้น" --force
gh label create "blocked" -R $R --color 000000 --description "ติดอยู่ รออย่างอื่น" --force
gh label create "ai-review" -R $R --color 5319E7 --description "สั่งให้ AI Review bot รีวิว PR นี้" --force
```

✅ **ต้องเห็น:** `gh label list -R <OWNER>/<REPO>` แสดง label ทั้ง 4 กลุ่ม

### ขั้นที่ 4 — เปิด PR และ merge

```bash
git add .github
git commit -m "chore: add issue templates"
git push -u origin chore/issue-templates
gh pr create --base main --fill
```

ให้เพื่อน Review → Approve → **Squash and merge**

### ขั้นที่ 5 — ตรวจว่าแม่แบบขึ้น

เปิด repo → แท็บ **Issues** → **New issue**

✅ **ต้องเห็น:** ตัวเลือก **Bug / Feature / Task**

### ขั้นที่ 6 — เปิด Issue จริง 1 ใบต่อคน

ใช้แม่แบบ **Feature** เขียนฟีเจอร์เล็ก ๆ ที่โมดูลของทีมน่าจะมี เช่น (ทีมค้นหา)

> **User story:** ในฐานะเจ้าหน้าที่ ฉันต้องการค้นเอกสารด้วยแท็ก เพื่อหาเอกสารได้เร็ว
> **Acceptance Criteria:**
> - [ ] ค้นด้วยแท็กหนึ่งแท็กแล้วได้เฉพาะเอกสารที่มีแท็กนั้น
> - [ ] ถ้าไม่มีเอกสารที่ตรง คืนรายการว่าง (ไม่ใช่ error)
> - [ ] ไม่มี Token → 401

แล้วติด Label: `type: feature`, `module: <โมดูลของทีม>`, `priority: medium`

## ✅ Checkpoint (ตรวจตัวเอง)

- [ ] New issue แสดงตัวเลือก 3 แบบและไม่มี "Open a blank issue"
- [ ] Issue ของคุณมี Acceptance Criteria เป็น checkbox อย่างน้อย 3 ข้อ ที่ **ตรวจได้**
- [ ] ติด Label ครบ type / module / priority

## 🔧 ปัญหาที่พบบ่อย

| อาการ | สาเหตุ | วิธีแก้ |
|---|---|---|
| New issue ไม่ขึ้นแม่แบบ | ไฟล์ยังไม่ merge เข้า `main` หรือ YAML ผิด | ตรวจว่าอยู่บน `main` ที่ path `.github/ISSUE_TEMPLATE/` และ indent ถูก (ใช้ space ไม่ใช่ tab) |
| `gh label create` ถามสิทธิ์ | ใช้ `-R` ผิด repo | ตรวจชื่อ `<OWNER>/<REPO>` |
| AC เขียนว่า "ระบบต้องเร็ว" | ตรวจไม่ได้ | เขียนใหม่เป็นตัวเลข/เงื่อนไข เช่น "ตอบภายใน 1 วินาที เมื่อมี 10,000 รายการ" |

## 🧪 ท้าทายเพิ่ม

- แลก Issue กับเพื่อน แล้วให้เพื่อนบอกว่า AC ข้อไหน "ตรวจไม่ได้" — ช่วยกันแก้
- เพิ่มช่อง **Priority** เป็น dropdown ใน `feature.yml`

## 🧑‍🏫 หมายเหตุสำหรับผู้สอน/TA

- เชื่อมกับ Day 2: AC ที่ตรวจได้ = โจทย์ที่ AI เข้าใจตรงกัน และเป็นเกณฑ์ของ "ประตูมนุษย์ที่ 1" (5 คำถามก่อนอนุมัติ Spec)
- ถ้า repo ใช้ GitHub **Issue types** (Bug/Feature/Task ระดับ Organization) ได้ ให้ผู้สอนตัดสินใจว่าจะใช้ควบกับ label หรือไม่ — เอกสารนี้ใช้ label เพราะรองรับทุกแพ็กเกจ
- แจกไฟล์ yml/สคริปต์ label ให้คัดลอกได้เลย ใช้เวลาไปกับการ **เขียน AC** ไม่ใช่การพิมพ์ YAML

**ต่อไป →** [WS3.2 สร้าง Kanban Board](ws-3.2-kanban-board.md)
