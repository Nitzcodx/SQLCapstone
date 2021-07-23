CREATE TABLE [dbo].[TheatreDetails]
(
	[TheatreId] INT CONSTRAINT [pk_TheatreId] PRIMARY KEY IDENTITY(1,1),
	[TheatreName] VARCHAR(50) NOT NULL,
	[Location] VARCHAR(50) NOT NULL
)
