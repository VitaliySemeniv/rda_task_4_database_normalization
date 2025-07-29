-- Create database and tables

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE ProductInventory (
    ID INT,
    ProductName VARCHAR(50),
    WarehouseAmount INT,
    WarehouseName VARCHAR(50),
    WarehouseAddress VARCHAR(50), 
    CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID) ON DELETE NO ACTION,
    PRIMARY KEY (ID)
);

-- Populate test data

INSERT INTO Countries (ID,Name)
	VALUES (1, 'Country1');
INSERT INTO Countries (ID,Name)
	VALUES (2, 'Country2');
    
INSERT INTO ProductInventory (ID,ProductName,WarehouseAmount,WarehouseName,WarehouseAddress,CountryID)
	VALUES (1, 'AwersomeProduct', 2, 'Warehouse-1', 'City-1, Street-1',1);
INSERT INTO ProductInventory (ID,ProductName,WarehouseAmount,WarehouseName,WarehouseAddress,CountryID)
	VALUES (2, 'AwersomeProduct', 5, 'Warehouse-2', 'City-2, Street-2',2);
DROP DATABASE IF EXISTS ShopDB;

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Warehouses (
    ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

CREATE TABLE Products (
    ID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL
);

CREATE TABLE ProductInventory (
    ID INT PRIMARY KEY,
    ProductID INT,
    WarehouseID INT,
    Amount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

INSERT INTO Countries (ID, Name) VALUES
(1, 'Ukraine'),
(2, 'Poland');

INSERT INTO Warehouses (ID, Name, Address, CountryID) VALUES
(1, 'Main Warehouse', 'Kyiv, UA', 1),
(2, 'Backup Warehouse', 'Warsaw, PL', 2);

INSERT INTO Products (ID, ProductName) VALUES
(1, 'Laptop'),
(2, 'Smartphone');

INSERT INTO ProductInventory (ID, ProductID, WarehouseID, Amount) VALUES
(1, 1, 1, 50),
(2, 2, 1, 30),
(3, 2, 2, 100);
