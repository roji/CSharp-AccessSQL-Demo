INSERT INTO [Blogs] (Url)
VALUES ('http://blogs.msdn.com/adonet');
GO

USE [master]
GO
DROP DATABASE [Blogging]
CREATE DATABASE [Blogging] 

GO

CREATE TABLE [Blogs](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NOT NULL
)
GO

CREATE TABLE [Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[BlogId] [int] NOT NULL
)
GO

INSERT INTO [Blogs] (Url)
VALUES ('http://blogs.msdn.com/adonet');
GO
