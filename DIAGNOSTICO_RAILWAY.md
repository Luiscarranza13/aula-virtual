# 🚨 Diagnóstico: Backend en Railway con Error 502

## Problema Detectado

El backend en Railway está devolviendo **Error 502: Application failed to respond**

Esto significa que:
- ❌ El backend no está corriendo correctamente
- ❌ La aplicación está crasheando al iniciar
- ❌ Hay un error que impide que el servidor responda

---

## 🔍 Pasos para Diagnosticar

### 1. Revisar Logs de Railway

1. Ve a tu dashboard de Railway: https://railway.app
2. Selecciona tu proyecto del backend
3. Haz clic en el servicio (web-production-1288a)
4. Ve a la pestaña **"Deployments"**
5. Haz clic en el último deployment
6. Revisa los **logs** en tiempo real

**Busca errores como:**
- `Error: Cannot find module...`
- `TypeError: ...`
- `Error connecting to database...`
- `Port already in use...`
- Cualquier línea en rojo

### 2. Verificar Variables de Entorno

En Railway, ve a **Variables** y verifica que tengas:

```
DB_HOST=tu-host-mysql.railway.app
DB_PORT=3306
DB_USERNAME=root
DB_PASSWORD=tu-password
DB_DATABASE=railway
NODE_ENV=production
PORT=3001
```

**IMPORTANTE**: Railway asigna automáticamente la variable `PORT`, pero tu app debe escucharla.

### 3. Verificar que el Código Esté Actualizado

1. Ve a la pestaña **"Deployments"** en Railway
2. Verifica el último commit desplegado
3. Debe ser el commit más reciente de tu repo de GitHub

Si no está actualizado:
- Ve a **Settings** → **Deploy**
- Haz clic en **"Redeploy"**

---

## 🛠️ Soluciones Comunes

### Solución 1: Verificar Puerto

El archivo `aula1/src/main.ts` debe tener:

```typescript
const port = process.env.PORT || 3001;
await app.listen(port, '0.0.0.0');
```

✅ Ya está configurado correctamente

### Solución 2: Verificar Conexión a Base de Datos

Si los logs muestran error de conexión a MySQL:

1. Verifica que el servicio de MySQL esté corriendo en Railway
2. Verifica las credenciales en las variables de entorno
3. Asegúrate de que el host sea el correcto (no localhost)

### Solución 3: Módulo Seed Deshabilitado

El módulo seed está comentado en `app.module.ts`:

```typescript
// import { SeedModule } from './seed/seed.module'; // Temporalmente deshabilitado
```

✅ Ya está deshabilitado correctamente

### Solución 4: Reinstalar Dependencias

Si hay errores de módulos faltantes:

1. En Railway, ve a **Settings**
2. Busca **"Build Command"**
3. Asegúrate de que sea: `npm install && npm run build`
4. Redeploy

---

## 📋 Checklist de Verificación

- [ ] Logs de Railway revisados
- [ ] Variables de entorno configuradas
- [ ] MySQL corriendo en Railway
- [ ] Último commit desplegado
- [ ] Sin errores en los logs
- [ ] Puerto configurado correctamente

---

## 🆘 Si el Backend Sigue Sin Funcionar

### Opción 1: Desplegar desde Cero

1. En Railway, elimina el servicio actual
2. Crea un nuevo servicio desde GitHub
3. Conecta el repo: https://github.com/Luiscarranza13/backend-aula.git
4. Configura las variables de entorno
5. Espera a que termine el deployment

### Opción 2: Revisar el Código Localmente

Ejecuta el backend localmente para ver si hay errores:

```bash
cd aula1
npm install
npm run start:dev
```

Si hay errores localmente, arregla el código y haz push a GitHub.

---

## 📝 Información del Error Actual

```
Status: 502
Message: Application failed to respond
URL: https://web-production-1288a.up.railway.app
```

Este error indica que Railway está intentando hacer proxy a tu aplicación, pero la aplicación no está respondiendo. Esto generalmente significa que:

1. La aplicación crasheó al iniciar
2. La aplicación no está escuchando en el puerto correcto
3. Hay un error fatal que impide que el servidor inicie

**SIGUIENTE PASO**: Revisa los logs de Railway y copia aquí cualquier error que veas.
