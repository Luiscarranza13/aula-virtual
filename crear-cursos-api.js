// Script para crear cursos usando la API del backend
const API_URL = 'https://backend-aula-production.up.railway.app';

async function crearCursos() {
  console.log('🌱 Iniciando creación de cursos via API...\n');

  try {
    // 1. Login como admin para obtener token
    console.log('🔐 Haciendo login como admin...');
    const loginResponse = await fetch(`${API_URL}/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        email: 'admin@aula.com',
        contraseña: 'admin123',
      }),
    });

    if (!loginResponse.ok) {
      throw new Error('Error en login: ' + (await loginResponse.text()));
    }

    const { access_token } = await loginResponse.json();
    console.log('✅ Login exitoso\n');

    const headers = {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${access_token}`,
    };

    // 2. Crear cursos
    console.log('📚 Creando cursos...');
    const cursos = [
      {
        titulo: 'Matemáticas Avanzadas',
        descripcion:
          'Cálculo diferencial e integral, álgebra lineal y ecuaciones diferenciales',
        docenteId: 1,
        grado: '5to',
        seccion: 'A',
      },
      {
        titulo: 'Programación Web Full Stack',
        descripcion:
          'Desarrollo web moderno con React, Node.js, Express y MongoDB',
        docenteId: 1,
        grado: '5to',
        seccion: 'A',
      },
      {
        titulo: 'Inteligencia Artificial',
        descripcion:
          'Machine Learning, Deep Learning y aplicaciones prácticas de IA',
        docenteId: 1,
        grado: '5to',
        seccion: 'B',
      },
      {
        titulo: 'Base de Datos Avanzadas',
        descripcion:
          'SQL, NoSQL, optimización de consultas y diseño de bases de datos',
        docenteId: 1,
        grado: '5to',
        seccion: 'B',
      },
      {
        titulo: 'Desarrollo Móvil',
        descripcion: 'Creación de apps nativas con React Native y Flutter',
        docenteId: 1,
        grado: '4to',
        seccion: 'A',
      },
      {
        titulo: 'Ciberseguridad',
        descripcion:
          'Seguridad informática, ethical hacking y protección de sistemas',
        docenteId: 1,
        grado: '4to',
        seccion: 'A',
      },
      {
        titulo: 'Cloud Computing',
        descripcion: 'AWS, Azure, Google Cloud y arquitecturas en la nube',
        docenteId: 1,
        grado: '4to',
        seccion: 'B',
      },
      {
        titulo: 'DevOps y CI/CD',
        descripcion:
          'Docker, Kubernetes, Jenkins y automatización de despliegues',
        docenteId: 1,
        grado: '4to',
        seccion: 'B',
      },
      {
        titulo: 'Diseño UX/UI',
        descripcion:
          'Principios de diseño, Figma, prototipado y experiencia de usuario',
        docenteId: 1,
        grado: '3ro',
        seccion: 'A',
      },
      {
        titulo: 'Blockchain y Criptomonedas',
        descripcion:
          'Tecnología blockchain, smart contracts y desarrollo de DApps',
        docenteId: 1,
        grado: '3ro',
        seccion: 'A',
      },
    ];

    let cursosCreados = 0;
    for (const curso of cursos) {
      try {
        const response = await fetch(`${API_URL}/courses`, {
          method: 'POST',
          headers,
          body: JSON.stringify(curso),
        });

        if (response.ok) {
          cursosCreados++;
          console.log(`  ✅ ${curso.titulo}`);
        } else {
          const error = await response.text();
          console.log(`  ⚠️  ${curso.titulo} - ${error}`);
        }
      } catch (error) {
        console.log(`  ❌ ${curso.titulo} - ${error.message}`);
      }
    }

    console.log(`\n✨ Proceso completado!`);
    console.log(`📊 ${cursosCreados} cursos creados exitosamente`);
  } catch (error) {
    console.error('❌ Error:', error.message);
  }
}

crearCursos();
