# 🚨 ARREGLAR RAILWAY AHORA - Paso a Paso

## Problema Identificado

El backend está crasheando porque **NO PUEDE CONECTARSE A LA BASE DE DATOS MySQL**.

Error: `ECONNREFUSED` - La aplicación no puede conectarse a MySQL.

---

## ✅ SOLUCIÓN INMEDIATA

### Paso 1: Verificar que MySQL esté corriendo

1. Ve a Railway Dashboard
2. En el panel izquierdo, busca el servicio **MySQL**
3. Verifica que diga **"Online"** o **"Running"**
4. Si dice **"Crashed"** o **"Stopped"**, haz clic en **"Restart"**

### Paso 2: Verificar Variables de Entorno

En Railway, ve al servicio **web** (backend) → **Variables**

**IMPORTANTE**: Las variables deben usar las referencias de Railway, NO valores hardcodeados.

#### ❌ INCORRECTO (valores hardcodeados):
```
DB_HOST=containers-us-west-123.railway.app
DB_PORT=3306
DB_USERNAME=root
DB_PASSWORD=abc123xyz
DB_DATABASE=railway
```

#### ✅ CORRECTO (referencias de Railway):
```
DB_HOST=${{MySQL.MYSQLHOST}}
DB_PORT=${{MySQL.MYSQLPORT}}
DB_USERNAME=${{MySQL.MYSQLUSER}}
DB_PASSWORD=${{MySQL.MYSQLPASSWORD}}
DB_DATABASE=${{MySQL.MYSQLDATABASE}}
NODE_ENV=production
```

### Paso 3: Agregar JWT_SECRET (Opcional pero Recomendado)

Agrega esta variable también:
```
JWT_SECRET=aula-virtual-secret-key-2024-production
```

### Paso 4: Redeploy

1. Después de configurar las variables correctamente
2. Ve a **Deployments**
3. Haz clic en **"Redeploy"** en el último deployment
4. Espera 2-3 minutos

---

## 🔍 Verificar que Funcionó

### Opción 1: Ver los Logs

1. Ve a **Deployments** → Último deployment → **View Logs**
2. Busca este mensaje:
   ```
   ✅ Servidor corriendo en puerto XXXX
   ```
3. Si ves ese mensaje, ¡funcionó!

### Opción 2: Probar desde PowerShell

```bash
node test-backend.js
```

Deberías ver:
```
✅ Backend está respondiendo
✅ Login exitoso
```

---

## 🆘 Si Sigue Sin Funciona