-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 07-12-2025 a las 17:19:37
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aula_virtual_nest`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int NOT NULL,
  `remitenteId` int NOT NULL,
  `destinatarioId` int DEFAULT NULL,
  `contenido` text NOT NULL,
  `tipo` enum('global','privado','grupo') NOT NULL DEFAULT 'global',
  `grupoId` int DEFAULT NULL,
  `leido` tinyint NOT NULL DEFAULT '0',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `remitenteId`, `destinatarioId`, `contenido`, `tipo`, `grupoId`, `leido`, `createdAt`) VALUES
(1, 1, 2, 'hola maestro como esta', 'privado', NULL, 0, '2025-12-07 10:05:24.889161'),
(2, 1, NULL, 'holaaa', 'global', NULL, 0, '2025-12-07 10:05:33.078982'),
(3, 3, 1, 'hola director', 'privado', NULL, 1, '2025-12-07 10:09:40.181829');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  `grado` varchar(255) NOT NULL,
  `seccion` varchar(255) NOT NULL,
  `docenteId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `titulo`, `descripcion`, `grado`, `seccion`, `docenteId`) VALUES
(1, 'mate', NULL, '4to', 'A', 2),
(2, 'Matemáticas Avanzadas', 'Curso de matemáticas para nivel avanzado. Incluye álgebra, geometría y cálculo básico.', '5to', 'A', 2),
(3, 'Historia Universal', 'Recorrido por los principales eventos históricos de la humanidad.', '4to', 'B', 7),
(4, 'Ciencias Naturales', 'Exploración del mundo natural: biología, química y física básica.', '3ro', 'A', 8),
(5, 'Literatura Española', 'Análisis de las obras más importantes de la literatura en español.', '5to', 'C', 2),
(6, 'Física Fundamental', 'Principios básicos de la física: mecánica, termodinámica y ondas.', '6to', 'A', 7),
(7, 'Química Orgánica', 'Estudio de los compuestos del carbono y sus reacciones.', '5to', 'B', 8),
(8, 'Inglés Intermedio', 'Desarrollo de habilidades de comunicación en inglés nivel B1.', '4to', 'A', 2),
(9, 'Programación Básica', 'Introducción a la programación con Python y JavaScript.', '6to', 'B', 7),
(10, 'Matemáticas Avanzadas', 'Curso de matemáticas para nivel avanzado. Incluye álgebra, geometría y cálculo básico.', '5to', 'A', 2),
(11, 'Historia Universal', 'Recorrido por los principales eventos históricos de la humanidad.', '4to', 'B', 7),
(12, 'Ciencias Naturales', 'Exploración del mundo natural: biología, química y física básica.', '3ro', 'A', 8),
(13, 'Literatura Española', 'Análisis de las obras más importantes de la literatura en español.', '5to', 'C', 2),
(14, 'Física Fundamental', 'Principios básicos de la física: mecánica, termodinámica y ondas.', '6to', 'A', 7),
(15, 'Química Orgánica', 'Estudio de los compuestos del carbono y sus reacciones.', '5to', 'B', 8),
(16, 'Inglés Intermedio', 'Desarrollo de habilidades de comunicación en inglés nivel B1.', '4to', 'A', 2),
(17, 'Programación Básica', 'Introducción a la programación con Python y JavaScript.', '6to', 'B', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int NOT NULL,
  `estudianteId` int NOT NULL,
  `cursoId` int NOT NULL,
  `estado` enum('activo','completado','abandonado') NOT NULL DEFAULT 'activo',
  `progreso` decimal(5,2) NOT NULL DEFAULT '0.00',
  `notaFinal` decimal(5,2) DEFAULT NULL,
  `fechaInscripcion` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exams`
--

CREATE TABLE `exams` (
  `id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  `cursoId` int NOT NULL,
  `docenteId` int NOT NULL,
  `tiempoLimite` int NOT NULL DEFAULT '60',
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFin` datetime DEFAULT NULL,
  `intentosPermitidos` int NOT NULL DEFAULT '1',
  `mostrarResultados` tinyint NOT NULL DEFAULT '1',
  `aleatorizar` tinyint NOT NULL DEFAULT '0',
  `activo` tinyint NOT NULL DEFAULT '1',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `exams`
--

INSERT INTO `exams` (`id`, `titulo`, `descripcion`, `cursoId`, `docenteId`, `tiempoLimite`, `fechaInicio`, `fechaFin`, `intentosPermitidos`, `mostrarResultados`, `aleatorizar`, `activo`, `createdAt`) VALUES
(1, 'Examen Parcial - mate', 'Evaluación parcial del curso mate. Incluye los temas vistos en las primeras semanas.', 1, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(2, 'Examen Final - mate', 'Evaluación final del curso mate. Cubre todos los temas del curso.', 1, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(3, 'Examen Parcial - Matemáticas Avanzadas', 'Evaluación parcial del curso Matemáticas Avanzadas. Incluye los temas vistos en las primeras semanas.', 2, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(4, 'Examen Final - Matemáticas Avanzadas', 'Evaluación final del curso Matemáticas Avanzadas. Cubre todos los temas del curso.', 2, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(5, 'Examen Parcial - Historia Universal', 'Evaluación parcial del curso Historia Universal. Incluye los temas vistos en las primeras semanas.', 3, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(6, 'Examen Final - Historia Universal', 'Evaluación final del curso Historia Universal. Cubre todos los temas del curso.', 3, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(7, 'Examen Parcial - Ciencias Naturales', 'Evaluación parcial del curso Ciencias Naturales. Incluye los temas vistos en las primeras semanas.', 4, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(8, 'Examen Final - Ciencias Naturales', 'Evaluación final del curso Ciencias Naturales. Cubre todos los temas del curso.', 4, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(9, 'Examen Parcial - Literatura Española', 'Evaluación parcial del curso Literatura Española. Incluye los temas vistos en las primeras semanas.', 5, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(10, 'Examen Final - Literatura Española', 'Evaluación final del curso Literatura Española. Cubre todos los temas del curso.', 5, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(11, 'Examen Parcial - Física Fundamental', 'Evaluación parcial del curso Física Fundamental. Incluye los temas vistos en las primeras semanas.', 6, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(12, 'Examen Final - Física Fundamental', 'Evaluación final del curso Física Fundamental. Cubre todos los temas del curso.', 6, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(13, 'Examen Parcial - Química Orgánica', 'Evaluación parcial del curso Química Orgánica. Incluye los temas vistos en las primeras semanas.', 7, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(14, 'Examen Final - Química Orgánica', 'Evaluación final del curso Química Orgánica. Cubre todos los temas del curso.', 7, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(15, 'Examen Parcial - Inglés Intermedio', 'Evaluación parcial del curso Inglés Intermedio. Incluye los temas vistos en las primeras semanas.', 8, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(16, 'Examen Final - Inglés Intermedio', 'Evaluación final del curso Inglés Intermedio. Cubre todos los temas del curso.', 8, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(17, 'Examen Parcial - Programación Básica', 'Evaluación parcial del curso Programación Básica. Incluye los temas vistos en las primeras semanas.', 9, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:38.000000'),
(18, 'Examen Final - Programación Básica', 'Evaluación final del curso Programación Básica. Cubre todos los temas del curso.', 9, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(19, 'Examen Parcial - Matemáticas Avanzadas', 'Evaluación parcial del curso Matemáticas Avanzadas. Incluye los temas vistos en las primeras semanas.', 10, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(20, 'Examen Final - Matemáticas Avanzadas', 'Evaluación final del curso Matemáticas Avanzadas. Cubre todos los temas del curso.', 10, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(21, 'Examen Parcial - Historia Universal', 'Evaluación parcial del curso Historia Universal. Incluye los temas vistos en las primeras semanas.', 11, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(22, 'Examen Final - Historia Universal', 'Evaluación final del curso Historia Universal. Cubre todos los temas del curso.', 11, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(23, 'Examen Parcial - Ciencias Naturales', 'Evaluación parcial del curso Ciencias Naturales. Incluye los temas vistos en las primeras semanas.', 12, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(24, 'Examen Final - Ciencias Naturales', 'Evaluación final del curso Ciencias Naturales. Cubre todos los temas del curso.', 12, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(25, 'Examen Parcial - Literatura Española', 'Evaluación parcial del curso Literatura Española. Incluye los temas vistos en las primeras semanas.', 13, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(26, 'Examen Final - Literatura Española', 'Evaluación final del curso Literatura Española. Cubre todos los temas del curso.', 13, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(27, 'Examen Parcial - Física Fundamental', 'Evaluación parcial del curso Física Fundamental. Incluye los temas vistos en las primeras semanas.', 14, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(28, 'Examen Final - Física Fundamental', 'Evaluación final del curso Física Fundamental. Cubre todos los temas del curso.', 14, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(29, 'Examen Parcial - Química Orgánica', 'Evaluación parcial del curso Química Orgánica. Incluye los temas vistos en las primeras semanas.', 15, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(30, 'Examen Final - Química Orgánica', 'Evaluación final del curso Química Orgánica. Cubre todos los temas del curso.', 15, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(31, 'Examen Parcial - Inglés Intermedio', 'Evaluación parcial del curso Inglés Intermedio. Incluye los temas vistos en las primeras semanas.', 16, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(32, 'Examen Final - Inglés Intermedio', 'Evaluación final del curso Inglés Intermedio. Cubre todos los temas del curso.', 16, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(33, 'Examen Parcial - Programación Básica', 'Evaluación parcial del curso Programación Básica. Incluye los temas vistos en las primeras semanas.', 17, 2, 45, NULL, NULL, 2, 1, 0, 1, '2025-12-07 10:50:39.000000'),
(34, 'Examen Final - Programación Básica', 'Evaluación final del curso Programación Básica. Cubre todos los temas del curso.', 17, 2, 90, NULL, NULL, 1, 1, 0, 1, '2025-12-07 10:50:39.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exam_attempts`
--

CREATE TABLE `exam_attempts` (
  `id` int NOT NULL,
  `examId` int NOT NULL,
  `estudianteId` int NOT NULL,
  `iniciadoEn` datetime NOT NULL,
  `finalizadoEn` datetime DEFAULT NULL,
  `respuestas` text,
  `calificacion` float DEFAULT NULL,
  `porcentaje` float DEFAULT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'en_progreso',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exam_questions`
--

CREATE TABLE `exam_questions` (
  `id` int NOT NULL,
  `examId` int NOT NULL,
  `pregunta` text NOT NULL,
  `tipo` varchar(255) NOT NULL DEFAULT 'multiple',
  `opciones` text,
  `respuestaCorrecta` text,
  `puntos` int NOT NULL DEFAULT '10',
  `orden` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `exam_questions`
--

INSERT INTO `exam_questions` (`id`, `examId`, `pregunta`, `tipo`, `opciones`, `respuestaCorrecta`, `puntos`, `orden`) VALUES
(1, 1, '¿Cuál es el objetivo principal del curso mate?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(2, 1, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(3, 1, '¿Qué metodología se utiliza principalmente en mate?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(4, 1, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(5, 1, 'Menciona un concepto clave del curso mate.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(6, 2, '¿Cuál es el objetivo principal del curso mate?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(7, 2, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(8, 2, '¿Qué metodología se utiliza principalmente en mate?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(9, 2, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(10, 2, 'Menciona un concepto clave del curso mate.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(11, 3, '¿Cuál es el objetivo principal del curso Matemáticas Avanzadas?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(12, 3, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(13, 3, '¿Qué metodología se utiliza principalmente en Matemáticas Avanzadas?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(14, 3, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(15, 3, 'Menciona un concepto clave del curso Matemáticas Avanzadas.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(16, 4, '¿Cuál es el objetivo principal del curso Matemáticas Avanzadas?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(17, 4, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(18, 4, '¿Qué metodología se utiliza principalmente en Matemáticas Avanzadas?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(19, 4, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(20, 4, 'Menciona un concepto clave del curso Matemáticas Avanzadas.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(21, 5, '¿Cuál es el objetivo principal del curso Historia Universal?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(22, 5, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(23, 5, '¿Qué metodología se utiliza principalmente en Historia Universal?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(24, 5, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(25, 5, 'Menciona un concepto clave del curso Historia Universal.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(26, 6, '¿Cuál es el objetivo principal del curso Historia Universal?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(27, 6, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(28, 6, '¿Qué metodología se utiliza principalmente en Historia Universal?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(29, 6, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(30, 6, 'Menciona un concepto clave del curso Historia Universal.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(31, 7, '¿Cuál es el objetivo principal del curso Ciencias Naturales?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(32, 7, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(33, 7, '¿Qué metodología se utiliza principalmente en Ciencias Naturales?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(34, 7, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(35, 7, 'Menciona un concepto clave del curso Ciencias Naturales.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(36, 8, '¿Cuál es el objetivo principal del curso Ciencias Naturales?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(37, 8, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(38, 8, '¿Qué metodología se utiliza principalmente en Ciencias Naturales?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(39, 8, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(40, 8, 'Menciona un concepto clave del curso Ciencias Naturales.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(41, 9, '¿Cuál es el objetivo principal del curso Literatura Española?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(42, 9, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(43, 9, '¿Qué metodología se utiliza principalmente en Literatura Española?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(44, 9, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(45, 9, 'Menciona un concepto clave del curso Literatura Española.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(46, 10, '¿Cuál es el objetivo principal del curso Literatura Española?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(47, 10, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(48, 10, '¿Qué metodología se utiliza principalmente en Literatura Española?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(49, 10, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(50, 10, 'Menciona un concepto clave del curso Literatura Española.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(51, 11, '¿Cuál es el objetivo principal del curso Física Fundamental?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(52, 11, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(53, 11, '¿Qué metodología se utiliza principalmente en Física Fundamental?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(54, 11, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(55, 11, 'Menciona un concepto clave del curso Física Fundamental.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(56, 12, '¿Cuál es el objetivo principal del curso Física Fundamental?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(57, 12, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(58, 12, '¿Qué metodología se utiliza principalmente en Física Fundamental?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(59, 12, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(60, 12, 'Menciona un concepto clave del curso Física Fundamental.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(61, 13, '¿Cuál es el objetivo principal del curso Química Orgánica?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(62, 13, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(63, 13, '¿Qué metodología se utiliza principalmente en Química Orgánica?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(64, 13, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(65, 13, 'Menciona un concepto clave del curso Química Orgánica.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(66, 14, '¿Cuál es el objetivo principal del curso Química Orgánica?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(67, 14, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(68, 14, '¿Qué metodología se utiliza principalmente en Química Orgánica?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(69, 14, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(70, 14, 'Menciona un concepto clave del curso Química Orgánica.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(71, 15, '¿Cuál es el objetivo principal del curso Inglés Intermedio?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(72, 15, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(73, 15, '¿Qué metodología se utiliza principalmente en Inglés Intermedio?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(74, 15, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(75, 15, 'Menciona un concepto clave del curso Inglés Intermedio.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(76, 16, '¿Cuál es el objetivo principal del curso Inglés Intermedio?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(77, 16, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(78, 16, '¿Qué metodología se utiliza principalmente en Inglés Intermedio?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(79, 16, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(80, 16, 'Menciona un concepto clave del curso Inglés Intermedio.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(81, 17, '¿Cuál es el objetivo principal del curso Programación Básica?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(82, 17, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(83, 17, '¿Qué metodología se utiliza principalmente en Programación Básica?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(84, 17, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(85, 17, 'Menciona un concepto clave del curso Programación Básica.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(86, 18, '¿Cuál es el objetivo principal del curso Programación Básica?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(87, 18, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(88, 18, '¿Qué metodología se utiliza principalmente en Programación Básica?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(89, 18, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(90, 18, 'Menciona un concepto clave del curso Programación Básica.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(91, 19, '¿Cuál es el objetivo principal del curso Matemáticas Avanzadas?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(92, 19, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(93, 19, '¿Qué metodología se utiliza principalmente en Matemáticas Avanzadas?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(94, 19, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(95, 19, 'Menciona un concepto clave del curso Matemáticas Avanzadas.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(96, 20, '¿Cuál es el objetivo principal del curso Matemáticas Avanzadas?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(97, 20, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(98, 20, '¿Qué metodología se utiliza principalmente en Matemáticas Avanzadas?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(99, 20, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(100, 20, 'Menciona un concepto clave del curso Matemáticas Avanzadas.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(101, 21, '¿Cuál es el objetivo principal del curso Historia Universal?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(102, 21, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(103, 21, '¿Qué metodología se utiliza principalmente en Historia Universal?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(104, 21, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(105, 21, 'Menciona un concepto clave del curso Historia Universal.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(106, 22, '¿Cuál es el objetivo principal del curso Historia Universal?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(107, 22, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(108, 22, '¿Qué metodología se utiliza principalmente en Historia Universal?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(109, 22, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(110, 22, 'Menciona un concepto clave del curso Historia Universal.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(111, 23, '¿Cuál es el objetivo principal del curso Ciencias Naturales?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(112, 23, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(113, 23, '¿Qué metodología se utiliza principalmente en Ciencias Naturales?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(114, 23, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(115, 23, 'Menciona un concepto clave del curso Ciencias Naturales.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(116, 24, '¿Cuál es el objetivo principal del curso Ciencias Naturales?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(117, 24, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(118, 24, '¿Qué metodología se utiliza principalmente en Ciencias Naturales?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(119, 24, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(120, 24, 'Menciona un concepto clave del curso Ciencias Naturales.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(121, 25, '¿Cuál es el objetivo principal del curso Literatura Española?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(122, 25, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(123, 25, '¿Qué metodología se utiliza principalmente en Literatura Española?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(124, 25, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(125, 25, 'Menciona un concepto clave del curso Literatura Española.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(126, 26, '¿Cuál es el objetivo principal del curso Literatura Española?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(127, 26, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(128, 26, '¿Qué metodología se utiliza principalmente en Literatura Española?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(129, 26, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(130, 26, 'Menciona un concepto clave del curso Literatura Española.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(131, 27, '¿Cuál es el objetivo principal del curso Física Fundamental?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(132, 27, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(133, 27, '¿Qué metodología se utiliza principalmente en Física Fundamental?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(134, 27, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(135, 27, 'Menciona un concepto clave del curso Física Fundamental.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(136, 28, '¿Cuál es el objetivo principal del curso Física Fundamental?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(137, 28, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(138, 28, '¿Qué metodología se utiliza principalmente en Física Fundamental?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(139, 28, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(140, 28, 'Menciona un concepto clave del curso Física Fundamental.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(141, 29, '¿Cuál es el objetivo principal del curso Química Orgánica?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(142, 29, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(143, 29, '¿Qué metodología se utiliza principalmente en Química Orgánica?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(144, 29, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(145, 29, 'Menciona un concepto clave del curso Química Orgánica.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(146, 30, '¿Cuál es el objetivo principal del curso Química Orgánica?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(147, 30, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(148, 30, '¿Qué metodología se utiliza principalmente en Química Orgánica?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(149, 30, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(150, 30, 'Menciona un concepto clave del curso Química Orgánica.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(151, 31, '¿Cuál es el objetivo principal del curso Inglés Intermedio?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(152, 31, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(153, 31, '¿Qué metodología se utiliza principalmente en Inglés Intermedio?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(154, 31, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(155, 31, 'Menciona un concepto clave del curso Inglés Intermedio.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(156, 32, '¿Cuál es el objetivo principal del curso Inglés Intermedio?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(157, 32, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(158, 32, '¿Qué metodología se utiliza principalmente en Inglés Intermedio?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(159, 32, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(160, 32, 'Menciona un concepto clave del curso Inglés Intermedio.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(161, 33, '¿Cuál es el objetivo principal del curso Programación Básica?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(162, 33, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(163, 33, '¿Qué metodología se utiliza principalmente en Programación Básica?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(164, 33, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(165, 33, 'Menciona un concepto clave del curso Programación Básica.', 'short_answer', NULL, 'aprendizaje', 10, 4),
(166, 34, '¿Cuál es el objetivo principal del curso Programación Básica?', 'multiple', '[\"Aprender conceptos básicos\",\"Desarrollar habilidades prácticas\",\"Ambas anteriores\",\"Ninguna de las anteriores\"]', 'Ambas anteriores', 10, 0),
(167, 34, 'El aprendizaje continuo es fundamental para el éxito profesional.', 'true_false', NULL, 'Verdadero', 5, 1),
(168, 34, '¿Qué metodología se utiliza principalmente en Programación Básica?', 'multiple', '[\"Teórica\",\"Práctica\",\"Mixta\",\"Autodidacta\"]', 'Mixta', 10, 2),
(169, 34, 'La evaluación formativa ayuda a mejorar el proceso de aprendizaje.', 'true_false', NULL, 'Verdadero', 5, 3),
(170, 34, 'Menciona un concepto clave del curso Programación Básica.', 'short_answer', NULL, 'aprendizaje', 10, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forums`
--

CREATE TABLE `forums` (
  `id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  `cursoId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `forums`
--

INSERT INTO `forums` (`id`, `titulo`, `descripcion`, `cursoId`) VALUES
(1, 'Dudas generales - Matemáticas', 'Espacio para resolver dudas sobre el curso.', 2),
(2, 'Discusión del tema principal - Matemáticas', 'Debate y análisis del contenido principal.', 2),
(3, 'Ayuda con tareas - Matemáticas', 'Colaboración entre estudiantes para las tareas.', 2),
(4, 'Dudas generales - Historia', 'Espacio para resolver dudas sobre el curso.', 3),
(5, 'Discusión del tema principal - Historia', 'Debate y análisis del contenido principal.', 3),
(6, 'Ayuda con tareas - Historia', 'Colaboración entre estudiantes para las tareas.', 3),
(7, 'Dudas generales - Ciencias', 'Espacio para resolver dudas sobre el curso.', 4),
(8, 'Discusión del tema principal - Ciencias', 'Debate y análisis del contenido principal.', 4),
(9, 'Ayuda con tareas - Ciencias', 'Colaboración entre estudiantes para las tareas.', 4),
(10, 'Dudas generales - Literatura', 'Espacio para resolver dudas sobre el curso.', 5),
(11, 'Discusión del tema principal - Literatura', 'Debate y análisis del contenido principal.', 5),
(12, 'Ayuda con tareas - Literatura', 'Colaboración entre estudiantes para las tareas.', 5),
(13, 'Dudas generales - Física', 'Espacio para resolver dudas sobre el curso.', 6),
(14, 'Discusión del tema principal - Física', 'Debate y análisis del contenido principal.', 6),
(15, 'Ayuda con tareas - Física', 'Colaboración entre estudiantes para las tareas.', 6),
(16, 'Dudas generales - Química', 'Espacio para resolver dudas sobre el curso.', 7),
(17, 'Discusión del tema principal - Química', 'Debate y análisis del contenido principal.', 7),
(18, 'Ayuda con tareas - Química', 'Colaboración entre estudiantes para las tareas.', 7),
(19, 'Dudas generales - Inglés', 'Espacio para resolver dudas sobre el curso.', 8),
(20, 'Discusión del tema principal - Inglés', 'Debate y análisis del contenido principal.', 8),
(21, 'Ayuda con tareas - Inglés', 'Colaboración entre estudiantes para las tareas.', 8),
(22, 'Dudas generales - Programación', 'Espacio para resolver dudas sobre el curso.', 9),
(23, 'Discusión del tema principal - Programación', 'Debate y análisis del contenido principal.', 9),
(24, 'Ayuda con tareas - Programación', 'Colaboración entre estudiantes para las tareas.', 9),
(25, 'Dudas generales - Matemáticas', 'Espacio para resolver dudas sobre el curso.', 10),
(26, 'Discusión del tema principal - Matemáticas', 'Debate y análisis del contenido principal.', 10),
(27, 'Ayuda con tareas - Matemáticas', 'Colaboración entre estudiantes para las tareas.', 10),
(28, 'Dudas generales - Historia', 'Espacio para resolver dudas sobre el curso.', 11),
(29, 'Discusión del tema principal - Historia', 'Debate y análisis del contenido principal.', 11),
(30, 'Ayuda con tareas - Historia', 'Colaboración entre estudiantes para las tareas.', 11),
(31, 'Dudas generales - Ciencias', 'Espacio para resolver dudas sobre el curso.', 12),
(32, 'Discusión del tema principal - Ciencias', 'Debate y análisis del contenido principal.', 12),
(33, 'Ayuda con tareas - Ciencias', 'Colaboración entre estudiantes para las tareas.', 12),
(34, 'Dudas generales - Literatura', 'Espacio para resolver dudas sobre el curso.', 13),
(35, 'Discusión del tema principal - Literatura', 'Debate y análisis del contenido principal.', 13),
(36, 'Ayuda con tareas - Literatura', 'Colaboración entre estudiantes para las tareas.', 13),
(37, 'Dudas generales - Física', 'Espacio para resolver dudas sobre el curso.', 14),
(38, 'Discusión del tema principal - Física', 'Debate y análisis del contenido principal.', 14),
(39, 'Ayuda con tareas - Física', 'Colaboración entre estudiantes para las tareas.', 14),
(40, 'Dudas generales - Química', 'Espacio para resolver dudas sobre el curso.', 15),
(41, 'Discusión del tema principal - Química', 'Debate y análisis del contenido principal.', 15),
(42, 'Ayuda con tareas - Química', 'Colaboración entre estudiantes para las tareas.', 15),
(43, 'Dudas generales - Inglés', 'Espacio para resolver dudas sobre el curso.', 16),
(44, 'Discusión del tema principal - Inglés', 'Debate y análisis del contenido principal.', 16),
(45, 'Ayuda con tareas - Inglés', 'Colaboración entre estudiantes para las tareas.', 16),
(46, 'Dudas generales - Programación', 'Espacio para resolver dudas sobre el curso.', 17),
(47, 'Discusión del tema principal - Programación', 'Debate y análisis del contenido principal.', 17),
(48, 'Ayuda con tareas - Programación', 'Colaboración entre estudiantes para las tareas.', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `contenido` text NOT NULL,
  `foroId` int DEFAULT NULL,
  `usuarioId` int DEFAULT NULL,
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `messages`
--

INSERT INTO `messages` (`id`, `contenido`, `foroId`, `usuarioId`, `createdAt`) VALUES
(1, '¡Hola a todos! Espero que este curso sea muy interesante.', 1, 3, '2025-12-07 09:37:34.000000'),
(2, '¿Alguien puede explicar el tema de la última clase?', 1, 10, '2025-12-07 09:37:34.000000'),
(3, 'Gracias por la información, me fue muy útil.', 1, 11, '2025-12-07 09:37:34.000000'),
(4, 'Tengo una duda sobre el ejercicio 3.', 1, 12, '2025-12-07 09:37:34.000000'),
(5, '¡Hola a todos! Espero que este curso sea muy interesante.', 2, 3, '2025-12-07 09:37:34.000000'),
(6, '¿Alguien puede explicar el tema de la última clase?', 2, 10, '2025-12-07 09:37:34.000000'),
(7, 'Gracias por la información, me fue muy útil.', 2, 11, '2025-12-07 09:37:34.000000'),
(8, 'Tengo una duda sobre el ejercicio 3.', 2, 12, '2025-12-07 09:37:34.000000'),
(9, '¡Hola a todos! Espero que este curso sea muy interesante.', 3, 3, '2025-12-07 09:37:34.000000'),
(10, '¿Alguien puede explicar el tema de la última clase?', 3, 10, '2025-12-07 09:37:34.000000'),
(11, 'Gracias por la información, me fue muy útil.', 3, 11, '2025-12-07 09:37:34.000000'),
(12, 'Tengo una duda sobre el ejercicio 3.', 3, 12, '2025-12-07 09:37:34.000000'),
(13, '¡Hola a todos! Espero que este curso sea muy interesante.', 4, 3, '2025-12-07 09:37:34.000000'),
(14, '¿Alguien puede explicar el tema de la última clase?', 4, 10, '2025-12-07 09:37:34.000000'),
(15, 'Gracias por la información, me fue muy útil.', 4, 11, '2025-12-07 09:37:34.000000'),
(16, 'Tengo una duda sobre el ejercicio 3.', 4, 12, '2025-12-07 09:37:34.000000'),
(17, '¡Hola a todos! Espero que este curso sea muy interesante.', 5, 3, '2025-12-07 09:37:34.000000'),
(18, '¿Alguien puede explicar el tema de la última clase?', 5, 10, '2025-12-07 09:37:34.000000'),
(19, 'Gracias por la información, me fue muy útil.', 5, 11, '2025-12-07 09:37:34.000000'),
(20, 'Tengo una duda sobre el ejercicio 3.', 5, 12, '2025-12-07 09:37:34.000000'),
(21, '¡Hola a todos! Espero que este curso sea muy interesante.', 6, 3, '2025-12-07 09:37:34.000000'),
(22, '¿Alguien puede explicar el tema de la última clase?', 6, 10, '2025-12-07 09:37:34.000000'),
(23, 'Gracias por la información, me fue muy útil.', 6, 11, '2025-12-07 09:37:34.000000'),
(24, 'Tengo una duda sobre el ejercicio 3.', 6, 12, '2025-12-07 09:37:34.000000'),
(25, '¡Hola a todos! Espero que este curso sea muy interesante.', 7, 3, '2025-12-07 09:37:34.000000'),
(26, '¿Alguien puede explicar el tema de la última clase?', 7, 10, '2025-12-07 09:37:34.000000'),
(27, 'Gracias por la información, me fue muy útil.', 7, 11, '2025-12-07 09:37:34.000000'),
(28, 'Tengo una duda sobre el ejercicio 3.', 7, 12, '2025-12-07 09:37:34.000000'),
(29, '¡Hola a todos! Espero que este curso sea muy interesante.', 8, 3, '2025-12-07 09:37:34.000000'),
(30, '¿Alguien puede explicar el tema de la última clase?', 8, 10, '2025-12-07 09:37:34.000000'),
(31, 'Gracias por la información, me fue muy útil.', 8, 11, '2025-12-07 09:37:34.000000'),
(32, 'Tengo una duda sobre el ejercicio 3.', 8, 12, '2025-12-07 09:37:34.000000'),
(33, '¡Hola a todos! Espero que este curso sea muy interesante.', 9, 3, '2025-12-07 09:37:34.000000'),
(34, '¿Alguien puede explicar el tema de la última clase?', 9, 10, '2025-12-07 09:37:34.000000'),
(35, 'Gracias por la información, me fue muy útil.', 9, 11, '2025-12-07 09:37:34.000000'),
(36, 'Tengo una duda sobre el ejercicio 3.', 9, 12, '2025-12-07 09:37:34.000000'),
(37, '¡Hola a todos! Espero que este curso sea muy interesante.', 10, 3, '2025-12-07 09:37:34.000000'),
(38, '¿Alguien puede explicar el tema de la última clase?', 10, 10, '2025-12-07 09:37:34.000000'),
(39, 'Gracias por la información, me fue muy útil.', 10, 11, '2025-12-07 09:37:34.000000'),
(40, 'Tengo una duda sobre el ejercicio 3.', 10, 12, '2025-12-07 09:37:34.000000'),
(41, '¡Hola a todos! Espero que este curso sea muy interesante.', 11, 3, '2025-12-07 09:37:34.000000'),
(42, '¿Alguien puede explicar el tema de la última clase?', 11, 10, '2025-12-07 09:37:34.000000'),
(43, 'Gracias por la información, me fue muy útil.', 11, 11, '2025-12-07 09:37:34.000000'),
(44, 'Tengo una duda sobre el ejercicio 3.', 11, 12, '2025-12-07 09:37:34.000000'),
(45, '¡Hola a todos! Espero que este curso sea muy interesante.', 12, 3, '2025-12-07 09:37:34.000000'),
(46, '¿Alguien puede explicar el tema de la última clase?', 12, 10, '2025-12-07 09:37:34.000000'),
(47, 'Gracias por la información, me fue muy útil.', 12, 11, '2025-12-07 09:37:34.000000'),
(48, 'Tengo una duda sobre el ejercicio 3.', 12, 12, '2025-12-07 09:37:34.000000'),
(49, '¡Hola a todos! Espero que este curso sea muy interesante.', 13, 3, '2025-12-07 09:37:34.000000'),
(50, '¿Alguien puede explicar el tema de la última clase?', 13, 10, '2025-12-07 09:37:34.000000'),
(51, 'Gracias por la información, me fue muy útil.', 13, 11, '2025-12-07 09:37:34.000000'),
(52, 'Tengo una duda sobre el ejercicio 3.', 13, 12, '2025-12-07 09:37:34.000000'),
(53, '¡Hola a todos! Espero que este curso sea muy interesante.', 14, 3, '2025-12-07 09:37:34.000000'),
(54, '¿Alguien puede explicar el tema de la última clase?', 14, 10, '2025-12-07 09:37:34.000000'),
(55, 'Gracias por la información, me fue muy útil.', 14, 11, '2025-12-07 09:37:34.000000'),
(56, 'Tengo una duda sobre el ejercicio 3.', 14, 12, '2025-12-07 09:37:34.000000'),
(57, '¡Hola a todos! Espero que este curso sea muy interesante.', 15, 3, '2025-12-07 09:37:34.000000'),
(58, '¿Alguien puede explicar el tema de la última clase?', 15, 10, '2025-12-07 09:37:34.000000'),
(59, 'Gracias por la información, me fue muy útil.', 15, 11, '2025-12-07 09:37:34.000000'),
(60, 'Tengo una duda sobre el ejercicio 3.', 15, 12, '2025-12-07 09:37:34.000000'),
(61, '¡Hola a todos! Espero que este curso sea muy interesante.', 16, 3, '2025-12-07 09:37:34.000000'),
(62, '¿Alguien puede explicar el tema de la última clase?', 16, 10, '2025-12-07 09:37:34.000000'),
(63, 'Gracias por la información, me fue muy útil.', 16, 11, '2025-12-07 09:37:34.000000'),
(64, 'Tengo una duda sobre el ejercicio 3.', 16, 12, '2025-12-07 09:37:34.000000'),
(65, '¡Hola a todos! Espero que este curso sea muy interesante.', 17, 3, '2025-12-07 09:37:34.000000'),
(66, '¿Alguien puede explicar el tema de la última clase?', 17, 10, '2025-12-07 09:37:34.000000'),
(67, 'Gracias por la información, me fue muy útil.', 17, 11, '2025-12-07 09:37:34.000000'),
(68, 'Tengo una duda sobre el ejercicio 3.', 17, 12, '2025-12-07 09:37:34.000000'),
(69, '¡Hola a todos! Espero que este curso sea muy interesante.', 18, 3, '2025-12-07 09:37:34.000000'),
(70, '¿Alguien puede explicar el tema de la última clase?', 18, 10, '2025-12-07 09:37:34.000000'),
(71, 'Gracias por la información, me fue muy útil.', 18, 11, '2025-12-07 09:37:34.000000'),
(72, 'Tengo una duda sobre el ejercicio 3.', 18, 12, '2025-12-07 09:37:34.000000'),
(73, '¡Hola a todos! Espero que este curso sea muy interesante.', 19, 3, '2025-12-07 09:37:34.000000'),
(74, '¿Alguien puede explicar el tema de la última clase?', 19, 10, '2025-12-07 09:37:34.000000'),
(75, 'Gracias por la información, me fue muy útil.', 19, 11, '2025-12-07 09:37:34.000000'),
(76, 'Tengo una duda sobre el ejercicio 3.', 19, 12, '2025-12-07 09:37:34.000000'),
(77, '¡Hola a todos! Espero que este curso sea muy interesante.', 20, 3, '2025-12-07 09:37:34.000000'),
(78, '¿Alguien puede explicar el tema de la última clase?', 20, 10, '2025-12-07 09:37:34.000000'),
(79, 'Gracias por la información, me fue muy útil.', 20, 11, '2025-12-07 09:37:34.000000'),
(80, 'Tengo una duda sobre el ejercicio 3.', 20, 12, '2025-12-07 09:37:34.000000'),
(81, '¡Hola a todos! Espero que este curso sea muy interesante.', 21, 3, '2025-12-07 09:37:34.000000'),
(82, '¿Alguien puede explicar el tema de la última clase?', 21, 10, '2025-12-07 09:37:34.000000'),
(83, 'Gracias por la información, me fue muy útil.', 21, 11, '2025-12-07 09:37:34.000000'),
(84, 'Tengo una duda sobre el ejercicio 3.', 21, 12, '2025-12-07 09:37:34.000000'),
(85, '¡Hola a todos! Espero que este curso sea muy interesante.', 22, 3, '2025-12-07 09:37:34.000000'),
(86, '¿Alguien puede explicar el tema de la última clase?', 22, 10, '2025-12-07 09:37:34.000000'),
(87, 'Gracias por la información, me fue muy útil.', 22, 11, '2025-12-07 09:37:34.000000'),
(88, 'Tengo una duda sobre el ejercicio 3.', 22, 12, '2025-12-07 09:37:34.000000'),
(89, '¡Hola a todos! Espero que este curso sea muy interesante.', 23, 3, '2025-12-07 09:37:34.000000'),
(90, '¿Alguien puede explicar el tema de la última clase?', 23, 10, '2025-12-07 09:37:34.000000'),
(91, 'Gracias por la información, me fue muy útil.', 23, 11, '2025-12-07 09:37:34.000000'),
(92, 'Tengo una duda sobre el ejercicio 3.', 23, 12, '2025-12-07 09:37:34.000000'),
(93, '¡Hola a todos! Espero que este curso sea muy interesante.', 24, 3, '2025-12-07 09:37:34.000000'),
(94, '¿Alguien puede explicar el tema de la última clase?', 24, 10, '2025-12-07 09:37:34.000000'),
(95, 'Gracias por la información, me fue muy útil.', 24, 11, '2025-12-07 09:37:34.000000'),
(96, 'Tengo una duda sobre el ejercicio 3.', 24, 12, '2025-12-07 09:37:34.000000'),
(97, '¡Hola a todos! Espero que este curso sea muy interesante.', 25, 3, '2025-12-07 09:38:11.000000'),
(98, '¿Alguien puede explicar el tema de la última clase?', 25, 10, '2025-12-07 09:38:11.000000'),
(99, 'Gracias por la información, me fue muy útil.', 25, 11, '2025-12-07 09:38:11.000000'),
(100, 'Tengo una duda sobre el ejercicio 3.', 25, 12, '2025-12-07 09:38:11.000000'),
(101, '¡Hola a todos! Espero que este curso sea muy interesante.', 26, 3, '2025-12-07 09:38:12.000000'),
(102, '¿Alguien puede explicar el tema de la última clase?', 26, 10, '2025-12-07 09:38:12.000000'),
(103, 'Gracias por la información, me fue muy útil.', 26, 11, '2025-12-07 09:38:12.000000'),
(104, 'Tengo una duda sobre el ejercicio 3.', 26, 12, '2025-12-07 09:38:12.000000'),
(105, '¡Hola a todos! Espero que este curso sea muy interesante.', 27, 3, '2025-12-07 09:38:12.000000'),
(106, '¿Alguien puede explicar el tema de la última clase?', 27, 10, '2025-12-07 09:38:12.000000'),
(107, 'Gracias por la información, me fue muy útil.', 27, 11, '2025-12-07 09:38:12.000000'),
(108, 'Tengo una duda sobre el ejercicio 3.', 27, 12, '2025-12-07 09:38:12.000000'),
(109, '¡Hola a todos! Espero que este curso sea muy interesante.', 28, 3, '2025-12-07 09:38:12.000000'),
(110, '¿Alguien puede explicar el tema de la última clase?', 28, 10, '2025-12-07 09:38:12.000000'),
(111, 'Gracias por la información, me fue muy útil.', 28, 11, '2025-12-07 09:38:12.000000'),
(112, 'Tengo una duda sobre el ejercicio 3.', 28, 12, '2025-12-07 09:38:12.000000'),
(113, '¡Hola a todos! Espero que este curso sea muy interesante.', 29, 3, '2025-12-07 09:38:12.000000'),
(114, '¿Alguien puede explicar el tema de la última clase?', 29, 10, '2025-12-07 09:38:12.000000'),
(115, 'Gracias por la información, me fue muy útil.', 29, 11, '2025-12-07 09:38:12.000000'),
(116, 'Tengo una duda sobre el ejercicio 3.', 29, 12, '2025-12-07 09:38:12.000000'),
(117, '¡Hola a todos! Espero que este curso sea muy interesante.', 30, 3, '2025-12-07 09:38:12.000000'),
(118, '¿Alguien puede explicar el tema de la última clase?', 30, 10, '2025-12-07 09:38:12.000000'),
(119, 'Gracias por la información, me fue muy útil.', 30, 11, '2025-12-07 09:38:12.000000'),
(120, 'Tengo una duda sobre el ejercicio 3.', 30, 12, '2025-12-07 09:38:12.000000'),
(121, '¡Hola a todos! Espero que este curso sea muy interesante.', 31, 3, '2025-12-07 09:38:12.000000'),
(122, '¿Alguien puede explicar el tema de la última clase?', 31, 10, '2025-12-07 09:38:12.000000'),
(123, 'Gracias por la información, me fue muy útil.', 31, 11, '2025-12-07 09:38:12.000000'),
(124, 'Tengo una duda sobre el ejercicio 3.', 31, 12, '2025-12-07 09:38:12.000000'),
(125, '¡Hola a todos! Espero que este curso sea muy interesante.', 32, 3, '2025-12-07 09:38:12.000000'),
(126, '¿Alguien puede explicar el tema de la última clase?', 32, 10, '2025-12-07 09:38:12.000000'),
(127, 'Gracias por la información, me fue muy útil.', 32, 11, '2025-12-07 09:38:12.000000'),
(128, 'Tengo una duda sobre el ejercicio 3.', 32, 12, '2025-12-07 09:38:12.000000'),
(129, '¡Hola a todos! Espero que este curso sea muy interesante.', 33, 3, '2025-12-07 09:38:12.000000'),
(130, '¿Alguien puede explicar el tema de la última clase?', 33, 10, '2025-12-07 09:38:12.000000'),
(131, 'Gracias por la información, me fue muy útil.', 33, 11, '2025-12-07 09:38:12.000000'),
(132, 'Tengo una duda sobre el ejercicio 3.', 33, 12, '2025-12-07 09:38:12.000000'),
(133, '¡Hola a todos! Espero que este curso sea muy interesante.', 34, 3, '2025-12-07 09:38:12.000000'),
(134, '¿Alguien puede explicar el tema de la última clase?', 34, 10, '2025-12-07 09:38:12.000000'),
(135, 'Gracias por la información, me fue muy útil.', 34, 11, '2025-12-07 09:38:12.000000'),
(136, 'Tengo una duda sobre el ejercicio 3.', 34, 12, '2025-12-07 09:38:12.000000'),
(137, '¡Hola a todos! Espero que este curso sea muy interesante.', 35, 3, '2025-12-07 09:38:12.000000'),
(138, '¿Alguien puede explicar el tema de la última clase?', 35, 10, '2025-12-07 09:38:12.000000'),
(139, 'Gracias por la información, me fue muy útil.', 35, 11, '2025-12-07 09:38:12.000000'),
(140, 'Tengo una duda sobre el ejercicio 3.', 35, 12, '2025-12-07 09:38:12.000000'),
(141, '¡Hola a todos! Espero que este curso sea muy interesante.', 36, 3, '2025-12-07 09:38:12.000000'),
(142, '¿Alguien puede explicar el tema de la última clase?', 36, 10, '2025-12-07 09:38:12.000000'),
(143, 'Gracias por la información, me fue muy útil.', 36, 11, '2025-12-07 09:38:12.000000'),
(144, 'Tengo una duda sobre el ejercicio 3.', 36, 12, '2025-12-07 09:38:12.000000'),
(145, '¡Hola a todos! Espero que este curso sea muy interesante.', 37, 3, '2025-12-07 09:38:12.000000'),
(146, '¿Alguien puede explicar el tema de la última clase?', 37, 10, '2025-12-07 09:38:12.000000'),
(147, 'Gracias por la información, me fue muy útil.', 37, 11, '2025-12-07 09:38:12.000000'),
(148, 'Tengo una duda sobre el ejercicio 3.', 37, 12, '2025-12-07 09:38:12.000000'),
(149, '¡Hola a todos! Espero que este curso sea muy interesante.', 38, 3, '2025-12-07 09:38:12.000000'),
(150, '¿Alguien puede explicar el tema de la última clase?', 38, 10, '2025-12-07 09:38:12.000000'),
(151, 'Gracias por la información, me fue muy útil.', 38, 11, '2025-12-07 09:38:12.000000'),
(152, 'Tengo una duda sobre el ejercicio 3.', 38, 12, '2025-12-07 09:38:12.000000'),
(153, '¡Hola a todos! Espero que este curso sea muy interesante.', 39, 3, '2025-12-07 09:38:12.000000'),
(154, '¿Alguien puede explicar el tema de la última clase?', 39, 10, '2025-12-07 09:38:12.000000'),
(155, 'Gracias por la información, me fue muy útil.', 39, 11, '2025-12-07 09:38:12.000000'),
(156, 'Tengo una duda sobre el ejercicio 3.', 39, 12, '2025-12-07 09:38:12.000000'),
(157, '¡Hola a todos! Espero que este curso sea muy interesante.', 40, 3, '2025-12-07 09:38:12.000000'),
(158, '¿Alguien puede explicar el tema de la última clase?', 40, 10, '2025-12-07 09:38:12.000000'),
(159, 'Gracias por la información, me fue muy útil.', 40, 11, '2025-12-07 09:38:12.000000'),
(160, 'Tengo una duda sobre el ejercicio 3.', 40, 12, '2025-12-07 09:38:12.000000'),
(161, '¡Hola a todos! Espero que este curso sea muy interesante.', 41, 3, '2025-12-07 09:38:12.000000'),
(162, '¿Alguien puede explicar el tema de la última clase?', 41, 10, '2025-12-07 09:38:12.000000'),
(163, 'Gracias por la información, me fue muy útil.', 41, 11, '2025-12-07 09:38:12.000000'),
(164, 'Tengo una duda sobre el ejercicio 3.', 41, 12, '2025-12-07 09:38:12.000000'),
(165, '¡Hola a todos! Espero que este curso sea muy interesante.', 42, 3, '2025-12-07 09:38:12.000000'),
(166, '¿Alguien puede explicar el tema de la última clase?', 42, 10, '2025-12-07 09:38:12.000000'),
(167, 'Gracias por la información, me fue muy útil.', 42, 11, '2025-12-07 09:38:12.000000'),
(168, 'Tengo una duda sobre el ejercicio 3.', 42, 12, '2025-12-07 09:38:12.000000'),
(169, '¡Hola a todos! Espero que este curso sea muy interesante.', 43, 3, '2025-12-07 09:38:12.000000'),
(170, '¿Alguien puede explicar el tema de la última clase?', 43, 10, '2025-12-07 09:38:12.000000'),
(171, 'Gracias por la información, me fue muy útil.', 43, 11, '2025-12-07 09:38:12.000000'),
(172, 'Tengo una duda sobre el ejercicio 3.', 43, 12, '2025-12-07 09:38:12.000000'),
(173, '¡Hola a todos! Espero que este curso sea muy interesante.', 44, 3, '2025-12-07 09:38:12.000000'),
(174, '¿Alguien puede explicar el tema de la última clase?', 44, 10, '2025-12-07 09:38:12.000000'),
(175, 'Gracias por la información, me fue muy útil.', 44, 11, '2025-12-07 09:38:12.000000'),
(176, 'Tengo una duda sobre el ejercicio 3.', 44, 12, '2025-12-07 09:38:12.000000'),
(177, '¡Hola a todos! Espero que este curso sea muy interesante.', 45, 3, '2025-12-07 09:38:12.000000'),
(178, '¿Alguien puede explicar el tema de la última clase?', 45, 10, '2025-12-07 09:38:12.000000'),
(179, 'Gracias por la información, me fue muy útil.', 45, 11, '2025-12-07 09:38:12.000000'),
(180, 'Tengo una duda sobre el ejercicio 3.', 45, 12, '2025-12-07 09:38:12.000000'),
(181, '¡Hola a todos! Espero que este curso sea muy interesante.', 46, 3, '2025-12-07 09:38:12.000000'),
(182, '¿Alguien puede explicar el tema de la última clase?', 46, 10, '2025-12-07 09:38:12.000000'),
(183, 'Gracias por la información, me fue muy útil.', 46, 11, '2025-12-07 09:38:12.000000'),
(184, 'Tengo una duda sobre el ejercicio 3.', 46, 12, '2025-12-07 09:38:12.000000'),
(185, '¡Hola a todos! Espero que este curso sea muy interesante.', 47, 3, '2025-12-07 09:38:12.000000'),
(186, '¿Alguien puede explicar el tema de la última clase?', 47, 10, '2025-12-07 09:38:12.000000'),
(187, 'Gracias por la información, me fue muy útil.', 47, 11, '2025-12-07 09:38:12.000000'),
(188, 'Tengo una duda sobre el ejercicio 3.', 47, 12, '2025-12-07 09:38:12.000000'),
(189, '¡Hola a todos! Espero que este curso sea muy interesante.', 48, 3, '2025-12-07 09:38:12.000000'),
(190, '¿Alguien puede explicar el tema de la última clase?', 48, 10, '2025-12-07 09:38:12.000000'),
(191, 'Gracias por la información, me fue muy útil.', 48, 11, '2025-12-07 09:38:12.000000'),
(192, 'Tengo una duda sobre el ejercicio 3.', 48, 12, '2025-12-07 09:38:12.000000'),
(193, 'hola', NULL, 1, '2025-12-07 10:00:11.928634');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `usuarioId` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `mensaje` text NOT NULL,
  `tipo` enum('info','success','warning','error') NOT NULL DEFAULT 'info',
  `categoria` enum('tarea','curso','foro','calificacion','sistema') NOT NULL DEFAULT 'sistema',
  `enlace` varchar(255) DEFAULT NULL,
  `leida` tinyint NOT NULL DEFAULT '0',
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resources`
--

CREATE TABLE `resources` (
  `id` int NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `tipo_recurso` varchar(255) DEFAULT NULL,
  `cursoId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `resources`
--

INSERT INTO `resources` (`id`, `nombre_archivo`, `url`, `tipo_recurso`, `cursoId`) VALUES
(1, 'Guía de estudio - Matemáticas.pdf', 'https://example.com/guia.pdf', 'documento', 2),
(2, 'Presentación Clase 1 - Matemáticas.pptx', 'https://example.com/clase1.pptx', 'presentacion', 2),
(3, 'Video explicativo - Matemáticas.pdf', 'https://youtube.com/watch?v=example', 'video', 2),
(4, 'Ejercicios resueltos - Matemáticas.pdf', 'https://example.com/ejercicios.pdf', 'documento', 2),
(5, 'Material complementario - Matemáticas.zip', 'https://example.com/material.zip', 'otro', 2),
(6, 'Guía de estudio - Historia.pdf', 'https://example.com/guia.pdf', 'documento', 3),
(7, 'Presentación Clase 1 - Historia.pptx', 'https://example.com/clase1.pptx', 'presentacion', 3),
(8, 'Video explicativo - Historia.pdf', 'https://youtube.com/watch?v=example', 'video', 3),
(9, 'Ejercicios resueltos - Historia.pdf', 'https://example.com/ejercicios.pdf', 'documento', 3),
(10, 'Material complementario - Historia.zip', 'https://example.com/material.zip', 'otro', 3),
(11, 'Guía de estudio - Ciencias.pdf', 'https://example.com/guia.pdf', 'documento', 4),
(12, 'Presentación Clase 1 - Ciencias.pptx', 'https://example.com/clase1.pptx', 'presentacion', 4),
(13, 'Video explicativo - Ciencias.pdf', 'https://youtube.com/watch?v=example', 'video', 4),
(14, 'Ejercicios resueltos - Ciencias.pdf', 'https://example.com/ejercicios.pdf', 'documento', 4),
(15, 'Material complementario - Ciencias.zip', 'https://example.com/material.zip', 'otro', 4),
(16, 'Guía de estudio - Literatura.pdf', 'https://example.com/guia.pdf', 'documento', 5),
(17, 'Presentación Clase 1 - Literatura.pptx', 'https://example.com/clase1.pptx', 'presentacion', 5),
(18, 'Video explicativo - Literatura.pdf', 'https://youtube.com/watch?v=example', 'video', 5),
(19, 'Ejercicios resueltos - Literatura.pdf', 'https://example.com/ejercicios.pdf', 'documento', 5),
(20, 'Material complementario - Literatura.zip', 'https://example.com/material.zip', 'otro', 5),
(21, 'Guía de estudio - Física.pdf', 'https://example.com/guia.pdf', 'documento', 6),
(22, 'Presentación Clase 1 - Física.pptx', 'https://example.com/clase1.pptx', 'presentacion', 6),
(23, 'Video explicativo - Física.pdf', 'https://youtube.com/watch?v=example', 'video', 6),
(24, 'Ejercicios resueltos - Física.pdf', 'https://example.com/ejercicios.pdf', 'documento', 6),
(25, 'Material complementario - Física.zip', 'https://example.com/material.zip', 'otro', 6),
(26, 'Guía de estudio - Química.pdf', 'https://example.com/guia.pdf', 'documento', 7),
(27, 'Presentación Clase 1 - Química.pptx', 'https://example.com/clase1.pptx', 'presentacion', 7),
(28, 'Video explicativo - Química.pdf', 'https://youtube.com/watch?v=example', 'video', 7),
(29, 'Ejercicios resueltos - Química.pdf', 'https://example.com/ejercicios.pdf', 'documento', 7),
(30, 'Material complementario - Química.zip', 'https://example.com/material.zip', 'otro', 7),
(31, 'Guía de estudio - Inglés.pdf', 'https://example.com/guia.pdf', 'documento', 8),
(32, 'Presentación Clase 1 - Inglés.pptx', 'https://example.com/clase1.pptx', 'presentacion', 8),
(33, 'Video explicativo - Inglés.pdf', 'https://youtube.com/watch?v=example', 'video', 8),
(34, 'Ejercicios resueltos - Inglés.pdf', 'https://example.com/ejercicios.pdf', 'documento', 8),
(35, 'Material complementario - Inglés.zip', 'https://example.com/material.zip', 'otro', 8),
(36, 'Guía de estudio - Programación.pdf', 'https://example.com/guia.pdf', 'documento', 9),
(37, 'Presentación Clase 1 - Programación.pptx', 'https://example.com/clase1.pptx', 'presentacion', 9),
(38, 'Video explicativo - Programación.pdf', 'https://youtube.com/watch?v=example', 'video', 9),
(39, 'Ejercicios resueltos - Programación.pdf', 'https://example.com/ejercicios.pdf', 'documento', 9),
(40, 'Material complementario - Programación.zip', 'https://example.com/material.zip', 'otro', 9),
(41, 'Guía de estudio - Matemáticas.pdf', 'https://example.com/guia.pdf', 'documento', 10),
(42, 'Presentación Clase 1 - Matemáticas.pptx', 'https://example.com/clase1.pptx', 'presentacion', 10),
(43, 'Video explicativo - Matemáticas.pdf', 'https://youtube.com/watch?v=example', 'video', 10),
(44, 'Ejercicios resueltos - Matemáticas.pdf', 'https://example.com/ejercicios.pdf', 'documento', 10),
(45, 'Material complementario - Matemáticas.zip', 'https://example.com/material.zip', 'otro', 10),
(46, 'Guía de estudio - Historia.pdf', 'https://example.com/guia.pdf', 'documento', 11),
(47, 'Presentación Clase 1 - Historia.pptx', 'https://example.com/clase1.pptx', 'presentacion', 11),
(48, 'Video explicativo - Historia.pdf', 'https://youtube.com/watch?v=example', 'video', 11),
(49, 'Ejercicios resueltos - Historia.pdf', 'https://example.com/ejercicios.pdf', 'documento', 11),
(50, 'Material complementario - Historia.zip', 'https://example.com/material.zip', 'otro', 11),
(51, 'Guía de estudio - Ciencias.pdf', 'https://example.com/guia.pdf', 'documento', 12),
(52, 'Presentación Clase 1 - Ciencias.pptx', 'https://example.com/clase1.pptx', 'presentacion', 12),
(53, 'Video explicativo - Ciencias.pdf', 'https://youtube.com/watch?v=example', 'video', 12),
(54, 'Ejercicios resueltos - Ciencias.pdf', 'https://example.com/ejercicios.pdf', 'documento', 12),
(55, 'Material complementario - Ciencias.zip', 'https://example.com/material.zip', 'otro', 12),
(56, 'Guía de estudio - Literatura.pdf', 'https://example.com/guia.pdf', 'documento', 13),
(57, 'Presentación Clase 1 - Literatura.pptx', 'https://example.com/clase1.pptx', 'presentacion', 13),
(58, 'Video explicativo - Literatura.pdf', 'https://youtube.com/watch?v=example', 'video', 13),
(59, 'Ejercicios resueltos - Literatura.pdf', 'https://example.com/ejercicios.pdf', 'documento', 13),
(60, 'Material complementario - Literatura.zip', 'https://example.com/material.zip', 'otro', 13),
(61, 'Guía de estudio - Física.pdf', 'https://example.com/guia.pdf', 'documento', 14),
(62, 'Presentación Clase 1 - Física.pptx', 'https://example.com/clase1.pptx', 'presentacion', 14),
(63, 'Video explicativo - Física.pdf', 'https://youtube.com/watch?v=example', 'video', 14),
(64, 'Ejercicios resueltos - Física.pdf', 'https://example.com/ejercicios.pdf', 'documento', 14),
(65, 'Material complementario - Física.zip', 'https://example.com/material.zip', 'otro', 14),
(66, 'Guía de estudio - Química.pdf', 'https://example.com/guia.pdf', 'documento', 15),
(67, 'Presentación Clase 1 - Química.pptx', 'https://example.com/clase1.pptx', 'presentacion', 15),
(68, 'Video explicativo - Química.pdf', 'https://youtube.com/watch?v=example', 'video', 15),
(69, 'Ejercicios resueltos - Química.pdf', 'https://example.com/ejercicios.pdf', 'documento', 15),
(70, 'Material complementario - Química.zip', 'https://example.com/material.zip', 'otro', 15),
(71, 'Guía de estudio - Inglés.pdf', 'https://example.com/guia.pdf', 'documento', 16),
(72, 'Presentación Clase 1 - Inglés.pptx', 'https://example.com/clase1.pptx', 'presentacion', 16),
(73, 'Video explicativo - Inglés.pdf', 'https://youtube.com/watch?v=example', 'video', 16),
(74, 'Ejercicios resueltos - Inglés.pdf', 'https://example.com/ejercicios.pdf', 'documento', 16),
(75, 'Material complementario - Inglés.zip', 'https://example.com/material.zip', 'otro', 16),
(76, 'Guía de estudio - Programación.pdf', 'https://example.com/guia.pdf', 'documento', 17),
(77, 'Presentación Clase 1 - Programación.pptx', 'https://example.com/clase1.pptx', 'presentacion', 17),
(78, 'Video explicativo - Programación.pdf', 'https://youtube.com/watch?v=example', 'video', 17),
(79, 'Ejercicios resueltos - Programación.pdf', 'https://example.com/ejercicios.pdf', 'documento', 17),
(80, 'Material complementario - Programación.zip', 'https://example.com/material.zip', 'otro', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `submissions`
--

CREATE TABLE `submissions` (
  `id` int NOT NULL,
  `tareaId` int NOT NULL,
  `estudianteId` int NOT NULL,
  `contenido` text,
  `archivoUrl` varchar(255) DEFAULT NULL,
  `archivoNombre` varchar(255) DEFAULT NULL,
  `estado` enum('pendiente','entregado','calificado','tarde') NOT NULL DEFAULT 'entregado',
  `calificacion` decimal(5,2) DEFAULT NULL,
  `comentarioDocente` text,
  `fechaEntrega` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `fechaCalificacion` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `id` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text,
  `fecha_entrega` datetime DEFAULT NULL,
  `estado` varchar(255) NOT NULL DEFAULT 'pendiente',
  `cursoId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `titulo`, `descripcion`, `fecha_entrega`, `estado`, `cursoId`) VALUES
(1, 'Investigación del tema - Matemáticas', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:37:34', 'pendiente', 2),
(2, 'Ejercicios prácticos - Matemáticas', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:37:34', 'completada', 2),
(3, 'Proyecto grupal - Matemáticas', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:37:34', 'pendiente', 2),
(4, 'Examen parcial - Matemáticas', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:37:34', 'completada', 2),
(5, 'Presentación oral - Matemáticas', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:37:34', 'pendiente', 2),
(6, 'Investigación del tema - Historia', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:37:34', 'pendiente', 3),
(7, 'Ejercicios prácticos - Historia', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:37:34', 'pendiente', 3),
(8, 'Proyecto grupal - Historia', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:37:34', 'completada', 3),
(9, 'Examen parcial - Historia', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:37:34', 'pendiente', 3),
(10, 'Presentación oral - Historia', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:37:34', 'pendiente', 3),
(11, 'Investigación del tema - Ciencias', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:37:34', 'completada', 4),
(12, 'Ejercicios prácticos - Ciencias', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:37:34', 'pendiente', 4),
(13, 'Proyecto grupal - Ciencias', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:37:34', 'completada', 4),
(14, 'Examen parcial - Ciencias', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:37:34', 'pendiente', 4),
(15, 'Presentación oral - Ciencias', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:37:34', 'pendiente', 4),
(16, 'Investigación del tema - Literatura', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:37:34', 'pendiente', 5),
(17, 'Ejercicios prácticos - Literatura', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:37:34', 'pendiente', 5),
(18, 'Proyecto grupal - Literatura', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:37:34', 'completada', 5),
(19, 'Examen parcial - Literatura', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:37:34', 'pendiente', 5),
(20, 'Presentación oral - Literatura', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:37:34', 'pendiente', 5),
(21, 'Investigación del tema - Física', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:37:34', 'pendiente', 6),
(22, 'Ejercicios prácticos - Física', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:37:34', 'pendiente', 6),
(23, 'Proyecto grupal - Física', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:37:34', 'completada', 6),
(24, 'Examen parcial - Física', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:37:34', 'pendiente', 6),
(25, 'Presentación oral - Física', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:37:34', 'pendiente', 6),
(26, 'Investigación del tema - Química', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:37:34', 'completada', 7),
(27, 'Ejercicios prácticos - Química', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:37:34', 'completada', 7),
(28, 'Proyecto grupal - Química', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:37:34', 'pendiente', 7),
(29, 'Examen parcial - Química', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:37:34', 'pendiente', 7),
(30, 'Presentación oral - Química', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:37:34', 'pendiente', 7),
(31, 'Investigación del tema - Inglés', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:37:34', 'pendiente', 8),
(32, 'Ejercicios prácticos - Inglés', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:37:34', 'completada', 8),
(33, 'Proyecto grupal - Inglés', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:37:34', 'pendiente', 8),
(34, 'Examen parcial - Inglés', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:37:34', 'pendiente', 8),
(35, 'Presentación oral - Inglés', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:37:34', 'pendiente', 8),
(36, 'Investigación del tema - Programación', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:37:34', 'pendiente', 9),
(37, 'Ejercicios prácticos - Programación', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:37:34', 'pendiente', 9),
(38, 'Proyecto grupal - Programación', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:37:34', 'pendiente', 9),
(39, 'Examen parcial - Programación', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:37:34', 'completada', 9),
(40, 'Presentación oral - Programación', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:37:34', 'completada', 9),
(41, 'Investigación del tema - Matemáticas', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:38:12', 'pendiente', 10),
(42, 'Ejercicios prácticos - Matemáticas', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:38:12', 'pendiente', 10),
(43, 'Proyecto grupal - Matemáticas', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:38:12', 'pendiente', 10),
(44, 'Examen parcial - Matemáticas', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:38:12', 'pendiente', 10),
(45, 'Presentación oral - Matemáticas', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:38:12', 'pendiente', 10),
(46, 'Investigación del tema - Historia', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:38:12', 'pendiente', 11),
(47, 'Ejercicios prácticos - Historia', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:38:12', 'pendiente', 11),
(48, 'Proyecto grupal - Historia', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:38:12', 'pendiente', 11),
(49, 'Examen parcial - Historia', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:38:12', 'completada', 11),
(50, 'Presentación oral - Historia', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:38:12', 'pendiente', 11),
(51, 'Investigación del tema - Ciencias', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:38:12', 'pendiente', 12),
(52, 'Ejercicios prácticos - Ciencias', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:38:12', 'pendiente', 12),
(53, 'Proyecto grupal - Ciencias', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:38:12', 'pendiente', 12),
(54, 'Examen parcial - Ciencias', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:38:12', 'pendiente', 12),
(55, 'Presentación oral - Ciencias', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:38:12', 'pendiente', 12),
(56, 'Investigación del tema - Literatura', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:38:12', 'completada', 13),
(57, 'Ejercicios prácticos - Literatura', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:38:12', 'pendiente', 13),
(58, 'Proyecto grupal - Literatura', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:38:12', 'pendiente', 13),
(59, 'Examen parcial - Literatura', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:38:12', 'completada', 13),
(60, 'Presentación oral - Literatura', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:38:12', 'pendiente', 13),
(61, 'Investigación del tema - Física', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:38:12', 'pendiente', 14),
(62, 'Ejercicios prácticos - Física', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:38:12', 'pendiente', 14),
(63, 'Proyecto grupal - Física', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:38:12', 'pendiente', 14),
(64, 'Examen parcial - Física', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:38:12', 'pendiente', 14),
(65, 'Presentación oral - Física', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:38:12', 'pendiente', 14),
(66, 'Investigación del tema - Química', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:38:12', 'pendiente', 15),
(67, 'Ejercicios prácticos - Química', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:38:12', 'completada', 15),
(68, 'Proyecto grupal - Química', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:38:12', 'pendiente', 15),
(69, 'Examen parcial - Química', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:38:12', 'pendiente', 15),
(70, 'Presentación oral - Química', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:38:12', 'pendiente', 15),
(71, 'Investigación del tema - Inglés', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:38:12', 'pendiente', 16),
(72, 'Ejercicios prácticos - Inglés', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:38:12', 'pendiente', 16),
(73, 'Proyecto grupal - Inglés', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:38:12', 'pendiente', 16),
(74, 'Examen parcial - Inglés', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:38:12', 'pendiente', 16),
(75, 'Presentación oral - Inglés', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:38:12', 'pendiente', 16),
(76, 'Investigación del tema - Programación', 'Realizar una investigación detallada sobre el tema asignado. Mínimo 3 páginas.', '2025-12-14 09:38:12', 'pendiente', 17),
(77, 'Ejercicios prácticos - Programación', 'Completar los ejercicios del capítulo correspondiente.', '2025-12-12 09:38:12', 'pendiente', 17),
(78, 'Proyecto grupal - Programación', 'Desarrollar un proyecto en equipo de 3-4 personas.', '2025-12-21 09:38:12', 'pendiente', 17),
(79, 'Examen parcial - Programación', 'Evaluación de los temas vistos hasta la fecha.', '2025-12-17 09:38:12', 'completada', 17),
(80, 'Presentación oral - Programación', 'Preparar y exponer un tema de 10 minutos.', '2025-12-19 09:38:12', 'completada', 17),
(81, 'tarea1', 'prueba', '2025-12-07 00:00:00', 'completada', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` enum('admin','docente','estudiante') NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `email`, `contraseña`, `rol`, `avatar`, `telefono`, `createdAt`) VALUES
(1, 'Administrador', 'admin@test.com', '$2b$10$Pq./zoTi9Lec15V2lXzOyuw/XY4au7Oal6/33KIYGQGyrncbUWmgm', 'admin', 'http://localhost:3001/uploads/ea29e040-e7a2-490c-a5da-7af103a89b07.png', '', '2025-12-07 14:42:58'),
(2, 'Juan Pérez', 'docente@test.com', '$2b$10$yEZtMCxHUsnO555d9ttH.eSmwGw9fz1OmNm7tb6aAkncAhzKDSq8e', 'docente', NULL, NULL, '2025-12-07 14:42:58'),
(3, 'María García', 'estudiante@test.com', '$2b$10$H1A/lDeoyERdjHKps7P8yuQptl.w4VjBbSYb2eC6sy6paQhZovfZO', 'estudiante', NULL, NULL, '2025-12-07 14:42:58'),
(7, 'Prof. Carlos López', 'carlos.lopez@test.com', '$2b$10$Bkv3v/HPdsHDmNKwmsy.ju23XW9NsuEu9qhI2V6TC7jSRfnhLIGNm', 'docente', NULL, NULL, '2025-12-07 14:42:58'),
(8, 'Prof. Ana Martínez', 'ana.martinez@test.com', '$2b$10$Bkv3v/HPdsHDmNKwmsy.ju23XW9NsuEu9qhI2V6TC7jSRfnhLIGNm', 'docente', NULL, NULL, '2025-12-07 14:42:58'),
(10, 'María Rodríguez', 'maria.rodriguez@test.com', '$2b$10$Bkv3v/HPdsHDmNKwmsy.ju23XW9NsuEu9qhI2V6TC7jSRfnhLIGNm', 'estudiante', NULL, NULL, '2025-12-07 14:42:58'),
(11, 'Pedro Sánchez', 'pedro.sanchez@test.com', '$2b$10$Bkv3v/HPdsHDmNKwmsy.ju23XW9NsuEu9qhI2V6TC7jSRfnhLIGNm', 'estudiante', NULL, NULL, '2025-12-07 14:42:58'),
(12, 'Laura Torres', 'laura.torres@test.com', '$2b$10$Bkv3v/HPdsHDmNKwmsy.ju23XW9NsuEu9qhI2V6TC7jSRfnhLIGNm', 'estudiante', NULL, NULL, '2025-12-07 14:42:58'),
(13, 'Diego Ramírez', 'diego.ramirez@test.com', '$2b$10$Bkv3v/HPdsHDmNKwmsy.ju23XW9NsuEu9qhI2V6TC7jSRfnhLIGNm', 'estudiante', NULL, NULL, '2025-12-07 14:42:58');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_a9292d27d5dbdc2f66946a7a2ed` (`remitenteId`),
  ADD KEY `FK_2265473d31df01474d6b062657f` (`destinatarioId`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_677e399d2172271cb85bb7a5025` (`docenteId`);

--
-- Indices de la tabla `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_6152161357837addd23b9a44853` (`estudianteId`),
  ADD KEY `FK_5ae250e77eaca72a69c644aa137` (`cursoId`);

--
-- Indices de la tabla `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_0e3be940313b31a61c890d7b070` (`cursoId`),
  ADD KEY `FK_07e50a1eba8c11161a4668ce3e1` (`docenteId`);

--
-- Indices de la tabla `exam_attempts`
--
ALTER TABLE `exam_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_4eb0dd11d0191d842a8331e91d0` (`examId`),
  ADD KEY `FK_2a652d9a778f2a147ff3055d35d` (`estudianteId`);

--
-- Indices de la tabla `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ecf1b78afe040b8995707914c49` (`examId`);

--
-- Indices de la tabla `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_81f52c50ae52448e14888574977` (`cursoId`);

--
-- Indices de la tabla `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_906de36a213303d4c8ec2b65cef` (`foroId`),
  ADD KEY `FK_a02dc1087da6486e7e98c470d06` (`usuarioId`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_6696e6a0dc7be95e6361ed7c837` (`usuarioId`);

--
-- Indices de la tabla `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_d36637983518aaf285caa2e0a57` (`cursoId`);

--
-- Indices de la tabla `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_9fa5012cfc1d8b7d2b0b830439f` (`tareaId`),
  ADD KEY `FK_222ca9fabd4a2801bdfadda164d` (`estudianteId`);

--
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_0a3f96916ff32416d8d15bb360e` (`cursoId`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `exam_attempts`
--
ALTER TABLE `exam_attempts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `exam_questions`
--
ALTER TABLE `exam_questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT de la tabla `forums`
--
ALTER TABLE `forums`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `FK_2265473d31df01474d6b062657f` FOREIGN KEY (`destinatarioId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_a9292d27d5dbdc2f66946a7a2ed` FOREIGN KEY (`remitenteId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `FK_677e399d2172271cb85bb7a5025` FOREIGN KEY (`docenteId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `FK_5ae250e77eaca72a69c644aa137` FOREIGN KEY (`cursoId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `FK_6152161357837addd23b9a44853` FOREIGN KEY (`estudianteId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `FK_07e50a1eba8c11161a4668ce3e1` FOREIGN KEY (`docenteId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_0e3be940313b31a61c890d7b070` FOREIGN KEY (`cursoId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `exam_attempts`
--
ALTER TABLE `exam_attempts`
  ADD CONSTRAINT `FK_2a652d9a778f2a147ff3055d35d` FOREIGN KEY (`estudianteId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_4eb0dd11d0191d842a8331e91d0` FOREIGN KEY (`examId`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `exam_questions`
--
ALTER TABLE `exam_questions`
  ADD CONSTRAINT `FK_ecf1b78afe040b8995707914c49` FOREIGN KEY (`examId`) REFERENCES `exams` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `forums`
--
ALTER TABLE `forums`
  ADD CONSTRAINT `FK_81f52c50ae52448e14888574977` FOREIGN KEY (`cursoId`) REFERENCES `courses` (`id`);

--
-- Filtros para la tabla `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `FK_906de36a213303d4c8ec2b65cef` FOREIGN KEY (`foroId`) REFERENCES `forums` (`id`),
  ADD CONSTRAINT `FK_a02dc1087da6486e7e98c470d06` FOREIGN KEY (`usuarioId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `FK_6696e6a0dc7be95e6361ed7c837` FOREIGN KEY (`usuarioId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `FK_d36637983518aaf285caa2e0a57` FOREIGN KEY (`cursoId`) REFERENCES `courses` (`id`);

--
-- Filtros para la tabla `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `FK_222ca9fabd4a2801bdfadda164d` FOREIGN KEY (`estudianteId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_9fa5012cfc1d8b7d2b0b830439f` FOREIGN KEY (`tareaId`) REFERENCES `tasks` (`id`);

--
-- Filtros para la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `FK_0a3f96916ff32416d8d15bb360e` FOREIGN KEY (`cursoId`) REFERENCES `courses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
