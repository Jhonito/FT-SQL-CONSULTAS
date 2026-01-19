---Cambiar tipo de movimiento en servicios---
UPDATE MOVIMIENTOS
SET TIPO = 'SERVICIO_CANCELADO'
WHERE FOLIO = '902342'

----verificar cuantos registros se veran afectados---
SELECT COUNT(*) AS Registros_Afectados
FROM MOVIMIENTOS
WHERE FOLIO = '902342';