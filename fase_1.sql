-- Punto 1
SELECT COUNT(id_orden) as num_ordenes
FROM orden

-- Punto 2
SELECT COUNT(c.cedula) as num_clientes
FROM clientes as c
JOIN orden as ord on c.cedula = ord.cedula
WHERE ord.fecha_orden BETWEEN CAST('01-01-2021' AS DATE) AND CURRENT_DATE() 

-- Punto 3
SELECT 
c.nombre as nombre_cliente,
c.cedula as cedula_cliente,
COUNT(ord.id_orden) as num_total_ordenes
FROM clientes as c
JOIN orden as ord on c.cedula = ord.cedula
WHERE ord.fecha_orden BETWEEN CAST('01-01-2021' AS DATE) AND CURRENT_DATE() 
GROUP BY c.cedula,c.nombre
ORDER BY num_total_ordenes DESC

-- Punto 4
SELECT 
    c.cedula,
    c.nombre AS nombre_cliente,
    c.telefono,
    ord.fecha_orden,
    p.nombre_producto,
    d.cantidad
FROM (
    SELECT 
        ord.id_orden,
        SUM(d.precio_unitario * d.cantidad) AS total
    FROM orden ord
    JOIN detalle_orden d ON ord.id_orden = d.id_orden
    WHERE EXTRACT(YEAR FROM ord.fecha_orden) = 2020
    GROUP BY ord.id_orden
    ORDER BY total DESC
    LIMIT 1

) AS pm
JOIN orden AS ord ON ord.id_orden = pm.id_orden
JOIN clientes AS c ON c.cedula = ord.cedula
JOIN detalle_orden AS d ON d.id_orden = ord.id_orden
JOIN producto AS p ON p.id_producto = d.id_producto

-- Punto 5
SELECT 
    EXTRACT(YEAR FROM ord.fecha_orden) AS anio,
    EXTRACT(MONTH FROM ord.fecha_orden) AS mes,
    SUM(d.precio_unitario * d.cantidad) AS total_vendido
FROM 
    orden AS ord
JOIN 
    detalle_orden AS d ON ord.id_orden = d.id_orden
GROUP BY 
    anio, mes
ORDER BY 
    anio, mes

-- Punto 6
SELECT 
    p.nombre_producto,
    COUNT(DISTINCT ord.id_orden) AS nro_veces_comprado,
    SUM(d.precio_unitario * d.cantidad) AS total_gastado
FROM 
    clientes AS c
JOIN 
    orden AS ord ON c.cedula = ord.cedula
JOIN 
    detalle_orden AS d ON ord.id_orden = d.id_orden
JOIN 
    producto AS p ON d.id_producto = p.id_producto
WHERE 
    c.cedula = '123456'
GROUP BY 
    p.nombre_producto
ORDER BY 
    total_gastado DESC



