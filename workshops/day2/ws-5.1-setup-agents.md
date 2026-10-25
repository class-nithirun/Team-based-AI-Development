# WS5.1 — ตั้งค่า Cline และ Kilo Code

| | |
|---|---|
| **ตำแหน่ง** | Day 2 · Session 5 |
| **เวลา** | 5–10 นาที (ตั้งค่าแล้วใน WS1.3 วันที่ 1 — วันนี้แค่ตรวจและเปิด repo ใหม่) |
| **รูปแบบ** | รายบุคคล |
| **สไลด์** | หน้า 75–76 |
| **ผลลัพธ์** | Cline และ Kilo Code ทำงานผ่าน API ของมหาวิทยาลัย โดยปิด Auto-approve ทั้งหมด และมองเห็น Agent/Workflow ของทีม |

> ✅ **ทำ Cline/Kilo + API Key ไปแล้วใน [WS1.3](../day1/ws-1.3-setup-ai-agent.md)** — ถ้าขั้นที่ 4 (ทดสอบ) ผ่าน ให้ข้ามขั้นที่ 2–3 ไปขั้นที่ 5–6 ได้เลย · คนที่มาไม่ทันวันแรกทำครบทุกขั้น

## 🎯 เป้าหมาย

ใช้ AI Coding Agent ได้ **อย่างปลอดภัย**: เชื่อม API ถูกต้อง ไม่เปิดให้ AI ทำอะไรเองโดยไม่ผ่านเรา และเห็นเครื่องมือของทีม (Agent `designer`/`reviewer`, Workflow `/build.md`)

## 📋 ต้องมีก่อนเริ่ม

- VS Code ที่ติดตั้ง Extension **Cline** และ **Kilo Code** แล้ว (ถ้ายัง: Extensions → ค้นหาชื่อ → Install)
- ค่า `<BASE_URL>` `<API_KEY>` `<MODEL_ID>` ที่ผู้สอนแจกในห้อง
- สิทธิ์ใน `dms-central` (อยู่ใน Team `participants`)

> ⚠️ **ระวังจอฉายและแชต** — API Key ห้ามถ่ายภาพหน้าจอ ห้ามวางลงแชต Issue หรือไฟล์ใด ๆ

## 👉 ขั้นตอน

### ขั้นที่ 1 — Clone `dms-central` และเปิดใน VS Code

```bash
cd ~/Desktop
gh repo clone <ORG>/dms-central
cd dms-central
code .
```

✅ **ต้องเห็น:** VS Code เปิดโฟลเดอร์ `dms-central` และมีไฟล์ `AGENTS.md` ในแถบซ้ายบนสุด

🔧 เปิด VS Code ผิดโฟลเดอร์ (เปิดโฟลเดอร์แม่) → File → Open Folder → เลือก `dms-central` โดยตรง — Workflow และ Agent จะมองไม่เห็นถ้าเปิดผิดชั้น

### ขั้นที่ 2 — ตั้งค่า Cline

1. คลิกไอคอน **Cline** ในแถบซ้าย
2. คลิกไอคอนเฟือง ⚙ (Settings)
3. **API Provider** → เลือก **OpenAI Compatible**
4. กรอก:
   - **Base URL:** `<BASE_URL>`
   - **API Key:** `<API_KEY>`
   - **Model ID:** `<MODEL_ID>`
5. กด **Done**

### ขั้นที่ 3 — ตั้งค่า Kilo Code

1. คลิกไอคอน **Kilo Code** ในแถบซ้าย → ไอคอนเฟือง ⚙ → **Providers**
2. เลือก Provider ชนิด **OpenAI Compatible** แล้วกรอก Base URL / API Key / Model ID ชุดเดียวกับข้างบน
3. บันทึก

### ขั้นที่ 4 — ทดสอบการเชื่อมต่อ

ใน **ทั้ง Cline และ Kilo Code** เริ่ม Task ใหม่ แล้วพิมพ์:

```text
ตอบสั้น ๆ ว่าคุณคือโมเดลอะไร และตอบคำว่า OK ปิดท้าย
```

✅ **ต้องเห็น:** ทั้งสองตัวตอบกลับได้

🔧 **ถ้าไม่เป็นแบบนี้**

