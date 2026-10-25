# check-before-pr — ตรวจก่อนเปิด Pull Request (ubu-biolink)

ใช้ทุกครั้งก่อนเปิด PR · ทำตามลำดับ · ถ้าขั้นไหนไม่ผ่าน **หยุด** แล้วรายงานผู้ใช้ — ห้ามข้ามขั้น และห้ามแก้เทสต์เพื่อให้ผ่าน

## 1. รู้ว่ากำลังทำงานอะไร

```bash
git branch --show-current
```

- ต้องเป็น `feature/<กลุ่ม>-<โมดูล>` หรือ `feature/<กลุ่ม>` (ไม่ใช่ `main`) — ถ้าอยู่ `main` ให้หยุด
- ถามผู้ใช้ว่า PR นี้จะเข้า base ไหน (โมดูล → `feature/<กลุ่ม>` · กลุ่ม → `main`) แล้วใช้เป็น `<base>` ในขั้นต่อไป
- เปิด `docs/specs/<เลข>-<ชื่อ>.md` และ `docs/handoff/<เลข>.md` ไว้ใช้ตรวจ — Handoff ส่วนที่ 1 ต้องติ๊กอนุมัติแล้ว

## 2. ไม่มีไฟล์แปลกปลอม

```bash
git status --short
git diff --name-only <base>...HEAD
```

- ไฟล์ที่เปลี่ยนต้องอยู่ในตารางหัวข้อ 5 ของ Spec (+ Spec/Handoff ของ Issue นี้) เท่านั้น
- ถ้ามีไฟล์ที่ `AGENTS.md` ห้ามแก้ หรือไฟล์ของโมดูล/กลุ่มอื่น → ถามผู้ใช้ว่าจะคืนค่าด้วย `git restore --source <base> <ไฟล์>` หรือไม่
- migration ใหม่ต้องมีเลขอยู่ในช่วงของกลุ่ม และไม่มีการแก้ migration ที่มีอยู่แล้ว
- ต้องไม่มี `.env`, `node_modules/`, `.next/` ในรายการ

## 3. ไม่มีความลับในโค้ด

```bash
git diff <base>...HEAD | grep -n -i -E "api[_-]?key|secret|password|token" || echo "ไม่พบคำต้องสงสัย"
```

- ถ้าพบ ให้แสดงบรรทัดนั้นให้ผู้ใช้ตัดสิน (ชื่อตัวแปร เช่น `SEED_USER_PASSWORD` ไม่เป็นไร แต่ค่าจริงห้าม commit)

## 4. คุณภาพ

```bash
npm test
npm run build:web
```

- ต้องเห็น `fail 0` และ build สำเร็จ
- ต้องมี `apps/api/test/<ชื่อ>.test.js` ของโมดูลนี้ และเทสต์ Postgres **ต้องไม่ถูก skip** (ตั้ง `TEST_DATABASE_URL` ก่อนรัน — ดู `docs/postgres.md`)

## 5. Acceptance Criteria

- รัน `npm run dev:api` ใหม่ในอีก Terminal
- รันคำสั่งในหัวข้อ 8 ของ Spec **ทุกข้อตามลำดับ** แล้วรายงานเป็นตาราง: ข้อ · ผลที่ต้องเห็น · ผลที่เห็นจริง · ผ่าน/ไม่ผ่าน
- restart API แล้วเรียก GET อีกครั้ง ข้อมูลต้องยังอยู่
- ข้อที่ต้องดูด้วยตา (หน้า Dashboard / หน้า Public) ให้ขอให้ผู้ใช้ตรวจและยืนยัน

## 6. Commit และ Push

```bash
git add <เฉพาะไฟล์ในหัวข้อ 5 ของ Spec + Spec/Handoff>
git commit -m "feat(<ชื่อ>): <สรุปสั้น ๆ> (#<เลข Issue>)"
git push -u origin <branch ปัจจุบัน>
```

- ห้ามใช้ `git add -A` หรือ `git add .`

## 7. เปิด Pull Request

```bash
gh pr create --base <base> --title "feat(<ชื่อ>): <สรุปสั้น ๆ>" --body "Closes #<เลข Issue>

Spec: docs/specs/<เลข>-<ชื่อ>.md · Handoff: docs/handoff/<เลข>.md

## ผล Acceptance Criteria
<ตารางจากขั้นที่ 5>"
```

- แจ้งผู้ใช้ให้กรอก `.github/pull_request_template.md` ให้ครบ แนบภาพหน้าจอ และขอคนจากอีกโมดูลหรืออีกกลุ่ม Review
