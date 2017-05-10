/*
Created: 12/8/2016
Modified: 12/8/2016
Model: RE Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create schemas section -------------------------------------------------

CREATE SCHEMA [Theater] AUTHORIZATION [dbo]
go

CREATE SCHEMA [ContactDetails] AUTHORIZATION [dbo]
go

CREATE SCHEMA [User] AUTHORIZATION [dbo]
go

CREATE SCHEMA [BoxOffice] AUTHORIZATION [dbo]
go

CREATE SCHEMA [Events] AUTHORIZATION [dbo]
go

CREATE SCHEMA [SoundTrack] AUTHORIZATION [dbo]
go

CREATE SCHEMA [Movies] AUTHORIZATION [dbo]
go

CREATE SCHEMA [Television] AUTHORIZATION [dbo]
go

CREATE SCHEMA [News] AUTHORIZATION [dbo]
go

CREATE SCHEMA [Community] AUTHORIZATION [dbo]
go

CREATE SCHEMA [Generic] AUTHORIZATION [dbo]
go

CREATE SCHEMA [Tickets] AUTHORIZATION [dbo]
go

CREATE SCHEMA [db_owner] AUTHORIZATION [db_owner]
go

CREATE SCHEMA [db_accessadmin] AUTHORIZATION [db_accessadmin]
go

CREATE SCHEMA [db_securityadmin] AUTHORIZATION [db_securityadmin]
go

CREATE SCHEMA [db_ddladmin] AUTHORIZATION [db_ddladmin]
go

CREATE SCHEMA [db_backupoperator] AUTHORIZATION [db_backupoperator]
go

CREATE SCHEMA [db_datareader] AUTHORIZATION [db_datareader]
go

CREATE SCHEMA [db_datawriter] AUTHORIZATION [db_datawriter]
go

CREATE SCHEMA [db_denydatareader] AUTHORIZATION [db_denydatareader]
go

CREATE SCHEMA [db_denydatawriter] AUTHORIZATION [db_denydatawriter]
go

-- Create tables section -------------------------------------------------

-- Table BoxOffice.BoxOffice

CREATE TABLE [BoxOffice].[BoxOffice]
(
 [BoxOfficeID] Int NOT NULL,
 [CountryID] Nvarchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Budget] Money NOT NULL,
 [EntityID] Int NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table BoxOffice.BoxOffice

CREATE INDEX [IX_Relationship1] ON [BoxOffice].[BoxOffice] ([CountryID])
 ON [PRIMARY]
go

-- Add keys for table BoxOffice.BoxOffice

ALTER TABLE [BoxOffice].[BoxOffice] ADD CONSTRAINT [Pkey181] PRIMARY KEY ([BoxOfficeID],[EntityID])
 ON [PRIMARY]
go

-- Table BoxOffice.WeekBoxOffice

CREATE TABLE [BoxOffice].[WeekBoxOffice]
(
 [EntityID] Int NOT NULL,
 [BoxOfficeID] Int NOT NULL,
 [WeekNumber] Int NOT NULL,
 [WeekendCollections] Money NULL
)
ON [PRIMARY]
go

-- Add keys for table BoxOffice.WeekBoxOffice

ALTER TABLE [BoxOffice].[WeekBoxOffice] ADD CONSTRAINT [Pkey19] PRIMARY KEY ([EntityID],[BoxOfficeID],[WeekNumber])
 ON [PRIMARY]
go

-- Table Community.Polls

CREATE TABLE [Community].[Polls]
(
 [PollID] Int NOT NULL,
 [Name] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Description] Nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Status] Nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [CreatedOn] Date NOT NULL,
 [ChangedOn] Date NULL,
 [BusinessEntityID] Int NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
go

-- Create indexes for table Community.Polls

CREATE INDEX [IX_Relationship8] ON [Community].[Polls] ([BusinessEntityID])
 ON [PRIMARY]
go

-- Add keys for table Community.Polls

ALTER TABLE [Community].[Polls] ADD CONSTRAINT [Pkey65] PRIMARY KEY ([PollID])
 ON [PRIMARY]
go

-- Table Community.PollsDetails

CREATE TABLE [Community].[PollsDetails]
(
 [PollID] Int NOT NULL,
 [ChoiceID] Int NOT NULL,
 [Choice] Nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ImageID] Int NULL,
 [VoteCount] Int NULL
)
ON [PRIMARY]
go

-- Create indexes for table Community.PollsDetails

CREATE INDEX [IX_Relationship75] ON [Community].[PollsDetails] ([ImageID])
 ON [PRIMARY]
go

-- Add keys for table Community.PollsDetails

ALTER TABLE [Community].[PollsDetails] ADD CONSTRAINT [Pkey63] PRIMARY KEY ([PollID],[ChoiceID])
 ON [PRIMARY]
go

-- Table Community.PollsResponse

CREATE TABLE [Community].[PollsResponse]
(
 [ResponseID] Int NOT NULL,
 [CreatedOn] Date NOT NULL,
 [PollID] Int NOT NULL,
 [ChoiceID] Int NOT NULL,
 [BusinessEntityID] Int NULL
)
ON [PRIMARY]
go

-- Create indexes for table Community.PollsResponse

CREATE INDEX [IX_Relationship7] ON [Community].[PollsResponse] ([BusinessEntityID])
 ON [PRIMARY]
go

-- Add keys for table Community.PollsResponse

ALTER TABLE [Community].[PollsResponse] ADD CONSTRAINT [Pkey64] PRIMARY KEY ([ResponseID],[PollID],[ChoiceID])
 ON [PRIMARY]
go

-- Table ContactDetails.Address

CREATE TABLE [ContactDetails].[Address]
(
 [AddressID] Int NOT NULL,
 [AddressLine1] Nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [AddressLine2] Nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [PostalCode] Nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [CityID] Int NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table ContactDetails.Address

CREATE INDEX [IX_Address_City_CityID] ON [ContactDetails].[Address] ([CityID])
 ON [PRIMARY]
go

-- Add keys for table ContactDetails.Address

ALTER TABLE [ContactDetails].[Address] ADD CONSTRAINT [Pkey2] PRIMARY KEY ([AddressID])
 ON [PRIMARY]
go

-- Table ContactDetails.AddressType

CREATE TABLE [ContactDetails].[AddressType]
(
 [AddressTypeID] Int NOT NULL,
 [Name] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table ContactDetails.AddressType

ALTER TABLE [ContactDetails].[AddressType] ADD CONSTRAINT [Pkey8] PRIMARY KEY ([AddressTypeID])
 ON [PRIMARY]
go

-- Table ContactDetails.City

CREATE TABLE [ContactDetails].[City]
(
 [CityID] Int NOT NULL,
 [StateProvinceID] Int NOT NULL,
 [Name] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table ContactDetails.City

CREATE INDEX [IX_City_StateProvince_StateProvinceID] ON [ContactDetails].[City] ([StateProvinceID])
 ON [PRIMARY]
go

-- Add keys for table ContactDetails.City

ALTER TABLE [ContactDetails].[City] ADD CONSTRAINT [Pkey3] PRIMARY KEY ([CityID])
 ON [PRIMARY]
go

-- Table ContactDetails.Country

CREATE TABLE [ContactDetails].[Country]
(
 [CountryRegionCode] Nvarchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Name] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table ContactDetails.Country

ALTER TABLE [ContactDetails].[Country] ADD CONSTRAINT [Pkey5] PRIMARY KEY ([CountryRegionCode])
 ON [PRIMARY]
go

-- Table ContactDetails.EmailAddress

CREATE TABLE [ContactDetails].[EmailAddress]
(
 [EmailAddressID] Int NOT NULL,
 [EmailAddress] Nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [BusinessEntityID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table ContactDetails.EmailAddress

ALTER TABLE [ContactDetails].[EmailAddress] ADD CONSTRAINT [Pkey11] PRIMARY KEY ([EmailAddressID],[BusinessEntityID])
 ON [PRIMARY]
go

-- Table ContactDetails.PhoneNumber

CREATE TABLE [ContactDetails].[PhoneNumber]
(
 [PhoneNumber] Nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [PhoneNumberTypeID] Int NOT NULL,
 [BusinessEntityID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table ContactDetails.PhoneNumber

ALTER TABLE [ContactDetails].[PhoneNumber] ADD CONSTRAINT [Pkey12] PRIMARY KEY ([PhoneNumber],[PhoneNumberTypeID],[BusinessEntityID])
 ON [PRIMARY]
go

-- Table ContactDetails.PhoneType

CREATE TABLE [ContactDetails].[PhoneType]
(
 [PhoneNumberTypeID] Int NOT NULL,
 [Name] Nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table ContactDetails.PhoneType

ALTER TABLE [ContactDetails].[PhoneType] ADD CONSTRAINT [Pkey13] PRIMARY KEY ([PhoneNumberTypeID])
 ON [PRIMARY]
go

-- Table ContactDetails.StateProvince

CREATE TABLE [ContactDetails].[StateProvince]
(
 [StateProvinceID] Int NOT NULL,
 [StateProvinceName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [CountryRegionCode] Nvarchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table ContactDetails.StateProvince

CREATE INDEX [IX_StateProvince_Country_CountryRegionCode] ON [ContactDetails].[StateProvince] ([CountryRegionCode])
 ON [PRIMARY]
go

-- Add keys for table ContactDetails.StateProvince

ALTER TABLE [ContactDetails].[StateProvince] ADD CONSTRAINT [Pkey4] PRIMARY KEY ([StateProvinceID])
 ON [PRIMARY]
go

-- Table Events.Awards

CREATE TABLE [Events].[Awards]
(
 [AwardID] Int NOT NULL,
 [Year] Varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Nomination] Varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ImageID] Int NULL,
 [AwardName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
go

-- Create indexes for table Events.Awards

CREATE INDEX [IX_Relationship66] ON [Events].[Awards] ([ImageID])
 ON [PRIMARY]
go

-- Add keys for table Events.Awards

ALTER TABLE [Events].[Awards] ADD CONSTRAINT [Pkey47] PRIMARY KEY ([AwardID])
 ON [PRIMARY]
go

-- Table Events.CastCrew

CREATE TABLE [Events].[CastCrew]
(
 [CastCrewID] Int NOT NULL,
 [TypeID] Int NOT NULL,
 [DateOfBirth] Date NULL,
 [ImageID] Int NOT NULL,
 [Name] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table Events.CastCrew

CREATE INDEX [IX_Relationship61] ON [Events].[CastCrew] ([ImageID])
 ON [PRIMARY]
go

-- Add keys for table Events.CastCrew

ALTER TABLE [Events].[CastCrew] ADD CONSTRAINT [Pkey69] PRIMARY KEY ([CastCrewID],[TypeID])
 ON [PRIMARY]
go

-- Table Events.CastCrewType

CREATE TABLE [Events].[CastCrewType]
(
 [TypeID] Int NOT NULL,
 [Type] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Events.CastCrewType

ALTER TABLE [Events].[CastCrewType] ADD CONSTRAINT [PKey70] PRIMARY KEY ([TypeID])
 ON [PRIMARY]
go

-- Table Events.Category

CREATE TABLE [Events].[Category]
(
 [CategoryID] Int NOT NULL,
 [CategoryName] Nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Events.Category

ALTER TABLE [Events].[Category] ADD CONSTRAINT [Pkey50] PRIMARY KEY ([CategoryID])
 ON [PRIMARY]
go

-- Table Events.Certificate

CREATE TABLE [Events].[Certificate]
(
 [CertificateID] Int NOT NULL,
 [CertificateName] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Description] Nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
go

-- Add keys for table Events.Certificate

ALTER TABLE [Events].[Certificate] ADD CONSTRAINT [Pkey36] PRIMARY KEY ([CertificateID])
 ON [PRIMARY]
go

-- Table Events.Entity

CREATE TABLE [Events].[Entity]
(
 [EntityID] Int NOT NULL,
 [TypeID] Int DEFAULT ((1)) NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Events.Entity

ALTER TABLE [Events].[Entity] ADD CONSTRAINT [Pkey245] PRIMARY KEY ([EntityID])
 ON [PRIMARY]
go

ALTER TABLE [Events].[Entity] ADD CONSTRAINT [Pkey26] UNIQUE ([EntityID])
 ON [PRIMARY]
go

-- Table Events.EntityDetails

CREATE TABLE [Events].[EntityDetails]
(
 [DetailID] Int NOT NULL,
 [LengthOfMovie] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [ReleaseDate] Date NOT NULL,
 [Language] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [EntityID] Int NOT NULL,
 [EndDate] Date NULL,
 [CountryRegionCode] Nvarchar(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table Events.EntityDetails

CREATE INDEX [IX_Relationship19] ON [Events].[EntityDetails] ([CountryRegionCode])
 ON [PRIMARY]
go

-- Add keys for table Events.EntityDetails

ALTER TABLE [Events].[EntityDetails] ADD CONSTRAINT [Pkey166] PRIMARY KEY ([DetailID],[EntityID])
 ON [PRIMARY]
go

-- Table Events.GenreDetails

CREATE TABLE [Events].[GenreDetails]
(
 [GenreID] Int NOT NULL,
 [Name] Nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Events.GenreDetails

ALTER TABLE [Events].[GenreDetails] ADD CONSTRAINT [PKey67] PRIMARY KEY ([GenreID])
 ON [PRIMARY]
go

-- Table Events.GenreEntity

CREATE TABLE [Events].[GenreEntity]
(
 [EntityID] Int NOT NULL,
 [GenreID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Events.GenreEntity

ALTER TABLE [Events].[GenreEntity] ADD CONSTRAINT [Key4] PRIMARY KEY ([EntityID],[GenreID])
 ON [PRIMARY]
go

-- Table Events.Image

CREATE TABLE [Events].[Image]
(
 [ImageID] Int NOT NULL,
 [Image] Nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
go

-- Add keys for table Events.Image

ALTER TABLE [Events].[Image] ADD CONSTRAINT [Pkey21] PRIMARY KEY ([ImageID])
 ON [PRIMARY]
go

-- Table Events.IMDBUser

CREATE TABLE [Events].[IMDBUser]
(
 [BusinessEntityID] Int NOT NULL,
 [PersonType] Nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [FirstName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [LastName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Sex] Char(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [DateOfBirth] Nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [UserName] Nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Password] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [REGID] Int NULL
)
ON [PRIMARY]
go

-- Create indexes for table Events.IMDBUser

CREATE INDEX [IX_Relationship2] ON [Events].[IMDBUser] ([REGID])
 ON [PRIMARY]
go

-- Add keys for table Events.IMDBUser

ALTER TABLE [Events].[IMDBUser] ADD CONSTRAINT [Pkey10] PRIMARY KEY ([BusinessEntityID])
 ON [PRIMARY]
go

-- Create triggers for table Events.IMDBUser

CREATE  TRIGGER update_user_age on Events.imdbuser 
for insert 
as
begin
declare @i_userid    int,
		@i_dob        date

select @i_userid =  REGID from inserted
select @i_dob    =  dateofbirth from inserted


update Events.UserRegDetails set userAge = (select (DATEPART(YEAR,GETDATE()) - DATEPART(YEAR,dateofbirth)) as age FROM Events.imdbuser 
where REGID= @i_userid
and dateofbirth = @i_dob  )
where REGID= @i_userid

end
go

Create  TRIGGER update_user_age1 on Events.imdbuser 
for insert 
as
begin
declare @i_userid    int,
		@i_dob        date

select @i_userid =  REGID from inserted
select @i_dob    =  dateofbirth from inserted


update Events.UserRegDetails set userAge = (select (DATEPART(YEAR,GETDATE()) - DATEPART(YEAR,dateofbirth)) as age FROM Events.imdbuser 
where REGID= @i_userid
and dateofbirth = @i_dob  ) , regyear = year (getdate())
where REGID= @i_userid

end
go

Create  TRIGGER update_user_age2 on Events.imdbuser 
for insert 
as
begin
declare @i_userid    int,
		@i_dob        date

select @i_userid =  REGID from inserted
select @i_dob    =  dateofbirth from inserted


update Events.UserRegDetails set userAge = (select (DATEPART(YEAR,GETDATE()) - DATEPART(YEAR,dateofbirth)) as age FROM Events.imdbuser 
where REGID= @i_userid
and dateofbirth = @i_dob  ) 
where REGID= @i_userid

end
go

-- Table Events.MoviesCastCrew

CREATE TABLE [Events].[MoviesCastCrew]
(
 [EntityID] Int NOT NULL,
 [CastCrewID] Int NOT NULL,
 [TypeID] Int NOT NULL,
 [AwardID] Int NULL,
 [NewsID] Int NULL,
 [PollID] Int NULL
)
ON [PRIMARY]
go

-- Create indexes for table Events.MoviesCastCrew

CREATE INDEX [IX_Relationship16] ON [Events].[MoviesCastCrew] ([AwardID])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship72] ON [Events].[MoviesCastCrew] ([NewsID])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship74] ON [Events].[MoviesCastCrew] ([PollID])
 ON [PRIMARY]
go

-- Add keys for table Events.MoviesCastCrew

ALTER TABLE [Events].[MoviesCastCrew] ADD CONSTRAINT [Pkey40] PRIMARY KEY ([EntityID],[CastCrewID],[TypeID])
 ON [PRIMARY]
go

-- Table Events.Production

CREATE TABLE [Events].[Production]
(
 [ProductionID] Int NOT NULL,
 [ProductionName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [EntityID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Events.Production

ALTER TABLE [Events].[Production] ADD CONSTRAINT [Pkey31] PRIMARY KEY ([ProductionID],[EntityID])
 ON [PRIMARY]
go

-- Table Events.Review

CREATE TABLE [Events].[Review]
(
 [ReviewID] Int NOT NULL,
 [Review] Nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [EntityID] Int NOT NULL,
 [BusinessEntityID] Int NOT NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
go

-- Create indexes for table Events.Review

CREATE INDEX [IX_Relationship6] ON [Events].[Review] ([BusinessEntityID])
 ON [PRIMARY]
go

-- Add keys for table Events.Review

ALTER TABLE [Events].[Review] ADD CONSTRAINT [Pkey14] PRIMARY KEY ([ReviewID],[EntityID])
 ON [PRIMARY]
go

-- Table Events.Technical

CREATE TABLE [Events].[Technical]
(
 [TechnicalID] Int NOT NULL,
 [RunTime] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Color] Nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [AspectRatio] Nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Camera] Nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Laboratory] Nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [NegativeFormat] Nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [CinematographyProcess] Nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [PrintedFilmFormat] Nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [SoundMix] Nvarchar(35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
go

-- Add keys for table Events.Technical

ALTER TABLE [Events].[Technical] ADD CONSTRAINT [Pkey37] PRIMARY KEY ([TechnicalID])
 ON [PRIMARY]
go

-- Table Events.Trailer

CREATE TABLE [Events].[Trailer]
(
 [TrailerID] Int NOT NULL,
 [Trailer] Nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
go

-- Add keys for table Events.Trailer

ALTER TABLE [Events].[Trailer] ADD CONSTRAINT [Pkey35] PRIMARY KEY ([TrailerID])
 ON [PRIMARY]
go

-- Table Events.Type

CREATE TABLE [Events].[Type]
(
 [TypeID] Int NOT NULL,
 [Name] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Events.Type

ALTER TABLE [Events].[Type] ADD CONSTRAINT [Key5] PRIMARY KEY ([TypeID])
 ON [PRIMARY]
go

-- Table Events.UserRegDetails

CREATE TABLE [Events].[UserRegDetails]
(
 [RegID] Int NOT NULL,
 [UserAge] Int NOT NULL,
 [RegYear] Int DEFAULT (datepart(year,getdate())) NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Events.UserRegDetails

ALTER TABLE [Events].[UserRegDetails] ADD CONSTRAINT [Pkey80] PRIMARY KEY ([RegID])
 ON [PRIMARY]
go

-- Table Movies.FilmLocation

CREATE TABLE [Movies].[FilmLocation]
(
 [FilmLocationID] Int NOT NULL,
 [EntityID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Movies.FilmLocation

ALTER TABLE [Movies].[FilmLocation] ADD CONSTRAINT [Pkey17] PRIMARY KEY ([FilmLocationID],[EntityID])
 ON [PRIMARY]
go

-- Table Movies.FilmLocationDetails

CREATE TABLE [Movies].[FilmLocationDetails]
(
 [FilmLocationID] Int NOT NULL,
 [FilmLocation] Nvarchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Movies.FilmLocationDetails

ALTER TABLE [Movies].[FilmLocationDetails] ADD CONSTRAINT [Pkey68] PRIMARY KEY ([FilmLocationID])
 ON [PRIMARY]
go

-- Table Movies.Movies

CREATE TABLE [Movies].[Movies]
(
 [EntityID] Int NOT NULL,
 [Name] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Description] Nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Rating] Decimal(10,3) NULL,
 [MetaScore] Int NOT NULL,
 [Rank] Int NULL,
 [MovieYear] Int NOT NULL,
 [TechnicalID] Int NULL,
 [Votes] Int NULL,
 [IsDVDAvail] Nvarchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [MovieStatus] Nvarchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [IsAmazonAvail] Nvarchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ImageID] Int NULL,
 [CertificateID] Int NULL,
 [TrailerID] Int NULL,
 [AwardID] Int NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
go

-- Create indexes for table Movies.Movies

CREATE INDEX [IX_Relationship21] ON [Movies].[Movies] ([ImageID])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship29] ON [Movies].[Movies] ([TechnicalID])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship33] ON [Movies].[Movies] ([CertificateID])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship34] ON [Movies].[Movies] ([TrailerID])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship40] ON [Movies].[Movies] ([AwardID])
 ON [PRIMARY]
go

-- Add keys for table Movies.Movies

ALTER TABLE [Movies].[Movies] ADD CONSTRAINT [Pkey33] PRIMARY KEY ([EntityID])
 ON [PRIMARY]
go

-- Table Movies.MovieShowTime

CREATE TABLE [Movies].[MovieShowTime]
(
 [BusinessEntityID] Int NOT NULL,
 [ScreenID] Int NOT NULL,
 [ShowTimeID] Int NOT NULL,
 [ShowTime] Time(7) NOT NULL,
 [Status] Nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [EntityID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Movies.MovieShowTime

ALTER TABLE [Movies].[MovieShowTime] ADD CONSTRAINT [Pkey52] PRIMARY KEY ([ShowTimeID],[BusinessEntityID],[ScreenID],[EntityID])
 ON [PRIMARY]
go

-- Table Movies.ShowTimeCategory

CREATE TABLE [Movies].[ShowTimeCategory]
(
 [BusinessEntityID] Int NOT NULL,
 [ScreenID] Int NOT NULL,
 [ShowTimeID] Int NOT NULL,
 [CategoryID] Int NOT NULL,
 [Price] Money NOT NULL,
 [EntityID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Movies.ShowTimeCategory

ALTER TABLE [Movies].[ShowTimeCategory] ADD CONSTRAINT [Pkey51] PRIMARY KEY ([BusinessEntityID],[ScreenID],[ShowTimeID],[CategoryID],[EntityID])
 ON [PRIMARY]
go

-- Table News.News

CREATE TABLE [News].[News]
(
 [NewsID] Int NOT NULL,
 [ImageID] Int NULL,
 [NewsTitle] Nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Description] Nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [CreateDate] Date NOT NULL,
 [IsImportant] Nvarchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Time] Time(7) NOT NULL,
 [NewsCategoryID] Int NOT NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
go

-- Create indexes for table News.News

CREATE INDEX [IX_Relationship73] ON [News].[News] ([ImageID])
 ON [PRIMARY]
go

-- Add keys for table News.News

ALTER TABLE [News].[News] ADD CONSTRAINT [Pkey62] PRIMARY KEY ([NewsID])
 ON [PRIMARY]
go

-- Table News.NewsCategory

CREATE TABLE [News].[NewsCategory]
(
 [NewsCategoryID] Int NOT NULL,
 [CategoryName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table News.NewsCategory

ALTER TABLE [News].[NewsCategory] ADD CONSTRAINT [Pkey61] PRIMARY KEY ([NewsCategoryID])
 ON [PRIMARY]
go

-- Table News.NewsCategoryBR

CREATE TABLE [News].[NewsCategoryBR]
(
 [NewsID] Int NOT NULL,
 [NewsCategoryID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table News.NewsCategoryBR

ALTER TABLE [News].[NewsCategoryBR] ADD CONSTRAINT [Key2] PRIMARY KEY ([NewsID],[NewsCategoryID])
 ON [PRIMARY]
go

-- Table News.NewsSource

CREATE TABLE [News].[NewsSource]
(
 [SourceID] Int NOT NULL,
 [SourceName] Nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [SourceLink] Nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
go

-- Add keys for table News.NewsSource

ALTER TABLE [News].[NewsSource] ADD CONSTRAINT [Pkey59] PRIMARY KEY ([SourceID])
 ON [PRIMARY]
go

-- Table News.NewsSourceBR

CREATE TABLE [News].[NewsSourceBR]
(
 [NewsID] Int NOT NULL,
 [SourceID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table News.NewsSourceBR

ALTER TABLE [News].[NewsSourceBR] ADD CONSTRAINT [Key3] PRIMARY KEY ([NewsID],[SourceID])
 ON [PRIMARY]
go

-- Table News.Reporter

CREATE TABLE [News].[Reporter]
(
 [ReporterID] Int NOT NULL,
 [Name] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table News.Reporter

ALTER TABLE [News].[Reporter] ADD CONSTRAINT [Pkey60] PRIMARY KEY ([ReporterID])
 ON [PRIMARY]
go

-- Table News.ReporterNews

CREATE TABLE [News].[ReporterNews]
(
 [NewsID] Int NOT NULL,
 [ReporterID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table News.ReporterNews

ALTER TABLE [News].[ReporterNews] ADD CONSTRAINT [Pkey71] PRIMARY KEY ([NewsID],[ReporterID])
 ON [PRIMARY]
go

-- Table SoundTrack.SoundTrack

CREATE TABLE [SoundTrack].[SoundTrack]
(
 [SoundTrackID] Int NOT NULL,
 [Name] Nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [EntityID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table SoundTrack.SoundTrack

ALTER TABLE [SoundTrack].[SoundTrack] ADD CONSTRAINT [Pkey45] PRIMARY KEY ([SoundTrackID],[EntityID])
 ON [PRIMARY]
go

-- Table SoundTrack.SoundTrackCastCrew

CREATE TABLE [SoundTrack].[SoundTrackCastCrew]
(
 [EntityID] Int NOT NULL,
 [SoundTrackID] Int NOT NULL,
 [AwardID] Int NULL,
 [CastCrewID] Int NOT NULL,
 [TypeID] Int NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table SoundTrack.SoundTrackCastCrew

CREATE INDEX [IX_Relationship37] ON [SoundTrack].[SoundTrackCastCrew] ([AwardID])
 ON [PRIMARY]
go

-- Add keys for table SoundTrack.SoundTrackCastCrew

ALTER TABLE [SoundTrack].[SoundTrackCastCrew] ADD CONSTRAINT [Pkey42] PRIMARY KEY ([SoundTrackID],[EntityID],[CastCrewID],[TypeID])
 ON [PRIMARY]
go

-- Table Television.Channels

CREATE TABLE [Television].[Channels]
(
 [ChannelID] Int NOT NULL,
 [ChannelName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

EXEC sp_addextendedproperty 'MS_Description', 'Table to maintain all theater related attributes ', 'SCHEMA', 'Television', 'TABLE', 'Channels', NULL, NULL
go

-- Add keys for table Television.Channels

ALTER TABLE [Television].[Channels] ADD CONSTRAINT [Pkey32] PRIMARY KEY ([ChannelID])
 ON [PRIMARY]
go

-- Table Television.Episode

CREATE TABLE [Television].[Episode]
(
 [SeasonID] Int NOT NULL,
 [EpisodeID] Int NOT NULL,
 [Name] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [Date] Date NOT NULL,
 [EntityID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Television.Episode

ALTER TABLE [Television].[Episode] ADD CONSTRAINT [Pkey54] PRIMARY KEY ([EpisodeID],[SeasonID],[EntityID])
 ON [PRIMARY]
go

-- Table Television.ProgCastCrew

CREATE TABLE [Television].[ProgCastCrew]
(
 [EntityID] Int NOT NULL,
 [CastCrewID] Int NOT NULL,
 [TypeID] Int NOT NULL,
 [AwardID] Int NULL
)
ON [PRIMARY]
go

-- Create indexes for table Television.ProgCastCrew

CREATE INDEX [IX_Relationship71] ON [Television].[ProgCastCrew] ([AwardID])
 ON [PRIMARY]
go

-- Add keys for table Television.ProgCastCrew

ALTER TABLE [Television].[ProgCastCrew] ADD CONSTRAINT [Key1] PRIMARY KEY ([EntityID],[CastCrewID],[TypeID])
 ON [PRIMARY]
go

-- Table Television.Program

CREATE TABLE [Television].[Program]
(
 [EntityID] Int NOT NULL,
 [ChannelID] Int NOT NULL,
 [Name] Nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Description] Nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [Rating] Decimal(10,2) NULL,
 [LaunchYear] Nvarchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 [TechnicalID] Int NOT NULL,
 [Votes] Int NOT NULL,
 [IsDVDAvail] Nvarchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [IsAmazonAvail] Nvarchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [ImageID] Int NULL,
 [CertificateID] Int NULL,
 [TrailerID] Int NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
go

-- Create indexes for table Television.Program

CREATE INDEX [IX_Program_Channels_ChannelID] ON [Television].[Program] ([ChannelID])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship45] ON [Television].[Program] ([TechnicalID])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship46] ON [Television].[Program] ([ImageID])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship47] ON [Television].[Program] ([CertificateID])
 ON [PRIMARY]
go

CREATE INDEX [IX_Relationship48] ON [Television].[Program] ([TrailerID])
 ON [PRIMARY]
go

-- Add keys for table Television.Program

ALTER TABLE [Television].[Program] ADD CONSTRAINT [Pkey30] PRIMARY KEY ([EntityID])
 ON [PRIMARY]
go

-- Table Television.Season

CREATE TABLE [Television].[Season]
(
 [SeasonID] Int NOT NULL,
 [Year] Nvarchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 [EntityID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Television.Season

ALTER TABLE [Television].[Season] ADD CONSTRAINT [Season _Id] PRIMARY KEY ([SeasonID],[EntityID])
 ON [PRIMARY]
go

-- Table Television.ShowTime

CREATE TABLE [Television].[ShowTime]
(
 [ShowTimeID] Int NOT NULL,
 [EntityID] Int NOT NULL,
 [ProgramShowTime] Time(7) NOT NULL,
 [Date] Date NOT NULL,
 [channelID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Television.ShowTime

ALTER TABLE [Television].[ShowTime] ADD CONSTRAINT [Pkey28] PRIMARY KEY ([ShowTimeID],[EntityID])
 ON [PRIMARY]
go

-- Table Television.Video

CREATE TABLE [Television].[Video]
(
 [EntityID] Int NOT NULL,
 [ProgramVideoID] Int NOT NULL,
 [VideoLink] Nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
go

-- Add keys for table Television.Video

ALTER TABLE [Television].[Video] ADD CONSTRAINT [Pkey29] PRIMARY KEY ([ProgramVideoID],[EntityID])
 ON [PRIMARY]
go

-- Table Theater.BusinessEntity

CREATE TABLE [Theater].[BusinessEntity]
(
 [BusinessEntityID] Int NOT NULL,
 [TypeID] Int DEFAULT ((1)) NOT NULL
)
ON [PRIMARY]
go

-- Create indexes for table Theater.BusinessEntity

CREATE INDEX [IX_Relationship2] ON [Theater].[BusinessEntity] ([TypeID])
 ON [PRIMARY]
go

-- Add keys for table Theater.BusinessEntity

ALTER TABLE [Theater].[BusinessEntity] ADD CONSTRAINT [Pkey9] PRIMARY KEY ([BusinessEntityID])
 ON [PRIMARY]
go

-- Table Theater.BusinessEntityAddress

CREATE TABLE [Theater].[BusinessEntityAddress]
(
 [AddressID] Int NOT NULL,
 [BusinessEntityID] Int NOT NULL,
 [AddressTypeID] Int NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Theater.BusinessEntityAddress

ALTER TABLE [Theater].[BusinessEntityAddress] ADD CONSTRAINT [Pkey6] PRIMARY KEY ([AddressID],[BusinessEntityID],[AddressTypeID])
 ON [PRIMARY]
go

-- Table Theater.Facilities

CREATE TABLE [Theater].[Facilities]
(
 [BusinessEntityID] Int NOT NULL,
 [FacilitiesID] Int NOT NULL,
 [FacilitiesName] Nvarchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Theater.Facilities

ALTER TABLE [Theater].[Facilities] ADD CONSTRAINT [Pkey1] PRIMARY KEY ([BusinessEntityID],[FacilitiesID])
 ON [PRIMARY]
go

-- Table Theater.Theater

CREATE TABLE [Theater].[Theater]
(
 [BusinessEntityID] Int NOT NULL,
 [TheaterName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

EXEC sp_addextendedproperty 'MS_Description', 'Table to maintain all theater related attributes ', 'SCHEMA', 'Theater', 'TABLE', 'Theater', NULL, NULL
go

-- Add keys for table Theater.Theater

ALTER TABLE [Theater].[Theater] ADD CONSTRAINT [Pkey71] PRIMARY KEY ([BusinessEntityID])
 ON [PRIMARY]
go

-- Table Theater.TheaterMovie

CREATE TABLE [Theater].[TheaterMovie]
(
 [EntityID] Int NOT NULL,
 [BusinessEntityID] Int NOT NULL,
 [ScreenID] Int NOT NULL,
 [MovieStartDate] Date NOT NULL,
 [MovieEndDate] Date NULL
)
ON [PRIMARY]
go

-- Add keys for table Theater.TheaterMovie

ALTER TABLE [Theater].[TheaterMovie] ADD CONSTRAINT [Pkey34] PRIMARY KEY ([BusinessEntityID],[ScreenID],[EntityID])
 ON [PRIMARY]
go

-- Table Theater.TheaterScreen

CREATE TABLE [Theater].[TheaterScreen]
(
 [BusinessEntityID] Int NOT NULL,
 [ScreenID] Int NOT NULL,
 [ScreenName] Nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
ON [PRIMARY]
go

-- Add keys for table Theater.TheaterScreen

ALTER TABLE [Theater].[TheaterScreen] ADD CONSTRAINT [Pkey27] PRIMARY KEY ([ScreenID],[BusinessEntityID])
 ON [PRIMARY]
go

-- Create procedures section -------------------------------------------------

CREATE PROCEDURE CreateBackup @fpath nvarchar(max)
AS
BEGIN
SET NOCOUNT ON;
DECLARE @name VARCHAR(50) -- database name    
DECLARE @fName VARCHAR(256) -- filename for backup  
DECLARE @fDate VARCHAR(20) -- used for file name

-- specify filename format 
SELECT @fDate = CONVERT(VARCHAR(20),GETDATE(),112) + REPLACE(CONVERT(VARCHAR(20),GETDATE(),108),':','')
 
DECLARE backup_cursor CURSOR FOR  
SELECT name 
FROM master.dbo.sysdatabases 
WHERE name NOT IN ('master','model','msdb','tempdb','Verification DB - IMDB')  -- exclude these databases

 
OPEN backup_cursor   
FETCH NEXT FROM backup_cursor INTO @name   

 
WHILE @@FETCH_STATUS = 0   
BEGIN   
       SET @fName = @fpath + rtrim(@name) + '_' + @fDate + '.BAK'  
       BACKUP DATABASE @name TO DISK = @fName  

 
       FETCH NEXT FROM backup_cursor INTO @name   
END   
 
CLOSE backup_cursor   
DEALLOCATE backup_cursor
END
go

-- Get the Show timings Price and Theater Details (Screen Details and facilities)

CREATE PROCEDURE GET_MOVIE_THEATER_DETAILS

(@movie_name Char)

AS
BEGIN 

DECLARE @M_MovieName VARCHAR(4000)         /* Use -meta option Movies.Name%TYPE */
DECLARE @T_TheaterName VARCHAR(4000)       /* Use -meta option Theater.TheaterName%TYPE */
DECLARE @T_BusinessEntityID VARCHAR(4000)  /* Use -meta option Theater.BusinessEntityID%TYPE */
DECLARE @F_FacilitiesName VARCHAR(4000)    /* Use -meta option Facilities.FacilitiesName%TYPE */
DECLARE @TS_ScreenName VARCHAR(4000)       /* Use -meta option TheaterScreen.ScreenName%TYPE */
DECLARE @TS_ScreenID VARCHAR(4000)         /* Use -meta option TheaterScreen.ScreenID%TYPE */
DECLARE @M_EntityID VARCHAR(4000)          /* Use -meta option Movies.EntityID%TYPE */
DECLARE @MS_Showtime VARCHAR(4000)         /* Use -meta option MovieShowTime.Showtime%TYPE */
DECLARE @MS_Status VARCHAR(4000)           /* Use -meta option MovieShowTime.Status%TYPE */
DECLARE @S_ShowTimeID VARCHAR(4000)        /* Use -meta option ShowTimeCategory.ShowTimeID%TYPE */
DECLARE @S_Price VARCHAR(4000)             /* Use -meta option ShowTimeCategory.Price%TYPE */


