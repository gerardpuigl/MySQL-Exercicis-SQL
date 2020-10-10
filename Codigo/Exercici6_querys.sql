-- PETICIÓN PEDIDO UN CLIENTE --

SELECT 
    client_name AS Nombre_cliente,
    client_surnames AS Apellido_cliente,
    model_brand AS Marca,
    model_name AS Modelo,
    rightgraduation AS Graduación_Ojo_Derecho,
    leftgraduation AS Graduación_Ojo_Izquierdo,
    glasscolor AS Color_Vidrio,
    model_price AS Precio,
    employ_name AS vendido_por
FROM
    sellesrecord
        INNER JOIN
    configurations ON sellesrecord.configurations_configuration_id = configurations.configuration_id
        INNER JOIN
    clients ON sellesrecord.clients_client_id = clients.client_id
        INNER JOIN
    employees ON sellesrecord.employees_employ_id = employees.employ_id
        INNER JOIN
    models ON configurations.models_model_id = models.model_id
WHERE
    selle_id = 3;

-- LISTA DE RECOMENDACIONES ENTRE CLIENTES --

SELECT 
    (SELECT client_name FROM clients WHERE clients_client_id=client_id)  AS 'Nombre', 
    (SELECT client_surnames FROM clients WHERE clients_client_id=client_id)  AS 'Apellido', 
    'recomedó a',
    (SELECT client_name FROM clients WHERE recomender_client_id=client_id)  AS 'Nombre', 
    (SELECT client_surnames FROM clients WHERE recomender_client_id=client_id ) AS 'Apellido'
FROM recomendations;

-- LISTA DE PROVEEDORES Y MODELOS --

SELECT supplier_name, supplier_phone, supplier_nif, model_brand, model_name, model_type, model_price FROM suppliers
INNER JOIN models ON models.Suppliers_supplier_id=supplier_id
ORDER BY supplier_name;

-- NUMERO DE VENTAS EMPLEADOS --

SELECT employ_name,employ_surnames,COUNT(selle_id) AS 'número de ventas' FROM sellesrecord
RIGHT JOIN employees ON sellesrecord.employees_employ_id=employ_id
GROUP BY employees.employ_id; -- SIN ESTE CODIGO NO MUESTRA LOS ZEROS!!! --