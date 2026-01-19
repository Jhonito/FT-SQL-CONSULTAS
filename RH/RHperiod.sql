SELECT 
    A.[idempleado],
    A.[nombre],
    A.[apellidopaterno],
    A.[apellidomaterno],
    B.[idperiodo],
    B.[idconcepto],
    B.[importetotal],
    B.[timestamp],
    C.*
FROM
( 
 SELECT
        [idempleado],
        [codigoempleado],
        [estadoempleado],
        [nombre],
        [apellidopaterno],
        [apellidomaterno]

    FROM [10.10.0.7,7301\COMPAC].[ctFARM_TEPA_2020].[dbo].[nom10001]
    WHERE  [estadoempleado] IN ('A','R')
)A
LEFT JOIN
(
    SELECT
    [idempleado],
    [idperiodo],
    [idconcepto],
    [importetotal],
    [timestamp]

    FROM [10.10.0.7,7301\COMPAC].[ctFARM_TEPA_2020].[dbo].[nom10007]
)B
ON A.[idempleado] = B.[idempleado]
LEFT JOIN
(
    SELECT
        [idconcepto],
        [descripcion]
     FROM [10.10.0.7,7301\COMPAC].[ctFARM_TEPA_2020].[dbo].[nom10004]
    
)C
ON B.[idconcepto] = C.[idconcepto]


-- AND B.[idperiodo] = '1131'
-- WHERE A.[idempleado] ='5415'
-- AND B.[idconcepto] ='1'
WHERE B.[idconcepto] ='1'
-- -- AND B.[idconcepto] = '1'
AND B.[idperiodo] IN ('1179')
ORDER BY B.importetotal DESC
-- -- ORDER BY B.timestamp DESC
-- ORDER BY B.[timestamp]  DESC
-- WHERE   C.[idconcepto] IN ('26')
-- ORDER BY B.[idperiodo] DESC