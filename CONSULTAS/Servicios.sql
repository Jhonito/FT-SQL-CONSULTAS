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
    SELECT TOP 100 
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
            WHERE TIPO IN ('SERVICIO','SERVICIO_CANCELADO','SERVICIO_ERROR','SERVICIO_PENDIENTE' )
            ORDER BY FECHA_HORA DESC
    --         -- ? CONSULTA DE REGISTROS DE VENTAS ? --
    -- SELECT TOP 100 
    --         TIPO,
    --         -- FOLIO,
    --         -- REFERENCIA,
    --         YEAR (FECHA_HORA) AS [2022],
    --         -- SUCURSAL,
    --         -- USUARIO,
    --         ARTICULO,
    --         DESCRIPCION,
    --         -- PCIO_VTA,
    --         -- COMENTARIOS,
    --         SUM (CANTIDAD) AS [CANTIDAD PATITO]
    --     FROM MOVIMIENTOS
    --         WHERE TIPO IN ('VENTA')
    --         GROUP BY ARTICULO, TIPO, DESCRIPCION, YEAR(2022)
            
    --         ORDER BY [CANTIDAD PATITO] DESC
-- ? Corte ? --
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
            WHERE TIPO IN ('SERVICIO','SERVICIO_CANCELADO','SERVICIO_ERROR','SERVICIO_PENDIENTE' )
            AND CONVERT(DATE, FECHA_HORA) = '10/04/2023'
            AND USUARIO = 'Elizabeth'
            ORDER BY FECHA_HORA DESC            
-- ? CONSULTA DE REGISTROS DE SERVICIOS CON SERVICIO CANCELADO POR ULTIMO ? --
                 
-- ? CANCELACIONES DE SERVICIO ? --
    SELECT 
        CANCELADO.USUARIO,
        CANCELACION.[USUARIO CANCELACION],
        CANCELADO.FECHA_HORA
    FROM
        (
            SELECT
            USUARIO,
            FOLIO,
            FECHA_HORA
            FROM MOVIMIENTOS
            WHERE TIPO IN ('SERVICIO_CANCELADO')
        )CANCELADO
    LEFT JOIN
        (
            SELECT 
            USUARIO AS 'USUARIO CANCELACION',
            FOLIO
            FROM MOVIMIENTOS
            WHERE TIPO IN ('CANCELACION_SERVICIO')
        )CANCELACION
    ON CANCELADO.FOLIO = CANCELACION.FOLIO
    ORDER BY CANCELADO.FECHA_HORA DESC
-- ? CONSULTA DE SERVICIO POR FOLIO ? --
    SELECT * FROM
        (
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
            WHERE TIPO IN ('SERVICIO','SERVICIO_CANCELADO','SERVICIO_ERROR','SERVICIO_PENDIENTE' )
        )MOVIMIENTOS
    -- LEFT JOIN
    --     (
    --         SELECT 
    --         USUARIO AS 'USUARIO CANCELACION',
    --         FOLIO
    --         FROM MOVIMIENTOS
    --         -- WHERE TIPO IN ('CANCELACION_SERVICIO')
    --     )CANCELACION
    -- ON MOVIMIENTOS.FOLIO = CANCELACION.FOLIO
    WHERE MOVIMIENTOS.REFERENCIA = '014470403020392511050000002651'
    ORDER BY MOVIMIENTOS.FECHA_HORA DESC
    -- ? CONSULTA DE SERVICIO POR REFERENCIA ? --
    SELECT * FROM
        (
            SELECT*
                -- TIPO,
                -- REFERENCIA,
                -- FOLIO,
                -- FECHA_HORA,
                -- SUCURSAL,
                -- USUARIO,
                -- ARTICULO,
                -- DESCRIPCION,
                -- PCIO_VTA,
                -- COMENTARIOS
            FROM MOVIMIENTOS
            WHERE TIPO IN ('SERVICIO','SERVICIO_CANCELADO','SERVICIO_ERROR','SERVICIO_PENDIENTE' )
        )MOVIMIENTOS
    -- LEFT JOIN
    --     (
    --         SELECT 
    --         USUARIO AS 'USUARIO CANCELACION',
    --         FOLIO
    --         FROM MOVIMIENTOS
    --         WHERE TIPO IN ('CANCELACION_SERVICIO')
    --     )CANCELACION
    -- ON MOVIMIENTOS.FOLIO = CANCELACION.FOLIO
    -- WHERE MOVIMIENTOS.REFERENCIA LIKE '%447900103187%'
    WHERE MOVIMIENTOS.DESCRIPCION LIKE '%TV CABLE%'
    -- AND CONVERT(DATE, FECHA_HORA) = '10/04/2023'
    ORDER BY MOVIMIENTOS.FECHA_HORA DESC
        -- ? CONSULTA DE SERVICIO POR USUARIO ? --
    SELECT
                PATITO.TIPO,
                PATITO.REFERENCIA,
                PATITO.FOLIO,
                CANCELACION.FOLIO,
                PATITO.FECHA_HORA,
                PATITO.SUCURSAL,
                PATITO.USUARIO,
                CANCELACION.[USUARIO CANCELACION],
                PATITO.ARTICULO,
                PATITO.DESCRIPCION,
                PATITO.PCIO_VTA,
                PATITO.COMENTARIOS
    FROM
        (
            SELECT
                TIPO,
                REFERENCIA,
                FOLIO,
                FECHA_HORA,
                SUCURSAL,
                USUARIO,
                ARTICULO,
                DESCRIPCION,
                PCIO_VTA,
                COMENTARIOS
            FROM MOVIMIENTOS
            WHERE TIPO IN ('SERVICIO','SERVICIO_CANCELADO','SERVICIO_ERROR','SERVICIO_PENDIENTE' )
        )PATITO
    LEFT JOIN
        (
            SELECT 
            USUARIO AS 'USUARIO CANCELACION',
            FOLIO
            FROM MOVIMIENTOS
            WHERE TIPO IN ('CANCELACION_SERVICIO')
        )CANCELACION
    ON PATITO.FOLIO = CANCELACION.FOLIO
    WHERE PATITO.USUARIO = 'AMADOR'
    ORDER BY PATITO.FECHA_HORA DESC

END