# Workshop Pack — Team-based AI Development (27–28 ต.ค. 2569)

ชุดเอกสาร Workshop ย่อยของหลักสูตร 2 วัน แยกเป็นไฟล์ละ 1 งาน ใช้คู่กับ
[สไลด์สอน](../slides/Team-based_AI_Development_Slides.pptx) และ
[คู่มือผู้สอน](../guide/Instructor_Guide_Team-based_AI_Development.docx)

> ผู้เรียนเปิดไฟล์ Workshop ของงานที่กำลังทำ — ผู้สอน/TA อ่านหัวข้อ **🧑‍🏫 หมายเหตุสำหรับผู้สอน/TA** ท้ายไฟล์เพิ่ม
> (ถ้าจะแจกผู้เรียน ให้ตัดหัวข้อนั้นออกได้)

## วิธีใช้

1. ผู้สอนทำตาม [00-instructor-prep.md](00-instructor-prep.md) **ก่อนวันอบรมอย่างน้อย 3 วัน**
2. ในห้อง ผู้สอนฉายสไลด์ (ทฤษฎีสั้น ๆ) แล้วบอกผู้เรียนให้เปิดไฟล์ Workshop ที่ตรงกับหน้าสไลด์
3. สไลด์ Workshop แต่ละหน้าสรุปขั้นตอนระดับสูง — **รายละเอียดคำสั่งและวิธีแก้ปัญหาอยู่ในไฟล์เหล่านี้**

## ตัวแปรที่ใช้ในเอกสาร

| ตัวแปร | ความหมาย | ค่า |
|---|---|---|
| `<ORG>` | GitHub Organization ของคลาส | `ubu-central-dev-2569` |
| `<REPO>` (Day 1) | Repo ฝึกหัดของทีม | `dms-practice-team<N>` (ผู้สอนแจ้ง) |
| `dms-central` (Day 2) | Repo ระบบ DMS กลางที่ทุกทีมร่วมพัฒนา | `<ORG>/dms-central` |
| `<ชื่อ>` | ชื่อเล่น/username ตัวพิมพ์เล็กของคุณ ใช้ต่อท้ายชื่อกิ่ง | เช่น `somchai` |
| `<N>` | เลข Issue | เช่น `12` |
| `<BASE_URL>` `<API_KEY>` `<MODEL_ID>` | ค่า AI ของมหาวิทยาลัย | ผู้สอนแจกในห้อง — **ห้ามบันทึกลงไฟล์** |

## สัญลักษณ์

| สัญลักษณ์ | ความหมาย |
|---|---|
| 🎯 | เป้าหมายของขั้นนี้ |
| 💡 | เหตุผล — อ่านเพื่ออธิบายเพื่อนได้ |
| 👉 | ลงมือทำตามลำดับ ห้ามข้าม |
| ✅ | ผลที่ต้องเห็น ถ้าเห็นแล้วไปขั้นถัดไป |
| 🔧 | ถ้าไม่เป็นแบบนี้ ให้แก้ตามนี้ |
| 🧪 | ท้าทายเพิ่ม (ถ้าเสร็จก่อน) |

## สมมติฐานเรื่อง Repository

- **Day 1** แต่ละทีม (4–6 คน จัดจากแบบสำรวจ) ใช้ **repo ฝึกหัดของทีมเอง** `dms-practice-team<N>` สร้างจาก Template repository
  ที่มี Starter Project อยู่ข้างใน ทุกคนในทีมมีสิทธิ์ Write และ Module Lead ของทีมเป็น Admin เพื่อฝึกตั้ง Ruleset / CI / Release ได้
- **Day 2** ทุกทีมทำงานใน **`dms-central`** repo เดียว ที่ติดตั้ง Kit (Memory hub, Agent, Workflow, AI Review bot) และมี Ruleset ป้องกัน `main` แล้ว
- ถ้าเลือกใช้ repo เดียวทั้งห้องตั้งแต่ Day 1 ปรับได้ แต่ WS2.3 และ WS4.1 (ต้องใช้สิทธิ์ Admin) ต้องทำเป็นการสาธิตโดยผู้สอน

## ตารางรวม Workshop (26 งาน)

### Day 1 — รากฐานการทำงานเป็นทีมบน GitHub