DECLARE C1 CURSOR LOCAL FOR
select  a.name from movies.movies as a where a.name = @M_MovieName

DECLARE C2 CURSOR LOCAL FOR
select t.TheaterName,f.facilitiesName from Theater.Theater as  t
join Theater.facilities as f 
on f.BUSINESSENTITYID = t.BUSINESSENTITYID

DECLARE C3 CURSOR LOCAL FOR
select m.showtime, s.price, m.STATUS,t.screenname from movies.showtimecategory s
join movies.movieshowtime m
on s.showtimeid = m.showtimeid
join Theater.TheaterScreen t
on m.screenID=s.screenID
where s.entityID = m.entityID
and s.screenid = t.screenid

--DECLARE c1 CURSOR for select a.name from Movies.Movies as a where a.name = @movie_name
OPEN c1 
FETCH c1 INTO @M_MovieName
WHILE @@FETCH_STATUS=0
BEGIN
SET @M_MovieName = @movie_name

PRINT '***MOVIE THEATER DETAILS***'

PRINT 'Movie Name: ' +ISNULL(RTRIM(@M_MovieName), '')+ isnull(char(10), '')




--DECLARE  c2 cursor for select b.TheaterName ,c.facilitiesName from Theater.Theater as b join Theater.Facilities as c
--on c.BusinessEntityID = b.BusinessEntityID 
OPEN c2 
FETCH c2 into @T_theatername ,@F_facilitiesname
WHILE @@FETCH_STATUS=0
BEGIN
--SET @T_theatername = t.theatername;
--SET @F_facilitiesname = theaterdata.facilitiesname;

