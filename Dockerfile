# Etapa 1: Construcción con Node.js
FROM node:24.1.0 AS builder

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos necesarios
COPY package*.json ./
RUN npm install

# Copiar el resto del código fuente
COPY . .

# Ejecutar el build de React
RUN npm run build

# Etapa 2: Servir usando NGINX
FROM nginx:alpine

# Copiar archivos generados al directorio de NGINX
COPY --from=builder /app/build /usr/share/nginx/html

# Copiar configuración personalizada de NGINX (opcional)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exponer el puerto que usará NGINX
EXPOSE 80

# Comando por defecto al iniciar el contenedor
CMD ["nginx", "-g", "daemon off;"]
