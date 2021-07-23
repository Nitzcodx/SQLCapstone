CREATE FUNCTION [dbo].[ufn_GenerateBookingId]()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @BookingId VARCHAR(5)
	IF NOT EXISTS (SELECT [BookingId] FROM BookingDetails)
		SET @BookingId = 'B1001'
	ELSE
		SELECT @BookingId = 'B' + CAST(CAST(SUBSTRING(MAX([BookingId]),2,4) AS INT)+1 AS VARCHAR) FROM BookingDetails
	RETURN @BookingId
END