PRINT 'Theater Name: ' + ISNULL(RTRIM(@T_TheaterName), '')+ isnull(char(10), '')+
'Facilities: ' +ISNULL(@F_FacilitiesName, '')

--DECLARE details CURSOR for C3
OPEN details;
FETCH details INTO @MS_Showtime,
				   @S_Price,
				   @MS_Status,
				   @TS_ScreenName

WHILE @@FETCH_STATUS=0
BEGIN
--SET @MS_Showtime = details.showtime;
--SET @S_Price = details.price;
--SET @MS_Status = details.status;
--SET @TS_ScreenName =.screenname;

PRINT 'Screen: ' + ISNULL(@TS_ScreenName, '') + isnull(char(10), '')+
'Status of Movie: ' + ISNULL(@MS_Status, '')+ isnull(char(10), '')+
'Show Timing: ' + ISNULL(@MS_Showtime, '') + isnull(char(10), '')+
'Prices: ' + ISNULL(@S_Price, '') + isnull(char(10), '')

--FETCH details INTO
END
CLOSE details
--DEALLOCATE details
--FETCH theaterdata INTO;
END
CLOSE c2
--DEALLOCATE c2 
--FETCH moviedata INTO;
END
CLOSE c1
--DEALLOCATE c1
END
go

Create PROCEDURE GET_MOVIE_THEATER_DETAILS1

