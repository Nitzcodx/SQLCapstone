CREATE PROCEDURE [dbo].[usp_BookTheTicket]
(
	@UserId VARCHAR(50),
	@ShowId INT,
	@NoOfTickets INT
)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM Users WHERE [UserId]=@UserId)
		BEGIN
			RETURN -1
		END
		IF NOT EXISTS (SELECT * FROM ShowDetails WHERE [ShowId]=@ShowId)
		BEGIN
			RETURN -2
		END
		IF @NoOfTickets < 0
		BEGIN
			RETURN -3
		END
		DECLARE @tickets INT
		SELECT @tickets=[TicketsAvailable] FROM ShowDetails WHERE [ShowId]=@ShowId
		IF @NoOfTickets>@tickets
		BEGIN
			RETURN -4
		END
		BEGIN TRAN
			DECLARE @BookingId VARCHAR(5), @TotalAmt DECIMAL(6,2)
			SELECT @TotalAmt = TicketCost*@NoOfTickets FROM ShowDetails WHERE [ShowId]=@ShowId
			SELECT @BookingId=dbo.ufn_GenerateBookingId()
			INSERT INTO BookingDetails([BookingId],[UserId],[ShowId],[NoOfTickets],[TotalAmt])
				VALUES	(@BookingId,@UserId,@ShowId,@NoOfTickets,@TotalAmt)
		COMMIT
		RETURN 1
	END TRY
	BEGIN CATCH
		ROLLBACK
		RETURN -99
	END CATCH
END
