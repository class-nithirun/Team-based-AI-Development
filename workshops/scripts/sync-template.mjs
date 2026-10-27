// ซิงก์ repo แม่แบบ (dms-practice-template) ให้ตรงกับ repo หลักสูตร
//   practice-app/ (ยกเว้น .github — เฉลย WS4.1)  →  รากของ template
//   workshops/    (ยกเว้นสคริปต์นี้)              →  template/workshops/
// ลิงก์ที่ชี้ออกนอก workshops/ ถูกแปลงให้ใช้ได้ใน template · ตรวจลิงก์สัมพัทธ์ทุกไฟล์ .md (ลิงก์เสีย → exit 1)
// ใช้: node workshops/scripts/sync-template.mjs <โฟลเดอร์ clone ของ dms-practice-template>
// แล้วตรวจ `git status` ใน template · npm ci && npm run lint && npm test · commit + push เอง
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..', '..');
const COURSE = 'https://github.com/class-nithirun/Team-based-AI-Development/blob/main';
const dest = process.argv[2];
if (!dest || !fs.existsSync(path.join(dest, '.git'))) {
  console.error('ระบุโฟลเดอร์ clone ของ dms-practice-template เช่น ../dms-practice-template');
  process.exit(1);
}
const SKIP = new Set(['.github', 'node_modules', '.env', 'data', 'sync-template.mjs']);

function copyTree(from, to, rewrite) {
  fs.mkdirSync(to, { recursive: true });
  for (const e of fs.readdirSync(from, { withFileTypes: true })) {
    if (SKIP.has(e.name)) continue;
    const src = path.join(from, e.name);
    const dst = path.join(to, e.name);
    if (e.isDirectory()) copyTree(src, dst, rewrite);
    else if (e.name.endsWith('.md')) fs.writeFileSync(dst, rewrite(fs.readFileSync(src, 'utf8'), path.relative(ROOT, src)));
    else fs.copyFileSync(src, dst);
  }
}

// 1) practice-app → ราก (ลิงก์ ../workshops/ ใน README ของแอป → workshops/)
copyTree(path.join(ROOT, 'practice-app'), dest, (md) => md.replaceAll('](../workshops/', '](workshops/'));

// 2) workshops → workshops/ (ลบของเดิมก่อน กันไฟล์ที่ถูกลบในต้นทางค้างอยู่)
const out = path.join(dest, 'workshops');
fs.rmSync(out, { recursive: true, force: true });
copyTree(path.join(ROOT, 'workshops'), out, (md) => md
  .replaceAll('](../practice-app/', '](../')                        // README.md ของ workshops
  .replaceAll('](../../practice-app/.github/', `](${COURSE}/practice-app/.github/`) // เฉลย ci.yml อยู่ใน repo หลักสูตรเท่านั้น
  .replaceAll('](../../practice-app/', '](../../')
  .replaceAll('](../slides/', `](${COURSE}/slides/`)
  .replaceAll('](../guide/', `](${COURSE}/guide/`));

// 3) ตรวจลิงก์สัมพัทธ์
const walk = (d) => fs.readdirSync(d, { withFileTypes: true })
  .flatMap((e) => (e.name === 'node_modules' || e.name === '.git') ? [] : e.isDirectory() ? walk(path.join(d, e.name)) : [path.join(d, e.name)]);
let broken = 0;
for (const f of walk(dest).filter((f) => f.endsWith('.md'))) {
  for (const [, link] of fs.readFileSync(f, 'utf8').matchAll(/\]\(([^)#\s]+)(?:#[^)]*)?\)/g)) {
    if (/^(https?:|mailto:)/.test(link) || link.startsWith('../blob/')) continue;   // ../blob/ = ลิงก์ในการ์ด Issue
    if (!fs.existsSync(path.resolve(path.dirname(f), decodeURI(link)))) { broken++; console.log(`ลิงก์เสีย: ${path.relative(dest, f)} → ${link}`); }
  }
}
console.log(`ซิงก์แล้ว: practice-app → ราก · workshops → workshops/ · ลิงก์เสีย ${broken}`);
process.exit(broken ? 1 : 0);
