USE [GD2C2016]
GO

-- Validacion de existencia
IF SCHEMA_ID('JOINEANDO_ANDO') IS NOT NULL
BEGIN
	--TABLAS
	IF OBJECT_ID('JOINEANDO_ANDO.Cancelaciones') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Cancelaciones
	
	IF OBJECT_ID('JOINEANDO_ANDO.Habilitados') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Habilitados

	IF OBJECT_ID('JOINEANDO_ANDO.Medico_Especialidad') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Medico_Especialidad

	IF OBJECT_ID('JOINEANDO_ANDO.Rol_Funcionabilidad') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Rol_Funcionabilidad

	IF OBJECT_ID('JOINEANDO_ANDO.Usuario_Rol') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Usuario_Rol

	IF OBJECT_ID('JOINEANDO_ANDO.Rol') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Rol

	IF OBJECT_ID('JOINEANDO_ANDO.Compra_Bonos') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Compra_Bonos

	IF OBJECT_ID('JOINEANDO_ANDO.Funcionabilidades') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Funcionabilidades

	IF OBJECT_ID('JOINEANDO_ANDO.Resultados') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Resultados

	IF OBJECT_ID('JOINEANDO_ANDO.Consulta_Medica') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Consulta_Medica
	
	IF OBJECT_ID('JOINEANDO_ANDO.Bonos') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Bonos

	IF OBJECT_ID('JOINEANDO_ANDO.Turnos') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Turnos

	IF OBJECT_ID('JOINEANDO_ANDO.Agendas') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Agendas

	IF OBJECT_ID('JOINEANDO_ANDO.Especialidades') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Especialidades

	IF OBJECT_ID('JOINEANDO_ANDO.Medicos') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Medicos

	IF OBJECT_ID('JOINEANDO_ANDO.Hist_Cambios') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].[Hist_Cambios]

	IF OBJECT_ID('JOINEANDO_ANDO.Pacientes') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Pacientes

	IF OBJECT_ID('JOINEANDO_ANDO.Planes') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Planes
	
	IF OBJECT_ID('JOINEANDO_ANDO.Tipo_Especialidad') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Tipo_Especialidad

	IF OBJECT_ID('JOINEANDO_ANDO.Usuarios') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Usuarios	
	
	IF OBJECT_ID('JOINEANDO_ANDO.Tipo_Documento') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Tipo_Documento

	IF OBJECT_ID('JOINEANDO_ANDO.Sexo') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Sexo
 
	IF OBJECT_ID('JOINEANDO_ANDO.Dias_Semana') IS NOT NULL
	DROP TABLE [JOINEANDO_ANDO].Dias_Semana

--Stored Procedures
	
	IF OBJECT_ID('JOINEANDO_ANDO.validar_usuario') IS NOT NULL
	DROP PROCEDURE JOINEANDO_ANDO.validar_usuario

	IF OBJECT_ID('JOINEANDO_ANDO.UsuariosPorId_seleccion') IS NOT NULL
	DROP PROCEDURE JOINEANDO_ANDO.UsuariosPorId_seleccion

	IF OBJECT_ID('JOINEANDO_ANDO.listarRoles') IS NOT NULL
	DROP PROCEDURE JOINEANDO_ANDO.listarRoles

	IF OBJECT_ID('JOINEANDO_ANDO.Seleccionar_rol') IS NOT NULL
	DROP PROCEDURE JOINEANDO_ANDO.Seleccionar_rol

	IF OBJECT_ID('JOINEANDO_ANDO.Seleccionar_Funcionabilidades_x_Rol') IS NOT NULL
	DROP PROCEDURE JOINEANDO_ANDO.Seleccionar_Funcionabilidades_x_Rol

	IF OBJECT_ID('JOINEANDO_ANDO.Seleccionar_Funcionabilidades') IS NOT NULL
	DROP PROCEDURE JOINEANDO_ANDO.Seleccionar_Funcionabilidades

