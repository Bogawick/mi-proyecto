# mi-proyecto


# Proyecto: Base de Datos de Productos

Este proyecto contiene el script SQL para crear una base de datos con tres tablas principales: `productos`, `comentarios` y `categorias`. Este archivo corresponde al **Nivel Básico** del sistema.

---

## 🗂️ Estructura de la base de datos (Nivel Básico)

### Tabla: `categorias`
Contiene las categorías de productos, con posibilidad de categorías anidadas.

| Campo           | Tipo        | Descripción                         |
|----------------|-------------|-------------------------------------|
| id             | INT         | Clave primaria autoincremental      |
| nombre         | VARCHAR(100)| Nombre de la categoría              |
| clase_padre_id | INT         | Referencia a la categoría padre     |

---

### Tabla: `productos`
Información básica de los productos registrados.

| Campo           | Tipo         | Descripción                         |
|----------------|--------------|-------------------------------------|
| id             | INT          | Clave primaria autoincremental      |
| modelo         | VARCHAR(100) | Modelo del producto                 |
| especificaciones | TEXT       | Descripción técnica o resumen       |
| precio         | DECIMAL(10,2)| Precio del producto                 |
| categoria_id   | INT          | Relación con la tabla `categorias`  |

---

### Tabla: `comentarios`
Comentarios realizados por usuarios para los productos.

| Campo           | Tipo         | Descripción                         |
|----------------|--------------|-------------------------------------|
| id             | INT          | Clave primaria autoincremental      |
| texto          | TEXT         | Contenido del comentario            |
| nombre_persona | VARCHAR(100) | Nombre del autor del comentario     |
| calificacion   | INT          | Valor entre 1 y 5                   |
| producto_id    | INT          | Relación con la tabla `productos`   |

---

## 📝 Datos de prueba
Cada tabla incluye al menos 10 registros de ejemplo que puedes utilizar para hacer pruebas, visualizar relaciones y montar interfaces.

---

## 🚀 Cómo usar este script
1. Abre MySQL o phpMyAdmin.
2. Ejecuta el archivo `nivel_basico.sql`.
3. Explora las tablas creadas y sus relaciones.

---

## Próximos niveles
- [ ] Nivel Intermedio: vistas, índices, accesorios, modificación de tablas.
- [ ] Nivel Avanzado: metainformación, procedimientos, mensualidades y vistas dinámicas.

---

© Proyecto académico - SQL - Nivel Básico
