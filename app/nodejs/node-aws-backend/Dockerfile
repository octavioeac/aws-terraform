# syntax=docker/dockerfile:1

# 1) Dependencias (sin dev) en capa separada
FROM node:20-alpine AS deps
WORKDIR /app
COPY package.json package-lock.json ./
# Cache de npm para builds más rápidos (opcional)
RUN --mount=type=cache,target=/root/.npm npm ci --omit=dev

# 2) Imagen final (runner)
FROM node:20-alpine AS runner
ENV NODE_ENV=production
WORKDIR /app

# Copiamos node_modules desde la etapa deps
COPY --from=deps /app/node_modules ./node_modules
# Copiamos el código
COPY . .

ENV PORT=3000
EXPOSE 3000

# Corre como no-root
USER node

# Si tu archivo está en src/index.js:
CMD ["node", "src/index.js"]
