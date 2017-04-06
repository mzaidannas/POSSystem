use master
go

drop Database POSDatabase
go

Create database POSDatabase
go

use POSDatabase
go

CREATE TABLE [dbo].[AspNetUsers] (
    [Id]                   NVARCHAR (128) NOT NULL,
    [Email]                NVARCHAR (256) NULL,
    [EmailConfirmed]       BIT            NOT NULL,
    [PasswordHash]         NVARCHAR (MAX) NULL,
    [SecurityStamp]        NVARCHAR (MAX) NULL,
    [PhoneNumber]          NVARCHAR (MAX) NULL,
    [PhoneNumberConfirmed] BIT            NOT NULL,
    [TwoFactorEnabled]     BIT            NOT NULL,
    [LockoutEndDateUtc]    DATETIME       NULL,
    [LockoutEnabled]       BIT            NOT NULL,
    [AccessFailedCount]    INT            NOT NULL,
    [UserName]             NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex]
    ON [dbo].[AspNetUsers]([UserName] ASC);

CREATE TABLE [dbo].[AspNetRoles] (
    [Id]   NVARCHAR (128) NOT NULL,
    [Name] NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex]
    ON [dbo].[AspNetRoles]([Name] ASC);

CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [UserId]     NVARCHAR (128) NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[AspNetUserClaims]([UserId] ASC);

CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] NVARCHAR (128) NOT NULL,
    [ProviderKey]   NVARCHAR (128) NOT NULL,
    [UserId]        NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED ([LoginProvider] ASC, [ProviderKey] ASC, [UserId] ASC),
    CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[AspNetUserLogins]([UserId] ASC);

CREATE TABLE [dbo].[AspNetUserRoles] (
    [UserId] NVARCHAR (128) NOT NULL,
    [RoleId] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC),
    CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_UserId]
    ON [dbo].[AspNetUserRoles]([UserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RoleId]
    ON [dbo].[AspNetUserRoles]([RoleId] ASC);


CREATE TABLE [dbo].[User] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Company_Id]   INT            NOT NULL,
    [Status_Id]    INT            NOT NULL,
    [FirstName]    NVARCHAR (50)  NOT NULL,
    [MiddleName]   NVARCHAR (50)  NULL,
    [LastName]     NVARCHAR (50)  NOT NULL,
    [Address]      NVARCHAR (500) NOT NULL,
    [PhoneNumber]  NVARCHAR (20)  NOT NULL,
    [MobileNumber] NVARCHAR (20)  NULL,
    [CNIC]         NVARCHAR (20)  NULL,
    [City]         NVARCHAR (50)  NULL,
    [Details]      NVARCHAR (500) NULL,
    [CreateBy]     NVARCHAR (50)  NOT NULL,
    [CreateDate]   DATETIME       NOT NULL,
    [UpdateBy]     NVARCHAR (50)  NULL,
    [UpdateDate]   DATETIME       NULL,
    [IsActive]     BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Company] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Country_Id] INT            NOT NULL,
    [Name]       NVARCHAR (50)  NOT NULL,
    [Slogon]     NVARCHAR (50)  NULL,
    [City]       NVARCHAR (50)  NULL,
    [Address]    NVARCHAR (150) NULL,
    [Phone]      NVARCHAR (20)  NULL,
    [Fax]        NVARCHAR (20)  NULL,
    [Email]      NVARCHAR (50)  NULL,
    [Website]    NVARCHAR (50)  NULL,
    [LogoUrl]    NVARCHAR (50)  NULL,
    [IsActive]   BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Country] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (50) NOT NULL,
    [Currency]       NVARCHAR (50) NULL,
    [CurrencySymbol] NVARCHAR (1)  NULL,
    [Code]           NVARCHAR (15) NULL,
    [TimeZoneHour]   INT           NOT NULL,
    [CreateBy]       NVARCHAR (50) NOT NULL,
    [CreateDate]     DATETIME      NOT NULL,
    [UpdateBy]       NVARCHAR (50) NULL,
    [UpdateDate]     DATETIME      NULL,
    [IsActive]       BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Product] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [Company_Id]        INT            NOT NULL,
    [Name]              NVARCHAR (50)  NOT NULL,
    [ShortDescription]  NVARCHAR (150) NULL,
    [LongDescription]   NVARCHAR (500) NULL,
    [Barcode]           NVARCHAR (50)  NULL,
    [Url]               NVARCHAR (150) NOT NULL,
    [ReorderLevel]      FLOAT (53)     NULL,
    [PriceDepreciation] FLOAT (53)     NOT NULL,
    [CreateBy]          NVARCHAR (50)  NOT NULL,
    [CreateDate]        DATETIME       NOT NULL,
    [UpdateBy]          NVARCHAR (50)  NULL,
    [UpdateDate]        DATETIME       NULL,
    [IsActive]          BIT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Product_Company] FOREIGN KEY ([Company_Id]) REFERENCES [dbo].[Company] ([Id])
);

