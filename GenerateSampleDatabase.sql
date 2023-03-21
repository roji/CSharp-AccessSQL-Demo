USE [master]
GO
/****** Object:  User [##MS_PolicyEventProcessingLogin##]    Script Date: 3/21/2023 1:32:26 PM ******/
CREATE USER [##MS_PolicyEventProcessingLogin##] FOR LOGIN [##MS_PolicyEventProcessingLogin##] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [##MS_AgentSigningCertificate##]    Script Date: 3/21/2023 1:32:26 PM ******/
CREATE USER [##MS_AgentSigningCertificate##] FOR LOGIN [##MS_AgentSigningCertificate##]
GO

/****** Object:  Table [dbo].[Blogs]    Script Date: 3/21/2023 1:32:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 3/21/2023 1:32:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[BlogId] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Posts_BlogId]    Script Date: 3/21/2023 1:32:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_Posts_BlogId] ON [dbo].[Posts]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([BlogId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Blogs_BlogId]
GO
