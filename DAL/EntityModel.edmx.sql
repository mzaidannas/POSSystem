
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/01/2017 14:12:19
-- Generated from EDMX file: D:\My Documents\Visual Studio 2015\Projects\Web Development\POSSystem\DAL\EntityModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [POSDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Category_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Category] DROP CONSTRAINT [FK_Category_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_Category_Company]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Category] DROP CONSTRAINT [FK_Category_Company];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_Deal_Company]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Deal] DROP CONSTRAINT [FK_Deal_Company];
GO
IF OBJECT_ID(N'[dbo].[FK_DealProduct_Deal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DealProduct] DROP CONSTRAINT [FK_DealProduct_Deal];
GO
IF OBJECT_ID(N'[dbo].[FK_DealProduct_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DealProduct] DROP CONSTRAINT [FK_DealProduct_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_Product_Company]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK_Product_Company];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductCategory_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_Category];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductCategory_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductImage_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductImage] DROP CONSTRAINT [FK_ProductImage_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductStock_Company]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductStock] DROP CONSTRAINT [FK_ProductStock_Company];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductStock_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductStock] DROP CONSTRAINT [FK_ProductStock_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductStock_Supplier]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductStock] DROP CONSTRAINT [FK_ProductStock_Supplier];
GO
IF OBJECT_ID(N'[dbo].[FK_Sale_Company]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sale] DROP CONSTRAINT [FK_Sale_Company];
GO
IF OBJECT_ID(N'[dbo].[FK_Sale_SaleProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sale] DROP CONSTRAINT [FK_Sale_SaleProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_Sale_Status]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sale] DROP CONSTRAINT [FK_Sale_Status];
GO
IF OBJECT_ID(N'[dbo].[FK_Sale_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sale] DROP CONSTRAINT [FK_Sale_User];
GO
IF OBJECT_ID(N'[dbo].[FK_SaleProduct_ProductStock]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SaleProduct] DROP CONSTRAINT [FK_SaleProduct_ProductStock];
GO
IF OBJECT_ID(N'[dbo].[FK_SaleProduct_Sale]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SaleProduct] DROP CONSTRAINT [FK_SaleProduct_Sale];
GO
IF OBJECT_ID(N'[dbo].[FK_Status_Company]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Status] DROP CONSTRAINT [FK_Status_Company];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[Category]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Category];
GO
IF OBJECT_ID(N'[dbo].[Company]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Company];
GO
IF OBJECT_ID(N'[dbo].[Country]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Country];
GO
IF OBJECT_ID(N'[dbo].[Deal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Deal];
GO
IF OBJECT_ID(N'[dbo].[DealProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DealProduct];
GO
IF OBJECT_ID(N'[dbo].[ErrorLog]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ErrorLog];
GO
IF OBJECT_ID(N'[dbo].[Product]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product];
GO
IF OBJECT_ID(N'[dbo].[ProductCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductCategory];
GO
IF OBJECT_ID(N'[dbo].[ProductImage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductImage];
GO
IF OBJECT_ID(N'[dbo].[ProductStock]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductStock];
GO
IF OBJECT_ID(N'[dbo].[Sale]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sale];
GO
IF OBJECT_ID(N'[dbo].[SaleProduct]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SaleProduct];
GO
IF OBJECT_ID(N'[dbo].[Status]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status];
GO
IF OBJECT_ID(N'[dbo].[Supplier]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Supplier];
GO
IF OBJECT_ID(N'[dbo].[TransactionLog]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TransactionLog];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Parent_Id] int  NULL,
    [Company_Id] int  NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Url] nvarchar(150)  NOT NULL,
    [Level] int  NOT NULL,
    [Description] nvarchar(500)  NULL,
    [CreateBy] nvarchar(50)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateBy] nvarchar(50)  NULL,
    [UpdateDate] datetime  NULL,
    [IsActive] bit  NULL
);
GO

-- Creating table 'Companies'
CREATE TABLE [dbo].[Companies] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Country_Id] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Slogon] nvarchar(50)  NULL,
    [City] nvarchar(50)  NULL,
    [Address] nvarchar(150)  NULL,
    [Phone] nvarchar(20)  NULL,
    [Fax] nvarchar(20)  NULL,
    [Email] nvarchar(50)  NULL,
    [Website] nvarchar(50)  NULL,
    [LogoUrl] nvarchar(50)  NULL,
    [IsActive] bit  NULL
);
GO

-- Creating table 'Countries'
CREATE TABLE [dbo].[Countries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Currency] nvarchar(50)  NULL,
    [CurrencySymbol] nvarchar(1)  NULL,
    [Code] nvarchar(15)  NULL,
    [TimeZoneHour] int  NOT NULL,
    [CreateBy] nvarchar(50)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateBy] nvarchar(50)  NULL,
    [UpdateDate] datetime  NULL,
    [IsActive] bit  NOT NULL
);
GO

-- Creating table 'Deals'
CREATE TABLE [dbo].[Deals] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Company_Id] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Description] nvarchar(500)  NULL,
    [Quantity] float  NOT NULL,
    [Price] float  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [CreateBy] nvarchar(50)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateBy] nvarchar(50)  NULL,
    [UpdateDate] datetime  NULL,
    [IsActive] bit  NULL
);
GO

-- Creating table 'DealProducts'
CREATE TABLE [dbo].[DealProducts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Deal_Id] int  NOT NULL,
    [Product_Id] int  NULL,
    [Quantity] float  NOT NULL,
    [SortOrder] int  NOT NULL
);
GO

-- Creating table 'ErrorLogs'
CREATE TABLE [dbo].[ErrorLogs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [User_Id] int  NOT NULL,
    [InnerException] nvarchar(500)  NULL,
    [Message] nvarchar(150)  NOT NULL,
    [Url] nvarchar(150)  NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Company_Id] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [ShortDescription] nvarchar(150)  NULL,
    [LongDescription] nvarchar(500)  NULL,
    [Barcode] nvarchar(50)  NULL,
    [Url] nvarchar(150)  NOT NULL,
    [ReorderLevel] float  NULL,
    [PriceDepreciation] float  NOT NULL,
    [CreateBy] nvarchar(50)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateBy] nvarchar(50)  NULL,
    [UpdateDate] datetime  NULL,
    [IsActive] bit  NOT NULL
);
GO

-- Creating table 'ProductCategories'
CREATE TABLE [dbo].[ProductCategories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Product_Id] int  NOT NULL,
    [Category_Id] int  NOT NULL
);
GO

-- Creating table 'ProductImages'
CREATE TABLE [dbo].[ProductImages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Product_Id] int  NOT NULL,
    [Url] nvarchar(150)  NOT NULL,
    [SortOrder] int  NOT NULL
);
GO

-- Creating table 'ProductStocks'
CREATE TABLE [dbo].[ProductStocks] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Product_Id] int  NOT NULL,
    [Supplier_Id] int  NOT NULL,
    [Company_Id] int  NOT NULL,
    [Description] nvarchar(500)  NULL,
    [Quantity] float  NOT NULL,
    [PricePerUnit] float  NOT NULL,
    [CostPerUnit] float  NULL,
    [SalePrice] float  NOT NULL,
    [PurchaseDate] datetime  NOT NULL,
    [PurchaseInvoiceNumber] nvarchar(50)  NOT NULL,
    [BatchNumber] int  NULL,
    [CreateBy] nvarchar(50)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateBy] nvarchar(50)  NULL,
    [UpdateDate] datetime  NULL,
    [IsActive] bit  NULL
);
GO

-- Creating table 'Sales'
CREATE TABLE [dbo].[Sales] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Company_Id] int  NOT NULL,
    [Status_Id] int  NOT NULL,
    [User_Id] int  NOT NULL,
    [SaleProduct_Id] int  NOT NULL,
    [CustomerName] nvarchar(50)  NOT NULL,
    [CustomerAddress] nvarchar(500)  NOT NULL,
    [CustomerNumber] nvarchar(20)  NOT NULL,
    [CustomerEmail] nvarchar(20)  NULL,
    [City] nvarchar(50)  NULL,
    [GrossTotal] float  NOT NULL,
    [Discount] float  NOT NULL,
    [Payable] float  NOT NULL,
    [Paid] float  NOT NULL,
    [Returned] float  NOT NULL,
    [BarcodeInvoice] nvarchar(50)  NULL,
    [Details] nvarchar(500)  NULL,
    [CreateBy] nvarchar(50)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateBy] nvarchar(50)  NULL,
    [UpdateDate] datetime  NULL,
    [IsActive] bit  NULL
);
GO

