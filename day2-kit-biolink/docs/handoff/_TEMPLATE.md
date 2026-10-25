# Handoff: Issue #<เลข> — <กลุ่ม> โมดูล <A–D> <ชื่องาน>

## 1) Design
- ผู้ทำ: <Designer agent + Model> • ควบคุมโดย @<username>
- Spec: `docs/specs/<เลข>-<ชื่อ>.md`
- สรุปแนวทาง (3 บรรทัด): …
- คำถามที่ยังเปิด (ต้องตอบก่อน Build): …
- [ ] **มนุษย์ตรวจและอนุมัติ Spec แล้ว** — โดย @<username> วันที่ <YYYY-MM-DD>  ← AI ห้ามติ๊กช่องนี้

## 2) Build
- ผู้ทำ: <Builder agent + Model> • ควบคุมโดย @<username>
- ไฟล์ที่เปลี่ยน: …
- คำสั่งทดสอบที่รันและผล: `npm test` → ผ่าน/ไม่ผ่าน · `npm run build:web` → ผ่าน/ไม่ผ่าน
- กรณีทดสอบในหัวข้อ 9 ของ Spec ที่มีเทสต์แล้ว: T1 … / ยังไม่มี: …
- สิ่งที่เบี่ยงจาก Spec + เหตุผล: ไม่มี / …

## 3) Review (AI)
- ผู้ทำ: <Reviewer agent + Model>
- ผลตาม Checklist:

| ข้อ | ผ่าน / ไม่ผ่าน / ไม่แน่ใจ | ไฟล์:บรรทัด | ข้อเสนอ |
|---|---|---|---|
| | | | |

- ต้องแก้ก่อน Merge: …
- หมายเหตุ: ผลนี้เป็นความเห็นของ AI ต้องให้มนุษย์ตรวจซ้ำ

## 4) Human decision
- Reviewer (มนุษย์ จากอีกโมดูลหรืออีกกลุ่ม): @<username> • ผล: Approve / Request changes • วันที่: …
- ข้อที่ AI Review พลาดหรือแจ้งเกินจริง (ใช้ปรับ `lessons.md`): …

## เสนอเพิ่มใน memory (ถ้ามี — มนุษย์เป็นผู้เปิด PR)
- ไฟล์: <decisions | conventions | lessons | glossary> • ข้อความที่เสนอ: …
