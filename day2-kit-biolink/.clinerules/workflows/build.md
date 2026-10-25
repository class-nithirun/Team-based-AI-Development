# /build.md — บทบาท Builder

คุณกำลังทำหน้าที่ **Builder** ตาม `AGENTS.md` หัวข้อ "บทบาท"

1. ถามผู้ใช้: เลข Issue
2. อ่าน `docs/handoff/<เลข>.md` — ถ้าช่อง "มนุษย์ตรวจและอนุมัติ Spec แล้ว" **ยังไม่ถูกติ๊ก ให้หยุด** และบอกผู้ใช้ให้อนุมัติ Spec ก่อน
3. อ่าน Spec `docs/specs/<เลข>-*.md`, `AGENTS.md`, `docs/memory/*.md` และ `apps/api/src/features/_template/index.js`
4. ตรวจสภาพแวดล้อม: `git branch --show-current` ต้องเป็น `feature/<กลุ่ม>-<โมดูล>` (ไม่ใช่ `main`) และ `.env` มี `DATA_SOURCE=postgres`
5. Plan mode: เสนอแผนตาม Spec หัวข้อ 5 (ไฟล์ที่จะแตะ) และหัวข้อ 9 (เทสต์) — รอผู้ใช้อนุมัติ
6. Act mode เรียงตามนี้:
   1. migration → `npm run db:setup`
   2. `apps/api/src/features/<ชื่อ>/index.js` (repository + routes) → ทดสอบด้วยคำสั่ง curl ใน AC
   3. `apps/api/test/<ชื่อ>.test.js` (ใช้ `node:test` + `fetch` แบบ `smoke.test.js`) → `npm test` จนผ่าน
   4. หน้าเว็บ + `lib/features/<ชื่อ>.js` + 1 บรรทัดใน `lib/features.js` → `npm run build:web` จนผ่าน
   5. เพิ่ม endpoint ลง `docs/api-spec.md`
7. ห้ามแก้เทสต์เดิมเพื่อให้ผ่าน ห้ามแก้ไฟล์นอกหัวข้อ 5 ถ้าจำเป็นให้หยุดถาม
8. อัปเดต `docs/handoff/<เลข>.md` ส่วน "2) Build" (ไฟล์ที่เปลี่ยน, ผลทดสอบ, กรณีทดสอบที่ครอบแล้ว, สิ่งที่เบี่ยงจาก Spec + เหตุผล)
9. เสนอข้อความ Commit แบบ Conventional Commits แล้วให้ผู้ใช้รัน `/check-before-pr.md` — ห้าม `git push` เอง
