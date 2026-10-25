# WS1.2 — เข้า Organization + Commit แรก

| | |
|---|---|
| **ตำแหน่ง** | Day 1 · Session 1 |
| **เวลา** | 30 นาที |
| **รูปแบบ** | รายบุคคลใน repo ฝึกหัดของทีมตัวเอง |
| **สไลด์** | หน้า 19–20 |
| **ผลลัพธ์** | กิ่ง `feat/hello-<ชื่อ>` ที่มี commit ของคุณ ปรากฏบน GitHub |

## 🎯 เป้าหมาย

ทำวงจร **clone → สร้างกิ่ง → แก้ไฟล์ → add → commit → push** ครบหนึ่งรอบด้วยตัวเอง

## 📋 ต้องมีก่อนเริ่ม

- ผ่าน [WS1.1](ws-1.1-setup-tools.md) แล้ว (`gh auth status` ผ่าน)
- รู้ชื่อ Organization (`<ORG>`) และชื่อ repo ฝึกหัดของทีม (`<REPO>`) — ผู้สอนแจ้งบนจอ

## 👉 ขั้นตอน

### ขั้นที่ 1 — รับคำเชิญเข้า Organization

1. เปิดอีเมลที่ผูกกับ GitHub → ค้นหาอีเมลคำเชิญจาก GitHub → กด **Join**
   (หรือเปิด https://github.com/`<ORG>` แล้วกด **Accept invitation** ที่แบนเนอร์ด้านบน)
2. ตรวจว่าเห็น repo `<REPO>` ในหน้า Organization

✅ **ต้องเห็น:** ชื่อ repo ของทีมคุณในหน้า `https://github.com/<ORG>`

🔧 ถ้าไม่เห็นคำเชิญ → ตรวจ GitHub username ที่แจ้งไว้ในแบบสำรวจ แล้วแจ้ง TA ให้ส่งคำเชิญใหม่

### ขั้นที่ 2 — Clone repo มาที่เครื่อง

```bash
cd ~/Desktop
gh repo clone <ORG>/<REPO>
cd <REPO>
code .
```

(หรือใช้ `git clone https://github.com/<ORG>/<REPO>.git` ได้เช่นกัน)

✅ **ต้องเห็น:** VS Code เปิดโฟลเดอร์ `<REPO>` และมีไฟล์ `README.md`, `CONTRIBUTORS.md` ในแถบซ้าย

🔧 คำสั่ง `code` ไม่รู้จัก → เปิด VS Code เอง → File → Open Folder → เลือกโฟลเดอร์ `<REPO>` บน Desktop

### ขั้นที่ 3 — สร้างกิ่งของตัวเอง

ใน Terminal ของ VS Code (เมนู Terminal → New Terminal):

```bash
git switch -c feat/hello-<ชื่อ>
git branch --show-current
```

💡 เราไม่แก้ `main` ตรง ๆ — ทุกงานเริ่มจากกิ่งใหม่ (กติกาข้อแรกของ GitHub Flow)

✅ **ต้องเห็น:** `feat/hello-<ชื่อ>`

### ขั้นที่ 4 — แก้ไฟล์

เปิด `CONTRIBUTORS.md` เพิ่มบรรทัดของคุณ (ตามรูปแบบที่มีอยู่) เช่น:

```markdown
- somchai — Backend developer (ฟีเจอร์ B ค้นหาประกาศ)
```

กด `Ctrl+S` (macOS: `Cmd+S`) เพื่อบันทึก

### ขั้นที่ 5 — ดูว่าเปลี่ยนอะไรไป

```bash
git status
git diff
```

✅ **ต้องเห็น:** `modified: CONTRIBUTORS.md` และบรรทัดสีเขียว (เพิ่ม) ใน `git diff`

### ขั้นที่ 6 — Add, Commit, Push

```bash
git add CONTRIBUTORS.md
git commit -m "docs: add <ชื่อ> to contributors"
git push -u origin feat/hello-<ชื่อ>
```

💡 **เหตุผลของข้อความ commit:** ใช้รูปแบบ `type(scope): สรุปสั้น ๆ` เหมือนกันทั้งทีม — `docs` คือเอกสาร

✅ **ต้องเห็น:** ข้อความ `branch 'feat/hello-<ชื่อ>' set up to track 'origin/feat/hello-<ชื่อ>'`

### ขั้นที่ 7 — ดูผลบน GitHub

เปิด `https://github.com/<ORG>/<REPO>` → จะเห็นแถบเหลือง **Compare & pull request** (ยังไม่ต้องกด — ใช้ใน WS2.1)

## ✅ Checkpoint (ตรวจตัวเอง)

- [ ] เห็นกิ่ง `feat/hello-<ชื่อ>` ใน GitHub (ปุ่มเลือกกิ่ง)
- [ ] เปิดหน้า commit แล้วเห็นชื่อและรูปของคุณ
- [ ] `git log --oneline -3` เห็น commit ของคุณบนสุด

## 🔧 ปัญหาที่พบบ่อย

| อาการ | สาเหตุ | วิธีแก้ |
|---|---|---|
| `Repository not found` ตอน clone | ยังไม่ได้ Accept คำเชิญ / ไม่มีสิทธิ์ | ทำขั้นที่ 1 ใหม่ แล้วแจ้ง TA |
| `Permission denied` / ขอรหัสผ่าน | `gh auth login` ยังไม่เสร็จ หรือใช้บัญชีผิด | `gh auth status` แล้วทำ WS1.1 ขั้นที่ 5 ซ้ำ |
| `push` ถูกปฏิเสธ (rejected) | กำลัง push เข้า `main` | `git branch --show-current` ต้องไม่ใช่ `main` |
| `nothing to commit` | ยังไม่ได้ Save ไฟล์ | `Ctrl+S` แล้ว `git status` |
| `Author identity unknown` | ยังไม่ตั้ง `user.name/email` | ทำ WS1.1 ขั้นที่ 4 |

## 🧪 ท้าทายเพิ่ม

- แก้ไฟล์ `README.md` อีกหนึ่งจุด แล้ว commit แยกอีก 1 อัน (ฝึก "commit เล็ก ๆ บ่อย ๆ") ดูผลด้วย `git log --oneline`
- ลองใช้แผง **Source Control** ใน VS Code (`Ctrl+Shift+G`) แทนคำสั่ง ทำ commit ที่สอง

## 🧑‍🏫 หมายเหตุสำหรับผู้สอน/TA

- ถ้า Ruleset ยังไม่เปิดใน repo ฝึกหัด ผู้เรียน push กิ่งได้ปกติ (กิ่ง ≠ main) การ merge เข้า `main` จะทำใน WS2.1
- ใช้ `CONTRIBUTORS.md` เป็นไฟล์ฝึกเพราะ conflict-free เมื่อแต่ละคนเพิ่มบรรทัดคนละบรรทัด (ถ้าเกิด conflict จริง ใช้เป็นตัวอย่างสอนได้)
- สังเกตผู้เรียนที่ commit เข้า `main` ตรง ๆ ได้ (ก่อนเปิด Ruleset) — ชวนให้เห็นว่าทำไม WS2.3 จึงบังคับด้วยระบบ

**ต่อไป →** [WS1.3 ตั้งค่า AI Agent และ API Key](ws-1.3-setup-ai-agent.md)
