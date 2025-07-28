
-- ============================================
-- NIVELES BÁSICO + INTERMEDIO + AVANZADO
-- ============================================

USE tienda;

-- ============================================
-- Agregar metainformación a productos
-- ============================================
ALTER TABLE productos
    ADD COLUMN fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    ADD COLUMN fecha_modificacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ADD COLUMN likes INT DEFAULT 0;

-- ============================================
-- Procedimiento para calcular mensualidades
-- ============================================
-- El cálculo es a 10% anual, distribuido entre 6 y 12 meses

DELIMITER //

CREATE PROCEDURE calcular_mensualidad (
    IN precio DECIMAL(10,2),
    IN meses INT,
    OUT mensualidad DECIMAL(10,2)
)
BEGIN
    DECLARE interes_anual DECIMAL(5,2) DEFAULT 0.10;
    DECLARE interes_mensual DECIMAL(5,4);
    SET interes_mensual = interes_anual / 12;
    SET mensualidad = (precio * interes_mensual * POW(1 + interes_mensual, meses)) / (POW(1 + interes_mensual, meses) - 1);
END //

DELIMITER ;

-- ============================================
-- Crear vista de 10 productos aleatorios con clasificación y mensualidades
-- ============================================

-- NOTA: MySQL no puede ejecutar procedimientos directamente en una vista,
-- así que se pre-calcula como estimación simple en la vista

CREATE OR REPLACE VIEW vista_productos_mensualidad AS
SELECT
    p.id,
    p.modelo,
    p.precio,
    c.nombre AS categoria,
    ROUND(p.precio * 0.008792, 2) AS mensualidad_6_meses,
    ROUND(p.precio * 0.004399, 2) AS mensualidad_12_meses
FROM productos p
JOIN categorias c ON p.categoria_id = c.id
ORDER BY RAND()
LIMIT 10;
