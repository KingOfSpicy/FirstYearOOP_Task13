SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Reception](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DentistId] [int] NULL,
	[PatientId] [int] NULL,
	[RoomId] [int] NULL,
	[OperId] [int] NULL,
	[ReceptionTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Reception] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Reception]  WITH CHECK ADD  CONSTRAINT [FK_Reception_Dentist] FOREIGN KEY([DentistId])
REFERENCES [dbo].[Dentist] ([Id])
ON DELETE SET NULL

ALTER TABLE [dbo].[Reception] CHECK CONSTRAINT [FK_Reception_Dentist]

ALTER TABLE [dbo].[Reception]  WITH CHECK ADD  CONSTRAINT [FK_Reception_Operation] FOREIGN KEY([OperId])
REFERENCES [dbo].[Operation] ([Id])
ON DELETE SET NULL

ALTER TABLE [dbo].[Reception] CHECK CONSTRAINT [FK_Reception_Operation]

ALTER TABLE [dbo].[Reception]  WITH CHECK ADD  CONSTRAINT [FK_Reception_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
ON DELETE SET NULL

ALTER TABLE [dbo].[Reception] CHECK CONSTRAINT [FK_Reception_Patient]

ALTER TABLE [dbo].[Reception]  WITH CHECK ADD  CONSTRAINT [FK_Reception_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
ON DELETE SET NULL

ALTER TABLE [dbo].[Reception] CHECK CONSTRAINT [FK_Reception_Room]
