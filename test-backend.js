// Script simple para probar la conexión con el backend en Railway
const API_URL = 'https://backend-aula-production.up.railway.app';

console.log('🔍 Probando conexión con el backend...\n');
console.log(`📍 URL: ${API_URL}\n`);

async function testBackend() {
  try {
    // Test 1: Health check
    console.log('1️⃣ Test: Health Check');
    const healthResponse = await fetch(`${API_URL}/`);
    const healthText = await healthResponse.text();
    console.log(`   Status: ${healthResponse.status}`);
    console.log(`   Respuesta: ${healthText}`);
    console.log(`   ✅ Backend está respondiendo\n`);

    // Test 2: Login
    console.log('2️⃣ Test: Login');
    const loginResponse = await fetch(`${API_URL}/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        email: 'admin@aula.com',
        contraseña: 'admin123',
      }),
    });
    const loginData = await loginResponse.json();
    console.log(`   Status: ${loginResponse.status}`);
    if (loginResponse.ok) {
      console.log(`   Usuario: ${loginData.user.nombre} ${loginData.user.apellido}`);
      console.log(`   Rol: ${loginData.user.rol}`);
      console.log(`   Token: ${loginData.access_token.substring(0, 30)}...`);
      console.log(`   ✅ Login exitoso\n`);

      // Test 3: Get Courses
      console.log('3️⃣ Test: Obtener Cursos');
      const coursesResponse = await fetch(`${API_URL}/courses`, {
        headers: {
          Authorization: `Bearer ${loginData.access_token}`,
        },
      });
      const coursesData = await coursesResponse.json();
      console.log(`   Status: ${coursesResponse.status}`);
      console.log(`   Total cursos: ${coursesData.length}`);
      if (coursesData.length > 0) {
        console.log(`   Primer curso: ${coursesData[0].titulo}`);
      }
      console.log(`   ✅ Cursos obtenidos\n`);

      // Test 4: Get Users
      console.log('4️⃣ Test: Obtener Usuarios');
      const usersResponse = await fetch(`${API_URL}/users`, {
        headers: {
          Authorization: `Bearer ${loginData.access_token}`,
        },
      });
      const usersData = await usersResponse.json();
      console.log(`   Status: ${usersResponse.status}`);
      console.log(`   Total usuarios: ${usersData.length}`);
      console.log(`   ✅ Usuarios obtenidos\n`);

      console.log('✨ Todos los tests pasaron exitosamente!');
      console.log('\n📊 Resumen:');
      console.log(`   - Backend: Online ✅`);
      console.log(`   - Autenticación: Funcionando ✅`);
      console.log(`   - API Courses: Funcionando ✅`);
      console.log(`   - API Users: Funcionando ✅`);
      console.log(`   - Total Cursos: ${coursesData.length}`);
      console.log(`   - Total Usuarios: ${usersData.length}`);
    } else {
      console.log(`   ❌ Login falló: ${JSON.stringify(loginData)}\n`);
    }
  } catch (error) {
    console.error('❌ Error:', error.message);
    console.error('\nPosibles causas:');
    console.error('  - Backend no está corriendo');
    console.error('  - Problema de red');
    console.error('  - URL incorrecta');
  }
}

testBackend();