--Funciones
	IF OBJECT_ID('JOINEANDO_ANDO.Existe_Usuario') IS NOT NULL
	DROP FUNCTION JOINEANDO_ANDO.Existe_Usuario

	IF OBJECT_ID('JOINEANDO_ANDO.Cantidad_Intentos_Fallidos') IS NOT NULL
	DROP FUNCTION JOINEANDO_ANDO.Cantidad_Intentos_Fallidos



--Esquema

	IF SCHEMA_ID('JOINEANDO_ANDO') IS NOT NULL
	DROP SCHEMA [JOINEANDO_ANDO]

END
GO

--Creacion de Esquema
CREATE SCHEMA [JOINEANDO_ANDO] AUTHORIZATION [gd]

GO

--Creacion de Tablas
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JOINEANDO_ANDO].[Agendas](
	[Agenda_id] [int] IDENTITY(1,1) NOT NULL,
	[Inicio_Horario] [time](7) NOT NULL,
	[Fin_Horario] [time](7) NOT NULL,
	[Dia_Semana_id] [int] NOT NULL,
	[Medico_id] [int] NOT NULL,
	[Especialidad_id] [int] NOT NULL
	)
GO

CREATE TABLE [JOINEANDO_ANDO].[Bonos](
	[Bono_id] [int]  NOT NULL,
	[Plan_id] [int] NOT NULL,
	[Numero_Consulta_Medica] [int] NOT NULL,
	[Numero_Raiz] [int] NOT NULL,
	[Numero_Familia] [int] NULL,
)
GO

CREATE TABLE [JOINEANDO_ANDO].[Cancelaciones](
	[Turno_id] [int] NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL
) 
GO

CREATE TABLE [JOINEANDO_ANDO].[Compra_Bonos](
	[Compra_id] [int] IDENTITY(1,1) NOT NULL,
	[Plan_id] [int] NOT NULL,
	[Monto] [numeric](18, 2) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha_Compra] [datetime] NOT NULL
	)
GO

CREATE TABLE [JOINEANDO_ANDO].[Consulta_Medica](
	[Consulta_Medica_id] [int] IDENTITY(1,1) NOT NULL,
	[Turno_id] [int] NOT NULL,
	[Bono_id] [int] NOT NULL,
	[Horario_Llegada] [datetime] NULL,
	[Horario_Atencion] [datetime] NULL
	)
GO

CREATE TABLE [JOINEANDO_ANDO].[Especialidades](
	[Especialidad_id] [int]  NOT NULL,
	[Nombre_Especialidad] [nvarchar](255) NOT NULL,
	[Tipo_Especialidad_id] [int] NULL
	)
GO

CREATE TABLE [JOINEANDO_ANDO].[Funcionabilidades](
	[Funcionabilidad_id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL
	)
GO

CREATE TABLE [JOINEANDO_ANDO].[Habilitados](
	[Paciente_id] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[Fecha_Alta] [datetime] NULL,
	[Fecha_Baja] [datetime] NULL
) 
GO

CREATE TABLE [JOINEANDO_ANDO].[Medico_Especialidad](
	[Medico_id] [int] NOT NULL,
	[Especialidad_id] [int] NOT NULL
) 
GO

CREATE TABLE [JOINEANDO_ANDO].[Medicos](
	[Medico_id] [int] NOT NULL,
	[Matricula] [int] ,
	)
GO

CREATE TABLE [JOINEANDO_ANDO].[Pacientes](
	[Paciente_id] [int] NOT NULL,
	[Estado_Civil] [nvarchar](255) ,
	[Familiares_A_Cargo] [int] NOT NULL,
	[Numero_Raiz] [int] NOT NULL,
	[Numero_Familia] [int] NOT NULL,
	[Plan_id] [int] NOT NULL
	)
GO

CREATE TABLE [JOINEANDO_ANDO].[Planes](
	[Plan_id] [int]  NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
	[Precio_Bono_Consulta] [numeric](18, 0) NOT NULL,
	[Precio_Bono_Farmacia] [numeric] (18,0) NOT NULL
	) 
GO

CREATE TABLE [JOINEANDO_ANDO].[Resultados](
	[Resultado_id] [int] IDENTITY(1,1) NOT NULL,
	[Consulta_Medica_id] [int] NOT NULL,
	[Descripcion] [nvarchar](255) NOT NULL
	)
GO

CREATE TABLE [JOINEANDO_ANDO].[Rol](
	[Rol_id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Habilitado] [bit] NOT NULL
	) 
GO

CREATE TABLE [JOINEANDO_ANDO].[Rol_Funcionabilidad](
	[Rol_id] [int] NOT NULL,
	[Funcionabilidad_id] [int] NOT NULL
) 
GO

CREATE TABLE [JOINEANDO_ANDO].[Tipo_Documento](
	[Tipo_Documento_id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](255) NOT NULL
	)
GO

CREATE TABLE [JOINEANDO_ANDO].[Tipo_Especialidad](
	[Tipo_Especialidad_id] [int]  NOT NULL,
	[Especializacion] [nvarchar](255) NOT NULL
	)
GO

CREATE TABLE [JOINEANDO_ANDO].[Turnos](
	[Paciente_id] [int] NOT NULL,
	[Agenda_id] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Horario] [time](7) NOT NULL,
	[Turno_id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo_Cancelacion] [int] NOT NULL,
	[Asistencia] [bit] NOT NULL
	) 
