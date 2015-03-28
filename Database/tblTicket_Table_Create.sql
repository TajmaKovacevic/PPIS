IF OBJECT_ID(N'[dbo].[tblTicket]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[tblTicket](
	[ID] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [varchar](1500) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Status] [varchar](100) NULL,
	[Email] [varchar](150) NULL,
	[Location] [varchar](100) NULL,
	[ContactPerson] [varchar](100) NOT NULL,
	[ContactNumber] [varchar](100) NULL,
	[StepsToReproduce] [varchar](1500) NULL,
	[ActionsToResolve] [varchar](1000) NULL,
	[DateCreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[Title] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END