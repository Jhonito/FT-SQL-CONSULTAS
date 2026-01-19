SELECT
        A.[codigoempleado] AS ID_RH,
        F.USUARIO,
        A.[estadoempleado] AS Estatus,
        A.[nombre] AS Nombre,
        A.[apellidopaterno] AS [Apellido Paterno],
        A.[apellidomaterno] AS [Apellido Materno],
        B.[descripcion] AS Sucursal,
        C.[descripcion] AS Puesto
FROM
(
    SELECT
        [idempleado],
        [iddepartamento],
        [idpuesto],
        [codigoempleado],
        [estadoempleado],
        [nombre],
        [apellidopaterno],
        [apellidomaterno]
    FROM [10.10.0.7,7291\SQLEXPRESS].[ctFARM_TEPA_2020].[dbo].[nom10001]
    WHERE  [estadoempleado] IN ('A','R')
)A
LEFT JOIN
(
    SELECT
        [iddepartamento],
        [descripcion]
        
    FROM [10.10.0.7,7291\SQLEXPRESS].[ctFARM_TEPA_2020].[dbo].[nom10003]
)B
ON A.iddepartamento = B.iddepartamento
LEFT JOIN
(
	SELECT
		[idpuesto],
        [descripcion]
    FROM [10.10.0.7,7291\SQLEXPRESS].[ctFARM_TEPA_2020].[dbo].[nom10006]
)C
ON A.[idpuesto] = C.[idpuesto]
-- LEFT JOIN
-- (
--     SELECT *
--     FROM FT.DBO.IDENTIDADES
--     WHERE ID_RH IS NOT NULL
-- )D
-- ON A.[codigoempleado] = D.ID_RH
LEFT JOIN
(
    SELECT 
        USUARIO,
        ID_RH
    FROM FT.DBO.USUARIOS
    WHERE ID_RH IS NOT NULL
)F
ON A.[codigoempleado] = F.ID_RH
ORDER BY A.[codigoempleado] ASC

-- WHERE A.nombre LIKE '%flor%'