# 00 — เตรียมความพร้อมก่อนวันอบรม (ผู้สอน + TA)

เอกสารนี้คือรายการที่ต้องทำให้เสร็จ **ก่อนวันอบรมอย่างน้อย 3 วัน** (ตัวหลักสูตรจัด 27–28 ต.ค. 2569)
ทำตามลำดับ แล้วติ๊กในคอลัมน์ ☐ แนะนำให้ซ้อมใหญ่ (Dry Run) ตาม *คู่มือจับมือทำ: Multi-agent + Memory Hub* ที่มีอยู่แล้ว อย่างน้อย 1 รอบ

## A. GitHub Organization (ใช้กับ Day 2 — Day 1 ไม่ต้องใช้ Org)

> Day 1 ผู้เรียนใช้บัญชีส่วนตัว: Module Lead สร้าง repo ทีมจาก Template เองใน WS1.2 (หัวข้อ B) — ตาราง A จึงเป็นของ Day 2 (ubu-biolink — ใช้เมื่อย้าย repo ไป Organization)

| ☐ | งาน | รายละเอียด |
|---|---|---|
| ☐ | Organization `ubu-central-dev-2569` | เปิด 2FA บังคับสำหรับสมาชิก (Settings → Authentication security) |
| ☐ | Team `maintainers` | ผู้สอน + ผู้ดูแลระบบของมหาวิทยาลัยที่ตัดสินใจ merge / อนุมัติ deploy |
| ☐ | Team `participants` | ผู้เรียนทั้งหมด — สิทธิ์ **Write** ใน `ubu-biolink` (ถ้าย้ายไป Organization) |
| ☐ | Team ย่อย `team-1` … `team-5` | แต่ละทีมผูกกับโมดูล (ใช้ใน `CODEOWNERS`) |
| ☐ | เชิญผู้เรียนจาก GitHub username ในแบบสำรวจ | ส่งคำเชิญล่วงหน้า 2–3 วัน และเตือนให้กด Accept |
| ☐ | Actions permissions | อนุญาต Actions ของ GitHub (`actions/*`); Workflow permissions: **Read and write** ถ้า Bot ต้อง comment (หรือกำหนด `pull-requests: write` ใน workflow) |
| ☐ | ตรวจแพ็กเกจที่ใช้ได้ | Rulesets, required reviewers ของ Environment, Secret scanning / Push protection / Code scanning **ใช้ได้เฉพาะกับ repo สาธารณะหรือแพ็กเกจที่รองรับ** — ตรวจก่อนสัญญากับผู้เรียน · ตรวจแล้ว 24 ต.ค.: repo private ของบัญชีฟรีตอบ *"Upgrade to GitHub Pro or make this repository public"* → repo ฝึก Day 1 ตั้งเป็น **public** (`NcKitt/dms-practice-template`, `NcKitt/dms-practice-dryrun`) แล้ว Ruleset ใช้ได้ · BioLink (private) ต้องใช้ทางเลือกในหัวข้อ "แพ็กเกจ GitHub" ด้านล่าง |

## B. Repo ฝึกหัด Day 1

