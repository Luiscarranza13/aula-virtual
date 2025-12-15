# 🚀 Instrucciones para Desplegar en Railway

## Estado Actual
- ✅ Frontend desplegado en Netlify
- ✅ Backend código subido a GitHub
- ⏳ Falta: Configurar MySQL y conectar todo

## Pasos para Completar el Despliegue

### 1️⃣ Crear MySQL en Railway

1. Ve a tu proyecto en Railway: https://railway.app
2. Click en **"+ New"**
3. Selecciona **"Database"** → **"Add MySQL"**
4. Espera a que se cree (toma ~30 segundos)

### 2️⃣ Obtener Credenciales de MySQL

1. Click en el servicio **"MySQL"** que acabas de crear
2. Ve a la pestaña **"Connect"**
3. Copia las credenciales que aparecen:
   - `MYSQLHOST`
   - `MYSQLPORT`
   - `MYSQLUSER`
   - `MYSQLPASSWORD`
   - `MYSQLDATABASE`

### 3️⃣ Configurar Variables en el Backend

1. Click en tu servicio **"web"** (el backend)
2. Ve a la pestaña **"Variables"**
3. Click en **"+ New Variable"** y agrega cada una:

```
DB_HOST = ${{MySQL.MYSQLHOST}}
DB_PORT = ${{MySQL.MYSQLPORT}}
DB_USERNAME = ${{MySQL.MYSQLUSER}}
DB_PASSWORD = ${{MySQL.MYSQLPASSWORD}}
DB_DATABASE = ${{MySQL.MYSQLDATABASE}}
NODE_ENV = production
```

**Nota:** Railway permite referenciar variables de otros servicios usando `${{NombreServicio.VARIABLE}}`

### 4️⃣ Importar Base de Datos

Tienes 2 opciones:

#### Opción A: Usando el script (Recomendado)

1. Edita el archivo `aula1/.env.railway` con las credenciales de Railway
2. Ejecuta:
   ```bash
   cd aula1
   node import-to-railway.js
   ```

#### Opción B: Usando Railway CLI

1. Instala Railway CLI:
   ```bash
   npm install -g @railway/cli
   ```

2. Login:
   ```bash
   railway login
   ```

3. Conecta al proyecto:
   ```bash
   railway link
   ```

4. Importa el SQL:
   ```bash
   railway run mysql -u root -p < ../aula_virtual_nest.sql
   ```

#### Opción C: Usando MySQL Workbench o phpMyAdmin

1. Usa las credenciales de Railway para conectarte
2. Importa el archivo `aula_virtual_nest.sql`

### 5️⃣ Verificar el Despliegue

1. En Railway, ve a tu servicio **"web"**
2. Ve a **"Deployments"** → Click en el último deployment
3. Click en **"View Logs"**
4. Deberías ver: `🚀 Servidor NestJS corriendo en puerto XXXX`

### 6️⃣ Generar Dominio Público

1. En el servicio **"web"**, ve a **"Settings"**
2. Scroll hasta **"Networking"**
3. Click en **"Generate Domain"**
4. Copia la URL (ej: `https://backend-aula-production.up.railway.app`)

### 7️⃣ Actualizar Frontend en Netlify

1. Ve a tu sitio en Netlify
2. Ve a **"Site configuration"** → **"Environment variables"**
3. Edita `NEXT_PUBLIC_API_URL`:
   ```
   NEXT_PUBLIC_API_URL=https://tu-backend.up.railway.app
   ```
4. Ve a **"Deploys"** → Click en **"Trigger deploy"** → **"Deploy site"**

### 8️⃣ Probar la Aplicación

1. Ve a tu URL de Netlify
2. Intenta hacer login con:
   - Admin: `admin@test.com` / `admin123`
   - Docente: `docente@test.com` / `admin123`
   - Estudiante: `estudiante@test.com` / `admin123`

## 🎉 ¡Listo!

Tu aplicación debería estar funcionando completamente en producción.

## 📊 URLs Finales

- **Frontend (Netlify):** https://tu-sitio.netlify.app
- **Backend (Railway):** https://tu-backend.up.railway.app
- **API Docs:** https://tu-backend.up.railway.app/api

## 🐛 Solución de Problemas

### El backend no inicia
- Verifica que las variables de entorno estén configuradas
- Revisa los logs en Railway: Deployments → View Logs

### Error de conexión a MySQL
- Verifica que MySQL esté corriendo en Railway
- Verifica que las variables DB_* estén correctas

### Frontend no se conecta al backend
- Verifica que `NEXT_PUBLIC_API_URL` esté configurada en Netlify
- Verifica que el backend tenga CORS habilitado para tu dominio de Netlify

### Base de datos vacía
- Importa el archivo SQL usando uno de los métodos del Paso 4

## 📞 Soporte

Si tienes problemas:
1. Revisa los logs en Railway
2. Verifica las variables de entorno
3. Asegúrate de que MySQL esté corriendo
