CREATE FUNCTION [dbo].[ufn_GetMovieShowtimes]
(
	@MovieName VARCHAR(50),
	@Location VARCHAR(50)
)
RETURNS @returntable TABLE
(
	[MovieName] VARCHAR(50),
	[ShowDate] DATE,
	[ShowTime] TIME,
	[TheatreName] VARCHAR(50),
	[TicketCost] DECIMAL(6,2)
)
AS
BEGIN
	INSERT @returntable
	SELECT show.MovieName,show.ShowDate,show.ShowTime,theatre.TheatreName,show.TicketCost
	FROM ShowDetails AS show
	JOIN TheatreDetails AS theatre
	ON show.TheatreId=theatre.TheatreId
	WHERE show.MovieName=@MovieName AND theatre.Location=@Location
	RETURN
END