GO

CREATE TABLE [JOINEANDO_ANDO].[Usuario_Rol](
	[Usuario_id] [int] NOT NULL,
	[Rol_id] [int] NOT NULL
) 
GO

CREATE TABLE [JOINEANDO_ANDO].[Usuarios](
	[Usuario_id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
	[Apellido] [nvarchar](255) NOT NULL,
	[Numero_Documento] [numeric](18, 0) NOT NULL,
	[Tipo_Documento_id] [int] NOT NULL,
	[Direccion] [nvarchar](255) NOT NULL,
	[Telefono] [numeric](18, 0) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[Fecha_Nacimiento] [datetime] NOT NULL,
	[Sexo_id] [int],
	[Nombre_Usuario] [nvarchar](255) NOT NULL,
	[Contrasena] [nvarchar](255) NOT NULL,
	[Habilitado] [bit] NOT NULL,
	[Intentos_Fallidos] [Int] NOT NULL
	)
GO

CREATE TABLE [JOINEANDO_ANDO].[Sexo](
[Sexo_id] [int] IDENTITY(1,1) NOT NULL,
[Descripcion] [nvarchar](20) NOT NULL
)
GO

CREATE TABLE [JOINEANDO_ANDO].[Dias_Semana](
[Dia_Semana_id] [int] IDENTITY(1,1) NOT NULL,
[Dia] [nvarchar](20) NOT NULL
)
GO

CREATE TABLE [JOINEANDO_ANDO].[Hist_Cambios](
[Paciente_id][int] NOT NULL,
[Descripcion] [nvarchar](255) NOT NULL,
[Fecha_mod][datetime]
)
GO

--Funciones

CREATE FUNCTION JOINEANDO_ANDO.Existe_Usuario (@Usuario nvarchar(255))
returns int
AS
begin
return (select count(Nombre_Usuario) from JOINEANDO_ANDO.Usuarios where Nombre_Usuario = @Usuario)
end
GO

CREATE FUNCTION JOINEANDO_ANDO.Cantidad_Intentos_Fallidos (@UnUsuario nvarchar(255))
returns int
AS
begin
return (select Intentos_Fallidos from JOINEANDO_ANDO.Usuarios where Nombre_Usuario = @UnUsuario)
end
GO

-- Stored Procedure
CREATE PROCEDURE JOINEANDO_ANDO.validar_usuario
@UserId nvarchar(50),
@Pas nvarchar(50)

AS
BEGIN

IF Exists (Select 1 from JOINEANDO_ANDO.Usuarios where Nombre_Usuario = @UserId and [contrasena] = @Pas and Habilitado = 1)
	BEGIN
		select 'Ingreso OK' resultado, Usuario_id from JOINEANDO_ANDO.Usuarios where Nombre_Usuario = @UserId
	END
ELSE
	BEGIN
		IF Exists(Select 1 from JOINEANDO_ANDO.Usuarios Where Nombre_Usuario = @UserID)
			Begin
				if( (Select Intentos_Fallidos from JOINEANDO_ANDO.Usuarios Where Nombre_Usuario = @UserID) < 3 )
					Begin
						update JOINEANDO_ANDO.Usuarios set Intentos_Fallidos = Intentos_Fallidos + 1 Where Nombre_Usuario = @UserID
						select 'usuario o password invalido' resultado, null rol
					End
				else
					Begin
						update JOINEANDO_ANDO.Usuarios set Habilitado = 0 Where Nombre_Usuario = @UserID
						select 'el usuario se encuentra bloqueado', null
					End
			End
		ELSE
			Begin
						select 'usuario o password invalido' resultado, null rol
				
			End
	end
End
GO

CREATE PROCEDURE JOINEANDO_ANDO.UsuariosPorId_seleccion
	@UsuarioId int
AS
BEGIN
	SELECT
	[Usuario_id] 
	,[Nombre]
	,[Apellido] 
	,[Numero_Documento] 
	,[Tipo_Documento_id] 
	,[Direccion] 
	,[Telefono] 
	,[Mail] 
	,[Fecha_Nacimiento] 
	,[Sexo_id] 
	,[Nombre_Usuario] 
	,[Contrasena]
	,[Habilitado] 
	,[Intentos_Fallidos] 
	FROM [JOINEANDO_ANDO].[Usuarios]
	WHERE [Usuario_id] = @UsuarioId
END
GO

CREATE Procedure JOINEANDO_ANDO.listarRoles
As
Begin
	SELECT 
	   [Rol_id]
      ,[Nombre]
	  ,[habilitado]

  FROM [JOINEANDO_ANDO].[Rol]
End
GO

CREATE procedure JOINEANDO_ANDO.Seleccionar_rol
@id int
As
	Begin
		Select * From [JOINEANDO_ANDO].[Rol] where Rol_id = @id
	End
GO

CREATE procedure JOINEANDO_ANDO.Seleccionar_Funcionabilidades_x_Rol
@id int
As
	Begin
		Select * From [JOINEANDO_ANDO].[Rol_Funcionabilidad] where Rol_id = @id
	End
GO
CREATE procedure JOINEANDO_ANDO.Seleccionar_Funcionabilidades
As
Begin
	Select * From [JOINEANDO_ANDO].[Funcionabilidades]
End
GO


--Migracion de Datos

INSERT INTO [JOINEANDO_ANDO].Funcionabilidades
Select 'Crear'
Union all
Select 'Modificar'
Union all
Select 'Eliminar'
GO

INSERT INTO [JOINEANDO_ANDO].Rol
Select 'Afiliado',1
Union all
Select 'Administrativo',1
Union all
Select 'Profesional',1
GO

INSERT INTO [JOINEANDO_ANDO].Sexo
Select 'Masculino'
Union all
Select 'Femenino'
GO

INSERT INTO [JOINEANDO_ANDO].Dias_Semana
Select 'Lunes'
Union all
Select 'Martes'
Union all
Select 'Miercoles'
Union all
Select 'Jueves'
Union all
Select 'Viernes'
Union all
Select 'Sabado'
Union all
Select 'Domingo'
GO

INSERT INTO [JOINEANDO_ANDO].Tipo_Documento
Select 'DNI'
Union all
Select 'Libreta Civica'
Union all
Select 'Pasaporte'
Union all
Select 'Otro'
GO


INSERT INTO [JOINEANDO_ANDO].Tipo_Especialidad
SELECT DISTINCT 
	[Tipo_Especialidad_Codigo]
	,[Tipo_Especialidad_Descripcion]
FROM [gd_esquema].Maestra
WHERE Tipo_Especialidad_Codigo IS NOT NULL

GO

INSERT INTO [JOINEANDO_ANDO].Especialidades
SELECT DISTINCT
	[Especialidad_Codigo]
	,[Especialidad_Descripcion]
	,[Tipo_Especialidad_Codigo]
FROM [gd_esquema].Maestra
WHERE Especialidad_Codigo IS NOT NULL
GO

INSERT INTO [JOINEANDO_ANDO].Planes
SELECT DISTINCT
	[Plan_Med_Codigo]
	,[Plan_Med_Descripcion]
	,[Plan_Med_Precio_Bono_Consulta]
	,[Plan_Med_Precio_Bono_Farmacia]

FROM [gd_esquema].Maestra
WHERE Plan_Med_Codigo IS NOT NULL
GO

--Medicos
INSERT INTO [JOINEANDO_ANDO].Usuarios
SELECT DISTINCT
	[medico_nombre]
	,[medico_apellido]
	,[Medico_Dni]
	,1
	,[Medico_Direccion]
	,[Medico_Telefono]
	,[Medico_Mail]
	,[Medico_Fecha_Nac]
	,NULL
	,[Medico_Nombre]+'.'+[Medico_Apellido]
	,'123456'
	,1
	,0

	FROM [gd_esquema].Maestra
	WHERE MEDICO_NOMBRE IS NOT NULL
GO


INSERT INTO [JOINEANDO_ANDO].Medicos
SELECT DISTINCT
	U.Usuario_id
	,555
FROM  JOINEANDO_ANDO.Usuarios as U Inner Join gd_esquema.Maestra as M
ON (U.nombre = M.Medico_Nombre) and (u.Apellido = M.Medico_Apellido)
GO

INSERT INTO [JOINEANDO_ANDO].Medico_Especialidad
SELECT DISTINCT
	u.Usuario_id
	,E.Especialidad_id

	FROM [JOINEANDO_ANDO].Especialidades AS E, [JOINEANDO_ANDO].Usuarios as U INNER JOIN [gd_esquema].Maestra as M
	ON ( u.NOMBRE = m.Medico_Nombre) AND (U.Apellido = m.Medico_Apellido) 
	WHERE (E.Especialidad_id = M.Especialidad_Codigo)
GO

-- Pacientes
INSERT INTO [JOINEANDO_ANDO].Usuarios
SELECT DISTINCT
	[Paciente_Nombre]
	,[Paciente_Apellido]
	,[Paciente_Dni]
	,1
	,[Paciente_Direccion]
	,[Paciente_Telefono]
	,[Paciente_Mail]
	,[Paciente_Fecha_Nac]
	,NULL
	,[Paciente_Nombre]+'.'+[Paciente_Apellido]
	,'123456'
	,1
	,0

	FROM [gd_esquema].Maestra
	WHERE Paciente_Nombre IS NOT NULL
GO

INSERT INTO [JOINEANDO_ANDO].Pacientes
SELECT DISTINCT
	U.Usuario_id
	,NULL
	,0
	,0
	,0
	,M.Plan_Med_Codigo

FROM  (JOINEANDO_ANDO.Usuarios AS U INNER JOIN gd_esquema.Maestra as M
ON (U.Nombre = M.Paciente_Nombre)  and (U.apellido = M.Paciente_Apellido) and (U.Numero_Documento = M.Paciente_Dni))
go

INSERT INTO [JOINEANDO_ANDO].Hist_Cambios
SELECT DISTINCT
	Paciente_id
	,'Migracion de usuario'
	,getDate()
	
FROM JOINEANDO_ANDO.Pacientes 
Go

--CompraBonos

INSERT INTO [JOINEANDO_ANDO].Compra_Bonos
SELECT DISTINCT
	P.Plan_id,
	P.Precio_Bono_Consulta,
	1,
	M.Compra_Bono_Fecha
	
FROM gd_esquema.Maestra AS M INNER JOIN JOINEANDO_ANDO.Planes AS P 
ON M.Plan_Med_Codigo = P.Plan_id
WHERE M.Compra_Bono_Fecha IS NOT NULL
GO

INSERT INTO [JOINEANDO_ANDO].Bonos
SELECT DISTINCT
	M.Bono_Consulta_Numero,
	P.Plan_id,
	0, --Numero consulta medica, maestra tenemos turno_numero
	0, --numero raiz
	0 --numero familia
FROM gd_esquema.Maestra AS M INNER JOIN JOINEANDO_ANDO.Planes AS P
ON P.Plan_id = M.Plan_Med_Codigo
WHERE M.Bono_Consulta_Numero IS NOT NULL
GO

-- Constraints
ALTER TABLE [JOINEANDO_ANDO].[Agendas] ADD CONSTRAINT 
[PK_Agendas] PRIMARY KEY CLUSTERED 
(
	[Agenda_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
 
GO

ALTER TABLE [JOINEANDO_ANDO].[Bonos] ADD CONSTRAINT
[PK_Bonos] PRIMARY KEY CLUSTERED 
(
	[Bono_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO

ALTER TABLE [JOINEANDO_ANDO].[Compra_Bonos] ADD CONSTRAINT
[PK_Compra_Bonos] PRIMARY KEY CLUSTERED 
(
	[Compra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO

ALTER TABLE [JOINEANDO_ANDO].[Consulta_Medica] ADD CONSTRAINT
[PK_Consulta_Medica] PRIMARY KEY CLUSTERED 
(
	[Consulta_Medica_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [JOINEANDO_ANDO].[Especialidades] ADD CONSTRAINT
[PK_Especialidades] PRIMARY KEY CLUSTERED 
(
	[Especialidad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE [JOINEANDO_ANDO].[Funcionabilidades] ADD CONSTRAINT
[PK_Funcionabilidades] PRIMARY KEY CLUSTERED 
(
	[Funcionabilidad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE [JOINEANDO_ANDO].[Medicos] ADD CONSTRAINT
[PK_Medicos] PRIMARY KEY CLUSTERED 
(
	[Medico_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO



ALTER TABLE [JOINEANDO_ANDO].[Pacientes] ADD CONSTRAINT
[PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[Paciente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO


ALTER TABLE [JOINEANDO_ANDO].[Planes] ADD CONSTRAINT

[PK_Planes] PRIMARY KEY CLUSTERED 
(
	[Plan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO

ALTER TABLE [JOINEANDO_ANDO].[Resultados] ADD CONSTRAINT
[PK_Resultados] PRIMARY KEY CLUSTERED 
(
	[Resultado_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE [JOINEANDO_ANDO].[Rol] ADD CONSTRAINT
[PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Rol_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO

ALTER TABLE [JOINEANDO_ANDO].[Tipo_Documento] ADD CONSTRAINT
[PK_Tipo_Documento_id] PRIMARY KEY CLUSTERED 
(
	[Tipo_Documento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE [JOINEANDO_ANDO].[Tipo_Especialidad] ADD CONSTRAINT
[PK_Tipo_Especialidad] PRIMARY KEY CLUSTERED 
(
	[Tipo_Especialidad_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO

ALTER TABLE [JOINEANDO_ANDO].[Turnos] ADD CONSTRAINT
[PK_Turnos] PRIMARY KEY CLUSTERED 
(
	[Turno_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO

ALTER TABLE [JOINEANDO_ANDO].[Usuarios] ADD CONSTRAINT
[PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Usuario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO

ALTER TABLE [JOINEANDO_ANDO].[Sexo] ADD CONSTRAINT
[Sexo_id] PRIMARY KEY CLUSTERED 
(
	[Sexo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO

ALTER TABLE [JOINEANDO_ANDO].[Dias_Semana] ADD CONSTRAINT
[Dia_Semana_id] PRIMARY KEY CLUSTERED 
(
	[Dia_Semana_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


GO

ALTER TABLE [JOINEANDO_ANDO].[Hist_Cambios] ADD CONSTRAINT
[paciente_id] PRIMARY KEY CLUSTERED
(
	[Paciente_id] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- FK

ALTER TABLE [JOINEANDO_ANDO].[Agendas]  WITH CHECK ADD  CONSTRAINT [FK_Agendas_Especialidades] FOREIGN KEY([Especialidad_id])
REFERENCES [JOINEANDO_ANDO].[Especialidades] ([Especialidad_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Agendas] WITH CHECK ADD CONSTRAINT [FK_Dia_Semana] FOREIGN KEY([Dia_Semana_id])
REFERENCES [JOINEANDO_ANDO].[Dias_Semana] ([Dia_Semana_id])
GO

ALTER TABLE [JOINEANDO_ANDO].[Agendas] CHECK CONSTRAINT [FK_Agendas_Especialidades]
GO
ALTER TABLE [JOINEANDO_ANDO].[Agendas]  WITH CHECK ADD  CONSTRAINT [FK_Agendas_Medicos] FOREIGN KEY([Medico_id])
REFERENCES [JOINEANDO_ANDO].[Medicos] ([Medico_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Agendas] CHECK CONSTRAINT [FK_Agendas_Medicos]
GO
ALTER TABLE [JOINEANDO_ANDO].[Bonos]  WITH CHECK ADD  CONSTRAINT [FK_Bonos_Planes] FOREIGN KEY([Plan_id])
REFERENCES [JOINEANDO_ANDO].[Planes] ([Plan_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Bonos] CHECK CONSTRAINT [FK_Bonos_Planes]
GO
ALTER TABLE [JOINEANDO_ANDO].[Cancelaciones]  WITH CHECK ADD  CONSTRAINT [FK_Cancelaciones_Turnos] FOREIGN KEY([Turno_id])
REFERENCES [JOINEANDO_ANDO].[Turnos] ([Turno_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Cancelaciones] CHECK CONSTRAINT [FK_Cancelaciones_Turnos]
GO
ALTER TABLE [JOINEANDO_ANDO].[Consulta_Medica]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Medica_Bonos] FOREIGN KEY([Bono_id])
REFERENCES [JOINEANDO_ANDO].[Bonos] ([Bono_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Consulta_Medica] CHECK CONSTRAINT [FK_Consulta_Medica_Bonos]
GO
ALTER TABLE [JOINEANDO_ANDO].[Consulta_Medica]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Medica_Turnos] FOREIGN KEY([Turno_id])
REFERENCES [JOINEANDO_ANDO].[Turnos] ([Turno_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Consulta_Medica] CHECK CONSTRAINT [FK_Consulta_Medica_Turnos]
GO
ALTER TABLE [JOINEANDO_ANDO].[Especialidades]  WITH CHECK ADD  CONSTRAINT [FK_Especialidades_Tipo_Especialidad] FOREIGN KEY([Tipo_Especialidad_id])
REFERENCES [JOINEANDO_ANDO].[Tipo_Especialidad] ([Tipo_Especialidad_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Especialidades] CHECK CONSTRAINT [FK_Especialidades_Tipo_Especialidad]
GO
ALTER TABLE [JOINEANDO_ANDO].[Habilitados]  WITH CHECK ADD  CONSTRAINT [FK_Habilitados_Pacientes] FOREIGN KEY([Paciente_id])
REFERENCES [JOINEANDO_ANDO].[Pacientes] ([Paciente_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Habilitados] CHECK CONSTRAINT [FK_Habilitados_Pacientes]
GO
ALTER TABLE [JOINEANDO_ANDO].[Medico_Especialidad]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Especialidad_Especialidades] FOREIGN KEY([Especialidad_id])
REFERENCES [JOINEANDO_ANDO].[Especialidades] ([Especialidad_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Medico_Especialidad] CHECK CONSTRAINT [FK_Medico_Especialidad_Especialidades]
GO
ALTER TABLE [JOINEANDO_ANDO].[Medico_Especialidad]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Especialidad_Medicos] FOREIGN KEY([Medico_id])
REFERENCES [JOINEANDO_ANDO].[Medicos] ([Medico_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Medico_Especialidad] CHECK CONSTRAINT [FK_Medico_Especialidad_Medicos]
GO
ALTER TABLE [JOINEANDO_ANDO].[Medicos]  WITH CHECK ADD  CONSTRAINT [FK_Medicos_Usuarios] FOREIGN KEY([Medico_id])
REFERENCES [JOINEANDO_ANDO].[Usuarios] ([Usuario_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Medicos] CHECK CONSTRAINT [FK_Medicos_Usuarios]
GO
ALTER TABLE [JOINEANDO_ANDO].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Planes] FOREIGN KEY([Plan_id])
REFERENCES [JOINEANDO_ANDO].[Planes] ([Plan_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Pacientes] CHECK CONSTRAINT [FK_Pacientes_Planes]
GO
ALTER TABLE [JOINEANDO_ANDO].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Usuarios] FOREIGN KEY([Paciente_id])
REFERENCES [JOINEANDO_ANDO].[Usuarios] ([Usuario_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Pacientes] CHECK CONSTRAINT [FK_Pacientes_Usuarios]
GO
ALTER TABLE [JOINEANDO_ANDO].[Resultados]  WITH CHECK ADD  CONSTRAINT [FK_Resultados_Consulta_Medica] FOREIGN KEY([Consulta_Medica_id])
REFERENCES [JOINEANDO_ANDO].[Consulta_Medica] ([Consulta_Medica_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Resultados] CHECK CONSTRAINT [FK_Resultados_Consulta_Medica]
GO
ALTER TABLE [JOINEANDO_ANDO].[Rol_Funcionabilidad]  WITH CHECK ADD  CONSTRAINT [FK_Rol_Funcionabilidad_Funcionabilidades] FOREIGN KEY([Funcionabilidad_id])
REFERENCES [JOINEANDO_ANDO].[Funcionabilidades] ([Funcionabilidad_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Rol_Funcionabilidad] CHECK CONSTRAINT [FK_Rol_Funcionabilidad_Funcionabilidades]
GO
ALTER TABLE [JOINEANDO_ANDO].[Rol_Funcionabilidad]  WITH CHECK ADD  CONSTRAINT [FK_Rol_Funcionabilidad_Rol] FOREIGN KEY([Rol_id])
REFERENCES [JOINEANDO_ANDO].[Rol] ([Rol_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Rol_Funcionabilidad] CHECK CONSTRAINT [FK_Rol_Funcionabilidad_Rol]
GO
ALTER TABLE [JOINEANDO_ANDO].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Agendas] FOREIGN KEY([Agenda_id])
REFERENCES [JOINEANDO_ANDO].[Agendas] ([Agenda_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Turnos] CHECK CONSTRAINT [FK_Turnos_Agendas]
GO
ALTER TABLE [JOINEANDO_ANDO].[Turnos]  WITH CHECK ADD  CONSTRAINT [FK_Turnos_Pacientes] FOREIGN KEY([Paciente_id])
REFERENCES [JOINEANDO_ANDO].[Pacientes] ([Paciente_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Turnos] CHECK CONSTRAINT [FK_Turnos_Pacientes]
GO
ALTER TABLE [JOINEANDO_ANDO].[Usuario_Rol]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol_Rol] FOREIGN KEY([Rol_id])
REFERENCES [JOINEANDO_ANDO].[Rol] ([Rol_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Usuario_Rol] CHECK CONSTRAINT [FK_Usuario_Rol_Rol]
GO
ALTER TABLE [JOINEANDO_ANDO].[Usuario_Rol]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol_Usuarios] FOREIGN KEY([Usuario_id])
REFERENCES [JOINEANDO_ANDO].[Usuarios] ([Usuario_id])
GO
ALTER TABLE [JOINEANDO_ANDO].[Usuario_Rol] CHECK CONSTRAINT [FK_Usuario_Rol_Usuarios]
GO
ALTER TABLE [JOINEANDO_ANDO].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Tipo_Documento] FOREIGN KEY([Tipo_Documento_id])
REFERENCES [JOINEANDO_ANDO].[Tipo_Documento] ([Tipo_Documento_id])
GO

ALTER TABLE [JOINEANDO_ANDO].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Tipo_Documento]
GO

ALTER TABLE [JOINEANDO_ANDO].[Usuarios] WITH CHECK ADD CONSTRAINT [FK_Usuarios_Sexo] FOREIGN KEY([Sexo_id]) 
REFERENCES [JOINEANDO_ANDO].[Sexo] ([Sexo_id])
GO

ALTER TABLE [JOINEANDO_ANDO].[Hist_Cambios] WITH CHECK ADD CONSTRAINT [FK_Paciente_id] FOREIGN KEY([Paciente_id])
REFERENCES [JOINEANDO_ANDO].[Pacientes] ([Paciente_id])
GO