(@movie_name Char)

AS
BEGIN 

DECLARE @M_MovieName VARCHAR(4000)         /* Use -meta option Movies.Name%TYPE */
DECLARE @T_TheaterName VARCHAR(4000)       /* Use -meta option Theater.TheaterName%TYPE */
DECLARE @T_BusinessEntityID VARCHAR(4000)  /* Use -meta option Theater.BusinessEntityID%TYPE */
DECLARE @F_FacilitiesName VARCHAR(4000)    /* Use -meta option Facilities.FacilitiesName%TYPE */
DECLARE @TS_ScreenName VARCHAR(4000)       /* Use -meta option TheaterScreen.ScreenName%TYPE */
DECLARE @TS_ScreenID VARCHAR(4000)         /* Use -meta option TheaterScreen.ScreenID%TYPE */
DECLARE @M_EntityID VARCHAR(4000)          /* Use -meta option Movies.EntityID%TYPE */
DECLARE @MS_Showtime VARCHAR(4000)         /* Use -meta option MovieShowTime.Showtime%TYPE */
DECLARE @MS_Status VARCHAR(4000)           /* Use -meta option MovieShowTime.Status%TYPE */
DECLARE @S_ShowTimeID VARCHAR(4000)        /* Use -meta option ShowTimeCategory.ShowTimeID%TYPE */
DECLARE @S_Price VARCHAR(4000)             /* Use -meta option ShowTimeCategory.Price%TYPE */


