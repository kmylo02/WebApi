/*
Script de implementación para FINANZA_PERSONAL

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "FINANZA_PERSONAL"
:setvar DefaultFilePrefix "FINANZA_PERSONAL"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'La siguiente operación se generó a partir de un archivo de registro de refactorización a9c0d101-7a02-4922-9d42-ef3be5eacbda';

PRINT N'Cambiar el nombre de [dbo].[CATEGORIA_] a CATEGORIA';


GO
EXECUTE sp_rename @objname = N'[dbo].[CATEGORIA_]', @newname = N'CATEGORIA', @objtype = N'OBJECT';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave be9f5796-0e88-4e83-9682-4b309f601ef4 se ha omitido; no se cambiará el nombre del elemento [dbo].[PRESUPUESTO].[Id] (SqlSimpleColumn) a ID_PRESUPUESTO';


GO
PRINT N'Creando [dbo].[PRESUPUESTO]...';


GO
CREATE TABLE [dbo].[PRESUPUESTO] (
    [ID_PRESUPUESTO] INT            NOT NULL,
    [ID_CATEGORIA]   INT            NOT NULL,
    [VALOR]          DECIMAL (18)   NOT NULL,
    [DESCRIPCION]    NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([ID_PRESUPUESTO] ASC)
);


GO
PRINT N'Creando [dbo].[FK_PRESUPUESTO_ToTable]...';


GO
ALTER TABLE [dbo].[PRESUPUESTO] WITH NOCHECK
    ADD CONSTRAINT [FK_PRESUPUESTO_ToTable] FOREIGN KEY ([ID_CATEGORIA]) REFERENCES [dbo].[CATEGORIA] ([ID_CATEGORIA]);


GO
-- Paso de refactorización para actualizar el servidor de destino con los registros de transacciones implementadas
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a9c0d101-7a02-4922-9d42-ef3be5eacbda')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a9c0d101-7a02-4922-9d42-ef3be5eacbda')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'be9f5796-0e88-4e83-9682-4b309f601ef4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('be9f5796-0e88-4e83-9682-4b309f601ef4')

GO

GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[PRESUPUESTO] WITH CHECK CHECK CONSTRAINT [FK_PRESUPUESTO_ToTable];


GO
PRINT N'Actualización completada.';


GO
