USE FT
IF(1=2)BEGIN

-- ? VER COLUMNAS DE TABLA ? --
   SELECT TOP 100*
            FROM MOVIMIENTOS
            -- WHERE FOLIO = '11519'
            -- AND TIPO = 'COMPRA'
            WHERE TIPO = 'COMPRA'
            -- WHERE TIPO = 'TRASPASO_ENTRADA'
            -- AND MONTH(FECHA_HORA) ='02'
            AND YEAR(FECHA_HORA) ='2025'
            -- AND DAY(FECHA_HORA) ='18'
            AND ARTICULO = '759684315053'
            -- AND REFERENCIA = '1170'
            --  GROUP BY FOLIO
            
-- ? VER COLUMNAS ? --
    SELECT DISTINCT(TIPO)
        FROM MOVIMIENTOS
            WHERE TIPO = 'COMPRA'


    SELECT DISTINCT(FOLIO)
        FROM MOVIMIENTOS
            WHERE TIPO = 'COMPRA'
            ORDER BY FECHA_HORA DESC

END