DECLARE C1 CURSOR LOCAL FOR
select  a.name from movies.movies as a where a.name = @M_MovieName

DECLARE C2 CURSOR LOCAL FOR
select t.TheaterName,f.facilitiesName from Theater.Theater as  t
join Theater.facilities as f 
on f.BUSINESSENTITYID = t.BUSINESSENTITYID

DECLARE C3 CURSOR LOCAL FOR
select m.showtime, s.price, m.STATUS,t.screenname from movies.showtimecategory s
join movies.movieshowtime m
on s.showtimeid = m.showtimeid
join Theater.TheaterScreen t
on m.screenID=s.screenID
where s.entityID = m.entityID
and s.screenid = t.screenid

--DECLARE c1 CURSOR for select a.name from Movies.Movies as a where a.name = @movie_name
OPEN c1 
FETCH c1 INTO @M_MovieName
WHILE @@FETCH_STATUS=0
BEGIN
SET @M_MovieName = @movie_name

SELECT '***MOVIE THEATER DETAILS***'
SELECT 'Movie Name: ' +ISNULL(RTRIM(@M_MovieName), '')+ isnull(char(10), '')

--DECLARE  c2 cursor for select b.TheaterName ,c.facilitiesName from Theater.Theater as b join Theater.Facilities as c
--on c.BusinessEntityID = b.BusinessEntityID 
OPEN c2 
FETCH c2 into @T_theatername ,@F_facilitiesname
WHILE @@FETCH_STATUS=0
BEGIN
--SET @T_theatername = t.theatername;
--SET @F_facilitiesname = theaterdata.facilitiesname;

