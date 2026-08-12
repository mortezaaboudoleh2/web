# راهنمای مشارکت

از علاقه‌ی شما به بهبود این پروژه سپاسگزاریم! 💗

## شروع

```bash
git clone https://github.com/USERNAME/hana-love.git
cd hana-love
npm install
cp .env.example .env
npm run dev
```

## گردش کار

1. مخزن را Fork کنید.
2. یک شاخه بسازید: `git checkout -b feat/my-feature`
3. تغییرات را اعمال کنید و تست‌ها را اجرا کنید: `npm test`
4. کد را قالب‌بندی کنید: `npm run format`
5. کامیت کنید (قالب Conventional Commits): `git commit -m "feat: افزودن قابلیت X"`
6. Push و سپس Pull Request باز کنید.

## قالب پیام کامیت

از [Conventional Commits](https://www.conventionalcommits.org/) پیروی می‌کنیم:

| پیشوند | کاربرد |
|---|---|
| `feat:` | قابلیت جدید |
| `fix:` | رفع باگ |
| `docs:` | تغییر مستندات |
| `style:` | قالب‌بندی بدون تغییر منطق |
| `refactor:` | بازنویسی بدون تغییر رفتار |
| `test:` | افزودن یا اصلاح تست |
| `chore:` | کارهای نگهداری |

## سبک کد

- Node.js نسخه ۱۸ یا بالاتر
- تورفتگی: ۲ فاصله
- نقل‌قول تکی، سمی‌کالن الزامی
- قبل از ارسال PR حتماً `npm run format` را اجرا کنید.

## گزارش باگ

از قالب‌های موجود در `.github/ISSUE_TEMPLATE/` استفاده کنید و موارد زیر را ذکر کنید:
- نسخه‌ی Node.js و سیستم‌عامل
- مراحل بازتولید
- رفتار مورد انتظار در برابر رفتار مشاهده‌شده
