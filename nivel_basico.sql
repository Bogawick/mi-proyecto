-- Crear base de datos
CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

-- Tabla de categorías (con anidación)
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    clase_padre_id INT DEFAULT NULL
);

-- Tabla de productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    especificaciones TEXT,
    precio DECIMAL(10,2) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Tabla de comentarios
CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    texto TEXT NOT NULL,
    nombre_persona VARCHAR(100) NOT NULL,
    calificacion INT CHECK (calificacion >= 1 AND calificacion <= 5),
    producto_id INT,
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Insertar categorías
INSERT INTO categorias (nombre, clase_padre_id) VALUES
('Electrónica', NULL),
('Computadoras', 1),
('Laptops', 2),
('Smartphones', 1),
('Hogar', NULL),
('Cocina', 5),
('Refrigeradores', 6),
('TVs', 1),
('Audio', 1),
('Accesorios', 1);

-- Insertar productos
INSERT INTO productos (modelo, especificaciones, precio, categoria_id) VALUES
('Laptop X100', '16GB RAM, 512GB SSD, Intel i7', 18999.99, 3),
('Smartphone Z1', '6.5" AMOLED, 128GB, 5G', 9999.99, 4),
('Laptop X200', '32GB RAM, 1TB SSD, Intel i9', 23999.99, 3),
('TV 55" 4K', 'Smart TV, HDMI, USB', 10999.99, 8),
('Refrigerador CoolMax', 'Doble puerta, Inverter', 12999.00, 7),
('Microondas HeatUp', '900W, Digital', 2499.99, 6),
('Bocina Boom', 'Bluetooth, batería 10h', 1999.99, 9),
('Mouse Pro', 'Óptico, inalámbrico', 499.99, 10),
('Teclado Mecánico', 'RGB, USB', 1299.00, 10),
('Smartphone Z2', '6.7" AMOLED, 256GB, 5G', 11499.99, 4);

-- Insertar comentarios
INSERT INTO comentarios (texto, nombre_persona, calificacion, producto_id) VALUES
('Excelente rendimiento y muy rápida.', 'Juan Pérez', 5, 1),
('Muy buena calidad, lo recomiendo.', 'María Gómez', 4, 2),
('Es potente pero se calienta un poco.', 'Carlos Ruiz', 4, 3),
('Excelente imagen y sonido.', 'Ana Torres', 5, 4),
('Muy espacioso y silencioso.', 'Luis Romero', 5, 5),
('Cumple su función, fácil de usar.', 'Karen Díaz', 4, 6),
('Sonido potente para su tamaño.', 'Eduardo Lara', 5, 7),
('Ligero y preciso, buena compra.', 'Fernanda Ríos', 4, 8),
('Teclas cómodas y luces bonitas.', 'Miguel Sánchez', 5, 9),
('Gran pantalla y buena batería.', 'Paola Núñez', 5, 10);
