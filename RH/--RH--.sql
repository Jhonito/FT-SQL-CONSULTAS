SELECT
A.*,B.*,C.*
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

-- WHERE A.nombre LIKE '%flor%'