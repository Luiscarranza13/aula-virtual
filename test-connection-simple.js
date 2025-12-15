// Test simple de conexión al backend
const BACKEND_URL = 'https://backend-aula-production.up.railway.app';

console.log('🚀 Iniciando test de conexión...');
console.log(`📡 Backend URL: ${BACKEND_URL}`);

// Test 1: Health check
async function testHealth() {
  console.log('\n=== TEST 1: Health Check ===');
  try {
    const response = await fetch(`${BACKEND_URL}/health`);
    const data = await response.json();
    console.log('✅ Health check OK:', data);
    return true;
  } catch (error) {
    console.error('❌ Health check failed:', error.message);
    return false;
  }
}

// Test 2: Courses endpoint
async function testCourses() {
  console.log('\n=== TEST 2: Courses Endpoint ===');
  try {
    const response = await fetch(`${BACKEND_URL}/courses`);
    
    if (!response.ok) {
      throw new Error(`HTTP ${response.status}: ${response.statusText}`);
    }
    
    const courses = await response.json();
    console.log(`✅ Courses loaded: ${courses.length} items`);
    
    if (courses.length > 0) {
      console.log('📚 First course:', {
        id: courses[0].id,
        titulo: courses[0].titulo,
        grado: courses[0].grado,
        docente: courses[0].docente?.nombre
      });
    }
    
    return courses;
  } catch (error) {
    console.error('❌ Courses test failed:', error.message);
    return null;
  }
}

// Test 3: CORS headers
async function testCORS() {
  console.log('\n=== TEST 3: CORS Headers ===');
  try {
    const response = await fetch(`${BACKEND_URL}/courses`, {
      method: 'OPTIONS'
    });
    
    const corsHeaders = {
      'Access-Control-Allow-Origin': response.headers.get('Access-Control-Allow-Origin'),
      'Access-Control-Allow-Methods': response.headers.get('Access-Control-Allow-Methods'),
      'Access-Control-Allow-Headers': response.headers.get('Access-Control-Allow-Headers')
    };
    
    console.log('✅ CORS Headers:', corsHeaders);
    return corsHeaders;
  } catch (error) {
    console.error('❌ CORS test failed:', error.message);
    return null;
  }
}

// Ejecutar todos los tests
async function runAllTests() {
  console.log('🔍 === DIAGNÓSTICO COMPLETO DE CONECTIVIDAD ===');
  
  const healthOK = await testHealth();
  const courses = await testCourses();
  const cors = await testCORS();
  
  console.log('\n📊 === RESUMEN ===');
  console.log(`Health Check: ${healthOK ? '✅ OK' : '❌ FAIL'}`);
  console.log(`Courses API: ${courses ? '✅ OK (' + courses.length + ' items)' : '❌ FAIL'}`);
  console.log(`CORS Config: ${cors ? '✅ OK' : '❌ FAIL'}`);
  
  if (healthOK && courses && cors) {
    console.log('\n🎉 TODOS LOS TESTS PASARON - EL BACKEND ESTÁ FUNCIONANDO CORRECTAMENTE');
    console.log('💡 Si el frontend no funciona, el problema está en la configuración de Netlify o en el código del frontend');
  } else {
    console.log('\n⚠️ ALGUNOS TESTS FALLARON - REVISAR CONFIGURACIÓN DEL BACKEND');
  }
}

// Ejecutar si estamos en Node.js
if (typeof window === 'undefined') {
  // Node.js environment
  const fetch = require('node-fetch');
  runAllTests();
} else {
  // Browser environment
  window.runAllTests = runAllTests;
  console.log('💻 Ejecutar en consola: runAllTests()');
}