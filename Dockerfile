FROM node:20-alpine AS base

WORKDIR /app
COPY package*.json ./
RUN npm install


FROM base AS builder
WORKDIR /app
COPY . .
RUN npm run build


FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist
RUN npm install --omit=dev

EXPOSE 3000
CMD ["npm", "start"]