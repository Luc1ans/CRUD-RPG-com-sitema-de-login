-- Creating table 'Classes'
use [C:\USERS\PEDRO\ONEDRIVE\ÁREA DE TRABALHO\GAME\CRUDGAMESOLUTION\CRUDGAME\APP_DATA\RPGDB.MDF]

CREATE TABLE [dbo].[Classes] (
    [IdClasse] int IDENTITY(1,1) NOT NULL primary key,
    [Descricao] varchar(100)  NOT NULL UNIQUE
);
GO

-- Creating table 'Racas'
CREATE TABLE [dbo].[Racas] (
    [IdRaca] int IDENTITY(1,1) NOT NULL primary key,
    [Descricao] varchar(50)  NOT NULL UNIQUE
);
GO

-- Creating table 'Habilidades'
CREATE TABLE [dbo].[Habilidades] (
    [IdHabilidade] int IDENTITY(1,1) NOT NULL primary key,
    [Descricao] varchar(50)  NOT NULL UNIQUE
);
GO

-- Creating table 'Subclasses'
CREATE TABLE [dbo].[Subclasses] (
    [IdSubclasse] int IDENTITY(1,1) NOT NULL primary key,
    [Descricao] varchar(50)  NOT NULL Unique,
    [ClasseID] int  NOT NULL,
    CONSTRAINT [FK_Subclasse_Classe]
    FOREIGN KEY ([ClasseID])
    REFERENCES [dbo].[Classes]
        ([IdClasse])
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

CREATE TABLE [dbo].[Cores] (
    [IdCor] int IDENTITY(1,1) NOT NULL primary key,
    [Descricao] varchar(50)  NOT NULL UNIQUE
);
GO

-- Creating table 'Personagens'
CREATE TABLE [dbo].[Personagens] (
    [IdPersonagem] int IDENTITY(1,1) NOT NULL primary key,
    [Forca] int not null,
    [Destreza] int not null,
    [Sabedoria] int not null,
    [Constituicao] int not null,
    [Inteligencia] int not null,
    [Carisma] int not null,
    [Peso] decimal(9,2) not null,
    [Altura] decimal(9,2) not null,
    [CorCabelo] int not null,
    [EstiloCabelo] varchar(100) not null,
    [CorOlho] int not null,
    [CorPele] int not null,
    [DataNasc] datetime not NULL,
    [Nivel] int  NOT NULL,
    [NomePersonagem] varchar(100)  NOT NULL,
    [Sexo] varchar(50)  NOT NULL,
    [RacaID] int  NOT NULL,
    [SubclasseID] int  NOT NULL,
    CONSTRAINT [FK_Personagem_CorCabelo] FOREIGN KEY ([CorCabelo])  REFERENCES [dbo].[Cores] ([IdCor]) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [FK_Personagem_CorOlho] FOREIGN KEY ([CorOlho])  REFERENCES [dbo].[Cores] ([IdCor]) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [FK_Personagem_CorPele] FOREIGN KEY ([CorPele])  REFERENCES [dbo].[Cores] ([IdCor]) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [FK_Personagem_RacaID] FOREIGN KEY ([RacaID])  REFERENCES [dbo].[Racas] ([IdRaca]) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [FK_Personagem_SubclasseID] FOREIGN KEY ([SubclasseID])  REFERENCES [dbo].[Subclasses] ([IdSubclasse]) ON DELETE NO ACTION ON UPDATE NO ACTION,

);
GO

-- Creating table 'Personagem_Habilidade'
CREATE TABLE [dbo].[Personagem_Habilidade] (
    [IdPersonHab] int NOT NULL primary key identity(1,1),
    [Habilidades_IdHabilidade] int  NOT NULL,
    [Personagens_IdPersonagem] int  NOT NULL
    CONSTRAINT [FK_Personagem_PersonHab] FOREIGN KEY ([Habilidades_IdHabilidade])  REFERENCES [dbo].[Habilidades] ([IdHabilidade]) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [FK_Habilidade_PersonHab] FOREIGN KEY ([Personagens_IdPersonagem])  REFERENCES [dbo].[Personagens] ([IdPersonagem]) ON DELETE NO ACTION ON UPDATE NO ACTION,

);
GO