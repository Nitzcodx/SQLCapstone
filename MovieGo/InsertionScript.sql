INSERT Users([UserId],[UserName],[Password],[Age],[Gender],[EmailId],[PhoneNumber])
	VALUES
		('mary_potter','Mary Potter','Mary@123',25,'F','mary_p@gmail.com',9786543211),
		('jack_sparrow','Jack Sparrow','Spar78!jack',28,'M','jack_spa@yahoo.com',7865432102)

SET IDENTITY_INSERT TheatreDetails ON
INSERT TheatreDetails([TheatreId],[TheatreName],[Location])
	VALUES
		(1,'PVR','Pune'),
		(2,'INOX','Delhi')
SET IDENTITY_INSERT TheatreDetails OFF
	
SET IDENTITY_INSERT ShowDetails ON
INSERT ShowDetails([ShowId],[TheatreId],[ShowDate],[ShowTime],[MovieName],[TicketCost],[TicketsAvailable])
	VALUES
		(1001,2,DATEFROMPARTS(2018,06,28),TIMEFROMPARTS(14,30,0,0,0),'Avengers',250.00,100),
		(1002,2,DATEFROMPARTS(2018,06,30),TIMEFROMPARTS(17,30,0,0,0),'Hit Man',200.00,150)
SET IDENTITY_INSERT ShowDetails OFF

INSERT BookingDetails([BookingId],[UserId],[ShowId],[NoOfTickets],[TotalAmt])
	VALUES
		('B1001','jack_sparrow',1001,2,500),
		('B1002','mary_potter',1002,5,1000.00)