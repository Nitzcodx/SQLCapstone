CREATE TABLE [dbo].[ShowDetails]
(
	[ShowId] INT CONSTRAINT [pk_ShowId] PRIMARY KEY IDENTITY(1000,1),
	[TheatreId] INT CONSTRAINT [fk_TheatreId] REFERENCES TheatreDetails([TheatreId]),
	[ShowDate] DATE NOT NULL,
	[ShowTime] TIME NOT NULL,
	[MovieName] VARCHAR(50) NOT NULL,
	[TicketCost] DECIMAL(6,2) NOT NULL,
	[TicketsAvailable] INT NOT NULL
)
