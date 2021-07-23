CREATE TABLE [dbo].[BookingDetails]
(
	[BookingId] VARCHAR(5) CONSTRAINT [pk_BookingId] PRIMARY KEY,
	[UserId] VARCHAR(50) CONSTRAINT [fk_UserId] REFERENCES Users([UserId]) NOT NULL,
	[ShowId] INT CONSTRAINT [fk_ShowId] REFERENCES ShowDetails([ShowId]) NOT NULL,
	[NoOfTickets] INT NOT NULL,
	[TotalAmt] DECIMAL(6,2) NOT NULL
)