| ☐ | งาน | รายละเอียด |
|---|---|---|
| ☐ | Template repo `dms-practice-template` | คัดลอกทุกไฟล์ใน [`practice-app/`](../practice-app/README.md) ไปไว้ที่ **ราก** ของ template (รวม `package-lock.json`, `.gitignore`, `.dockerignore`, `AGENTS.md`, `docs/`, `.clinerules/` แต่ **ไม่รวม `.github/`** ซึ่งเป็นเฉลยของ WS4.1) — มีสคริปต์ `dev`, `lint`, `test`, `start` + `Dockerfile`, `docker-compose.yml`, `ecosystem.config.cjs` สำหรับ WS4.5–4.6 แล้วตั้งเป็น Template repository |
| ☐ | ซ้อม Deploy บนเครื่องสะอาด | `docker compose up -d --build` → `:8080` และ `pm2 start ecosystem.config.cjs` → `:3000` ทั้งบน Windows และ macOS อย่างละ 1 เครื่อง |
| ☐ | ไฟล์ที่ต้องมีใน Template | `CONTRIBUTORS.md` (หัวข้อว่าง ๆ), `team-info.md` (มีบรรทัด `เวลาประชุมทีม: 10:00` สำหรับ WS2.2), `.gitignore` (มี `.env`), `.env.example`, `README.md` |
| ☐ | Template ต้องเป็น **Public** และติ๊ก **Template repository** | Module Lead กด **Use this template** สร้าง `dms-practice-team<N>` ใต้บัญชีตัวเอง (Public) ใน WS1.2 แล้วเชิญเพื่อน + `<INSTRUCTOR>` เป็น Collaborator — ผู้สอนไม่ต้องสร้าง repo ทีมเอง |
| ☐ | แจ้งค่าบนจอก่อน WS1.2 | `<TEMPLATE>` และ `<INSTRUCTOR>` · ให้แต่ละทีมเลือก Module Lead ไว้ก่อน (คนที่คล่อง GitHub หรือคนที่อยากฝึกเป็นผู้ดูแล) |
| ☐ | เก็บรายชื่อ repo ทีม | หลัง WS1.2 ให้ Module Lead ส่งลิงก์ `https://github.com/<OWNER>/<REPO>` มาในแชตห้อง แล้วกด Accept คำเชิญจากทุกทีม |
| ☐ | การ์ดฟีเจอร์ 8 ใบ (A–H) สำหรับ WS3.3 | ช่วงพักกลางวันของวันที่ 1 (หลัง Accept คำเชิญแล้ว) รัน `bash workshops/scripts/seed-day1-features.sh <OWNER>/<REPO>` ทุก repo ทีม — สร้าง Label + Issue จาก [day1/feature-cards/](day1/feature-cards/) |
| ☐ | ซ้อมฟีเจอร์ Day 1 ทั้งทีม (Dry Run 90′) | ตามแผนใน [day1/features-backlog.md](day1/features-backlog.md) หัวข้อ 6 — เฉลยสำหรับ TA อยู่ใน [day1/solutions/](day1/solutions/README.md) (ห้ามใส่ใน Template) |
| ☐ | ตรวจว่า `npm test` ผ่านใน Template | บนเครื่องสะอาดและใน CI (ดู WS4.1) |
| ☐ | สคริปต์ Label + ไฟล์ Issue Template ตัวอย่าง | เตรียมไว้ให้ผู้เรียนคัดลอกจาก WS3.1 |

## C. `ubu-biolink` สำหรับ Day 2

> Day 2 ใช้ ubu-biolink branch **`instructor/revamp-workshop-base`** (4 กลุ่ม × 4 โมดูล, Postgres) ซึ่งมีชุดไฟล์ AI และคู่มือของวันครบแล้ว
> รายการเตรียมฉบับเต็มอยู่ใน `docs/workshop/README.md` หัวข้อ H ของ repo นั้น — ตารางนี้สรุปเฉพาะที่ต้องทำก่อน 29 ต.ค.

