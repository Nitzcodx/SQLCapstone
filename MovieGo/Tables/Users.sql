CREATE TABLE [dbo].[Users]
(
	[UserId] VARCHAR(50) CONSTRAINT [pk_UserId] PRIMARY KEY,
	[UserName] VARCHAR(50) NOT NULL,
	[Password] VARCHAR(50) NOT NULL,
	[Age] INT NOT NULL,
	[Gender] CHAR(1) CONSTRAINT [chk_Gender] CHECK([Gender]='M' OR [Gender]='F'),
	[EmailId] VARCHAR(50) CONSTRAINT [uk_EmailId] UNIQUE,
	[PhoneNumber] NUMERIC(10) NOT NULL
)
