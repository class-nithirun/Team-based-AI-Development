# Lessons (สิ่งที่ AI ทำผิดบ่อย และวิธีป้องกัน)

รูปแบบ: `- [วันที่] ปัญหา → วิธีป้องกัน (อ้างอิง PR/Issue)`
เพิ่มจากผล Review และ Retro — ข้อที่มีอยู่แล้วผู้สอนใส่ไว้ล่วงหน้า (ข้อผิดพลาดที่พบบ่อยกับโครงแบบนี้)

- [2026-10-24] AI แก้ `apps/api/src/app.js` เพื่อเพิ่ม router → feature ถูกโหลดอัตโนมัติจาก `src/features/<ชื่อ>/` ให้ export `path` + `routes` เท่านั้น (D-001)
- [2026-10-24] AI รับ `userId` จาก body หรือ query → ใช้ `req.user.id` จาก token เท่านั้น และใส่ `user_id` ใน `WHERE` ทุกคำสั่งแก้/ลบ (กัน IDOR)
- [2026-10-24] AI ตั้งเลข migration ต่อจาก `004` เป็น `005_...` → ใช้เลขในช่วงของกลุ่มตัวเอง (D-003)
- [2026-10-24] AI เพิ่ม method ใน `repositories/memory.js` → feature ใช้ Postgres อย่างเดียว (D-002)
- [2026-10-24] AI ติดตั้ง Jest หรือ Supertest เพื่อเขียนเทสต์ → ใช้ `node:test` + `fetch` แบบเดียวกับ `apps/api/test/smoke.test.js`
- [2026-10-24] AI แก้ `PublicProfile.jsx` เพื่อแสดงข้อมูลของกลุ่ม → สร้าง component ใน `components/public/sections/` แล้วเพิ่ม 1 บรรทัดใน `PUBLIC_SECTIONS`
