// Script para crear usuario admin en Railway
const API_URL = 'https://backend-aula-production.up.railway.app';

async function crearAdmin() {
  console.log('🔐 Creando usuario administrador...\n');

  try {
    // Crear usuario admin
    const response = await fetch(`${API_URL}/users`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        email: 'admin@aula.com',
        contraseña: 'admin123',
        nombre: 'Admin',
        apellido: 'Sistema',
        rol: 'admin',
      }),
    });

    if (response.ok) {
      const data = await response.json();
      console.log('✅ Usuario admin creado exitosamente!');
      console.log(`   Email: ${data.email}`);
      console.log(`   Nombre: ${data.nombre} ${data.apellido}`);
      console.log(`   Rol: ${data.rol}`);
      console.log(`\n🎉 Ahora puedes hacer login con:`);
      console.log(`   Email: admin@aula.com`);
      console.log(`   Contraseña: admin123`);
    } else {
      const error = await response.json();
      console.error('❌ Error al crear usuario:', error.message || error);
      
      if (response.status === 409 || error.message?.includes('already exists')) {
        console.log('\n✅ El usuario admin ya existe!');
        console.log('   Puedes hacer login con:');
        console.log('   Email: admin@aula.com');
        console.log('   Contraseña: admin123');
      }
    }
  } catch (error) {
    console.error('❌ Error de conexión:', error.message);
    console.error('\nVerifica que el backend esté corriendo en:');
    console.error(API_URL);
  }
}

crearAdmin();
