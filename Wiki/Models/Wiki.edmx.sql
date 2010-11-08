
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/25/2010 11:58:36
-- Generated from EDMX file: C:\Users\WebhallenAB\Documents\Visual Studio 2010\Projects\Wiki\Wiki\Models\Wiki.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Wiki];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ArticleArticle_section]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Article_section] DROP CONSTRAINT [FK_ArticleArticle_section];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Articles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Articles];
GO
IF OBJECT_ID(N'[dbo].[Article__has__Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Article__has__Categories];
GO
IF OBJECT_ID(N'[dbo].[Article__has__Keywords]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Article__has__Keywords];
GO
IF OBJECT_ID(N'[dbo].[Article__has__Tag]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Article__has__Tag];
GO
IF OBJECT_ID(N'[dbo].[Article_section]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Article_section];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comments];
GO
IF OBJECT_ID(N'[dbo].[Keywords]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Keywords];
GO
IF OBJECT_ID(N'[dbo].[Tags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tags];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Articles'
CREATE TABLE [dbo].[Articles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nchar(100)  NOT NULL,
    [PubDate] datetime  NOT NULL
);
GO

-- Creating table 'Article__has__Categories'
CREATE TABLE [dbo].[Article__has__Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Article_id] int  NOT NULL,
    [Categories_id] int  NOT NULL
);
GO

-- Creating table 'Article__has__Keywords'
CREATE TABLE [dbo].[Article__has__Keywords] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Keyword_id] int  NOT NULL,
    [Article_id] int  NOT NULL
);
GO

-- Creating table 'Article__has__Tag'
CREATE TABLE [dbo].[Article__has__Tag] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Article_id] int  NOT NULL,
    [Tags_id] int  NOT NULL
);
GO

-- Creating table 'Article_section'
CREATE TABLE [dbo].[Article_section] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Section_heading] nchar(60)  NULL,
    [Section_text] varchar(max)  NULL,
    [Parent_section] int  NULL,
    [Section_order] int  NULL,
    [User_id] int  NOT NULL,
    [Article_id] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Category1] nchar(60)  NOT NULL,
    [Category_id] nchar(10)  NULL
);
GO

-- Creating table 'Comments'
CREATE TABLE [dbo].[Comments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Comment1] nchar(10)  NOT NULL,
    [Users_id] int  NOT NULL,
    [Article_id] int  NOT NULL,
    [PubDate] datetime  NOT NULL
);
GO

-- Creating table 'Keywords'
CREATE TABLE [dbo].[Keywords] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Keywords] nchar(100)  NOT NULL,
    [Description] nchar(300)  NOT NULL
);
GO

-- Creating table 'Tags'
CREATE TABLE [dbo].[Tags] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tags] nchar(100)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nchar(20)  NOT NULL,
    [Password] nchar(12)  NOT NULL,
    [Email] nchar(40)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [PK_Articles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Article__has__Categories'
ALTER TABLE [dbo].[Article__has__Categories]
ADD CONSTRAINT [PK_Article__has__Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Article__has__Keywords'
ALTER TABLE [dbo].[Article__has__Keywords]
ADD CONSTRAINT [PK_Article__has__Keywords]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Article__has__Tag'
ALTER TABLE [dbo].[Article__has__Tag]
ADD CONSTRAINT [PK_Article__has__Tag]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Article_section'
ALTER TABLE [dbo].[Article_section]
ADD CONSTRAINT [PK_Article_section]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Keywords'
ALTER TABLE [dbo].[Keywords]
ADD CONSTRAINT [PK_Keywords]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Tags'
ALTER TABLE [dbo].[Tags]
ADD CONSTRAINT [PK_Tags]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Article_id] in table 'Article_section'
ALTER TABLE [dbo].[Article_section]
ADD CONSTRAINT [FK_ArticleArticle_section]
    FOREIGN KEY ([Article_id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleArticle_section'
CREATE INDEX [IX_FK_ArticleArticle_section]
ON [dbo].[Article_section]
    ([Article_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------