SELECT 'Theater Name: ' + ISNULL(RTRIM(@T_TheaterName), '')+ isnull(char(10), '')+
'Facilities: ' +ISNULL(@F_FacilitiesName, '')

--DECLARE details CURSOR for C3
OPEN details;
FETCH details INTO @MS_Showtime,
				   @S_Price,
				   @MS_Status,
				   @TS_ScreenName

WHILE @@FETCH_STATUS=0
BEGIN
--SET @MS_Showtime = details.showtime;
--SET @S_Price = details.price;
--SET @MS_Status = details.status;
--SET @TS_ScreenName =.screenname;

select 'Screen: ' + ISNULL(@TS_ScreenName, '') + isnull(char(10), '')+
'Status of Movie: ' + ISNULL(@MS_Status, '')+ isnull(char(10), '')+
'Show Timing: ' + ISNULL(@MS_Showtime, '') + isnull(char(10), '')+
'Prices: ' + ISNULL(@S_Price, '') + isnull(char(10), '')

--FETCH details INTO
END
CLOSE details
--DEALLOCATE details
--FETCH theaterdata INTO;
END
CLOSE c2
--DEALLOCATE c2 
--FETCH moviedata INTO;
END
CLOSE c1
--DEALLOCATE c1
END
go

CREATE PROCEDURE MovieSearch @searchByMovieName nvarchar(50) 
AS
BEGIN
      SET NOCOUNT ON;
 
      --DECLARE THE VARIABLES FOR HOLDING DATA.
      DECLARE 
	  			@MovieName VARCHAR(100),
				@TheaterName VARCHAR(100), 
				@ScreenName VARCHAR(100),
				@ShowTime Time,
				@Price Money 

 
      --DECLARE AND SET COUNTER.
      DECLARE @Counter INT, 
			  @rowcount INT
			  set @rowCount = 0
      SET @Counter = 1
	 select @rowcount = count(*)
	 from Movies.Movies as a
join Theater.TheaterMovie as b 
on a.EntityID = b.EntityID
join Theater.Theater as c 
on b.BusinessEntityID = c.BusinessEntityID
join Theater.TheaterScreen as d 
on c.BusinessEntityID = d.BusinessEntityID 
join Movies.MovieShowTime as e 
on d.BusinessEntityID = e.BusinessEntityID 
join Movies.ShowTimeCategory as f 
on e.BusinessEntityID = f.BusinessEntityID
and e.ScreenID= f.ScreenID
and e.ShowTimeID = f.ShowTimeID
and e.Status = 'Active'
where a.Name = @searchByMovieName
group by a.EntityID
if (@rowcount = 0 )
Begin 
Print 'No Match found for the selection criteria'+ @searchByMovieName
Print 'Processing Terminated'
Return
End

      --DECLARE THE CURSOR FOR A QUERY.
      DECLARE Moviescr CURSOR READ_ONLY
      FOR select 
	   a.Name,
	   c.TheaterName, 
	   d.ScreenName,
	   e.ShowTime,
	   f.Price
from Movies.Movies as a
join Theater.TheaterMovie as b 
on a.EntityID = b.EntityID
join Theater.Theater as c 
on b.BusinessEntityID = c.BusinessEntityID
join Theater.TheaterScreen as d 
on c.BusinessEntityID = d.BusinessEntityID 
join Movies.MovieShowTime as e 
on d.BusinessEntityID = e.BusinessEntityID 
join Movies.ShowTimeCategory as f 
on e.BusinessEntityID = f.BusinessEntityID
and e.ScreenID= f.ScreenID
and e.ShowTimeID = f.ShowTimeID
and e.Status = 'Active'
where a.Name = @searchByMovieName
order by a.Name,c.TheaterName
-- End of New Code 
 
      --OPEN CURSOR.
      OPEN Moviescr
      --FETCH THE RECORD INTO THE VARIABLES.
      FETCH NEXT FROM Moviescr INTO
      @MovieName , @TheaterName , 
	  @ScreenName ,@ShowTime,
	  @Price
 
	  	
      --LOOP UNTIL RECORDS ARE AVAILABLE.
      WHILE @@FETCH_STATUS = 0
      BEGIN
             if @counter = 1 
			 print 'Movie Name:' + @MovieName + char(13)
		
             --PRINT CURRENT RECORD.
             Print  @TheaterName + CHAR(9) + CHAR(9) + CHAR(9) +
					@ScreenName + CHAR(9) + CHAR(9) + CHAR(9)+ CAST(@ShowTime as VARCHAR(10)) + CHAR(9) + CHAR(9) + CHAR(9) +
					CAST (@Price as VARCHAR(10))

             --INCREMENT COUNTER.
             SET @Counter = @Counter + 1
 
             --FETCH THE NEXT RECORD INTO THE VARIABLES.
             FETCH NEXT FROM Moviescr INTO
      @MovieName , @TheaterName , 
	  @ScreenName ,@ShowTime,
	  @Price
      END
 
      --CLOSE THE CURSOR.
      CLOSE Moviescr
      DEALLOCATE Moviescr 
