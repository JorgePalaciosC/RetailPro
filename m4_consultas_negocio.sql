USE Ventas_Tech_DB

-- Consulta 1 — Resumen ejecutivo mensual

SELECT    
    SUM(cantidad * precio_unitario) AS Total_facturado,
    COUNT(id_venta) AS Cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS Ticket_promedio,
    DATEPART(MONTH, fecha_venta) AS Mes
FROM 
    ventas 
GROUP BY 
    DATEPART(MONTH, fecha_venta);

-- Consulta 2 — Ranking de productos
SELECT TOP 5 id_producto, SUM(cantidad * precio_unitario) AS Total_facturado, SUM(cantidad) AS Unidades_vendidas 
FROM ventas 
GROUP BY id_producto 
ORDER BY Total_facturado DESC;

-- Consulta 3 — Clientes recurrentes 
SELECT 
id_cliente, 
COUNT(id_venta) AS Cantidad_pedidos, 
SUM(cantidad * precio_unitario) AS Total_gastado 
FROM ventas 
GROUP BY id_cliente
HAVING COUNT(id_cliente) > 1;

-- Consulta 4 — Meses por encima/por debajo del promedio
-- Esta consulta se me complico siento que no es correcta
SELECT
    id_producto,
    fecha_venta,
    SUM(cantidad * precio_unitario) AS Total_facturado_dia,
    AVG(cantidad * precio_unitario) AS Promedio_por_ticket,
    CASE
        WHEN SUM(cantidad * precio_unitario) > AVG(cantidad * precio_unitario) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS Comparacion_dia_vs_ticket
FROM ventas
GROUP BY id_producto,fecha_venta
ORDER BY Promedio_por_ticket DESC;

-- No puedo realizar el bloque de cierre por que como lo mencione esta última consulta no pude resolverla