CREATE TABLE [dbo].[Category] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Parent_Id]   INT            NULL,
    [Company_Id]  INT            NULL,
    [Name]        NVARCHAR (50)  NOT NULL,
    [Url]         NVARCHAR (150) NOT NULL,
    [Level]       INT            NOT NULL,
    [Description] NVARCHAR (500) NULL,
    [CreateBy]    NVARCHAR (50)  NOT NULL,
    [CreateDate]  DATETIME       NOT NULL,
    [UpdateBy]    NVARCHAR (50)  NULL,
    [UpdateDate]  DATETIME       NULL,
    [IsActive]    BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Category_Category] FOREIGN KEY ([Parent_Id]) REFERENCES [dbo].[Category] ([Id]),
    CONSTRAINT [FK_Category_Company] FOREIGN KEY ([Company_Id]) REFERENCES [dbo].[Company] ([Id])
);

CREATE TABLE [dbo].[ProductCategory] (
    [Id]          INT IDENTITY (1, 1) NOT NULL,
    [Product_Id]  INT NOT NULL,
    [Category_Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProductCategory_Category] FOREIGN KEY ([Category_Id]) REFERENCES [dbo].[Category] ([Id]),
    CONSTRAINT [FK_ProductCategory_Product] FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Product] ([Id])
);

CREATE TABLE [dbo].[Deal] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Company_Id]  INT            NOT NULL,
    [Name]        NVARCHAR (50)  NOT NULL,
    [Description] NVARCHAR (500) NULL,
    [Quantity]    FLOAT (53)     NOT NULL,
    [Price]       FLOAT (53)     NOT NULL,
    [StartDate]   DATETIME       NOT NULL,
    [EndDate]     DATETIME       NOT NULL,
    [CreateBy]    NVARCHAR (50)  NOT NULL,
    [CreateDate]  DATETIME       NOT NULL,
    [UpdateBy]    NVARCHAR (50)  NULL,
    [UpdateDate]  DATETIME       NULL,
    [IsActive]    BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Deal_Company] FOREIGN KEY ([Company_Id]) REFERENCES [dbo].[Company] ([Id])
);

CREATE TABLE [dbo].[DealProduct] (
    [Id]         INT        IDENTITY (1, 1) NOT NULL,
    [Deal_Id]    INT        NOT NULL,
    [Product_Id] INT        NULL,
    [Quantity]   FLOAT (53) NOT NULL,
    [SortOrder]  INT        NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DealProduct_Deal] FOREIGN KEY ([Deal_Id]) REFERENCES [dbo].[Deal] ([Id]),
    CONSTRAINT [FK_DealProduct_Product] FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Product] ([Id])
);

CREATE TABLE [dbo].[ErrorLog] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [User_Id]        INT            NOT NULL,
    [InnerException] NVARCHAR (500) NULL,
    [Message]        NVARCHAR (150) NOT NULL,
    [Url]            NVARCHAR (150) NULL,
    [CreateDate]     DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[ProductImage] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Product_Id] INT            NOT NULL,
    [Url]        NVARCHAR (150) NOT NULL,
    [SortOrder]  INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProductImage_Product] FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Product] ([Id])
);

CREATE TABLE [dbo].[Status] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [Company_Id] INT           NOT NULL,
    [Name]       NVARCHAR (50) NULL,
    [Type]       NVARCHAR (50) NULL,
    [CreateBy]   NVARCHAR (50) NOT NULL,
    [CreateDate] DATETIME      NOT NULL,
    [UpdateBy]   NVARCHAR (50) NULL,
    [UpdateDate] DATETIME      NULL,
    [IsActive]   BIT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Status_Company] FOREIGN KEY ([Company_Id]) REFERENCES [dbo].[Company] ([Id])
);

