IF OBJECT_ID(N'[dbo].[tblUsers]', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[tblUsers](
	[ID] [int] NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](150) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](100) NULL,
	[Email] [varchar](150) NULL,
	[UserType] [varchar](100) NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END