
-- ============================================
-- NIVELES BÁSICO + INTERMEDIO
-- ============================================

-- Usar base de datos
USE tienda;

-- ============================================
-- Agregar índices y llaves foráneas explícitas
-- (algunas ya están, reforzamos con índice)
-- ============================================
ALTER TABLE productos ADD INDEX idx_categoria_id (categoria_id);
ALTER TABLE comentarios ADD INDEX idx_producto_id (producto_id);
ALTER TABLE categorias ADD INDEX idx_clase_padre_id (clase_padre_id);

-- ============================================
-- Crear tabla de accesorios por categoría
-- ============================================
CREATE TABLE accesorios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Insertar accesorios de ejemplo
INSERT INTO accesorios (nombre, descripcion, categoria_id) VALUES
('Funda para Laptop', 'Funda de neopreno 15.6"', 3),
('Soporte de Laptop', 'Soporte ajustable de aluminio', 3),
('Cargador Universal', 'Compatible con múltiples marcas', 3),
('Audífonos Inalámbricos', 'Bluetooth con micrófono', 9),
('Control Remoto', 'Para TV Smart 4K', 8),
('Batería de Repuesto', 'Para Smartphone Z1/Z2', 4),
('Filtro Antibacteriano', 'Para Refrigeradores', 7),
('Parrilla Giratoria', 'Para Microondas', 6),
('Mouse Pad', 'Antideslizante y ergonómico', 10),
('Cable HDMI', '1.8 metros de longitud', 10);

-- ============================================
-- Agregar columna: cantidad de visitas
-- ============================================
ALTER TABLE productos ADD COLUMN visitas INT DEFAULT 0;

-- ============================================
-- Crear vista de productos con promedio de calificación
-- ============================================
CREATE OR REPLACE VIEW vista_productos_comentarios AS
SELECT
    p.id,
    p.modelo,
    p.especificaciones,
    p.precio,
    p.visitas,
    AVG(c.calificacion) AS calificacion_promedio,
    COUNT(c.id) AS total_comentarios
FROM productos p
LEFT JOIN comentarios c ON p.id = c.producto_id
GROUP BY p.id
ORDER BY calificacion_promedio DESC;
