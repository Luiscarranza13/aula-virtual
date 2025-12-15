# 🌱 Ejecutar Seed para Agregar Cursos

## Espera 2-3 minutos para que Railway termine de redesplegar el backend

Luego ejecuta UNO de estos métodos:

## Método 1: Desde PowerShell (Windows)

```powershell
Invoke-WebRequest -Uri "https://web-production-1288a.up.railway.app/seed/run" -Method POST
```

## Método 2: Desde la Consola del Navegador

1. Abre tu sitio en Vercel
2. Presiona F12 para abrir DevTools
3. Ve a la pestaña "Console"
4. Pega y ejecuta:

```javascript
fetch('https://web-production-1288a.up.railway.app/seed/run', {
  method: 'POST'
}).then(r => r.json()).then(console.log)
```

## Método 3: Desde Postman

1. Abre Postman
2. Crea una nueva request
3. Método: POST
4. URL: `https://web-production-1288a.up.railway.app/seed/run`
5. Click en "Send"

## ✅ Resultado Esperado

Deberías ver algo como:

```json
{
  "success": true,
  "message": "Seed completado exitosamente",
  "results": {
    "usuarios": 12,
    "cursos": 10,
    "inscripciones": 80,
    "tareas": 8,
    "recursos": 4,
    "foros": 2
  }
}
```

## 🔑 Credenciales para Probar

**Admin:**
- Email: admin@aula.com
- Password: admin123

**Profesor:**
- Email: juan@aula.com
- Password: admin123

**Estudiante:**
- Email: ana@aula.com
- Password: admin123

## 📚 Cursos que se Crearán

1. Matemáticas Avanzadas
2. Programación Web Full Stack
3. Inteligencia Artificial
4. Base de Datos Avanzadas
5. Desarrollo Móvil
6. Ciberseguridad
7. Cloud Computing
8. DevOps y CI/CD
9. Diseño UX/UI
10. Blockchain y Criptomonedas

¡Listo! Después de ejecutar el seed, recarga tu frontend en Vercel y verás todos los cursos 🎉
