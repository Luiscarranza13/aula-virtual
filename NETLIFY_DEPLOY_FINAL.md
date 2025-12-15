# 🚀 INSTRUCCIONES FINALES PARA NETLIFY

## ⚠️ PROBLEMA ACTUAL
El frontend en Netlify sigue mostrando la URL incorrecta del backend debido a caché. 

**URL INCORRECTA (antigua):** `https://web-production-1288a.up.railway.app`
**URL CORRECTA (nueva):** `https://backend-aula-production.up.railway.app`

## ✅ SOLUCIÓN IMPLEMENTADA

### 1. Archivos Actualizados
- ✅ `aula-virtual-frontend/.env.production` - Variable correcta
- ✅ `aula-virtual-frontend/lib/api-new.js` - URL hardcodeada correcta
- ✅ `aula-virtual-frontend/app/login/page.js` - Usa api-new.js
- ✅ `aula-virtual-frontend/netlify.toml` - Variable en build
- ✅ `aula-virtual-frontend/package.json` - Script de verificación

### 2. Archivos de Verificación Creados
- ✅ `aula-virtual-frontend/public/test-connection.html` - Test directo
- ✅ `aula-virtual-frontend/scripts/verify-build.js` - Verificación automática

## 🔧 PASOS PARA ARREGLAR EN NETLIFY

### Paso 1: Configurar Variable de Entorno
1. Ir a Netlify Dashboard → Tu sitio → Site settings → Environment variables
2. Agregar/Actualizar:
   - **Key:** `NEXT_PUBLIC_API_URL`
   - **Value:** `https://backend-aula-production.up.railway.app`

### Paso 2: Limpiar Caché y Redesplegar
1. Ir a Deploys → Trigger deploy
2. Seleccionar **"Clear cache and deploy site"**
3. Esperar que termine el build

### Paso 3: Verificar Funcionamiento
1. Ir a: `https://tu-sitio.netlify.app/test-connection.html`
2. Debe mostrar conexión exitosa con el backend
3. Probar login en: `https://tu-sitio.netlify.app/login`
4. Usar credenciales: `admin@aula.com` / `admin123`

## 🧪 CREDENCIALES DE PRUEBA
```
Admin: admin@aula.com / admin123
Docente: docente@test.com / admin123  
Estudiante: estudiante@test.com / admin123
```

## 🔍 VERIFICACIÓN TÉCNICA

### Backend Funcionando ✅
- URL: https://backend-aula-production.up.railway.app
- Health: https://backend-aula-production.up.railway.app/health
- Login: https://backend-aula-production.up.railway.app/auth/login

### Frontend Configurado ✅
- Variable de entorno: `NEXT_PUBLIC_API_URL=https://backend-aula-production.up.railway.app`
- API hardcodeada en `lib/api-new.js`
- Login usando `api-new.js`

## 🚨 SI SIGUE SIN FUNCIONAR

### Opción 1: Verificar en Netlify
```bash
# En el build log de Netlify, buscar:
NEXT_PUBLIC_API_URL=https://backend-aula-production.up.railway.app
```

### Opción 2: Test Manual
1. Abrir DevTools en el navegador
2. Ir a Network tab
3. Intentar login
4. Verificar que las requests vayan a `backend-aula-production.up.railway.app`

### Opción 3: Forzar Rebuild Completo
1. Cambiar algo mínimo en el código (ej: agregar espacio)
2. Commit y push
3. Netlify auto-desplegará

## 📊 ESTADO ACTUAL DEL SISTEMA

### ✅ FUNCIONANDO
- Backend en Railway: https://backend-aula-production.up.railway.app
- Base de datos MySQL en Railway
- Usuario admin creado: admin@aula.com / admin123
- 10 cursos creados en la base de datos
- Sistema de JWT y roles implementado
- Módulo de exámenes completo (34 exámenes con 5 preguntas c/u)

### 🔄 EN PROCESO
- Frontend en Netlify conectándose al backend correcto

### 🎯 OBJETIVO
- Login funcionando en Netlify con credenciales: admin@aula.com / admin123
- Dashboard cargando datos del backend en Railway
- Sistema completo funcionando end-to-end

## 📞 SOPORTE
Si después de seguir estos pasos el problema persiste, el issue está en la configuración de Netlify, no en el código.