| อาการ | สาเหตุ | วิธีแก้ |
|---|---|---|
| `401` | Key ผิดหรือหมดอายุ | ตรวจสอบการคัดลอก (ไม่มีช่องว่างหน้า/หลัง) แล้วแจ้ง TA |
| `404` | Base URL หรือ Model ID ผิด | ตรวจว่า Base URL ลงท้าย `/v1` ตามที่ผู้สอนบอก และชื่อ Model ถูกตัวอักษร |
| `429` | เกิน Rate limit | รอ 1 นาที ลองใหม่ |
| ไม่ตอบ / timeout | เน็ตห้องช้า หรือถูกบล็อก | แจ้ง TA |

### ขั้นที่ 5 — ปิด Auto-approve ทั้งหมด (สำคัญที่สุด)

**Cline:** แถบ *Auto-approve* ด้านล่างช่องพิมพ์ — **ไม่ติ๊กทุกข้อ** (อ่านไฟล์ / แก้ไฟล์ / รันคำสั่ง / ใช้เบราว์เซอร์ / MCP)

**Kilo Code:** Settings → *Auto-Approve* → ปิดทุกข้อ

ตรวจสวิตช์ **Plan / Act** ของ Cline ให้อยู่ที่ **Plan**

💡 **ทำไมไม่เปิด Auto-approve:** ถ้าเปิด AI จะแก้ไฟล์และรันคำสั่งได้เองทั้งหมด ผู้เรียนมือใหม่จะไม่ทันเห็นว่ามันทำอะไรกับเครื่องและโค้ด — ในคลาสนี้ **"อ่านก่อนกด" คือทักษะที่เราสอน**

### ขั้นที่ 6 — ตรวจว่าเห็น Agent และ Workflow ของทีม

1. **Kilo Code:** คลิกตัวเลือก **Agent** ที่ด้านล่างช่องพิมพ์ → ต้องเห็น `designer` และ `reviewer` ต่อจาก `code / plan / ask / debug`
2. **Cline:** พิมพ์ `/` ในช่องพิมพ์ → ต้องเห็น `build.md`, `design.md`, `review.md` ในหมวด Workflows

🔧 **ถ้าไม่เป็นแบบนี้**

| อาการ | วิธีแก้ |
|---|---|
| ไม่เห็น Agent ใหม่ใน Kilo | `git switch main && git pull` → `Ctrl+Shift+P` → `Reload Window` → อัปเดต Kilo Code เป็นเวอร์ชันล่าสุด |
| ยังไม่เห็น | (ตามคู่มือ TA) คัดลอกโฟลเดอร์ `.kilo/agents` ไปไว้ที่ `.kilocode/agents` อีกชุด (เวอร์ชันเก่าอ่านจากที่นี่) แล้ว Reload แล้วแจ้งผู้สอน |
| ไม่เห็น `/build.md` ใน Cline | ตรวจว่าเปิด VS Code ที่โฟลเดอร์ `dms-central` และมีไฟล์ใน `.clinerules/workflows/` |

## ✅ Checkpoint (ตรวจตัวเอง)

- [ ] Cline และ Kilo Code ตอบกลับได้
- [ ] Auto-approve **ปิดทั้งหมด** ทั้งสองตัว
- [ ] Cline อยู่ที่ **Plan**
- [ ] เห็น Agent `designer` / `reviewer` และ Workflow `/build.md` `/design.md` `/review.md`

## 🧪 ท้าทายเพิ่ม

- เปิดไฟล์ `.kilo/agents/designer.md` อ่านว่า "สิทธิ์" ของ designer ถูกเขียนไว้อย่างไร (เทียบกับ `reviewer.md`)
- ดูแผง Usage/Token ของ Extension แล้วจดว่าข้อความทดสอบใช้ไปกี่ Token

## 🧑‍🏫 หมายเหตุสำหรับผู้สอน/TA

- แจก Key ผ่านช่องทางที่ไม่ฉายบนจอ เก็บ Key สำรองไว้ให้ TA แจกคนที่ติด
- TA ตรวจทุกเครื่องว่า **Auto-approve ปิด** ก่อนไปต่อ — ข้อนี้เป็นเงื่อนไขของทั้งวัน
- ถ้า Provider/เวอร์ชันของ Extension ต่างจากที่เขียน ให้จด "จุดที่หน้าจอจริงต่างจากเอกสาร" แล้วอัปเดตเอกสารหลังซ้อม (แบบบันทึก Drill ภาคผนวก ก)
- เมื่อเริ่ม Task ใหม่ใน Kilo/Cline ให้สอนผู้เรียนปุ่ม **New Task** เพราะจะใช้บ่อยตลอดวัน

**ต่อไป →** [WS5.2 ReAct Trace](ws-5.2-react-trace.md)
