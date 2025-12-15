# 🚀 Desplegar Frontend en Netlify

## Configuración Actual

✅ **Backend en Railway**: https://web-production-1288a.up.railway.app
✅ **Código actualizado**: Variable `NEXT_PUBLIC_API_URL` configurada
✅ **Archivos listos**: netlify.toml, _redirects, .env.production

---

## 📋 Pasos para Desplegar en Netlify

### 1. Conectar Repositorio a Netlify

1. Ve a https://app.netlify.com
2. Haz clic en **"Add new site"** → **"Import an existing project"**
3. Selecciona **"GitHub"**
4. Busca y selecciona el repositorio: `front-aula`
5. Autoriza a Netlify si es necesario

### 2. Configurar Build Settings

Netlify debería detectar automáticamente la configuración de `netlify.toml`, pero verifica:

```
Build command: npm run build
Publish directory: .next
```

### 3. Configurar Variables de Entorno

En la sección **"Environment variables"**, agrega:

```
Key: NEXT_PUBLIC_API_URL
Value: https://web-production-1288a.up.railway.app
```

**IMPORTANTE**: Asegúrate de que esté disponible para:
- ✅ Production
- ✅ Deploy Previews
- ✅ Branch deploys

### 4. Deploy

1. Haz clic en **"Deploy site"**
2. Espera 3-5 minutos mientras Netlify hace el build
3. Una vez completado, verás tu URL de Netlify (ej: `https://tu-sitio.netlify.app`)

---

## 🧪 Probar el Sitio

Una vez desplegado:

1. Ve a tu URL de Netlify
2. Intenta hacer login con:
   - Email: `admin@aula.com`
   - Contraseña: `admin123`

3. Si funciona, deberías ver el dashboard

---

## 🔧 Si Hay Problemas

### Error: "No se puede conectar con el servidor"

**Solución 1: Verificar Variable de Entorno**
1. Ve a Site settings → Environment variables
2. Verifica que `NEXT_PUBLIC_API_URL` esté correcta
3. Si la cambias, haz un **"Trigger deploy"** → **"Clear cache and deploy site"**

**Solución 2: Verificar Backend**
1. Abre https://web-production-1288a.up.railway.app en el navegador
2. Deberías ver: `{"message":"Aula Virtual API is running",...}`
3. Si no funciona, el problema está en Railway

**Solución 3: Limpiar Caché**
1. Ve a Deploys → Trigger deploy
2. Selecciona **"Clear cache and deploy site"**
3. Espera el nuevo build

### Error de Build en Netlify

Si el build falla:

1. Ve a **Deploys** → Haz clic en el deploy fallido
2. Revisa los logs de build
3. Busca errores en rojo

**Errores comunes:**
- `Module not found`: Falta una dependencia en package.json
- `Command failed`: Problema con el comando de build
- `Out of memory`: El build necesita más memoria (contacta soporte de Netlify)

---

## 📝 Configuración Avanzada

### Custom Domain (Opcional)

Si tienes un dominio propio:

1. Ve a Site settings → Domain management
2. Haz clic en **"Add custom domain"**
3. Sigue las instrucciones para configurar DNS

### Deploy Hooks (Opcional)

Para redesplegar automáticamente cuando cambies el backend:

1. Ve a Site settings → Build & deploy → Build hooks
2. Crea un nuevo hook
3. Usa la URL del hook para triggear deploys desde Railway

---

## ✅ Checklist Final

- [ ] Repositorio conectado a Netlify
- [ ] Variable `NEXT_PUBLIC_API_URL` configurada
- [ ] Build exitoso
- [ ] Sitio accesible en la URL de Netlify
- [ ] Login funciona correctamente
- [ ] Dashboard se muestra correctamente

---

## 🆘 Comandos Útiles

### Probar Build Localmente
```bash
cd aula-virtual-frontend
npm run build
npm start
```

### Probar Backend
```bash
node test-backend.js
```

### Subir Cambios
```bash
cd aula-virtual-frontend
git add .
git commit -m "mensaje"
git push origin main
```

Netlify redesplegará automáticamente cuando hagas push a main.

---

## 📊 URLs Importantes

- **Frontend Netlify**: (tu URL después de desplegar)
- **Backend Railway**: https://web-production-1288a.up.railway.app
- **Repo Frontend**: https://github.com/Luiscarranza13/front-aula.git
- **Repo Backend**: https://github.com/Luiscarranza13/backend-aula.git

---

## 💡 Notas

- Netlify redespliega automáticamente cuando haces push a GitHub
- El primer deploy puede tardar más (5-10 minutos)
- Los deploys subsecuentes son más rápidos (2-3 minutos)
- Netlify tiene un plan gratuito generoso (100GB bandwidth/mes)
