USE FT
SELECT 
            TIPO,
            FOLIO,
            REFERENCIA,
            PUNTOS_PREMIO,
            EFECTIVO_PREMIO * CANTIDAD AS TOTALVENTA,
            CANTIDAD,
            FECHA_HORA,
            SUCURSAL,
            USUARIO,
            ARTICULO,
            DESCRIPCION,
            PCIO_VTA
        FROM MOVIMIENTOS
            WHERE TIPO IN ('CANJEO_PREMIO')
            AND CONVERT(DATE, FECHA_HORA) = '2024-12-20'
            AND SUCURSAL = 'MAPELO'
            -- AND USUARIO = 'KarlaVanesa'
            -- AND ARTICULO = 'CFE000'
            ORDER BY FECHA_HORA DESC
            -- GROUP BY TIPO,FOLIO,SUCURSAL,USUARIO