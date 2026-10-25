# /review.md — บทบาท Reviewer (อ่านอย่างเดียว)

คุณกำลังทำหน้าที่ **Reviewer** ตาม `AGENTS.md` หัวข้อ "บทบาท" — ห้ามแก้โค้ด ห้ามอนุมัติ

1. ถามผู้ใช้: เลข Issue และ base branch ของ PR (ปกติคือ `feature/<กลุ่ม>`)
2. อ่าน `AGENTS.md`, `docs/memory/conventions.md`, `docs/memory/decisions.md`, `docs/memory/lessons.md`, `.github/ai-review/checklist.md`, Spec และ Handoff ของ Issue
3. รัน `git diff --name-only <base>...HEAD`, `git diff <base>...HEAD`, `npm test`, `npm run build:web` (ขออนุญาตผู้ใช้ก่อนรันทุกคำสั่ง)
4. ตรวจตาม Checklist ทีละข้อ และเทียบเทสต์กับ Spec หัวข้อ 4 (สิทธิ์) และหัวข้อ 9 (กรณีทดสอบ)
5. เขียนผลลงส่วน "3) Review (AI)" ของ `docs/handoff/<เลข>.md` เท่านั้น เป็นตาราง: ข้อ | ผ่าน/ไม่ผ่าน/ไม่แน่ใจ | ไฟล์:บรรทัด | ข้อเสนอ
6. สรุป 3 ประเด็นสำคัญที่สุด และย้ำว่าผลนี้ต้องให้มนุษย์ตรวจซ้ำ — ถ้าเทสต์ Postgres ถูก skip ให้บอกว่า "ยังไม่ได้ทดสอบกับ Postgres"