| ☐ | งาน | รายละเอียด |
|---|---|---|
| ☐ | **ย้ายเฉลยออกก่อนเชิญผู้เรียน** | ผู้เรียนที่เป็น Collaborator เปิดดูได้ทุก branch — ย้าย branch `instructor/solution` และโฟลเดอร์ `instructor-only/` ไปไว้ใน repo แยก (private) ก่อนส่งคำเชิญ |
| ☐ | รวมชุดไฟล์เข้า `main` ก่อนแตก branch กลุ่ม | `AGENTS.md`, `.kilo/`, `.clinerules/`, `docs/memory·specs·handoff·workshop`, `.github/`, `scripts/` — workflow ของ AI Review bot ต้องอยู่ใน base branch ของ PR |
| ☐ | เตรียม skeleton 16 โมดูล | stub ทุกโมดูล, `lib/features.js`, `features/<กลุ่ม>/index.js`, `docs/api/group-N.md` ตาม `docs/features.md` §4.1 |
| ☐ | สร้าง branch กลุ่ม | `feature/academic` · `feature/teaching` · `feature/services` · `feature/community` จาก `main` แล้ว push |
| ☐ | AI Review bot | Secret `ANTHROPIC_API_KEY` (ไม่ตั้งก็ได้ — bot ยังตรวจกติกาแบบตายตัว) · Variables `AI_REVIEW_INSTRUCTORS` (login ผู้สอน) และ `AI_REVIEW_MODEL` ถ้าไม่ใช้ค่าเริ่มต้น |
| ☐ | `CODEOWNERS` | เปลี่ยนชื่อผู้สอน แล้วปลดคอมเมนต์บรรทัดกลุ่มคู่ (G1↔G2, G3↔G4) หลังรู้ username ผู้เรียน |
| ☐ | Branch protection / Ruleset ของ `main` | PR + CI (`CI / api`, `CI / web`) + code owner review — **ubu-biolink เป็น private ของบัญชีฟรี ใช้ Ruleset ไม่ได้** ดูหัวข้อ H |
| ☐ | เชิญผู้เรียนเป็น Collaborator | จาก username ที่ได้ใน WS4.4 (สิทธิ์ Write) |
| ☐ | **Project Board "BioLink Workshop"** | repo → Projects → New project → Board · คอลัมน์ `Todo` `In Progress` `In Review` `Done` · Workflows เปิด *Auto-add to project* (repo ubu-biolink), *Item closed* → Done, *Pull request merged* → Done · Link project เข้ากับ repo ให้ผู้เรียนเห็น |
| ☐ | **สร้างการ์ด 20 ใบ** (Issue + label + Milestone) | `gh auth refresh -s project` แล้ว `bash workshops/scripts/seed-day2-cards.sh <OWNER>/ubu-biolink <เลข project>` — ได้การ์ด Design Doc 4 ใบ (Assign ผู้ประสาน) + โมดูล 16 ใบ จาก [day2/cards/](day2/cards/) · Assign เจ้าของโมดูลได้ทันทีหลังรู้ username หรือให้ผู้เรียน Assign เองใน WS5.1 |
| ☐ | พิมพ์ใบ Loop | [day2/loop-1-card.pdf](day2/loop-1-card.pdf) คนละ 1 แผ่น (A4) |
| ☐ | ซ้อม "ตรวจ 4 ข้อ" | บนเครื่องที่ใช้สอน 1 รอบ — ยืนยันว่า agent ปฏิเสธจริงในเวอร์ชัน Kilo ที่ใช้ |
| ☐ | ซ้อมสาธิต Expertise | ตาม `instructor-only/demo/README.md` (Design Doc → Prompt → Build → Review) |

## D. Deploy วันที่ 2

ไม่มีในวันที่ 2 แล้ว — branch `instructor/revamp-workshop-base` จบวันด้วย Demo บนเครื่อง (สไลด์ Release/Deploy ของวันที่ 2 ถูกซ่อนไว้ท้ายชุด)
การ Deploy สอนในวันที่ 1 แล้ว (WS4.5 Docker · WS4.6 PM2 ด้วย `practice-app`)

## E. API Key และ AI

| ☐ | งาน |
|---|---|
| ☐ | ได้ API Key ของมหาวิทยาลัยพอสำหรับผู้เรียน + TA (Kilo Code / Cline) และ `ANTHROPIC_API_KEY` แยกสำหรับ AI Review bot |
| ☐ | ตัดสินใจ Model: ผู้เรียนใช้ตัวหนึ่ง Bot ใช้อีกตัว (มุมมองต่างกัน) |
| ☐ | ตั้งงบ/rate limit ต่อ Key และเตรียมวิธี Revoke อย่างรวดเร็ว |
| ☐ | ทดสอบ Key ด้วย `curl` ก่อนแจก (ดูคู่มือผู้สอนฉบับเดิม ภาคผนวก F-1) |
| ☐ | เตรียมช่องทางแจก Key ที่ไม่แสดงบนจอฉาย (กระดาษ / ข้อความส่วนตัว) |

## F. ผู้เรียน, TA และห้องอบรม

