# InventorySalesDB_Sample
Title: Building a Basic Inventory Sales Database with SQL Server

Introduction

This repository contains a sample database schema and sample data for an Inventory Sales system. 
It's designed as a practice project to learn database design, creation, and population using Microsoft SQL Server Management Studio (SSMS).

The database, named 'InventorySales', consists of the following tables:

1. Suppliers: Contains information about suppliers.
2. Products: Contains information about products.
3. ategories: Contains information about product categories.
4. Orders: Contains information about customer orders.
5. OrderDetails: Contains details of ordered products.
6. Customers: Contains information about customers.
7. Shippers: Contains information about shipping companies.
8. Employees: Contains information about employees.

SQL Script

The SQL script to create the tables and relationships:


-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID int PRIMARY KEY IDENTITY(1,1),
    CompanyName nvarchar(50),
    ContactName nvarchar(50),
    ContactTitle nvarchar(30),
    Address nvarchar(50),
    City nvarchar(50),
    Region nvarchar(50),
    PostalCode nvarchar(10),
    Country nvarchar(50),
    Phone nvarchar(24),
    Fax nvarchar(24),
    HomePage nvarchar(100)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID int PRIMARY KEY IDENTITY(1,1),
    LastName nvarchar(50),
    FirstName nvarchar(50),
    Title nvarchar(30),
    TitleOfCourtesy nvarchar(25),
    BirthDate date,
    HireDate date,
    Address nvarchar(50),
    City nvarchar(50),
    Region nvarchar(50),
    PostalCode nvarchar(10),
    Country nvarchar(50),
    HomePhone nvarchar(24),
    Extension nvarchar(10),
    Notes nvarchar(MAX),
    ReportsTo int,
    PhotoPath nvarchar(255),
    FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);

-- Create other tables similarly based on the ER diagram

Populating the Database
INSERT INTO Suppliers (CompanyName, ContactName, ...)
VALUES ('Supplier1', 'Contact1', ...);

INSERT INTO Employees (LastName, FirstName, ...)
VALUES ('Smith', 'John', ...)

Note: Replace the placeholder values with your desired data.

Additional Considerations
This is a basic example. Real-world databases would require additional considerations like data types, indexing, constraints, and normalization.
The provided data is for demonstration purposes only.
Consider using more realistic data for your practice projects.

Conclusion
This repository serves as a starting point for building database applications. 
Feel free to expand on this foundation by adding more tables, relationships, and data to suit your specific needs.

Feel free to contribute or provide feedback!

