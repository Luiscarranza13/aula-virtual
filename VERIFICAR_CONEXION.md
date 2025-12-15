# 🔍 Verificar Conexión Frontend-Backend

## Estado Actual

✅ **Backend en Railway**: https://web-production-1288a.up.railway.app (Online)
✅ **Frontend en Vercel**: Desplegado con variable `NEXT_PUBLIC_API_URL` configurada
✅ **CORS configurado**: Backend acepta peticiones desde `*.vercel.app`
✅ **Código actualizado**: Mensaje de error corregido para mostrar URL correcta

---

## 🧪 Pasos para Verificar la Conexión

### 1. Verificar que Vercel haya redesplegado

1. Ve a tu dashboard de Vercel
2. Busca el proyecto del frontend
3. Verifica que el último deployment sea exitoso (debe mostrar el commit "Fix: Corregir mensaje de error...")
4. Si no ha redesplegado automáticamente, haz clic en "Redeploy"

### 2. Probar la Página de Diagnóstico

Una vez que Vercel termine de desplegar, abre en tu navegador:

```
https://tu-sitio-vercel.vercel.app/test-api.html
```

Esta página tiene 3 botones de prueba:

- **Test Backend Health**: Verifica que el backend esté respondiendo
- **Test Login**: Prueba el login con credenciales de admin
- **Test Get Courses**: Obtiene la lista de cursos

### 3. Verificar Variables de Entorno en Vercel

1. Ve a tu proyecto en Vercel
2. Settings → Environment Variables
3. Verifica que `NEXT_PUBLIC_API_URL` tenga el valor:
   ```
   https://web-production-1288a.up.railway.app
   ```
4. Asegúrate de que esté marcada para **Production**, **Preview** y **Development**

### 4. Probar el Login Normal

1. Ve a tu sitio de Vercel
2. Intenta hacer login con:
   - Email: `admin@aula.com`
   - Contraseña: `admin123`

3. Si ves un error, abre la consola del navegador (F12) y busca:
   - Errores de CORS
   - Errores de red
   - La URL que está intentando usar

---

## 🐛 Problemas Comunes

### Error: "No se puede conectar con el servidor"

**Causa**: El backend no está respondiendo o hay un problema de CORS

**Solución**:
1. Verifica que el backend esté Online en Railway
2. Prueba acceder directamente a: https://web-production-1288a.up.railway.app
3. Debería mostrar: "Aula Virtual API is running"

### Error: CORS

**Causa**: El backend no acepta peticiones desde tu dominio de Vercel

**Solución**:
1. El CORS ya está configurado para aceptar `*.vercel.app`
2. Si tu dominio es diferente, necesitas agregarlo en `aula1/src/main.ts`

### Variables de entorno no se actualizan

**Causa**: Vercel cachea las variables de entorno

**Solución**:
1. Ve a Settings → Environment Variables en Vercel
2. Edita la variable `NEXT_PUBLIC_API_URL`
3. Guarda (aunque no cambies nada)
4. Haz un Redeploy manual

---

## 📝 Siguiente Paso: Crear Cursos

Una vez que el frontend se conecte correctamente al backend, ejecuta:

```bash
node crear-cursos-api.js
```

Esto creará 10 cursos en la base de datos usando la API del backend.

---

## 🆘 Si Nada Funciona

1. **Limpia la caché de Vercel**:
   - Settings → General → Clear Cache
   - Redeploy

2. **Verifica el build log de Vercel**:
   - Ve al último deployment
   - Revisa los logs de build
   - Busca errores o warnings

3. **Prueba en modo incógnito**:
   - Abre tu sitio en una ventana de incógnito
   - Esto evita problemas de caché del navegador

4. **Verifica la consola del navegador**:
   - F12 → Console
   - Busca errores en rojo
   - Copia y pega los errores para analizarlos
