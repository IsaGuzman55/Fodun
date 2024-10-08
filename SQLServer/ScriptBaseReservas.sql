USE [Reservas]
GO
/****** Object:  Table [dbo].[Alojamientos]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alojamientos](
	[AlojamientoId] [int] IDENTITY(1,1) NOT NULL,
	[SedeId] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Capacidad] [int] NOT NULL,
	[NumeroHabitaciones] [int] NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AlojamientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disponibles]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disponibles](
	[DisponibilidadId] [int] IDENTITY(1,1) NOT NULL,
	[AlojamientoId] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DisponibilidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[PagoId] [int] IDENTITY(1,1) NOT NULL,
	[ReservaId] [int] NOT NULL,
	[FechaPago] [date] NOT NULL,
	[MontoPagado] [decimal](10, 2) NOT NULL,
	[MetodoPago] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[ReservaId] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[AlojamientoId] [int] NOT NULL,
	[FechaReserva] [date] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaSalida] [date] NOT NULL,
	[NumeroPersonas] [int] NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[MontoTotal] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sedes]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sedes](
	[SedeId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Tipo] [varchar](50) NULL,
	[Ubicacion] [varchar](255) NULL,
	[CapacidadTotal] [int] NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Imagen] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SedeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarifas]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifas](
	[TarifaId] [int] IDENTITY(1,1) NOT NULL,
	[AlojamientoId] [int] NOT NULL,
	[Temporada] [varchar](100) NULL,
	[PrecioBase] [decimal](10, 2) NOT NULL,
	[MaxPersonas] [int] NOT NULL,
	[PrecioPersonaAdicional] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[TarifaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[Documento] [varchar](80) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Celular] [varchar](50) NULL,
	[Email] [varchar](255) NOT NULL,
	[Departamento] [varchar](255) NULL,
	[Municipio] [varchar](255) NULL,
	[Barrio] [varchar](100) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[PreguntaSecreta] [varchar](200) NOT NULL,
	[RespuestaSecreta] [varchar](200) NOT NULL,
	[Clave] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[sqlAlojamientos]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[sqlAlojamientos]
AS
SELECT        dbo.Alojamientos.Descripcion, dbo.Sedes.Imagen, dbo.Alojamientos.Nombre, dbo.Sedes.Tipo, dbo.Sedes.Ubicacion, dbo.Alojamientos.AlojamientoId, dbo.Alojamientos.SedeId, dbo.Alojamientos.Capacidad
FROM            dbo.Sedes INNER JOIN
                         dbo.Alojamientos ON dbo.Sedes.SedeId = dbo.Alojamientos.SedeId
GO
SET IDENTITY_INSERT [dbo].[Alojamientos] ON 

INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (1, 7, N'Habitación 1', 2, 1, N'Dos camas sencillas y baño privado.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (2, 7, N'Habitación 2', 2, 1, N'Dos camas sencillas.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (3, 7, N'Habitación 3', 2, 1, N'Dos camas sencillas.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (4, 7, N'Habitación 4', 2, 1, N'Dos camas sencillas.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (5, 7, N'Habitación 5', 1, 1, N'Una cama sencilla y baño privado.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (6, 8, N'Apartamento 202', 8, 3, N'Sala comedor, cocina, 2 baños, tres habitaciones y un sitio para parqueo.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (7, 8, N'Apartamento 301', 6, 2, N'Sala comedor, cocina, 1 baño, dos habitaciones y un sitio para parqueo.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (8, 8, N'Apartamento 401', 6, 2, N'Sala comedor, cocina, 1 baño, dos habitaciones y un sitio para parqueo.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (9, 1, N'Habitación 1', 4, 1, N'Cama doble y camarote, baño, nevera, televisor y terraza cubierta.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (10, 2, N'Alojamiento 1', 3, 2, N'Dos habitaciones, una con cama doble y una sencilla.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (11, 2, N'Alojamiento 2', 4, 2, N'Dos habitaciones, una con cama doble y cuatro camas sencillas.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (12, 2, N'Alojamiento 3', 3, 1, N'Una habitación con cama doble y dos camas sencillas.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (13, 2, N'Alojamiento 4', 3, 2, N'Dos habitaciones, una con cama doble y una sencilla.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (14, 2, N'Cabaña 5', 4, 1, N'Sala de estar con sofá cama, baño, habitación con cama doble y una cama sencilla.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (15, 2, N'Cabaña 6', 4, 1, N'Sala de estar con sofá cama, baño, habitación con cama doble y una cama sencilla.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (16, 2, N'Cabaña 7', 4, 1, N'Sala de estar con sofá cama, baño, habitación con cama doble y una cama sencilla.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (17, 2, N'Cabaña 8', 4, 1, N'Sala de estar con sofá cama, baño, habitación con cama doble y una cama sencilla.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (18, 3, N'Alojamiento 1', 4, 2, N'Dos habitaciones con cama doble y camas sencillas.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (19, 3, N'Alojamiento 2', 4, 2, N'Dos habitaciones con cama doble y camas sencillas.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (20, 3, N'Alojamiento 4', 3, 1, N'Una habitación con cama doble y una cama sencilla.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (21, 3, N'Alojamiento 3', 4, 2, N'Dos habitaciones, una con cama doble y dos camas sencillas.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (22, 3, N'Alojamiento 5', 3, 1, N'Una habitación con cama doble y una cama sencilla.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (23, 3, N'Alojamiento 6', 3, 1, N'Una habitación con cama doble y una cama sencilla.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (24, 4, N'Alojamiento 1', 3, 1, N'Una habitación con cama doble y un camarote.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (25, 4, N'Alojamiento 2', 3, 1, N'Una habitación con cama doble y un camarote.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (26, 4, N'Alojamiento 3', 4, 2, N'Dos habitaciones con cama doble y camarotes.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (27, 4, N'Alojamiento 4', 4, 2, N'Dos habitaciones con cama doble y camarotes.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (28, 5, N'Alojamiento 1', 3, 1, N'Una cama doble y un camarote.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (29, 5, N'Alojamiento 2', 4, 1, N'Una cama doble, un camarote y un sofá-cama.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (30, 5, N'Alojamiento 3', 4, 1, N'Una cama doble, un camarote y un sofá-cama.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (31, 5, N'Alojamiento Nuevo 1', 3, 1, N'Una habitación con dos camas gemelas y un camarote.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (32, 5, N'Alojamiento Nuevo 2', 3, 1, N'Una habitación con dos camas gemelas y un camarote.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (33, 5, N'Alojamiento Nuevo 3', 3, 1, N'Una habitación con dos camas gemelas y un camarote.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (34, 5, N'Alojamiento Nuevo 4', 3, 1, N'Una habitación con dos camas gemelas y un camarote.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (35, 5, N'Alojamiento Nuevo 5', 3, 1, N'Una habitación con dos camas gemelas y un camarote.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (36, 5, N'Alojamiento Nuevo 6', 3, 1, N'Una habitación con dos camas gemelas y un camarote.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (37, 5, N'Alojamiento Nuevo 7', 3, 1, N'Una habitación con dos camas gemelas y un camarote.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (38, 5, N'Alojamiento Nuevo 8', 3, 1, N'Una habitación con dos camas gemelas y un camarote.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (39, 6, N'Habitación 1', 2, 1, N'Una alcoba con servicios de baño turco, sauna, jacuzzi, etc.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (40, 6, N'Habitación 2', 2, 1, N'Una alcoba con servicios de baño turco, sauna, jacuzzi, etc.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (41, 6, N'Habitación 3', 2, 1, N'Una alcoba con servicios de baño turco, sauna, jacuzzi, etc.', N'Disponible')
INSERT [dbo].[Alojamientos] ([AlojamientoId], [SedeId], [Nombre], [Capacidad], [NumeroHabitaciones], [Descripcion], [Estado]) VALUES (42, 6, N'Habitación 4', 2, 1, N'Una alcoba con servicios de baño turco, sauna, jacuzzi, etc.', N'Disponible')
SET IDENTITY_INSERT [dbo].[Alojamientos] OFF
SET IDENTITY_INSERT [dbo].[Disponibles] ON 

INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (1, 1, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-10' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (2, 1, CAST(N'2024-02-01' AS Date), CAST(N'2024-02-28' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (3, 2, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-15' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (4, 3, CAST(N'2024-03-01' AS Date), CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (5, 4, CAST(N'2024-04-01' AS Date), CAST(N'2024-04-30' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (6, 5, CAST(N'2024-05-01' AS Date), CAST(N'2024-05-15' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (7, 6, CAST(N'2024-06-01' AS Date), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (8, 7, CAST(N'2024-07-01' AS Date), CAST(N'2024-07-15' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (9, 8, CAST(N'2024-08-01' AS Date), CAST(N'2024-08-31' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (10, 9, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-15' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (11, 10, CAST(N'2024-02-01' AS Date), CAST(N'2024-02-28' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (12, 11, CAST(N'2024-03-01' AS Date), CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (13, 12, CAST(N'2024-04-01' AS Date), CAST(N'2024-04-30' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (14, 13, CAST(N'2024-05-01' AS Date), CAST(N'2024-05-15' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (15, 14, CAST(N'2024-06-01' AS Date), CAST(N'2024-06-30' AS Date))
INSERT [dbo].[Disponibles] ([DisponibilidadId], [AlojamientoId], [FechaInicio], [FechaFin]) VALUES (16, 15, CAST(N'2024-07-01' AS Date), CAST(N'2024-07-15' AS Date))
SET IDENTITY_INSERT [dbo].[Disponibles] OFF
SET IDENTITY_INSERT [dbo].[Sedes] ON 

INSERT [dbo].[Sedes] ([SedeId], [Nombre], [Tipo], [Ubicacion], [CapacidadTotal], [Descripcion], [Imagen]) VALUES (1, N'Sede Recreativa Villeta', N'Sede Recreativa', N'Villeta', 32, N'Ocho habitaciones cada una con una alcoba que tiene una cama doble y un camarote, baño, nevera, televisor y terraza cubierta.', N'https://www.fodun.com.co/Files/sedes/villeta_1601.JPG')
INSERT [dbo].[Sedes] ([SedeId], [Nombre], [Tipo], [Ubicacion], [CapacidadTotal], [Descripcion], [Imagen]) VALUES (2, N'Sede Recreativa El Placer', N'Sede Recreativa', N'Fusagasugá', 4, N'Tiene dos habitaciones, baño y televisor, una con cama doble y una sencilla, la otra con una cama sencilla.', N'https://www.fodun.com.co/Files/sedes/villeta_0301.JPG')
INSERT [dbo].[Sedes] ([SedeId], [Nombre], [Tipo], [Ubicacion], [CapacidadTotal], [Descripcion], [Imagen]) VALUES (3, N'Sede Recreativa Chinchiná', N'Sede Recreativa', N'Gonzalo Morante', 30, N'Alojamientos y cabañas con capacidad hasta 30 personas.', N'https://www.fodun.com.co/Files/sedes/villeta_2101.JPG')
INSERT [dbo].[Sedes] ([SedeId], [Nombre], [Tipo], [Ubicacion], [CapacidadTotal], [Descripcion], [Imagen]) VALUES (4, N'Sede Recreativa Palmira', N'Sede Recreativa', N'Palmira', 24, N'Alojamientos con capacidad hasta 24 personas.', N'https://www.fodun.com.co/Files/sedes/miniatura/villeta_1701.JPG')
INSERT [dbo].[Sedes] ([SedeId], [Nombre], [Tipo], [Ubicacion], [CapacidadTotal], [Descripcion], [Imagen]) VALUES (5, N'Sede Recreativa Santa fe de Antioquia', N'Sede Recreativa', N'Santa fe de Antioquia', 46, N'Alojamientos y bloque nuevo con capacidad total de hasta 46 personas.', N'https://www.fodun.com.co/Files/sedes/miniatura/casa-principal-con-bbq.jpg')
INSERT [dbo].[Sedes] ([SedeId], [Nombre], [Tipo], [Ubicacion], [CapacidadTotal], [Descripcion], [Imagen]) VALUES (6, N'Sede Recreativa Bogotá', N'Sede Recreativa', N'Bogotá', 4, N'Habitaciones para alojamiento de los asociados.', N'https://www.fodun.com.co/Files/sedes/villeta_1901.JPG')
INSERT [dbo].[Sedes] ([SedeId], [Nombre], [Tipo], [Ubicacion], [CapacidadTotal], [Descripcion], [Imagen]) VALUES (7, N'Edificio Suramericana', N'Apartamento', N'Antioquia,', 46, N'Alojamientos y bloque nuevo con capacidad total de hasta 46 personas.', N'https://www.fodun.com.co/Files/sedes/miniatura/casa-principal-con-bbq.jpg')
INSERT [dbo].[Sedes] ([SedeId], [Nombre], [Tipo], [Ubicacion], [CapacidadTotal], [Descripcion], [Imagen]) VALUES (8, N'El Rodadero,', N'Santa Marta.', N'Bogotá', 4, N'Habitaciones para alojamiento de los asociados.', N'https://www.fodun.com.co/Files/sedes/villeta_1901.JPG')
SET IDENTITY_INSERT [dbo].[Sedes] OFF
SET IDENTITY_INSERT [dbo].[Tarifas] ON 

INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (1, 7, N'Todo el año', CAST(63000.00 AS Decimal(10, 2)), 1, NULL)
INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (2, 7, N'Todo el año', CAST(75000.00 AS Decimal(10, 2)), 2, NULL)
INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (3, 8, N'Baja', CAST(89000.00 AS Decimal(10, 2)), 6, NULL)
INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (4, 8, N'Baja', CAST(103000.00 AS Decimal(10, 2)), 8, NULL)
INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (5, 8, N'Alta', CAST(124000.00 AS Decimal(10, 2)), 6, NULL)
INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (6, 8, N'Alta', CAST(143000.00 AS Decimal(10, 2)), 8, NULL)
INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (7, 1, N'Todo el año', CAST(70000.00 AS Decimal(10, 2)), 4, CAST(16000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (8, 2, N'Todo el año', CAST(90000.00 AS Decimal(10, 2)), 4, CAST(16000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (9, 3, N'Todo el año', CAST(70000.00 AS Decimal(10, 2)), 4, CAST(16000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (10, 4, N'Todo el año', CAST(70000.00 AS Decimal(10, 2)), 4, CAST(16000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (11, 5, N'Todo el año', CAST(70000.00 AS Decimal(10, 2)), 4, CAST(16000.00 AS Decimal(10, 2)))
INSERT [dbo].[Tarifas] ([TarifaId], [AlojamientoId], [Temporada], [PrecioBase], [MaxPersonas], [PrecioPersonaAdicional]) VALUES (12, 6, N'Todo el año', CAST(70000.00 AS Decimal(10, 2)), 4, CAST(16000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Tarifas] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([UsuarioId], [Documento], [Nombre], [FechaNacimiento], [Celular], [Email], [Departamento], [Municipio], [Barrio], [Direccion], [Telefono], [PreguntaSecreta], [RespuestaSecreta], [Clave]) VALUES (1, N'123456789', N'Maria Perez', CAST(N'1990-05-15' AS Date), N'3001234567', N'maria.perez@example.com', N'Antioquia', N'Medellin', N'El Poblado', N'Calle 10 #12-34', N'6041234567', N'¿Nombre de tu primera mascota?', N'Firulais', N'hashed_password1')
INSERT [dbo].[Usuarios] ([UsuarioId], [Documento], [Nombre], [FechaNacimiento], [Celular], [Email], [Departamento], [Municipio], [Barrio], [Direccion], [Telefono], [PreguntaSecreta], [RespuestaSecreta], [Clave]) VALUES (2, N'987654321', N'Juan Gomez', CAST(N'1985-08-20' AS Date), N'3019876543', N'juan.gomez@example.com', N'Cundinamarca', N'Bogota', N'Chapinero', N'Carrera 15 #45-67', N'6019876543', N'¿Lugar de nacimiento?', N'Bogota', N'hashed_password2')
INSERT [dbo].[Usuarios] ([UsuarioId], [Documento], [Nombre], [FechaNacimiento], [Celular], [Email], [Departamento], [Municipio], [Barrio], [Direccion], [Telefono], [PreguntaSecreta], [RespuestaSecreta], [Clave]) VALUES (3, N'456789123', N'Luisa Martinez', CAST(N'1992-03-10' AS Date), N'3104567890', N'luisa.martinez@example.com', N'Valle del Cauca', N'Cali', N'San Fernando', N'Avenida 5 #6-78', N'6024567890', N'¿Nombre de tu escuela primaria?', N'San Jose', N'hashed_password3')
INSERT [dbo].[Usuarios] ([UsuarioId], [Documento], [Nombre], [FechaNacimiento], [Celular], [Email], [Departamento], [Municipio], [Barrio], [Direccion], [Telefono], [PreguntaSecreta], [RespuestaSecreta], [Clave]) VALUES (4, N'1013459127', N'Isabella Guzman', CAST(N'2006-06-29' AS Date), N'3064842607', N'isa@gmail.com', N'Antioquia', N'Medellin', N'fojpe', N'fefcerf', N'3186704356', N'¿Cuál es tu color favorito?', N'azul', N'12345')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
ALTER TABLE [dbo].[Alojamientos] ADD  DEFAULT ('Disponible') FOR [Estado]
GO
ALTER TABLE [dbo].[Alojamientos]  WITH CHECK ADD FOREIGN KEY([SedeId])
REFERENCES [dbo].[Sedes] ([SedeId])
GO
ALTER TABLE [dbo].[Disponibles]  WITH CHECK ADD FOREIGN KEY([AlojamientoId])
REFERENCES [dbo].[Alojamientos] ([AlojamientoId])
GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([ReservaId])
REFERENCES [dbo].[Reservas] ([ReservaId])
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD FOREIGN KEY([AlojamientoId])
REFERENCES [dbo].[Alojamientos] ([AlojamientoId])
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[Tarifas]  WITH CHECK ADD FOREIGN KEY([AlojamientoId])
REFERENCES [dbo].[Alojamientos] ([AlojamientoId])
GO
/****** Object:  StoredProcedure [dbo].[CalcularTarifa]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalcularTarifa]
    @AlojamientoId INT,
    @NumeroHabitaciones INT,
    @NumeroPersonas INT,
    @PersonaAdicional bit,
    @TipoAlojamientoId INT,
    @Temporada varchar(100),
    @Tarifa DECIMAL(10, 2) OUTPUT
AS
BEGIN
    -- Declarar variables para almacenar la tarifa base  
    DECLARE @TarifaBase DECIMAL(10, 2);
    DECLARE @MultiplicadorTemporada DECIMAL(10, 2);
    DECLARE @TarifaPorPersonaAdicional DECIMAL(10, 2);
    DECLARE @TarifaPorHabitacion DECIMAL(10, 2);

    -- Obtener la tarifa base por tipo de alojamiento,sitio y temporada
    SELECT @TarifaBase = t.PrecioBase
    FROM Tarifas t
    WHERE t.AlojamientoId = @AlojamientoId
    and t.Temporada = @Temporada;

    -- Validar si incluye valor adicional
      if @PersonaAdicional = 1
        BEGIN
        SELECT @TarifaPorPersonaAdicional = t.PrecioPersonaAdicional
        FROM Tarifas t
        WHERE t.AlojamientoId = @AlojamientoId
        and t.Temporada = @Temporada;
    END

    -- Calcular la tarifa por persona y por habitación
    SET @TarifaPorHabitacion = @TarifaBase;

    -- Calcular la tarifa total
    SET @Tarifa = (@TarifaBase + @TarifaPorPersonaAdicional + (@TarifaPorHabitacion * @NumeroHabitaciones));
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarTarifas]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscarTarifas]
    @Ubicacion VARCHAR(255),
    @Temporada VARCHAR(100),
    @NumeroPersonas INT,
    @AlojamientoId INT
AS
BEGIN
    SELECT A.TarifaId, A.PrecioBase, A.Temporada, AL.Capacidad, S.Ubicacion
    FROM Tarifas A
    JOIN Alojamientos AL ON A.AlojamientoId = AL.AlojamientoId
    JOIN Sedes S ON S.SedeId = AL.SedeId
    WHERE S.Ubicacion = @Ubicacion
      AND A.Temporada = @Temporada
      AND AL.Capacidad >= @NumeroPersonas
      AND A.AlojamientoId = @AlojamientoId;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_HabitacionesPorRangoFechas]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_HabitacionesPorRangoFechas]
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SELECT A.AlojamientoId
    FROM Alojamientos A
    JOIN Disponibles D ON A.AlojamientoId = D.AlojamientoId
    WHERE A.Estado = 'Disponible'
      AND D.FechaInicio <= @FechaFin
      AND D.FechaFin >= @FechaInicio;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_HabitacionesPorRangoFechasyPersonas]    Script Date: 16/09/2024 12:31:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_HabitacionesPorRangoFechasyPersonas]
    @FechaInicio DATE,
    @FechaFin DATE,
    @NumeroPersonas INT
AS
BEGIN
    SELECT A.AlojamientoId
    FROM Alojamientos A
    JOIN Disponibles D ON A.AlojamientoId = D.AlojamientoId
    WHERE A.Estado = 'Disponible'
      AND D.FechaInicio <= @FechaFin
      AND D.FechaFin >= @FechaInicio
      AND A.Capacidad >= @NumeroPersonas;
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Sedes"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Alojamientos"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 198
               Right = 501
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sqlAlojamientos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'sqlAlojamientos'
GO
