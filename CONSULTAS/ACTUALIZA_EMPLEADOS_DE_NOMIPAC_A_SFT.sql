USE [FT]
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZA_EMPLEADOS_DE_NOMIPAC_A_SFT]    Script Date: 4/15/2025 1:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER
 PROCEDURE [dbo].[ACTUALIZA_EMPLEADOS_DE_NOMIPAC_A_SFT]
AS
EXECUTE
	('
		UPDATE A
		SET 
			NOMBRE = B.nombre,
			APELLIDO1 = B.apellidopaterno,
			APELLIDO2 = B.apellidomaterno,
			GENERO = B.sexo,
			NACIMIENTO = B.fechanacimiento,
			E_CIVIL = B.estadocivil,
			EMAIL = B.CorreoElectronico,
			TELEFONO1 = B.telefono,
			CP = B.codigopostal,
			CALLE = B.direccion,
			CIUDAD = B.poblacion,
			ESTADO = B.estado,
			PAIS = ''MEXICO'',
			ESTADO_EMPLEADO = B.estadoempleado,
			--FECHA_ALTA = B.fechaalta, --18/02/2020 - 11:32:57 A. M.: SE OMITIO ESTE CAMPO DE LA ACTUALIZACION PARA
				--ADMINISTRARLO MANUALMENTE DESDE EL PORTAL, SOLO SE IMPORTARAN CUANDO SON NUEVOS EN EL PROCEDIMIENTO "INSERTA_NUEVOS_EMPLEADOS_DE_NOMIPAQ_A_SFT"
			FECHA_BAJA = B.fechabaja,
			FECHA_REINGRESO = B.fechareingreso
		FROM
			(
				SELECT * FROM [IDENTIDADES]
			)A
		JOIN
			(
				SELECT * FROM [10.10.0.7,7291\SQLEXPRESS].[ctFARM_TEPA_2020].[dbo].[nom10001]
				WHERE [codigoempleado] NOT IN (''0084'',''1646'') -- Excluir ID_RH ''0084'' DE JUAN CARLOS MENDOZA PORQUE CRISTY ESTABA CHINGANDO 07/01/2025 - 01:26:57 P. M Y ''1646'' DE ANTONIO CANSECO 15/04/2025 - 01:11:36
			)B
		ON A.ID_RH = B.[codigoempleado]
	')
