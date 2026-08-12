FROM node:20-alpine AS base
WORKDIR /app
ENV NODE_ENV=production

# نصب وابستگی‌ها در لایه‌ی جدا برای استفاده از کش
COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force

# کپی سورس
COPY src ./src

# اجرا با کاربر غیر root
RUN mkdir -p /app/data && chown -R node:node /app
USER node

EXPOSE 3000
ENV PORT=3000 HOST=0.0.0.0 DATA_DIR=/app/data

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD node -e "fetch('http://127.0.0.1:'+(process.env.PORT||3000)+'/healthz').then(r=>process.exit(r.ok?0:1)).catch(()=>process.exit(1))"

CMD ["node", "src/server.js"]