| Session | ID | งาน | เวลา | สไลด์ | ไฟล์ |
|---|---|---|---|---|---|
| S1 (09:00–10:30) | WS1.1 | ตรวจและติดตั้งเครื่องมือ | 25′ | หน้า 17–18 | [ws-1.1-setup-tools.md](day1/ws-1.1-setup-tools.md) |
| | WS1.2 | เข้า Organization + Commit แรก | 25′ | หน้า 19–20 | [ws-1.2-first-commit.md](day1/ws-1.2-first-commit.md) |
| | WS1.3 | ตั้งค่า AI Agent (Cline + Kilo) และ API Key | 20′ | Session 1 | [ws-1.3-setup-ai-agent.md](day1/ws-1.3-setup-ai-agent.md) |
| S2 (10:45–12:00) | WS2.1 | GitHub Flow รอบแรก: PR + Review | 25′ | หน้า 27–28 | [ws-2.1-pr-review.md](day1/ws-2.1-pr-review.md) |
| | WS2.2 | จำลอง Merge Conflict และแก้ร่วมกัน | 20′ | หน้า 31 | [ws-2.2-merge-conflict.md](day1/ws-2.2-merge-conflict.md) |
| | WS2.3 | ตั้ง Ruleset, CODEOWNERS และกันความลับ | 20′ | หน้า 35 | [ws-2.3-repo-rules-secrets.md](day1/ws-2.3-repo-rules-secrets.md) |
| S3 (13:00–14:30) | WS3.1 | Issue Template และ Label ของทีม | 15′ | หน้า 46 | [ws-3.1-issue-templates-labels.md](day1/ws-3.1-issue-templates-labels.md) |
| | WS3.2 | สร้าง Kanban Board ของทีม | 15′ | หน้า 47 | [ws-3.2-kanban-board.md](day1/ws-3.2-kanban-board.md) |
| | WS3.3 | Sprint: 8 ฟีเจอร์ = 8 Feature Branch (ทำด้วย AI) | 45′ | หน้า 48 | [ws-3.3-sprint-planning.md](day1/ws-3.3-sprint-planning.md) |

> ฟีเจอร์ A–H ของ practice-app: ภาพรวม การเตรียม และแผนซ้อมของทีมผู้สอนอยู่ที่ [day1/features-backlog.md](day1/features-backlog.md) · การ์ด [day1/feature-cards/](day1/feature-cards/) · เฉลย TA [day1/solutions/](day1/solutions/README.md)
| S4 (14:45–16:00) | WS4.1 | สร้าง CI และตั้ง Required Check | 20′ | หน้า 59 | [ws-4.1-ci-required-check.md](day1/ws-4.1-ci-required-check.md) |
| | WS4.2 | Dependabot และ Security scanning | 10′ | หน้า 60 | [ws-4.2-dependabot-security.md](day1/ws-4.2-dependabot-security.md) |
| | WS4.3 | Release v0.0.1 | 15′ | หน้า 61 | [ws-4.3-release-v0.0.1.md](day1/ws-4.3-release-v0.0.1.md) |
| | WS4.5 | Deploy ด้วย Docker | 20′ | — | [ws-4.5-deploy-docker.md](day1/ws-4.5-deploy-docker.md) |
| | WS4.6 | Deploy ด้วย PM2 | 20′ | — | [ws-4.6-deploy-pm2.md](day1/ws-4.6-deploy-pm2.md) |
| | WS4.4 | จัดทีมและเขียน Working Agreement (งานสุดท้ายของวัน) | 15′ | หน้า 64 | [ws-4.4-team-setup.md](day1/ws-4.4-team-setup.md) |

> ลำดับใน Session 4: WS4.1 → 4.2 → 4.3 → **4.5 → 4.6** → 4.4 — แอปที่ใช้ Deploy คือ [`practice-app/`](../practice-app/README.md)

### Day 2 — Multi-agent Vibe Coding ด้วย Cline และ Kilo Code

