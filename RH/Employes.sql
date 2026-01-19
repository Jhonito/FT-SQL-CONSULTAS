SELECT 
        [idempleado],
        [fechanacimiento],
        [fechaalta],
        [idpuesto],
        [codigoempleado],
        [estadoempleado],
        [nombre],
        [apellidopaterno],
        [apellidomaterno]
    FROM [10.10.0.7,7301\COMPAC].[ctFARM_TEPA_2020].[dbo].[nom10001]
    WHERE [codigoempleado] = '3190'
    -- WHERE [nombre] LIKE '%BEATRIZ%'