-- Creating table 'SaleProducts'
CREATE TABLE [dbo].[SaleProducts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Sale_Id] int  NOT NULL,
    [ProductStock_Id] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Quantity] float  NOT NULL,
    [SalePrice] float  NOT NULL,
    [Discount] float  NOT NULL,
    [DiscountedPrice] float  NOT NULL,
    [CreateBy] nvarchar(50)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateBy] nvarchar(50)  NULL,
    [UpdateDate] datetime  NULL,
    [IsActive] bit  NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Company_Id] int  NOT NULL,
    [Name] nvarchar(50)  NULL,
    [Type] nvarchar(50)  NULL,
    [CreateBy] nvarchar(50)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateBy] nvarchar(50)  NULL,
    [UpdateDate] datetime  NULL,
    [IsActive] bit  NOT NULL
);
GO

-- Creating table 'Suppliers'
CREATE TABLE [dbo].[Suppliers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Company_Id] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Address] nvarchar(500)  NOT NULL,
    [PhoneNumber] nvarchar(20)  NOT NULL,
    [MobileNumber] nvarchar(20)  NULL,
    [CNIC] nvarchar(20)  NULL,
    [Description] nvarchar(500)  NULL,
    [CreateBy] nvarchar(50)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateBy] nvarchar(50)  NULL,
    [UpdateDate] datetime  NULL,
    [IsActive] bit  NULL
);
GO

