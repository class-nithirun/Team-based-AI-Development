# Conventions (ข้อตกลงที่ทุกกลุ่มใช้ร่วมกัน)

## API
- path หลักของ feature: `/api/<ชื่อ>` พหูพจน์ ตัวพิมพ์เล็ก คั่นด้วย `-` เช่น `/api/courses`, `/api/doc-requests`
- endpoint สาธารณะ (ไม่ต้องล็อกอิน) อยู่ใต้ path ของ feature เช่น `GET /api/courses/public/:username` และห้ามส่ง `userId` หรือข้อมูลส่วนตัวออก
- ตอบสำเร็จ: `GET` → 200 + JSON · `POST` สร้าง → 201 + รายการที่สร้าง · `PUT`/`PATCH` → 200 + รายการหลังแก้ · `DELETE` → 204
- Error: โยน `new HttpError(status, 'ข้อความภาษาไทย', details?)` → ระบบตอบ `{ "error": { "message", "details" } }`
- รหัสที่ใช้: 400 ข้อมูลผิด · 401 ไม่ได้ล็อกอิน · 403 บทบาทไม่พอ · 404 ไม่พบหรือไม่ใช่ของตน · 409 สถานะไม่อนุญาตหรือข้อมูลซ้ำ · 501 ยังไม่ได้ตั้ง Postgres
- ชื่อฟิลด์ใน JSON เป็น camelCase (`sortOrder`, `isPublic`) คอลัมน์ใน DB เป็น snake_case (`sort_order`, `is_public`) — แปลงใน repository

## โค้ด API
- ทุกอย่างของ feature อยู่ใน `apps/api/src/features/<ชื่อ>/` (เริ่มจากคัดลอก `_template`) — ถ้า `index.js` ยาวเกิน ~200 บรรทัด แยก `repository.js`, `schemas.js` ไว้ในโฟลเดอร์เดียวกัน
- ชื่อ method ของ repository เป็นกริยา + ชื่อ feature เช่น `listCourses`, `createCourse` — กันชื่อชนกับกลุ่มอื่น (ทุก feature รวมเป็น repository เดียว และตัวที่โหลดทีหลังเขียนทับได้)
- SQL อยู่ใน `repository(pool)` เท่านั้น ใช้ `$1, $2` เสมอ
- วันเวลาเก็บเป็น `TIMESTAMPTZ` ส่งออกเป็น ISO 8601

## Database
- ไฟล์ migration: `apps/api/db/migrations/<เลขในช่วงของกลุ่ม>_<ชื่อ>.sql` เช่น `130_courses.sql`
- ตารางที่เป็นของผู้ใช้มี `user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE`
- ไม่ต้องเขียน `IF NOT EXISTS` — `migrate.js` ข้ามไฟล์ที่รันแล้วให้เอง

## Web
- เรียก API ผ่าน `request()` จาก `@/lib/api` ในไฟล์ `lib/features/<ชื่อ>.js` ของตัวเอง ห้ามแก้ `lib/api.js`
- เพิ่มเมนูหรือส่วนบนหน้า Public ด้วยการเพิ่มต่อท้าย 1 บรรทัดใน `lib/features.js`

## Git
- Branch กลุ่ม: `feature/<กลุ่ม>` (เช่น `feature/teaching`) · โมดูลแตกจาก branch กลุ่ม: `feature/<กลุ่ม>-<โมดูล>` (เช่น `feature/teaching-courses`)
- PR ของโมดูลเข้า branch กลุ่ม แล้ว branch กลุ่ม PR เข้า `main` ตอนท้าย
- Commit: Conventional Commits พร้อม scope เป็นชื่อ feature เช่น `feat(courses): add course CRUD`, `test(courses): cover IDOR`
- PR หนึ่งอัน = Issue หนึ่งใบ และรวม Spec + Handoff ของ Issue นั้นไว้ใน PR เดียวกัน