END
go

-- Create functions section -------------------------------------------------

CREATE FUNCTION CalculateTotalTurnOver
(@Movie_name Char(50))
RETURNS float 
AS
BEGIN
DECLARE @TotalAmount float
Declare @newTotal float
Declare @str nvarchar
set @newTotal = 0.0

select @totalAmount = max(weekendcollections * weeknumber) from BoxOffice.weekboxoffice
where entityID in (select entityID from  Movies.Movies where  name=@Movie_name)
set @newTotal = @TotalAmount
Return(@newTotal)
END;
go

create function TopPolls (@pollid int)
	returns table 
	as
	return (select top 5  b.Name, a.PollID, sum(a.voteCount) as NetVotes
	from Community.PollsDetails as a
	join Community.Polls as b
	on b.PollID = a.PollID
	where b.PollID = @pollid
	group by  b.Name,a.PollID  
	order by NetVotes desc
)
go

-- Create relationships section ------------------------------------------------- 

ALTER TABLE [BoxOffice].[BoxOffice] ADD CONSTRAINT [BoxOffice_Country_CountryID] FOREIGN KEY ([CountryID]) REFERENCES [ContactDetails].[Country] ([CountryRegionCode]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [BoxOffice].[BoxOffice] ADD CONSTRAINT [BoxOffice_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [BoxOffice].[WeekBoxOffice] ADD CONSTRAINT [WeekBoxOffice_BoxOffice_entityID] FOREIGN KEY ([BoxOfficeID], [EntityID]) REFERENCES [BoxOffice].[BoxOffice] ([BoxOfficeID], [EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Community].[Polls] ADD CONSTRAINT [Polls_BusineesEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Theater].[BusinessEntity] ([BusinessEntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Community].[PollsDetails] ADD CONSTRAINT [PollDetails_Polls_PollID] FOREIGN KEY ([PollID]) REFERENCES [Community].[Polls] ([PollID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Community].[PollsDetails] ADD CONSTRAINT [PollsDetails_Image_ImageID] FOREIGN KEY ([ImageID]) REFERENCES [Events].[Image] ([ImageID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Community].[PollsResponse] ADD CONSTRAINT [PollResponse_PollDetails_PollChoiceID] FOREIGN KEY ([PollID], [ChoiceID]) REFERENCES [Community].[PollsDetails] ([PollID], [ChoiceID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Community].[PollsResponse] ADD CONSTRAINT [PollsResponse_BusineesEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Theater].[BusinessEntity] ([BusinessEntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ContactDetails].[Address] ADD CONSTRAINT [Address_City_CityID] FOREIGN KEY ([CityID]) REFERENCES [ContactDetails].[City] ([CityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ContactDetails].[City] ADD CONSTRAINT [City_StateProvince_StateProvinceID] FOREIGN KEY ([StateProvinceID]) REFERENCES [ContactDetails].[StateProvince] ([StateProvinceID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ContactDetails].[EmailAddress] ADD CONSTRAINT [EmailAddress_BusineesEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Theater].[BusinessEntity] ([BusinessEntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ContactDetails].[PhoneNumber] ADD CONSTRAINT [PhoneNumber_BusineesEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Theater].[BusinessEntity] ([BusinessEntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ContactDetails].[PhoneNumber] ADD CONSTRAINT [PhoneNumber_PhoneType_PhoneNumberTypeID] FOREIGN KEY ([PhoneNumberTypeID]) REFERENCES [ContactDetails].[PhoneType] ([PhoneNumberTypeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [ContactDetails].[StateProvince] ADD CONSTRAINT [StateProvince_Country_CountryRegionCode] FOREIGN KEY ([CountryRegionCode]) REFERENCES [ContactDetails].[Country] ([CountryRegionCode]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[Awards] ADD CONSTRAINT [Awards_Image_ImageID] FOREIGN KEY ([ImageID]) REFERENCES [Events].[Image] ([ImageID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[CastCrew] ADD CONSTRAINT [CastCrew_CastCrewType_TypeID] FOREIGN KEY ([TypeID]) REFERENCES [Events].[CastCrewType] ([TypeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[CastCrew] ADD CONSTRAINT [CastCrew_Image_ImageID] FOREIGN KEY ([ImageID]) REFERENCES [Events].[Image] ([ImageID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[Entity] ADD CONSTRAINT [Entity_BusinessEntityType_TypeID] FOREIGN KEY ([TypeID]) REFERENCES [Events].[Type] ([TypeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[EntityDetails] ADD CONSTRAINT [EntityDetails_Country_CountryRegionCode] FOREIGN KEY ([CountryRegionCode]) REFERENCES [ContactDetails].[Country] ([CountryRegionCode]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[EntityDetails] ADD CONSTRAINT [EntityDetails_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[GenreEntity] ADD CONSTRAINT [GenreEntity_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[GenreEntity] ADD CONSTRAINT [GenreEntity_Genre_GenreID] FOREIGN KEY ([GenreID]) REFERENCES [Events].[GenreDetails] ([GenreID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[IMDBUser] ADD CONSTRAINT [IMDBUser_UserREgDetails_RegID] FOREIGN KEY ([REGID]) REFERENCES [Events].[UserRegDetails] ([RegID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[IMDBUser] ADD CONSTRAINT [User_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Theater].[BusinessEntity] ([BusinessEntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[MoviesCastCrew] ADD CONSTRAINT [MoviesCastCrew_CastCrew_CastCrewID] FOREIGN KEY ([CastCrewID], [TypeID]) REFERENCES [Events].[CastCrew] ([CastCrewID], [TypeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[MoviesCastCrew] ADD CONSTRAINT [MoviesCastCrew_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[MoviesCastCrew] ADD CONSTRAINT [MoviesCastCrew_News_NewsID] FOREIGN KEY ([NewsID]) REFERENCES [News].[News] ([NewsID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[MoviesCastCrew] ADD CONSTRAINT [MoviesCastCrew_Polls_PollID] FOREIGN KEY ([PollID]) REFERENCES [Community].[Polls] ([PollID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[MoviesCastCrew] ADD CONSTRAINT [MoviesDirector_Awards_AwardID] FOREIGN KEY ([AwardID]) REFERENCES [Events].[Awards] ([AwardID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[Production] ADD CONSTRAINT [Production_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[Review] ADD CONSTRAINT [Review_BusineesEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Theater].[BusinessEntity] ([BusinessEntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Events].[Review] ADD CONSTRAINT [Review_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies].[FilmLocation] ADD CONSTRAINT [FilmLocation_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies].[FilmLocation] ADD CONSTRAINT [FilmLocationDetails_FilmLocation_FilmLocationID] FOREIGN KEY ([FilmLocationID]) REFERENCES [Movies].[FilmLocationDetails] ([FilmLocationID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies].[Movies] ADD CONSTRAINT [Movies_Awards_AwardID] FOREIGN KEY ([AwardID]) REFERENCES [Events].[Awards] ([AwardID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies].[Movies] ADD CONSTRAINT [Movies_Certificate_CertificateID] FOREIGN KEY ([CertificateID]) REFERENCES [Events].[Certificate] ([CertificateID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies].[Movies] ADD CONSTRAINT [Movies_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies].[Movies] ADD CONSTRAINT [Movies_Image_ImageID] FOREIGN KEY ([ImageID]) REFERENCES [Events].[Image] ([ImageID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies].[Movies] ADD CONSTRAINT [Movies_Technical_EntityID] FOREIGN KEY ([TechnicalID]) REFERENCES [Events].[Technical] ([TechnicalID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies].[Movies] ADD CONSTRAINT [Movies_Trailer_TrailerID] FOREIGN KEY ([TrailerID]) REFERENCES [Events].[Trailer] ([TrailerID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies].[MovieShowTime] ADD CONSTRAINT [MovieShowTime_TheaterMovie_BusinessEntityID] FOREIGN KEY ([BusinessEntityID], [ScreenID], [EntityID]) REFERENCES [Theater].[TheaterMovie] ([BusinessEntityID], [ScreenID], [EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies].[ShowTimeCategory] ADD CONSTRAINT [ShowTimeCategory_Category_CategoryID] FOREIGN KEY ([CategoryID]) REFERENCES [Events].[Category] ([CategoryID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies].[ShowTimeCategory] ADD CONSTRAINT [ShowTimeCategory_MovieShowTime_BusinessEntityID] FOREIGN KEY ([ShowTimeID], [BusinessEntityID], [ScreenID], [EntityID]) REFERENCES [Movies].[MovieShowTime] ([ShowTimeID], [BusinessEntityID], [ScreenID], [EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News].[News] ADD CONSTRAINT [News_Image_ImageID] FOREIGN KEY ([ImageID]) REFERENCES [Events].[Image] ([ImageID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News].[News] ADD CONSTRAINT [NewsCategoryID] FOREIGN KEY ([NewsCategoryID]) REFERENCES [News].[NewsCategory] ([NewsCategoryID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News].[NewsCategoryBR] ADD CONSTRAINT [NewCategoryBR_News_NewsID] FOREIGN KEY ([NewsID]) REFERENCES [News].[News] ([NewsID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News].[NewsCategoryBR] ADD CONSTRAINT [NewsCategoryBR_NewsCategory_NewsCategoryID] FOREIGN KEY ([NewsCategoryID]) REFERENCES [News].[NewsCategory] ([NewsCategoryID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News].[NewsSourceBR] ADD CONSTRAINT [NewsSourceBR_News] FOREIGN KEY ([NewsID]) REFERENCES [News].[News] ([NewsID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News].[NewsSourceBR] ADD CONSTRAINT [NewsSourceBR_NewsSource] FOREIGN KEY ([SourceID]) REFERENCES [News].[NewsSource] ([SourceID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News].[ReporterNews] ADD CONSTRAINT [NewReporter_News_NewsID] FOREIGN KEY ([NewsID]) REFERENCES [News].[News] ([NewsID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News].[ReporterNews] ADD CONSTRAINT [ReporterNews_News_ReporterID] FOREIGN KEY ([ReporterID]) REFERENCES [News].[Reporter] ([ReporterID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [SoundTrack].[SoundTrack] ADD CONSTRAINT [Soundtrack_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [SoundTrack].[SoundTrackCastCrew] ADD CONSTRAINT [SoundTrackCastCrew_Soundtrack_SoundtrackID] FOREIGN KEY ([SoundTrackID], [EntityID]) REFERENCES [SoundTrack].[SoundTrack] ([SoundTrackID], [EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [SoundTrack].[SoundTrackCastCrew] ADD CONSTRAINT [SoundTrackCastCrewt_CastCrew_CastCrewID] FOREIGN KEY ([CastCrewID], [TypeID]) REFERENCES [Events].[CastCrew] ([CastCrewID], [TypeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [SoundTrack].[SoundTrackCastCrew] ADD CONSTRAINT [SoundTrackLyricist_Awards_AwardID] FOREIGN KEY ([AwardID]) REFERENCES [Events].[Awards] ([AwardID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[Episode] ADD CONSTRAINT [Episode_Season_SeasonID] FOREIGN KEY ([SeasonID], [EntityID]) REFERENCES [Television].[Season] ([SeasonID], [EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[ProgCastCrew] ADD CONSTRAINT [ProgCastCrew_CastCrew_CastCrewID] FOREIGN KEY ([CastCrewID], [TypeID]) REFERENCES [Events].[CastCrew] ([CastCrewID], [TypeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[ProgCastCrew] ADD CONSTRAINT [ProgCastCrew_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[ProgCastCrew] ADD CONSTRAINT [ProgramCastCrew_Awards_AwardsID] FOREIGN KEY ([AwardID]) REFERENCES [Events].[Awards] ([AwardID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[Program] ADD CONSTRAINT [Program_Certificate_CertificateID] FOREIGN KEY ([CertificateID]) REFERENCES [Events].[Certificate] ([CertificateID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[Program] ADD CONSTRAINT [Program_Channels_ChannelID] FOREIGN KEY ([ChannelID]) REFERENCES [Television].[Channels] ([ChannelID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[Program] ADD CONSTRAINT [Program_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[Program] ADD CONSTRAINT [Program_Image_ImgaeID] FOREIGN KEY ([ImageID]) REFERENCES [Events].[Image] ([ImageID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[Program] ADD CONSTRAINT [Program_Technical_TechnicalID] FOREIGN KEY ([TechnicalID]) REFERENCES [Events].[Technical] ([TechnicalID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[Program] ADD CONSTRAINT [Program_Trailer_TrailerID] FOREIGN KEY ([TrailerID]) REFERENCES [Events].[Trailer] ([TrailerID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[Season] ADD CONSTRAINT [Season_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[ShowTime] ADD CONSTRAINT [ChannelID] FOREIGN KEY ([channelID]) REFERENCES [Television].[Channels] ([ChannelID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[ShowTime] ADD CONSTRAINT [ShowTime_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Television].[Video] ADD CONSTRAINT [Video_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Theater].[BusinessEntity] ADD CONSTRAINT [BusinessEntity_BusinessEntityType_TypeID] FOREIGN KEY ([TypeID]) REFERENCES [Events].[Type] ([TypeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Theater].[BusinessEntityAddress] ADD CONSTRAINT [BusineeEntityAddress_BusineesEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Theater].[BusinessEntity] ([BusinessEntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Theater].[BusinessEntityAddress] ADD CONSTRAINT [BusinessEntityAddress_Address_AddressID] FOREIGN KEY ([AddressID]) REFERENCES [ContactDetails].[Address] ([AddressID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Theater].[BusinessEntityAddress] ADD CONSTRAINT [BusinessEntityAddress_AddressType_AddressTypeID] FOREIGN KEY ([AddressTypeID]) REFERENCES [ContactDetails].[AddressType] ([AddressTypeID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Theater].[Facilities] ADD CONSTRAINT [Facilities_BusineesEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Theater].[BusinessEntity] ([BusinessEntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Theater].[Theater] ADD CONSTRAINT [Theater_BusinessEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Theater].[BusinessEntity] ([BusinessEntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Theater].[TheaterMovie] ADD CONSTRAINT [TheaterMovie_Entity_EntityID] FOREIGN KEY ([EntityID]) REFERENCES [Events].[Entity] ([EntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Theater].[TheaterMovie] ADD CONSTRAINT [TheaterMovie_TheaterScreen_ScreenID] FOREIGN KEY ([ScreenID], [BusinessEntityID]) REFERENCES [Theater].[TheaterScreen] ([ScreenID], [BusinessEntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Theater].[TheaterScreen] ADD CONSTRAINT [TheaterScreen_BusineesEntity_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Theater].[BusinessEntity] ([BusinessEntityID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

-- Create roles section -------------------------------------------------

CREATE ROLE [db_accessadmin]
go
CREATE ROLE [db_backupoperator]
go
CREATE ROLE [db_datareader]
go
CREATE ROLE [db_datawriter]
go
CREATE ROLE [db_ddladmin]
go
CREATE ROLE [db_denydatareader]
go
CREATE ROLE [db_denydatawriter]
go
CREATE ROLE [db_owner]
go
CREATE ROLE [db_securityadmin]
go
CREATE ROLE [public]
go

-- Grant permissions section -------------------------------------------------

ALTER ROLE [db_owner] ADD MEMBER [dbo]
go