CREATE TABLE [dbo].[Supplier] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Company_Id]   INT            NOT NULL,
    [Name]         NVARCHAR (50)  NOT NULL,
    [Address]      NVARCHAR (500) NOT NULL,
    [PhoneNumber]  NVARCHAR (20)  NOT NULL,
    [MobileNumber] NVARCHAR (20)  NULL,
    [CNIC]         NVARCHAR (20)  NULL,
    [Description]  NVARCHAR (500) NULL,
    [CreateBy]     NVARCHAR (50)  NOT NULL,
    [CreateDate]   DATETIME       NOT NULL,
    [UpdateBy]     NVARCHAR (50)  NULL,
    [UpdateDate]   DATETIME       NULL,
    [IsActive]     BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[ProductStock] (
    [Id]                    INT            IDENTITY (1, 1) NOT NULL,
    [Product_Id]            INT            NOT NULL,
    [Supplier_Id]           INT            NOT NULL,
    [Company_Id]            INT            NOT NULL,
    [Description]           NVARCHAR (500) NULL,
    [Quantity]              FLOAT (53)     NOT NULL,
    [PricePerUnit]          FLOAT (53)     NOT NULL,
    [CostPerUnit]           FLOAT (53)     NULL,
    [SalePrice]             FLOAT (53)     NOT NULL,
    [PurchaseDate]          DATETIME       NOT NULL,
    [PurchaseInvoiceNumber] NVARCHAR (50)  NOT NULL,
    [BatchNumber]           INT            NULL,
    [CreateBy]              NVARCHAR (50)  NOT NULL,
    [CreateDate]            DATETIME       NOT NULL,
    [UpdateBy]              NVARCHAR (50)  NULL,
    [UpdateDate]            DATETIME       NULL,
    [IsActive]              BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ProductStock_Supplier] FOREIGN KEY ([Supplier_Id]) REFERENCES [dbo].[Supplier] ([Id]),
    CONSTRAINT [FK_ProductStock_Company] FOREIGN KEY ([Company_Id]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [FK_ProductStock_Product] FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Product] ([Id])
);

CREATE TABLE [dbo].[Sale] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [Company_Id]      INT            NOT NULL,
    [Status_Id]       INT            NOT NULL,
    [User_Id]         INT            NOT NULL,
    [SaleProduct_Id]  INT            NOT NULL,
    [CustomerName]    NVARCHAR (50)  NOT NULL,
    [CustomerAddress] NVARCHAR (500) NOT NULL,
    [CustomerNumber]  NVARCHAR (20)  NOT NULL,
    [CustomerEmail]   NVARCHAR (20)  NULL,
    [City]            NVARCHAR (50)  NULL,
    [GrossTotal]      FLOAT (53)     NOT NULL,
    [Discount]        FLOAT (53)     NOT NULL,
    [Payable]         FLOAT (53)     NOT NULL,
    [Paid]            FLOAT (53)     NOT NULL,
    [Returned]        FLOAT (53)     NOT NULL,
    [BarcodeInvoice]  NVARCHAR (50)  NULL,
    [Details]         NVARCHAR (500) NULL,
    [CreateBy]        NVARCHAR (50)  NOT NULL,
    [CreateDate]      DATETIME       NOT NULL,
    [UpdateBy]        NVARCHAR (50)  NULL,
    [UpdateDate]      DATETIME       NULL,
    [IsActive]        BIT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Sale_Company] FOREIGN KEY ([Company_Id]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [FK_Sale_Status] FOREIGN KEY ([Status_Id]) REFERENCES [dbo].[Status] ([Id]),
    CONSTRAINT [FK_Sale_User] FOREIGN KEY ([User_Id]) REFERENCES [dbo].[User] ([Id])
);

CREATE TABLE [dbo].[SaleProduct] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [Sale_Id]         INT           NOT NULL,
    [ProductStock_Id] INT           NOT NULL,
    [Name]            NVARCHAR (50) NOT NULL,
    [Quantity]        FLOAT (53)    NOT NULL,
    [SalePrice]       FLOAT (53)    NOT NULL,
    [Discount]        FLOAT (53)    NOT NULL,
    [DiscountedPrice] FLOAT (53)    NOT NULL,
    [CreateBy]        NVARCHAR (50) NOT NULL,
    [CreateDate]      DATETIME      NOT NULL,
    [UpdateBy]        NVARCHAR (50) NULL,
    [UpdateDate]      DATETIME      NULL,
    [IsActive]        BIT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SaleProduct_ProductStock] FOREIGN KEY ([ProductStock_Id]) REFERENCES [dbo].[ProductStock] ([Id]),
    CONSTRAINT [FK_SaleProduct_Sale] FOREIGN KEY ([Sale_Id]) REFERENCES [dbo].[Sale] ([Id])
);

CREATE TABLE [dbo].[TransactionLog] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [User_Id]    INT            NOT NULL,
    [RecordId]   INT            NOT NULL,
    [Action]     NVARCHAR (50)  NOT NULL,
    [TableName]  NVARCHAR (50)  NULL,
    [Detail]     NVARCHAR (150) NULL,
    [CreateDate] DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

