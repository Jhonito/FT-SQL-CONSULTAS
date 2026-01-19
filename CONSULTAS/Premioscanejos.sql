-- Ctrl + SHIFT+ E PARA EJECUTAR COMANDO
USE FT
IF(1=2)BEGIN
-- ? VER COLUMNAS DE TABLA ? --
    SELECT *
        FROM MOVIMIENTOS
            WHERE TIPO = 'COMPRA'
            ORDER BY FECHA_HORA DESC
-- ? PARA VER TODOS LOS TIPOS DE MOVMIENTOS DE LA TABLA -- ?
    SELECT 
        DISTINCT(TIPO)
            FROM MOVIMIENTOS            


-- ? CONSULTA DE REGISTROS DE SERVICIOS POR ULTIMO ? --
    SELECT 
            TIPO,
            FOLIO,
            REFERENCIA,
            FECHA_HORA,
            SUCURSAL,
            USUARIO,
            ARTICULO,
            DESCRIPCION,
            PCIO_VTA,
            COMENTARIOS
        FROM MOVIMIENTOS
            WHERE TIPO IN ('CANJEO_PREMIO')
            -- WHERE MOVIMIENTOS.USUARIO = 'TaniaCecilia'
            AND ARTICULO = '7506292616873'
            -- AND FOLIO = '729546'
            AND CONVERT(DATE, FECHA_HORA) = '12/17/2025'
            ORDER BY FECHA_HORA DESC
    