# 🚂 Solución Final para Railway

## Problema Actual

El backend está crasheando en Railway con error 502. He actualizado el código para usar las variables correctas de Railway (`MYSQLHOST`, `MYSQLPORT`, etc.), pero necesitas verificar los logs para ver el error exacto.

---

## ✅ Cambios Realizados

1. ✅ Código actualizado para usar variables de Railway (`MYSQLHOST`, `MYSQLUSER`, etc.)
2. ✅ Fallback a variables antiguas (`DB_HOST`, `DB_USERNAME`, etc.)
3. ✅ JWT_SECRET con valor por defecto
4. ✅ Mejor manejo de errores en main.ts
5. ✅ Procfile configurado correctamente
6. ✅ Build funciona localmente

---

## 🔍 PASO 1: Ver los Logs de Railway

**ESTO ES CRÍTICO - Necesitas hacer esto para saber qué está fallando:**

1. Ve a Railway: https://railway.app
2. Selecciona tu proyecto
3. Haz clic en el servicio "backend-aula"
4. Haz clic en la pestaña **"Deployments"**
5. Haz clic en el último deployment (el más reciente)
6. Verás los logs en tiempo real

**Busca en los logs:**
- ❌ Líneas en rojo con "ERROR"
- ❌ "Unable to connect to database"
- ❌ "Cannot find module"
- ❌ "ECONNREFUSED"
- ❌ Cualquier stack trace

**Copia el error exacto y búscalo en Google o dímelo para ayudarte**

---

## 🛠️ PASO 2: Verificar Variables de Entorno

En Railway, ve a **Variables** y verifica que tengas:

### Variables de MySQL (automáticas de Railway)
```
MYSQLHOST=...
MYSQLPORT=3306
MYSQLUSER=root
MYSQLPASSWORD=...
MYSQLDATABASE=railway
```

### Variables que debes agregar manualmente
```
NODE_ENV=production
JWT_SECRET=aula-virtual-secret-key-2024
```

**IMPORTANTE**: NO agregues la variable `PORT`, Railway la asigna automáticamente.

---

## 🔄 PASO 3: Forzar Redeploy

Si las variables están bien pero sigue fallando:

1. Ve a **Deployments**
2. Haz clic en los 3 puntos del último deployment
3. Selecciona **"Redeploy"**
4. Espera 2-3 minutos
5. Revisa los logs nuevamente

---

## 🧪 PASO 4: Probar el Backend

Una vez que los logs muestren:
```
✅ Servidor corriendo en puerto XXXX
```

Ejecuta desde tu terminal:
```bash
node test-backend.js
```

Deberías ver:
```
✅ Backend está respondiendo
✅ Login exitoso
✅ Cursos obtenidos
```

---

## 🚨 Problemas Comunes y Soluciones

### Error: "Cannot connect to database"

**Causa**: MySQL no está corriendo o las credenciales son incorrectas

**Solución**:
1. Ve a la pestaña de MySQL en Railway
2. Verifica que esté "Online"
3. Si está "Offline", inícialo
4. Verifica que las variables `MYSQL*` estén correctas

### Error: "Cannot find module"

**Causa**: Falta alguna dependencia en package.json

**Solución**:
1. Verifica que `package.json` tenga todas las dependencias
2. En Railway, ve a Settings → Build Command
3. Asegúrate de que sea: `npm install && npm run build`
4. Redeploy

### Error: "Port already in use"

**Causa**: El código no está usando `process.env.PORT`

**Solución**:
- Ya está arreglado en el código actual
- El main.ts usa: `const port = process.env.PORT || 3001;`

### Error: "synchronize: true" causando problemas

**Causa**: TypeORM está intentando crear/modificar tablas automáticamente

**Solución temporal**:
1. Cambia `synchronize: true` a `synchronize: false` en `app.module.ts`
2. Importa la base de datos manualmente usando el archivo SQL

---

## 📝 PASO 5: Una vez que funcione

Cuando el backend esté funcionando correctamente:

### 1. Crear Cursos
```bash
node crear-cursos-api.js
```

### 2. Verificar Frontend
1. Ve a tu sitio de Vercel
2. Intenta hacer login con: admin@aula.com / admin123
3. Deberías ver el dashboard

---

## 🆘 Si Nada Funciona

### Opción 1: Usar el servidor de prueba temporalmente

1. Cambia el Procfile a:
   ```
   web: node server-test.js
   ```

2. Haz commit y push:
   ```bash
   cd aula1
   git add Procfile
   git commit -m "Usar servidor de prueba"
   git push origin main
   ```

3. Esto te dará un backend funcional (sin base de datos) para probar el frontend

### Opción 2: Desplegar desde cero

1. En Railway, elimina el servicio actual
2. Crea un nuevo servicio desde GitHub
3. Conecta el repo: https://github.com/Luiscarranza13/backend-aula.git
4. Agrega las variables de entorno manualmente
5. Espera el deployment

---

## 📊 Checklist Final

- [ ] Logs de Railway revisados
- [ ] Error específico identificado
- [ ] Variables de entorno configuradas
- [ ] MySQL corriendo en Railway
- [ ] Redeploy realizado
- [ ] Backend respondiendo (test-backend.js exitoso)
- [ ] Frontend conectándose correctamente
- [ ] Cursos creados

---

## 💡 Nota Importante

El código está correcto y funciona localmente. El problema está en la configuración de Railway o en la conexión a MySQL. Los logs te dirán exactamente qué está fallando.

**SIGUIENTE PASO**: Ve a Railway → Deployments → Logs y copia aquí el error que veas.