-- Creating table 'TransactionLogs'
CREATE TABLE [dbo].[TransactionLogs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [User_Id] int  NOT NULL,
    [RecordId] int  NOT NULL,
    [Action] nvarchar(50)  NOT NULL,
    [TableName] nvarchar(50)  NULL,
    [Detail] nvarchar(150)  NULL,
    [CreateDate] datetime  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Company_Id] int  NOT NULL,
    [Status_Id] int  NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [MiddleName] nvarchar(50)  NULL,
    [LastName] nvarchar(50)  NOT NULL,
    [Address] nvarchar(500)  NOT NULL,
    [PhoneNumber] nvarchar(20)  NOT NULL,
    [MobileNumber] nvarchar(20)  NULL,
    [CNIC] nvarchar(20)  NULL,
    [City] nvarchar(50)  NULL,
    [Details] nvarchar(500)  NULL,
    [CreateBy] nvarchar(50)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateBy] nvarchar(50)  NULL,
    [UpdateDate] datetime  NULL,
    [IsActive] bit  NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Companies'
ALTER TABLE [dbo].[Companies]
ADD CONSTRAINT [PK_Companies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Countries'
ALTER TABLE [dbo].[Countries]
ADD CONSTRAINT [PK_Countries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Deals'
ALTER TABLE [dbo].[Deals]
ADD CONSTRAINT [PK_Deals]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DealProducts'
ALTER TABLE [dbo].[DealProducts]
ADD CONSTRAINT [PK_DealProducts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ErrorLogs'
ALTER TABLE [dbo].[ErrorLogs]
ADD CONSTRAINT [PK_ErrorLogs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductCategories'
ALTER TABLE [dbo].[ProductCategories]
ADD CONSTRAINT [PK_ProductCategories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductImages'
ALTER TABLE [dbo].[ProductImages]
ADD CONSTRAINT [PK_ProductImages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductStocks'
ALTER TABLE [dbo].[ProductStocks]
ADD CONSTRAINT [PK_ProductStocks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sales'
ALTER TABLE [dbo].[Sales]
ADD CONSTRAINT [PK_Sales]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SaleProducts'
ALTER TABLE [dbo].[SaleProducts]
ADD CONSTRAINT [PK_SaleProducts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Suppliers'
ALTER TABLE [dbo].[Suppliers]
ADD CONSTRAINT [PK_Suppliers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TransactionLogs'
ALTER TABLE [dbo].[TransactionLogs]
ADD CONSTRAINT [PK_TransactionLogs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [Parent_Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [FK_Category_Category]
    FOREIGN KEY ([Parent_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Category_Category'
CREATE INDEX [IX_FK_Category_Category]
ON [dbo].[Categories]
    ([Parent_Id]);
GO

-- Creating foreign key on [Company_Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [FK_Category_Company]
    FOREIGN KEY ([Company_Id])
    REFERENCES [dbo].[Companies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Category_Company'
CREATE INDEX [IX_FK_Category_Company]
ON [dbo].[Categories]
    ([Company_Id]);
GO

-- Creating foreign key on [Category_Id] in table 'ProductCategories'
ALTER TABLE [dbo].[ProductCategories]
ADD CONSTRAINT [FK_ProductCategory_Category]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCategory_Category'
CREATE INDEX [IX_FK_ProductCategory_Category]
ON [dbo].[ProductCategories]
    ([Category_Id]);
GO

-- Creating foreign key on [Company_Id] in table 'Deals'
ALTER TABLE [dbo].[Deals]
ADD CONSTRAINT [FK_Deal_Company]
    FOREIGN KEY ([Company_Id])
    REFERENCES [dbo].[Companies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Deal_Company'
CREATE INDEX [IX_FK_Deal_Company]
ON [dbo].[Deals]
    ([Company_Id]);
GO

-- Creating foreign key on [Company_Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Product_Company]
    FOREIGN KEY ([Company_Id])
    REFERENCES [dbo].[Companies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Product_Company'
CREATE INDEX [IX_FK_Product_Company]
ON [dbo].[Products]
    ([Company_Id]);
GO

-- Creating foreign key on [Company_Id] in table 'ProductStocks'
ALTER TABLE [dbo].[ProductStocks]
ADD CONSTRAINT [FK_ProductStock_Company]
    FOREIGN KEY ([Company_Id])
    REFERENCES [dbo].[Companies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductStock_Company'
CREATE INDEX [IX_FK_ProductStock_Company]
ON [dbo].[ProductStocks]
    ([Company_Id]);
GO

-- Creating foreign key on [Company_Id] in table 'Sales'
ALTER TABLE [dbo].[Sales]
ADD CONSTRAINT [FK_Sale_Company]
    FOREIGN KEY ([Company_Id])
    REFERENCES [dbo].[Companies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Sale_Company'
CREATE INDEX [IX_FK_Sale_Company]
ON [dbo].[Sales]
    ([Company_Id]);
GO

-- Creating foreign key on [Company_Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [FK_Status_Company]
    FOREIGN KEY ([Company_Id])
    REFERENCES [dbo].[Companies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Status_Company'
CREATE INDEX [IX_FK_Status_Company]
ON [dbo].[Status]
    ([Company_Id]);
GO

-- Creating foreign key on [Deal_Id] in table 'DealProducts'
ALTER TABLE [dbo].[DealProducts]
ADD CONSTRAINT [FK_DealProduct_Deal]
    FOREIGN KEY ([Deal_Id])
    REFERENCES [dbo].[Deals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DealProduct_Deal'
CREATE INDEX [IX_FK_DealProduct_Deal]
ON [dbo].[DealProducts]
    ([Deal_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'DealProducts'
ALTER TABLE [dbo].[DealProducts]
ADD CONSTRAINT [FK_DealProduct_Product]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DealProduct_Product'
CREATE INDEX [IX_FK_DealProduct_Product]
ON [dbo].[DealProducts]
    ([Product_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'ProductCategories'
ALTER TABLE [dbo].[ProductCategories]
ADD CONSTRAINT [FK_ProductCategory_Product]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCategory_Product'
CREATE INDEX [IX_FK_ProductCategory_Product]
ON [dbo].[ProductCategories]
    ([Product_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'ProductImages'
ALTER TABLE [dbo].[ProductImages]
ADD CONSTRAINT [FK_ProductImage_Product]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductImage_Product'
CREATE INDEX [IX_FK_ProductImage_Product]
ON [dbo].[ProductImages]
    ([Product_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'ProductStocks'
ALTER TABLE [dbo].[ProductStocks]
ADD CONSTRAINT [FK_ProductStock_Product]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductStock_Product'
CREATE INDEX [IX_FK_ProductStock_Product]
ON [dbo].[ProductStocks]
    ([Product_Id]);
GO

-- Creating foreign key on [Supplier_Id] in table 'ProductStocks'
ALTER TABLE [dbo].[ProductStocks]
ADD CONSTRAINT [FK_ProductStock_Supplier]
    FOREIGN KEY ([Supplier_Id])
    REFERENCES [dbo].[Suppliers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductStock_Supplier'
CREATE INDEX [IX_FK_ProductStock_Supplier]
ON [dbo].[ProductStocks]
    ([Supplier_Id]);
GO

-- Creating foreign key on [ProductStock_Id] in table 'SaleProducts'
ALTER TABLE [dbo].[SaleProducts]
ADD CONSTRAINT [FK_SaleProduct_ProductStock]
    FOREIGN KEY ([ProductStock_Id])
    REFERENCES [dbo].[ProductStocks]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SaleProduct_ProductStock'
CREATE INDEX [IX_FK_SaleProduct_ProductStock]
ON [dbo].[SaleProducts]
    ([ProductStock_Id]);
GO

-- Creating foreign key on [SaleProduct_Id] in table 'Sales'
ALTER TABLE [dbo].[Sales]
ADD CONSTRAINT [FK_Sale_SaleProduct]
    FOREIGN KEY ([SaleProduct_Id])
    REFERENCES [dbo].[SaleProducts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Sale_SaleProduct'
CREATE INDEX [IX_FK_Sale_SaleProduct]
ON [dbo].[Sales]
    ([SaleProduct_Id]);
GO

-- Creating foreign key on [Status_Id] in table 'Sales'
ALTER TABLE [dbo].[Sales]
ADD CONSTRAINT [FK_Sale_Status]
    FOREIGN KEY ([Status_Id])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Sale_Status'
CREATE INDEX [IX_FK_Sale_Status]
ON [dbo].[Sales]
    ([Status_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Sales'
ALTER TABLE [dbo].[Sales]
ADD CONSTRAINT [FK_Sale_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Sale_User'
CREATE INDEX [IX_FK_Sale_User]
ON [dbo].[Sales]
    ([User_Id]);
GO

-- Creating foreign key on [Sale_Id] in table 'SaleProducts'
ALTER TABLE [dbo].[SaleProducts]
ADD CONSTRAINT [FK_SaleProduct_Sale]
    FOREIGN KEY ([Sale_Id])
    REFERENCES [dbo].[Sales]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SaleProduct_Sale'
CREATE INDEX [IX_FK_SaleProduct_Sale]
ON [dbo].[SaleProducts]
    ([Sale_Id]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRole]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUser]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUser'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUser]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------