| ☐ | งาน |
|---|---|
| ☐ | จัดทีม: Day 1 ทีมละ 4–6 คน · Day 2 **4 กลุ่ม** กลุ่มละ 4–5 คน (เจ้าของโมดูล A–D + ผู้ประสาน/QA ถ้ามีคนที่ 5) |
| ☐ | ส่งคู่มือติดตั้งล่วงหน้า (VS Code, Git, Node.js 24 LTS, Docker Desktop, GitHub CLI, Cline, Kilo Code) |
| ☐ | TA ทุกคนซ้อมวงจร 1 โมดูลบน ubu-biolink (Design → Build → Review) และ "ตรวจ 4 ข้อ" ของ agent |
| ☐ | ตรวจเครือข่ายห้อง: เข้าถึง GitHub, Docker Hub / ghcr.io, npm และ API ของ AI ได้ |
| ☐ | ติดตั้งเครื่องมือล่วงหน้าบนเครื่องสำรอง 2–3 เครื่อง สำหรับผู้เรียนที่ติดตั้งไม่ผ่าน |
| ☐ | USB / โฟลเดอร์แชร์ติดตั้งออฟไลน์: ตัวติดตั้ง VS Code, Git, Node.js, Docker Desktop, VSIX ของ Cline/Kilo |
| ☐ | พิมพ์ Cheat-sheet คำสั่ง (ภาคผนวก ข ของคู่มือจับมือทำ) วางติดโต๊ะ |
| ☐ | เตรียมใบประเมินและวุฒิบัตร |

## G. วันก่อนอบรม (D-1)

- ☐ เปิด `ubu-biolink` branch กลุ่มแล้วตรวจ: agent `designer` · `builder` · `reviewer` ขึ้นใน Kilo และ workflow `/design.md` `/build.md` `/review.md` ใช้ได้
- ☐ เปิด PR ทดสอบ 1 ใบ ให้ AI Review bot คอมเมนต์ได้ภายใน 2 นาที
- ☐ ตรวจว่า `instructor/solution` และ `instructor-only/` ไม่อยู่ใน repo ที่ผู้เรียนเข้าถึงได้ และผู้เรียนทุกคน Accept คำเชิญแล้ว
- ☐ สำรองสไลด์เป็น PDF และคัดลอก Workshop pack ไว้ในเครื่องผู้สอน (กัน Wi-Fi ล่ม)

## H. แพ็กเกจ GitHub (สำคัญ — กระทบ WS2.3, WS4.1, WS8.2)

ฟีเจอร์ที่หลักสูตรใช้และเงื่อนไข (ตรวจ 24 ต.ค. 2569):

| ฟีเจอร์ | repo public (ฟรี) | repo private บัญชีฟรี | private บน GitHub Pro / Team |
|---|---|---|---|
| Rulesets / Required status check (WS2.3, WS4.1) | ✅ | ❌ | ✅ |
| Environment + Required reviewers (Deploy WS8.2) | ✅ | ❌ | ⚠️ ต้องตรวจเอกสาร GitHub ก่อนซื้อ — กฎป้องกัน Environment บางข้อใน private ใช้ได้เฉพาะแพ็กเกจสูง (Enterprise) |
| Secret scanning / Push protection | ✅ | ❌ | ต้อง GitHub Advanced Security |
| Actions | ✅ ไม่จำกัด | ✅ โควตา 2,000 นาที/เดือน | ✅ |

**ทางเลือก**

1. **Day 1 — ใช้ repo public** (ทำแล้ว) practice-app ไม่มีข้อมูลจริงและไม่มีความลับ จึงเปิดสาธารณะได้
2. **Day 2 — BioLink เป็นระบบจริงของมหาวิทยาลัย ไม่ควรเปิด public** เลือกอย่างใดอย่างหนึ่ง:
   - ย้ายเข้า **Organization บนแพ็กเกจ GitHub Team** — ขอฟรีได้ผ่าน **GitHub Education** (Teacher / Campus program) ใช้เวลาอนุมัติหลายวัน ต้องยื่นทันที
   - หรือเจ้าของ repo (ocka1234) อัปเกรดเป็น **GitHub Pro** — ได้ Rulesets / Required check ใน private ส่วนผู้อนุมัติก่อน Deploy ต้องตรวจเงื่อนไขแพ็กเกจอีกครั้ง
   - หรือถ้าไม่ทันทั้งคู่: Day 2 สาธิต Ruleset/Environment บน repo public (dryrun) ให้ดู แล้วใน BioLink ใช้ "กติกาทีม + Reviewer ตรวจ PR" แทนการบังคับด้วยระบบ (บอกผู้เรียนตรง ๆ ว่าเป็นข้อจำกัดของแพ็กเกจ)
