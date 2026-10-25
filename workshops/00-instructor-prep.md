# 00 — เตรียมความพร้อมก่อนวันอบรม (ผู้สอน + TA)

เอกสารนี้คือรายการที่ต้องทำให้เสร็จ **ก่อนวันอบรมอย่างน้อย 3 วัน** (ตัวหลักสูตรจัด 27–28 ต.ค. 2569)
ทำตามลำดับ แล้วติ๊กในคอลัมน์ ☐ แนะนำให้ซ้อมใหญ่ (Dry Run) ตาม *คู่มือจับมือทำ: Multi-agent + Memory Hub* ที่มีอยู่แล้ว อย่างน้อย 1 รอบ

## A. GitHub Organization

| ☐ | งาน | รายละเอียด |
|---|---|---|
| ☐ | Organization `ubu-central-dev-2569` | เปิด 2FA บังคับสำหรับสมาชิก (Settings → Authentication security) |
| ☐ | Team `maintainers` | ผู้สอน + ผู้ดูแลระบบของมหาวิทยาลัยที่ตัดสินใจ merge / อนุมัติ deploy |
| ☐ | Team `participants` | ผู้เรียนทั้งหมด — สิทธิ์ **Write** ใน `dms-central` |
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
| ☐ | สร้าง `dms-practice-team1` … `team5` จาก Template | ให้ทีมละ repo: สมาชิกทีมสิทธิ์ Write, Module Lead สิทธิ์ Admin |
| ☐ | การ์ดฟีเจอร์ 8 ใบ (A–H) สำหรับ WS3.3 | `bash workshops/scripts/seed-day1-features.sh <ORG>/<REPO>` ทุก repo ทีม — สร้าง Label + Issue จาก [day1/feature-cards/](day1/feature-cards/) |
| ☐ | ซ้อมฟีเจอร์ Day 1 ทั้งทีม (Dry Run 90′) | ตามแผนใน [day1/features-backlog.md](day1/features-backlog.md) หัวข้อ 6 — เฉลยสำหรับ TA อยู่ใน [day1/solutions/](day1/solutions/README.md) (ห้ามใส่ใน Template) |
| ☐ | ตรวจว่า `npm test` ผ่านใน Template | บนเครื่องสะอาดและใน CI (ดู WS4.1) |
| ☐ | สคริปต์ Label + ไฟล์ Issue Template ตัวอย่าง | เตรียมไว้ให้ผู้เรียนคัดลอกจาก WS3.1 |

## C. `ubu-biolink` สำหรับ Day 2

> Day 2 ใช้ ubu-biolink branch `instructor/revamp-workshop-base` (Postgres, 5 กลุ่ม × 4 โมดูล) — ชุดไฟล์อยู่ที่ [`day2-kit-biolink/`](../day2-kit-biolink/README-KIT.md) ใน repo นี้ · ไฟล์ WS ของ Day 2 บางไฟล์ยังเขียนตาม DMS เดิม

| ☐ | งาน | รายละเอียด |
|---|---|---|
| ☐ | ติดตั้ง **day2-kit-biolink** ผ่าน 2 PR | PR 1: `AGENTS.md`, `docs/memory/`, `docs/specs/_TEMPLATE.md`, `docs/handoff/_TEMPLATE.md`, `.clinerules/workflows/`, `.kilo/agents/` (ไม่กระทบระบบ) · PR 2: `.github/CODEOWNERS`, `.github/ai-review/`, `ai-review.yml`, `scripts/ai-review.mjs` — ขั้นตอนใน [`README-KIT.md`](../day2-kit-biolink/README-KIT.md) |
| ☐ | Ruleset ป้องกัน `main` | Require PR (1 approval) + Require Code Owners + Required checks `CI / api`, `CI / web` + Block force push — **BioLink เป็น private ของบัญชี Free ใช้ Ruleset ไม่ได้** ดูหัวข้อ H |
| ☐ | Variables / Secret ของ AI Review bot | `LLM_BASE_URL`, `LLM_MODEL` (Variables) และ `LLM_API_KEY` (Secret ใช้ `gh secret set`) + label `ai-review` — ทดสอบด้วย PR ที่ผิดโดยตั้งใจ (บทที่ 3–4 ของคู่มือจับมือทำ) |
| ☐ | Board `DMS Board` ของ `dms-central` | 5 คอลัมน์เหมือน Day 1 + Fields Module / Priority / Size |
| ☐ | Backlog เริ่มต้นของ 5 โมดูล | โมดูลละ ≥ 3 การ์ดขนาดเล็ก (ทีมจะเติมเองใน WS4.4 อีก ≥ 5) ติด label `module: …` |
| ☐ | Issue ซ้อม stats endpoint | การ์ดสำรองที่ทุกคนทำได้ถ้าการ์ดของทีมยังไม่พร้อม (ดูบทที่ 5 คู่มือจับมือทำ) |
| ☐ | `CODEOWNERS` ใส่ชื่อจริง | แทน `@INSTRUCTOR` ด้วย username ผู้สอน และเปิดบรรทัด `/apps/api/src/features/<ชื่อ>/` ของแต่ละกลุ่มเมื่อรู้ชื่อโฟลเดอร์ |

## D. สภาพแวดล้อมสำหรับ Deploy (WS8.2)

