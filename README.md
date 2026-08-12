<div align="center">

# 💌 hana-love

**یک وب‌اپ عاشقانه‌ی تک‌صفحه‌ای با تم نئون — برای عذرخواهی، آشتی و گرفتن قرار**

[![Node.js](https://img.shields.io/badge/Node.js-%3E%3D18-339933?logo=node.js&logoColor=white)](https://nodejs.org)
[![Express](https://img.shields.io/badge/Express-4.x-000000?logo=express&logoColor=white)](https://expressjs.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-ff2e88.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-b14aff.svg)](CONTRIBUTING.md)

[امکانات](#-امکانات) · [نصب سریع](#-نصب-سریع) · [پیکربندی](#-پیکربندی) · [API](#-api) · [دیپلوی](#-دیپلوی)

</div>

---

## 📖 درباره

`hana-love` یک اپلیکیشن وب کوچک و بدون وابستگی سنگین است که یک تجربه‌ی تعاملی عاشقانه می‌سازد:
یک پاکت نامه باز می‌شود، یک نامه‌ی عذرخواهی تایپ می‌شود، مخاطب از میان یک دکمه‌ی فراری «آشتی» را انتخاب می‌کند و در نهایت به چند پرسش پاسخ می‌دهد. پاسخ‌ها هم به‌صورت متن قابل‌کپی به کاربر داده می‌شود و هم در یک پنل ادمین محافظت‌شده ذخیره می‌گردد.

> ساخته‌شده با 💗 — رابط کاربری کاملاً فارسی و راست‌به‌چپ (RTL).

## ✨ امکانات

| | |
|---|---|
| 💌 **پاکت نامه‌ی سه‌بعدی** | انیمیشن باز شدن با CSS 3D و مهر موم |
| ✍️ **نامه‌ی تایپ‌شونده** | متن عذرخواهی حرف‌به‌حرف ظاهر می‌شود |
| 🥺 **صحنه‌ی آشتی** | دکمه‌ی «نه» از موس/لمس فرار می‌کند و بعد از ۶ تلاش محو می‌شود |
| 💓 **قلب لمسی** | نگه‌داشتن ۳ ثانیه‌ای با حلقه‌ی پیشرفت SVG |
| 💬 **چت تعاملی** | افکت تایپینگ، نوار پیشرفت، پرسش‌های گزینه‌ای و متن آزاد |
| 📊 **خط‌کش عشق** | اسلایدر ۰ تا ۱۰۰ با پاسخ پویا |
| 📅 **فرم قرار** | تاریخ، ساعت و مکان |
| 📝 **خروجی متنی** | کپی، واتساپ، تلگرام، Web Share API و دانلود `.txt` |
| 🔐 **پنل ادمین** | ورود توکنی برای مشاهده و حذف پاسخ‌ها |
| 🎵 **صدا** | ملودی و افکت‌های صوتی با Web Audio API (بدون فایل خارجی) |
| 🌸 **پس‌زمینه‌ی زنده** | قلب و گلبرگ متحرک روی Canvas |

## 🚀 نصب سریع

```bash
git clone https://github.com/USERNAME/hana-love.git
cd hana-love
npm install
cp .env.example .env    # مقادیر را ویرایش کنید
npm start
```

سپس مرورگر را باز کنید: <http://localhost:3000>

### حالت توسعه

```bash
npm run dev     # با ری‌استارت خودکار (node --watch)
```

## ⚙️ پیکربندی

متغیرهای محیطی از طریق فایل `.env` یا محیط سیستم:

| متغیر | پیش‌فرض | توضیح |
|---|---|---|
| `PORT` | `3000` | پورت سرور |
| `HOST` | `0.0.0.0` | آدرس bind |
| `ADMIN_USER` | `admin` | نام کاربری پنل ادمین |
| `ADMIN_PASS` | `change-me` | **حتماً تغییر دهید** |
| `DATA_DIR` | `./data` | مسیر ذخیره‌ی `answers.json` |
| `SESSION_TTL_MS` | `43200000` | عمر توکن نشست (۱۲ ساعت) |
| `NODE_ENV` | — | با `production` کش فایل‌های استاتیک فعال می‌شود |

## 🗂 ساختار پروژه

```
hana-love/
├── src/
│   ├── public/
│   │   ├── index.html      # تجربه‌ی کاربر (نامه، آشتی، چت)
│   │   └── admin.html      # پنل ادمین
│   ├── app.js              # ساخت اپ اکسپرس و میدل‌ورها
│   ├── auth.js             # احراز هویت توکنی ادمین
│   ├── config.js           # پیکربندی متمرکز
│   ├── routes.js           # مسیرهای API
│   ├── server.js           # نقطه‌ی ورود + graceful shutdown
│   └── store.js            # لایه‌ی ذخیره‌سازی JSON
├── test/
│   └── api.test.js         # تست‌های node:test
├── docs/
│   └── DEPLOY.md           # راهنمای دیپلوی
├── .github/
│   ├── workflows/ci.yml    # اجرای تست در CI
│   └── ISSUE_TEMPLATE/
├── .env.example
├── Dockerfile
└── package.json
```

## 🔌 API

| متد | مسیر | احراز هویت | توضیح |
|---|---|---|---|
| `GET` | `/api/status` | ❌ | وضعیت سرویس |
| `POST` | `/api/answer` | ❌ | ثبت پاسخ‌ها |
| `POST` | `/api/admin/login` | ❌ | دریافت توکن |
| `POST` | `/api/admin/logout` | ✅ | ابطال توکن |
| `GET` | `/api/admin/answers` | ✅ | فهرست پاسخ‌ها |
| `DELETE` | `/api/admin/answers/:id` | ✅ | حذف یک پاسخ |
| `GET` | `/healthz` | ❌ | بررسی سلامت |

احراز هویت با هدر `Authorization: Bearer <token>` انجام می‌شود.

<details>
<summary><b>نمونه‌ی درخواست‌ها</b></summary>

```bash
# ثبت پاسخ
curl -X POST http://localhost:3000/api/answer \
  -H 'Content-Type: application/json' \
  -d '{"ashti":"آره، آشتی 💖","love":100,"answers":[]}'

# ورود ادمین
TOKEN=$(curl -s -X POST http://localhost:3000/api/admin/login \
  -H 'Content-Type: application/json' \
  -d '{"user":"admin","pass":"your-password"}' | jq -r .token)

# دریافت پاسخ‌ها
curl http://localhost:3000/api/admin/answers \
  -H "Authorization: Bearer $TOKEN"
```
</details>

## 🧪 تست

```bash
npm test
```

## 🐳 Docker

```bash
docker build -t hana-love .
docker run -p 3000:3000 \
  -e ADMIN_USER=morteza \
  -e ADMIN_PASS=secret \
  -v $(pwd)/data:/app/data \
  hana-love
```

## ☁️ دیپلوی

راهنمای کامل در [`docs/DEPLOY.md`](docs/DEPLOY.md) — شامل Render، Railway، Fly.io و VPS.

خلاصه:
- **Build:** `npm install`
- **Start:** `npm start`
- **Env:** `ADMIN_USER`, `ADMIN_PASS`
- برای ماندگاری داده‌ها یک دیسک دائمی به `DATA_DIR` وصل کنید.

## 🔒 نکات امنیتی

- رمز پیش‌فرض (`change-me`) را حتماً عوض کنید.
- فایل `.env` هرگز نباید کامیت شود (در `.gitignore` هست).
- مقایسه‌ی رمز به‌صورت زمان‌ثابت (`timingSafeEqual`) انجام می‌شود.
- داده‌ها در فایل JSON ساده ذخیره می‌شوند؛ برای بار بالا از دیتابیس استفاده کنید.

## 🤝 مشارکت

راهنما در [`CONTRIBUTING.md`](CONTRIBUTING.md). Issue و PR خوش‌آمد است.

## 📄 مجوز

[MIT](LICENSE) © Morteza
