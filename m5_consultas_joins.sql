USE Ventas_Tech_DB;

---Consulta 1 — Vista base del proyecto (INNER JOIN)
SELECT 
    fecha_venta,
    clientes.nombre AS identificacion_cliente,
    clientes.ciudad AS ciudad_cliente,
    productos.nombre_producto,
    categoria.nombre_categoria,
    categoria.descripcion,
    cantidad,
    precio_unitario,
    precio_unitario * cantidad AS total_venta
FROM ventas 
LEFT JOIN clientes ON ventas.id_cliente = clientes.id_cliente
LEFT JOIN productos ON ventas.id_producto = productos.id_producto
LEFT JOIN(
    SELECT id_categoria, nombre_categoria, descripcion
    FROM categorias
) AS categoria
 ON categoria.id_categoria = productos.id_categoria;

---Consulta 2 - Clientes sin ventas (LEFT JOIN) 
SELECT clientes.nombre
FROM clientes
LEFT JOIN ventas
ON clientes.id_cliente = ventas.id_cliente
WHERE ventas.id_cliente IS NULL;

--Consulta 3 - Productos sin ventas (LEFT JOIN)
--Agregue este producto por que no tenia productos sin venta
INSERT INTO productos VALUES ('Teclado normal',2,100.00,20,1);

SELECT productos.nombre_producto
FROM productos
LEFT JOIN ventas
ON ventas.id_producto = productos.id_producto WHERE ventas.id_producto IS NULL;

--Consulta 4 -  Consolidado por canal (UNION ALL)
SELECT id_venta,id_cliente,id_producto,cantidad, precio_unitario,fecha_venta
FROM ventas 
WHERE fecha_venta BETWEEN '2024-03-11' AND '2024-03-15'

UNION ALL

SELECT id_venta,id_cliente,id_producto,cantidad, precio_unitario,fecha_venta
FROM ventas 
WHERE fecha_venta BETWEEN '2024-03-05' AND '2024-03-10';