ตัวอย่างนี้สมมติว่า Deploy ด้วย **SSH + Docker Compose** ปรับให้ตรงกับเซิร์ฟเวอร์จริงของมหาวิทยาลัย

| ☐ | งาน | รายละเอียด |
|---|---|---|
| ☐ | เซิร์ฟเวอร์ (VM) พร้อม Docker | ติดตั้ง Docker + Compose, เปิดพอร์ตที่ใช้, ผู้ใช้ `deploy` ที่ไม่ใช่ root |
| ☐ | โฟลเดอร์ `/opt/dms` | clone `dms-central` ไว้ (read-only deploy key) และมี `deploy.sh <tag>` |
| ☐ | SSH key เฉพาะ deploy | สร้างคู่กุญแจใหม่ (`ssh-keygen -t ed25519`) ใส่ public key ที่เซิร์ฟเวอร์ — private key เก็บเป็น **Environment secret** `DEPLOY_SSH_KEY` |
| ☐ | Environment `production` | Required reviewers = `maintainers`, ติ๊ก Prevent self-review, จำกัดให้ deploy เฉพาะ tag ที่ตรง `v*` |
| ☐ | Variables | `DEPLOY_HOST`, `DEPLOY_USER` |
| ☐ | Workflow `deploy.yml` + `scripts/deploy-ssh.sh` | ใน `main` ของ `dms-central` — ทดสอบด้วย tag ทดลอง (เช่น `v0.0.0-test`) ก่อนวันจริง |
| ☐ | Tag baseline สำหรับ rollback | สร้าง tag เสถียร (เช่น `v0.0.0-baseline`) ใน `dms-central` และตรวจว่า deploy tag นี้ได้ |
| ☐ | Endpoint ตรวจสุขภาพ | `/health` หรือ endpoint ที่มีอยู่ สำหรับ smoke test (ถ้า Starter ยังไม่มี ให้เพิ่มเป็นการ์ดเล็ก) |
| ☐ | แผนสำรอง | ถ้าเซิร์ฟเวอร์ไม่พร้อม ใช้ `docker compose` บนเครื่องผู้สอนเป็นเป้าหมาย deploy จำลอง |

## E. API Key และ AI

| ☐ | งาน |
|---|---|
| ☐ | ได้ API Key ของมหาวิทยาลัยพอสำหรับผู้เรียน + TA + Bot (Key ของ Bot **แยกต่างหาก**) |
| ☐ | ตัดสินใจ Model: ผู้เรียนใช้ตัวหนึ่ง Bot ใช้อีกตัว (มุมมองต่างกัน) |
| ☐ | ตั้งงบ/rate limit ต่อ Key และเตรียมวิธี Revoke อย่างรวดเร็ว |
| ☐ | ทดสอบ Key ด้วย `curl` ก่อนแจก (ดูคู่มือผู้สอนฉบับเดิม ภาคผนวก F-1) |
| ☐ | เตรียมช่องทางแจก Key ที่ไม่แสดงบนจอฉาย (กระดาษ / ข้อความส่วนตัว) |

## F. ผู้เรียน, TA และห้องอบรม

| ☐ | งาน |
|---|---|
| ☐ | จัดทีม (5 ทีม) จากแบบสำรวจความคุ้นเคย — ทีมละ 4–6 คน ผสมทักษะ และกำหนดโมดูลของแต่ละทีม |
| ☐ | ส่งคู่มือติดตั้งล่วงหน้า (VS Code, Git, Node.js 24 LTS, Docker Desktop, GitHub CLI, Cline, Kilo Code) |
| ☐ | TA ทุกคนผ่านการซ้อม: บทที่ 6 (ซ้อมครบวงจร) + บทที่ 7 (ทดสอบรั้ว G1–G7) ของคู่มือจับมือทำ |
| ☐ | ตรวจเครือข่ายห้อง: เข้าถึง GitHub, Docker Hub / ghcr.io, npm และ API ของ AI ได้ |
| ☐ | ติดตั้งเครื่องมือล่วงหน้าบนเครื่องสำรอง 2–3 เครื่อง สำหรับผู้เรียนที่ติดตั้งไม่ผ่าน |
| ☐ | USB / โฟลเดอร์แชร์ติดตั้งออฟไลน์: ตัวติดตั้ง VS Code, Git, Node.js, Docker Desktop, VSIX ของ Cline/Kilo |
| ☐ | พิมพ์ Cheat-sheet คำสั่ง (ภาคผนวก ข ของคู่มือจับมือทำ) วางติดโต๊ะ |
| ☐ | เตรียมใบประเมินและวุฒิบัตร |

## G. วันก่อนอบรม (D-1)

- ☐ เปิด `ubu-biolink` แล้วตรวจ: `AGENTS.md` อยู่ชั้นบนสุด, Agent `designer` / `reviewer` ขึ้นใน Kilo, Workflow `/design.md` `/build.md` `/review.md` `/check-before-pr.md` ขึ้นใน Cline (เช็กลิสต์ท้าย README-KIT.md)
- ☐ เปิด PR ทดสอบ 1 ใบ ให้ AI Review bot คอมเมนต์ได้ภายใน 2 นาที
- ☐ ทดสอบ deploy ด้วย tag ทดลองจนครบวงจรและ rollback ได้
- ☐ ตรวจให้ทุก Team ใน Org มีสมาชิกถูกต้อง และได้รับสิทธิ์ใน `dms-central`
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
