# Day 2 kit สำหรับ ubu-biolink — Memory hub + Designer → Builder → Reviewer + AI Review bot

ชุดไฟล์นี้ทำให้ ubu-biolink (branch `instructor/revamp-workshop-base`: Postgres, feature plugin, 5 กลุ่ม × 4 โมดูล) มีไฟล์ .md แบบเดียวกับ `practice-app` ของวันที่ 1
**path ตรงกันทั้งสองวัน:** `AGENTS.md`, `docs/specs/_TEMPLATE.md`, `docs/memory/decisions.md`, `.clinerules/workflows/check-before-pr.md` — ผู้เรียนเจอไฟล์ชื่อเดิมในตำแหน่งเดิม

> ผู้สอนเป็นคนนำเข้า ubu-biolink ผ่าน PR เอง — ไม่ commit ตรงเข้า `main` และคัดลอกทุกไฟล์ **ยกเว้น README-KIT.md นี้**

## ไฟล์ในชุดนี้

| ไฟล์ | หน้าที่ | ต่างจากวันที่ 1 | PR |
|---|---|---|---|
| `AGENTS.md` | กติกา AI: stack, ขอบเขตไฟล์, ช่วงเลข migration, API, บทบาท, Memory protocol | เพิ่ม "บทบาท" + "Memory protocol" | 1 |
| `docs/memory/README.md` | กติกาของ Memory hub | – | 1 |
| `docs/memory/decisions.md` | D-001…D-007 (plugin, Postgres, ช่วง migration, auth, สัญญาระหว่างกลุ่ม, upload/audit กลาง, แบ่งงานแนวตั้ง) | ไฟล์เดียวกัน เนื้อหาของ BioLink | 1 |
| `docs/memory/conventions.md` | รูปแบบ API, Error, DB, Web, Git | ใหม่ | 1 |
| `docs/memory/glossary.md` | คำศัพท์ ↔ ชื่อในโค้ด | ใหม่ | 1 |
| `docs/memory/lessons.md` | สิ่งที่ AI พลาดบ่อย (ใส่ไว้ 6 ข้อ) | ใหม่ | 1 |
| `docs/specs/_TEMPLATE.md` | แม่แบบ Spec 11 หัวข้อ | 9 หัวข้อเดิม + **4 สิทธิ์** + **9 กรณีทดสอบ** | 1 |
| `docs/handoff/_TEMPLATE.md` | Handoff 4 ส่วน: Design → Build → Review (AI) → Human | ใหม่ | 1 |
| `.clinerules/workflows/design.md`, `build.md`, `review.md` | Workflow ของ Cline ตามบทบาท (`/design.md` ฯลฯ) | ใหม่ | 1 |
| `.clinerules/workflows/check-before-pr.md` | ตรวจก่อนเปิด PR | คำสั่งเป็น `npm test` + `npm run build:web`, base = branch กลุ่ม | 1 |
| `.kilo/agents/designer.md`, `reviewer.md` | Agent ของ Kilo Code (จำกัดสิทธิ์แก้ไฟล์ / รันคำสั่ง) | ใหม่ | 1 |
| `.github/ai-review/checklist.md` | Checklist ที่ Reviewer (AI และคน) ใช้ | ใหม่ | 2 |
| `.github/CODEOWNERS` | ไฟล์ส่วนกลางต้องให้ผู้สอนรีวิว (แทน `@INSTRUCTOR` ก่อน) | ใหม่ | 2 |
| `.github/workflows/ai-review.yml` + `scripts/ai-review.mjs` | AI Review bot โพสต์ Comment ใน PR | ใหม่ | 2 |

ไฟล์เดิมของ ubu-biolink ที่ชุดนี้ **ไม่แตะ:** `.github/workflows/ci.yml`, `.github/pull_request_template.md`, `README.md`, `docs/features.md`, `docs/api-spec.md`, โค้ดทั้งหมดใน `apps/`

## ทำไมแยก 2 PR

