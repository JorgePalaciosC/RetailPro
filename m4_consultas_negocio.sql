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


-- Reemplazo de la consulta 4 por sugerencia de la IA
-- Consulta 4 — Meses por encima/por debajo del promedio

WITH Facturacion_Mensual AS (
    SELECT
        YEAR(fecha_venta) AS Anio,
        MONTH(fecha_venta) AS Mes,
        SUM(cantidad * precio_unitario) AS Total_facturado
    FROM ventas
    GROUP BY
        YEAR(fecha_venta),
        MONTH(fecha_venta)
)
SELECT
    Anio,
    Mes,
    Total_facturado,
    AVG(Total_facturado) OVER() AS Promedio_mensual,
    CASE
        WHEN Total_facturado > AVG(Total_facturado) OVER()
            THEN 'Por encima del promedio'
        WHEN Total_facturado < AVG(Total_facturado) OVER()
            THEN 'Por debajo del promedio'
        ELSE 'Igual al promedio'
    END AS Comparacion
FROM Facturacion_Mensual
ORDER BY Anio, Mes;
