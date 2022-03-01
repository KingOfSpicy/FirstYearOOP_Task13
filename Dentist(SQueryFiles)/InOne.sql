IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'Dentist')
BEGIN
    CREATE database Dentist
	PRINT 'Database Dentist successfully created.'
END
ELSE
	PRINT 'You already have database Dentist created.'
GO

USE [Dentist]
GO

:setvar path "D:\BACKUP\FirstYear\Object Oriented Programming\Task 13\Dentist"

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME = N'Dentist')
BEGIN
	:r $(path)\CreateDentist.sql
	PRINT 'Table Dentist successfully created.'
END
ELSE
	PRINT 'You already have table Dentist created.'
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME = N'Patient')
BEGIN
	:r $(path)\CreatePatient.sql
	PRINT 'Table Patient successfully created.'
END
ELSE
	PRINT 'You already have table Patient created.'
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME = N'Operation')
BEGIN
	:r $(path)\CreateOperation.sql
	PRINT 'Table Operation successfully created.'
END
ELSE
	PRINT 'You already have table Operation created.'
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME = N'Room')
BEGIN
	:r $(path)\CreateRoom.sql
	PRINT 'Table Room successfully created.'
END
ELSE
	PRINT 'You already have table Room created.'
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME = N'Reception')
BEGIN
	:r $(path)\CreateReception.sql
	PRINT 'Table Reception successfully created.'
END
ELSE
	PRINT 'You already have table Reception created.'
GO

IF NOT EXISTS (SELECT * FROM Dentist)
BEGIN
	:r $(path)\InsertDentist.sql
	PRINT 'Information added successfully to table Dentist.'
END
ELSE
	PRINT 'You already have the Dentist information added.'
GO

IF NOT EXISTS (SELECT * FROM Patient)
BEGIN
	:r $(path)\InsertPatient.sql
	PRINT 'Information added successfully to table Patient.'
END
ELSE
	PRINT 'You already have the Patient information added.'
GO

IF NOT EXISTS (SELECT * FROM Operation)
BEGIN
	:r $(path)\InsertOperation.sql
	PRINT 'Information added successfully to table Operation.'
END
ELSE
	PRINT 'You already have the Operation information added.'
GO

IF NOT EXISTS (SELECT * FROM Room)
BEGIN
	:r $(path)\InsertRoom.sql
	PRINT 'Information added successfully to table Room.'
END
ELSE
	PRINT 'You already have the Room information added.'
GO

IF NOT EXISTS (SELECT * FROM Reception)
BEGIN
	:r $(path)\InsertReception.sql
	PRINT 'Information added successfully to table Reception.'
END
ELSE
	PRINT 'You already have the Reception information added.'
GO
