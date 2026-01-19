USE FT
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
            WHERE TIPO IN ('SERVICIO')
            AND CONVERT(DATE, FECHA_HORA) = '2025-07-28'
            -- AND SUCURSAL = 'MariaVera'
            AND USUARIO = 'MirandaValencia'
            -- AND ARTICULO = 'TVCableTepa'
            -- AND ARTICULO = 'CFE000'
            ORDER BY FECHA_HORA DESC            