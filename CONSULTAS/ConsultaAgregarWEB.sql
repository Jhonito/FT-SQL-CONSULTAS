USE BITS
IF 1 = 2 BEGIN
--Cambiar Datos de artículo de los productos en FERNANDA--
	DECLARE @TABLE_PRODUCTS_UPDATE_INFO TABLE_PRODUCTS_UPDATE_INFO
	INSERT INTO @TABLE_PRODUCTS_UPDATE_INFO
	VALUES

	('7503012700065','Nebulizador de compresor Nebucor P-102 (1 pza) adulto/ infantil','NEBUCOR','Nebulizador de compresor, autolubricado, de alta potencia. No necesita mantenimiento. Más Compacto, llevalo contigo a donde sea, resistente y de gran durabilidad. Para niños y adultos. Recomendado por ASOCIACIÓN MEXICANA DE PEDIATRÍA, A.C. y la SOCIEDAD MEXICANA DE NEUMOLOGIA Y CIRUGÍA DE TÓRAX, A.C. Incluye accesorios: dos mascarillas (adulto e infantil), manguera  higiénica, ampolla nebulizadora, tres filtros de repuesto. Recomendable usarlo de 20 a 25 min promedio para realizar la nebulización.','Incluye accesorios: dos mascarillas (adulto e infantil), manguera, ampolla nebulizadora, tres filtros de repuesto. ','')



	--SELECT * FROM @TABLE_PRODUCTS_UPDATE_INFO

	EXEC [BITS].[DBO].[ADMIN_PROCEDURES]
		@REQUEST = 'PRODUCTS_UPDATE_INFO',
		@REPLACE_NAME = 1,
		@TABLE_PRODUCTS_UPDATE_INFO = @TABLE_PRODUCTS_UPDATE_INFO,
		@MARK_DELETED_PRODUCTS_NOT_SENDED = 0

	--SELECT 'PRODUCTS_UPDATE_INFO FINISHED' AS FINISH

	--EXEC sp_columns TABLE_PRODUCTS_UPDATE_INFO



	--DEFINICION DE COLUMNAS---
	--[SKU] [nvarchar](50) NULL,
	--	[NAME] [nvarchar](100) NULL,
	--	[BRAND] [nvarchar](50) NULL,
	--	[DESCRIPTION] [nvarchar](4000) NULL,
	--	[FEATURES] [nvarchar](4000) NULL,
	--	[NOTES] [nvarchar](4000) NULL

	
END
-----------------------------------------------------
IF 1 = 2 BEGIN
	--COMPROBACIÓN DE PRODUCTO--
	SELECT * FROM PRODUCTS
	WHERE SKU = '7503012700065'
END
-----------------------------------------------------
IF 1 = 2 BEGIN

--COMPROBACIÓN DE PRODUCTOS DADOS DE ALTA Y PRODUCTOS ELIMINADOS--

	SELECT ISNULL( STATUS,'ALTA'), COUNT(ISNULL (STATUS,'ALTA'))
	FROM PRODUCTS
	GROUP BY STATUS

END