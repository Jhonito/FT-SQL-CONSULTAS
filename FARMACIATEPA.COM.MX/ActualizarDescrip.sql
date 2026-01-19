--CONSULTA PARA DATOS--
SELECT TOP 20*
FROM [BITS].[dbo].[PRODUCTS]
WHERE SKU = '7506475115254'


--ACTUALIZAR NOMBRE DEL ARTICULO para fernanda si lo metemos en farmacia.com.mx no se cambia PRODUCTO POR PRODUCTO

--ACTUALIZAR EN FERNANDA --ATENCIÓN NOOOOOOO EN FARMACIATEPA.COM.MX--
--ASEGURAR EL UPDATE
  UPDATE [BITS].[dbo].[PRODUCTS]
  SET NAME = 'Chocolate en Polvo Choco Milk Lata 2kg'
  WHERE SKU = '7506205807770'


--ACTUALIZAR DESCRIPCION para fernanda si lo metemos en farmacia.com.mx no se cambia PRODUCTO POR PRODUCTO
--ASEGURAR EL UPDATE
  UPDATE [BITS].[dbo].[PRODUCTS]
  SET DESCRIPTION = ' Dale a tu ropa el trato que se merece con el Suavizante de telas Cuidado Superior fresco aroma de sol de Suavitel en presentación de 450ml. Suavitel Cuidado Superior protege la calidad de tus prendas más finas, procurando que el desgaste no se haga presente, incluso, evita la deformación, porque suaviza los hilos para darles la elasticidad que necesitan. Este suavizante de ropa neutraliza los malos olores, sorpréndete por su exquisita fragancia duradera.'
  WHERE SKU = '7509546017815'