# Configurar Frontend en Vercel con Backend en Railway

## 🎯 Objetivo
Conectar tu frontend desplegado en Vercel con el backend en Railway.

## 📋 Pasos

### 1. Configurar Variable de Entorno en Vercel

#### Opción A: Dashboard Web (Más Fácil)
1. Ir a: https://vercel.com/dashboard
2. Seleccionar tu proyecto
3. Ir a **Settings** → **Environment Variables**
4. Agregar nueva variable:
   ```
   Name: NEXT_PUBLIC_API_URL
   Value: https://web-production-1288a.up.railway.app
   Environments: ✓ Production ✓ Preview ✓ Development
   ```
5. Click **Save**
6. Ir a **Deployments** → Click en los 3 puntos del último deploy → **Redeploy**

#### Opción B: Vercel CLI
```bash
# Instalar Vercel CLI (si no lo tienes)
npm i -g vercel

# Ir a tu carpeta del frontend
cd aula-virtual-frontend

# Login en Vercel
vercel login

# Agregar variable de entorno
vercel env add NEXT_PUBLIC_API_URL production
# Cuando pregunte el valor, pegar: https://web-production-1288a.up.railway.app

# También para preview y development
vercel env add NEXT_PUBLIC_API_URL preview
vercel env add NEXT_PUBLIC_API_URL development

# Redesplegar
vercel --prod
```

### 2. Verificar Configuración

Una vez redesplegado, tu frontend en Vercel debería conectarse automáticamente al backend en Railway.

**URL del Frontend**: https://tu-proyecto.vercel.app
**URL del Backend**: https://web-production-1288a.up.railway.app

### 3. Probar la Conexión

1. Abre tu frontend en Vercel
2. Intenta hacer login con:
   - Email: `admin@aula.com`
   - Password: `admin123`
3. Si funciona, ¡todo está conectado! 🎉

### 4. Ejecutar Seed (Agregar Cursos)

Para agregar los 10 cursos y datos de prueba, ejecuta desde la consola del navegador:

```javascript
fetch('https://web-production-1288a.up.railway.app/seed/run', {
  method: 'POST'
}).then(r => r.json()).then(console.log)
```

O desde terminal:
```bash
curl -X POST https://web-production-1288a.up.railway.app/seed/run
```

Esto creará:
- ✅ 12 usuarios (1 admin, 3 profesores, 8 estudiantes)
- ✅ 10 cursos variados
- ✅ 80 inscripciones
- ✅ 8 tareas
- ✅ 4 recursos
- ✅ 2 foros

### 5. Credenciales de Prueba

**Admin:**
- Email: admin@aula.com
- Password: admin123

**Profesor:**
- Email: juan@aula.com
- Password: admin123

**Estudiante:**
- Email: ana@aula.com
- Password: admin123

## 🔧 Troubleshooting

### Error: "Failed to fetch"
- Verifica que la variable `NEXT_PUBLIC_API_URL` esté configurada
- Asegúrate de haber redesplegado después de agregar la variable
- Verifica que el backend en Railway esté corriendo

### Error: "CORS"
El backend ya tiene CORS configurado para aceptar peticiones de Vercel (*.vercel.app)

### No aparecen los cursos
Ejecuta el seed usando el endpoint `/seed/run` como se indica arriba

## 📱 URLs Finales

- **Frontend (Vercel)**: https://[tu-proyecto].vercel.app
- **Backend (Railway)**: https://web-production-1288a.up.railway.app
- **Base de Datos**: Railway MySQL (interno)

## ✅ Checklist

- [ ] Variable `NEXT_PUBLIC_API_URL` configurada en Vercel
- [ ] Frontend redesplegado en Vercel
- [ ] Backend corriendo en Railway
- [ ] Seed ejecutado (cursos agregados)
- [ ] Login funcionando
- [ ] Cursos visibles en el dashboard

¡Listo! Tu aplicación está completamente desplegada y funcionando en producción 🚀