| Session | ID | งาน | เวลา | สไลด์ | ไฟล์ |
|---|---|---|---|---|---|
| S5 (09:00–10:30) | WS5.1 | ตรวจ Agent (ตั้งค่าแล้วใน WS1.3) | 5′ | หน้า 75–76 | [ws-5.1-setup-agents.md](day2/ws-5.1-setup-agents.md) |
| | WS5.2 | ReAct Trace: ดู Agent คิดและลงมือ | 10′ | หน้า 77 | [ws-5.2-react-trace.md](day2/ws-5.2-react-trace.md) |
| | WS5.3 | Memory hub: AI อ่านและจำอย่างไร | 15′ | หน้า 86 | [ws-5.3-memory-hub.md](day2/ws-5.3-memory-hub.md) |
| | WS5.4 | รัน DMS Starter ด้วย Docker | 20′ | หน้า 87–88 | [ws-5.4-run-dms-starter.md](day2/ws-5.4-run-dms-starter.md) |
| S6 (10:45–12:00) | WS6.1 | Designer: จากการ์ดสู่ Spec | 25′ | หน้า 98 | [ws-6.1-designer-spec.md](day2/ws-6.1-designer-spec.md) |
| | WS6.2 | ประตูมนุษย์ที่ 1: อนุมัติ Spec | 10′ | หน้า 99 | [ws-6.2-human-gate-1.md](day2/ws-6.2-human-gate-1.md) |
| | WS6.3 | Builder: Spec → Migration + API → PR | 40′ | หน้า 100 | [ws-6.3-builder-api-pr.md](day2/ws-6.3-builder-api-pr.md) |
| S7 (13:00–14:30) | WS7.1 | Builder รอบ 2: หน้าจอ + Test | 35′ | หน้า 109 | [ws-7.1-ui-and-tests.md](day2/ws-7.1-ui-and-tests.md) |
| | WS7.2 | Reviewer agent + AI Review bot | 20′ | หน้า 110 | [ws-7.2-reviewer-and-bot.md](day2/ws-7.2-reviewer-and-bot.md) |
| | WS7.3 | Cross-team Review + บันทึกบทเรียน | 25′ | หน้า 112 | [ws-7.3-cross-team-review.md](day2/ws-7.3-cross-team-review.md) |
| S8 (14:45–16:00) | WS8.1 | รวมโมดูลเข้า main | 15′ | หน้า 126 | [ws-8.1-integration.md](day2/ws-8.1-integration.md) |
| | WS8.2 | Release v0.1.0 และ Deploy | 20′ | หน้า 127 | [ws-8.2-release-deploy.md](day2/ws-8.2-release-deploy.md) |
| | WS8.3 | Sprint Review + Memory hub สด | 12′ | หน้า 128 | [ws-8.3-sprint-review-memory.md](day2/ws-8.3-sprint-review-memory.md) |
| | WS8.4 | ทดสอบรั้วกั้น (สาธิตโดยผู้สอน) | 8′ | หน้า 129 | [ws-8.4-guardrail-tests.md](day2/ws-8.4-guardrail-tests.md) |

## สัดส่วนเวลาแต่ละ Session (ทฤษฎี : Workshop)

| Session | ทฤษฎี | Workshop | Buffer / Checkpoint |
|---|---|---|---|
| S1 | 15′ (Git 10′ + AI Agent/API Key 5′ — เปิดหลักสูตรอยู่ช่วง 08:45–09:00) | 70′ (WS1.1 25′ + WS1.2 25′ + WS1.3 20′) | 5′ |
| S2 | 15′ | 65′ (25′ + 20′ + 20′) → ลดสาธิต WS2.3 เหลือ 15′ ได้ | — |
| S3 | 15′ | 75′ (WS3.1 15′ + WS3.2 15′ + WS3.3 45′) | — (Template/Label/Board เตรียมไว้ก่อน ผู้เรียนแค่ตรวจและปรับ) |
| S4 | 10′ | 95′ (WS4.1 20′ + WS4.2 สาธิต 5′ + WS4.3 15′ + WS4.5 20′ + WS4.6 20′ + WS4.4 15′) | — (ตามกำหนดการ SAGE 14:45–16:30 = 105′) |
| S5 | 25′ (ReAct 10′ + Multi-agent/Memory hub 15′ — "Agent คืออะไร" และ "Plan/Act" ย้ายไปสอนก่อน WS1.3 แล้ว) | 50′ (5′ + 10′ + 15′ + 20′) | — (ให้ TA pre-pull Docker image ตอนลงทะเบียน) |
| S6 | 10′ | 75′ (25′ + 10′ + 40′) | — |
| S7 | 10′ | 80′ (35′ + 20′ + 25′) | — |
| S8 | 12′ (ความปลอดภัย/ธรรมาภิบาล) | 55′ (15′ + 20′ + 12′ + 8′) | 8′ Q&A + วุฒิบัตร |

> เวลาของแต่ละ Workshop รวมเวลาที่ผู้สอนอธิบายสั้น ๆ ก่อนเริ่ม ถ้าเวลาไม่พอ ดูแผนตัดงานใน **คู่มือผู้สอน → ภาคผนวก ค**

## กติกากลางตลอด 2 วัน

1. ทุกการเปลี่ยนแปลงเข้า `main` ผ่าน Pull Request
2. หยิบการ์ด (Assign ตัวเอง) ก่อนลงมือเสมอ
3. **ห้ามเปิด Auto-approve** ของ Cline / Kilo Code — "อ่านก่อนกด" คือทักษะที่เราสอน
4. ความลับ (API Key, `.env`) ไม่ลงแชต ไม่ลง repo — หลุดแล้ว Revoke ก่อน
5. ติดเกิน 10 นาที ถามเพื่อนร่วมทีม แล้วเรียก TA