- **PR 1 (ไฟล์ .md, `.clinerules/`, `.kilo/`)** ไม่มีผลกับการรันระบบหรือ CI — merge ได้ทันทีก่อนวันอบรม
- **PR 2 (`.github/`, `scripts/`)** เปลี่ยนพฤติกรรมของ GitHub: CODEOWNERS ขอรีวิวอัตโนมัติ และ AI Review ใช้ API Key — merge เมื่อพร้อมตั้งค่าด้านล่างแล้วเท่านั้น

## วิธีนำเข้า (ผู้สอนทำในเครื่องตัวเอง)

```bash
cd ubu-biolink
git switch instructor/revamp-workshop-base && git pull
git switch -c instructor/day2-kit-docs
# คัดลอกไฟล์ของ PR 1 จากโฟลเดอร์นี้ (ไม่รวม .github/ และ scripts/)
cp -r <path>/day2-kit-biolink/{AGENTS.md,docs,.clinerules,.kilo} .
git add AGENTS.md docs/memory docs/specs docs/handoff .clinerules .kilo
git commit -m "docs: add AGENTS.md, memory hub, spec/handoff templates and agent workflows"
git push -u origin instructor/day2-kit-docs
# เปิด PR เข้า branch ที่จะใช้สอน (instructor/revamp-workshop-base หรือ main หลัง revamp ถูก merge)
```

PR 2 ทำแบบเดียวกันด้วย branch `instructor/day2-kit-review` และไฟล์ `.github/CODEOWNERS`, `.github/ai-review/`, `.github/workflows/ai-review.yml`, `scripts/ai-review.mjs`

## ตั้งค่าก่อน merge PR 2

1. แทน `@INSTRUCTOR` ใน `.github/CODEOWNERS` ด้วย username จริง (ตรวจได้ที่หน้า CODEOWNERS บน GitHub ว่าไม่มีเส้นแดง)
2. Settings → Secrets and variables → Actions:
   - Variables: `LLM_BASE_URL` (OpenAI-compatible เช่น `https://openrouter.ai/api/v1`), `LLM_MODEL`
   - Secret: `LLM_API_KEY`
   - ถ้ายังไม่ตั้ง bot จะข้ามการรีวิวเอง (ไม่ทำให้ PR ล้ม)
3. Issues → Labels → สร้าง Label `ai-review` (ใช้สั่งรีวิวซ้ำ)
4. Ruleset ของ `main`: Require PR + required checks `CI / api`, `CI / web` + (ถ้าต้องการ) "Require review from Code Owners" — **ห้ามใส่ AI Review เป็น required check**

## ข้อจำกัดแพ็กเกจ GitHub

ubu-biolink เป็น **private repo ของบัญชีส่วนตัวบนแพ็กเกจ Free** → Rulesets / Branch protection / บังคับ CODEOWNERS **ใช้ไม่ได้** (GitHub ตอบ "Upgrade to GitHub Pro or make this repository public")
ทางเลือก (รายละเอียดใน `workshops/00-instructor-prep.md` หัวข้อ H):

- ย้ายไป Organization ที่ใช้ GitHub Team หรือ GitHub Education (ฟรีสำหรับสถานศึกษา)
- อัปเกรดบัญชีเจ้าของเป็น GitHub Pro
- ถ้าทำไม่ทัน: ใช้ไฟล์ชุดนี้ได้ตามปกติ (AGENTS.md / memory / workflow ไม่ต้องพึ่ง Ruleset) แต่การห้าม push ตรง `main` และการบังคับรีวิวต้องใช้กติกาในห้องแทน และผู้สอนตรวจ PR เอง

## ตรวจหลังนำเข้า

- [ ] เปิด Cline แล้วพิมพ์ `/` เห็น `design.md`, `build.md`, `review.md`, `check-before-pr.md`
- [ ] Kilo Code เห็น agent `designer` และ `reviewer` ในรายการ mode
- [ ] สั่ง Designer กับ Issue ทดลอง 1 ใบ → ได้ `docs/specs/<เลข>-*.md` + `docs/handoff/<เลข>.md` และ AI ไม่แก้ไฟล์อื่น
- [ ] (หลัง PR 2) เปิด PR ทดลอง → มี Comment "🤖 AI Review" ภายใน ~1 นาที
