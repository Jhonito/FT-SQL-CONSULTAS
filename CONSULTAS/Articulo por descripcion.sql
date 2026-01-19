--Procedimiento para chechar articulos en general basados en grupos o artiuclo
-- Ctrl + SHIFT+ E PARA EJECUTAR COMANDO
USE FT

-- ? VER COLUMNAS DE TABLA ? --

 --PRODUCTOS POR DESCRIPCION PARECIDA
    SELECT
        ARTICULO,
        DESCRIPCION,
        GRUPO,
        DEPTO,
        EXISTENCIA,
        PCIO_VTA,
        --IVA,
        --IEPS,
        DESCUENTO,
        VIGENCIA,
        CADUCIDAD,
        --FORMULA PAR CALCULAR PRECIO CON IMPUESTOS
        ROUND(PCIO_VTA*(1+IEPS/100+IEPS*IVA/10000+IVA/100),2) AS PRECIO_PUBLICO,
        --FORMULA PARA CALCULAR LOS DESCUENTOS E IMPUESTOS
        ROUND(([PCIO_VTA]-([PCIO_VTA]*IIF(
            VIGENCIA <= CONVERT(VARCHAR(10),GETDATE(),120) AND
            CADUCIDAD >= CONVERT(VARCHAR(10), GETDATE(),120),
            DESCUENTO,0
        )/100))*(1+[IEPS]/100+[IEPS]*[IVA]/10000+[IVA]/100),2) AS [PRECIO_CON_DESCUENTO]

         FROM [FT].[dbo].[ARTICULOS]
            
            -- WHERE GRUPO IN ('ALMA')
   

    


