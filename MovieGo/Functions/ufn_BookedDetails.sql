CREATE FUNCTION [dbo].[ufn_BookedDetails]
(
	@BookingId VARCHAR(5)
)
RETURNS @returntable TABLE
(
	[BookingId] VARCHAR(5),
	[UserName] VARCHAR(50),
	[MovieName] VARCHAR(50),
	[TheatreName] VARCHAR(50),
	[ShowDate] DATE,
	[ShowTime] TIME,
	[NoOfTickets] INT,
	[TotalAmt] DECIMAL(6,2)
)
AS
BEGIN
	INSERT @returntable
	SELECT booking.BookingId, [user].UserName, show.MovieName,
			theatre.TheatreName, show.ShowDate, show.ShowTime,
			booking.NoOfTickets,booking.TotalAmt
	FROM BookingDetails AS booking
	JOIN ShowDetails AS show
	ON booking.ShowId=show.ShowId
	JOIN TheatreDetails AS theatre
	ON show.TheatreId=theatre.TheatreId
	JOIN Users AS [user]
	ON [user].UserId = booking.UserId
	RETURN
END
