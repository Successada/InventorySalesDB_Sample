Create Database InventorySales
use InventorySales


--CREATING VARIOUS TABLES IN THE INVENTORY SALES DATABASE
CREATE TABLE Suppliers(SuppliersID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
						CompanyName Varchar(255) NOT NULL,
						ContactName Varchar(255) NOT NULL,
						CAddress nVarchar(255) NOT NULL,
						City nVarchar(255) NOT NULL,
						PostalCode nVarchar(255) NOT NULL,
						Country nVarchar(255) NOT NULL,
						Phone nVarchar(255) NOT NULL,
						Fax nVarchar(255) NOT NULL,
						HomePage nVarchar(255) NOT NULL)

CREATE TABLE Categories(CatergoryID INT IDENTITY (1,2) PRIMARY KEY NOT NULL,
						CatergoryName Varchar(255) NOT NULL,
						Description nVarchar(Max),
						Picture Varbinary(Max))

CREATE TABLE Products(ProductID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
					ProductName Varchar(255) NOT NULL,
					SuppliersID INT FOREIGN KEY (SuppliersID) REFERENCES Suppliers(SuppliersID),
					CatergoryID INT FOREIGN KEY (CatergoryID) REFERENCES Categories(CatergoryID),
					QuantityPerUnit  Varchar(100) NOT NULL,
					UnitPrice Decimal(10,2) NOT NULL,
					UnitsInStock SmallINT NOT NULL,
					UnitsOnOrder SmallInt NOT NULL,
					ReorderLevel  SmallInt NOT NULL,
					Discontinued BIT)


CREATE TABLE OrderDetails (OrderID INT NOT NULL,
							ProductID INT NOT NULL,
							UnitPrice DECIMAL(10, 2) NOT NULL,
							Quantity INT NOT NULL,
							Discount DECIMAL(4, 2),
							PRIMARY KEY (OrderID, ProductID),
							FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
							FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
						);

		

CREATE TABLE Employees(EmployeeID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
						Fname Varchar(255) NOT NULL,
						Lname Varchar(255) NOT NULL,
						Title Varchar(255) NOT NULL,
						TitleOfCourtesy Varchar(255) NOT NULL,
						DOB DATE NOT NULL,
						HireDate DATE NOT NULL,
						EAddress Varchar(255) NOT NULL,
						City Varchar(255) NOT NULL,
						Region NVarchar(255) NOT NULL,
						PostalCode NVarchar(255) NOT NULL,
						Country NVarchar(255) NOT NULL,
						HomePhone NVarchar(255) NOT NULL,
						Extension NVarchar(255) NOT NULL,
						Photo Varbinary(Max),
						Notes NVarchar(255) NOT NULL,
						ReportsTo Varchar(255) NOT NULL)


CREATE TABLE Customers( CustomerID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
						CompanyName Varchar(255) NOT NULL,
						ContactName NVarchar(255) NOT NULL,
						ContactTitle NVarchar(255) NOT NULL,
						cAddress NVarchar(255) NOT NULL,
						City NVarchar(255) NOT NULL,
						Region NVarchar(255) NOT NULL,
						PostalCode NVarchar(255) NOT NULL,
						Country NVarchar(255) NOT NULL,
						Phone NVarchar(255) NOT NULL,
						Fax NVarchar(255) NOT NULL)
						

CREATE TABLE Orders( OrderID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
					CustomerID INT FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) NOT NULL,
					EmployeeID INT FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
					OrderDate DATE,
					RequiredDate DATE,
					ShippedDate DATE,
					ShipVia INT FOREIGN KEY (ShipVia) REFERENCES Shippers(ShipperID) NOT NULL,
					Freight Decimal (10,2),
					ShipName NVarchar(255) NOT NULL,
					ShipAddress NVarchar(255) NOT NULL,
					ShipCity NVarchar(255) NOT NULL,
					ShipRegion NVarchar(255) NOT NULL,
					ShipPostalCode NVarchar(255) NOT NULL,
					ShipCountry NVarchar(255) NOT NULL)
					


CREATE TABLE Shippers( ShipperID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
					CompanyName NVarchar(255) NOT NULL,
					Phone NVarchar(255) NOT NULL)


					select * from Categories
					select * from Customers
					select * from Employees
					select * from OrderDetails
					select * from Orders
					select * from Products
					select * from Shippers
					select * from Suppliers

--INSERTING VALUES INTO ALL THE TABLES CREATED
INSERT INTO Suppliers (CompanyName, ContactName, CAddress, City, PostalCode, Country, Phone, Fax, HomePage)
VALUES
('Supplier A', 'John Doe', '123 Elm St', 'New York', '10001', 'USA', '+1-212-555-1234', '+1-212-555-5678', 'http://www.suppliera.com'),
('Supplier B', 'Jane Smith', '456 Oak St', 'Toronto', 'M5H 2N2', 'Canada', '+1-416-555-2345', '+1-416-555-6789', 'http://www.supplierb.com'),
('Supplier C', 'Samuel Green', '789 Pine St', 'London', 'WC2N 5DU', 'UK', '+44-20-555-3456', '+44-20-555-7890', 'http://www.supplierc.com'),
('Supplier D', 'Anna White', '101 Maple St', 'Sydney', '2000', 'Australia', '+61-2-555-4567', '+61-2-555-8901', 'http://www.supplierd.com'),
('Supplier E', 'Robert Brown', '202 Birch St', 'Tokyo', '100-0001', 'Japan', '+81-3-555-5678', '+81-3-555-9012', 'http://www.suppliere.com'),
('Supplier F', 'Emily Davis', '303 Cedar St', 'Berlin', '10115', 'Germany', '+49-30-555-6789', '+49-30-555-0123', 'http://www.supplierf.com'),
('Supplier G', 'Michael Wilson', '404 Spruce St', 'Paris', '75001', 'France', '+33-1-555-7890', '+33-1-555-1234', 'http://www.supplierg.com'),
('Supplier H', 'Sarah Johnson', '505 Willow St', 'Mexico City', '01000', 'Mexico', '+52-55-555-8901', '+52-55-555-2345', 'http://www.supplierh.com'),
('Supplier I', 'David Lee', '606 Aspen St', 'Moscow', '101000', 'Russia', '+7-495-555-9012', '+7-495-555-3456', 'http://www.supplieri.com'),
('Supplier J', 'Laura Martin', '707 Redwood St', 'Dubai', '00000', 'UAE', '+971-4-555-0123', '+971-4-555-4567', 'http://www.supplierj.com'),
('Supplier K', 'Carlos Garcia', '808 Fir St', 'Seoul', '04524', 'South Korea', '+82-2-555-1234', '+82-2-555-5678', 'http://www.supplierk.com'),
('Supplier L', 'Sophia Martinez', '909 Chestnut St', 'Mumbai', '400001', 'India', '+91-22-555-2345', '+91-22-555-6789', 'http://www.supplierl.com'),
('Supplier M', 'Daniel Rodriguez', '1010 Elm St', 'Manchester', 'M2 4LQ', 'UK', '+44-161-555-3456', '+44-161-555-7890', 'http://www.supplierm.com'),
('Supplier N', 'Isabella Hernandez', '1111 Pine St', 'Houston', '77001', 'USA', '+1-713-555-4567', '+1-713-555-8901', 'http://www.suppliern.com'),
('Supplier O', 'Joshua Lopez', '1212 Maple St', 'Ottawa', 'K1P 5G3', 'Canada', '+1-613-555-5678', '+1-613-555-9012', 'http://www.suppliero.com'),
('Supplier P', 'Emma King', '1313 Oak St', 'London', 'WC2N 5DU', 'UK', '+44-20-555-6789', '+44-20-555-0123', 'http://www.supplierp.com'),
('Supplier Q', 'James Wright', '1414 Cedar St', 'Birmingham', 'B2 5JU', 'UK', '+44-121-555-7890', '+44-121-555-1234', 'http://www.supplierq.com'),
('Supplier R', 'Ava Scott', '1515 Birch St', 'Glasgow', 'G1 2FF', 'UK', '+44-141-555-8901', '+44-141-555-2345', 'http://www.supplierr.com'),
('Supplier S', 'William Harris', '1616 Spruce St', 'Calgary', 'T2P 3C5', 'Canada', '+1-403-555-9012', '+1-403-555-3456', 'http://www.suppliers.com'),
('Supplier T', 'Olivia Walker', '1717 Willow St', 'Edinburgh', 'EH1 1YY', 'UK', '+44-131-555-0123', '+44-131-555-4567', 'http://www.suppliert.com');


INSERT INTO Categories (CatergoryName, Description, Picture)
VALUES
('Beverages', 'Soft drinks, coffees, teas, beers, and ales', NULL),
('Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings', NULL),
('Confections', 'Desserts, candies, and sweet breads', NULL),
('Dairy Products', 'Cheeses and other dairy products', NULL),
('Grains/Cereals', 'Breads, crackers, pasta, and cereal', NULL),
('Meat/Poultry', 'Prepared meats', NULL),
('Produce', 'Dried fruit and bean curd', NULL),
('Seafood', 'Seaweed and fish', NULL),
('Snacks', 'Salty and savory snacks', NULL),
('Soups', 'Instant soups and broths', NULL),
('Beverages', 'Soft drinks, coffees, teas, beers, and ales', NULL),
('Frozen Foods', 'Frozen meals and vegetables', NULL),
('Fruits', 'Fresh fruits', NULL),
('Vegetables', 'Fresh vegetables', NULL),
('Dairy Products', 'Cheeses and other dairy products', NULL),
('Grains/Cereals', 'Breads, crackers, pasta, and cereal', NULL),
('Pasta', 'Various types of pasta', NULL),
('Canned Goods', 'Canned vegetables and fruits', NULL),
('Spices', 'Dried spices and herbs', NULL),
('Beverages', 'Soft drinks, coffees, teas, beers, and ales', NULL);


INSERT INTO Products (ProductName, SuppliersID, CatergoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES
('Dell Laptop', 1, 1, '1 unit', 600.00, 8, 2, 2, 0),
('HP Laptop', 2, 1, '1 unit', 650.00, 10, 3, 3, 0),
('Toyota Camry', 3, 3, '1 unit', 20000.00, 5, 1, 1, 0),
('Honda Accord', 4, 3, '1 unit', 22000.00, 4, 1, 1, 0),
('Samsung TV', 5, 1, '1 unit', 450.00, 7, 3, 3, 0),
('LG Refrigerator', 6, 1, '1 unit', 1200.00, 6, 2, 2, 0),
('Sony PlayStation 5', 7, 1, '1 unit', 500.00, 20, 5, 5, 0),
('Apple iPhone 13', 8, 1, '1 unit', 999.00, 15, 4, 4, 0),
('Huawei P40', 9, 1, '1 unit', 750.00, 10, 3, 3, 0),
('Asus Gaming Laptop', 10, 1, '1 unit', 1200.00, 8, 2, 2, 0),
('Dell Laptop', 11, 1, '1 unit', 600.00, 9, 2, 2, 0),
('HP Laptop', 12, 1, '1 unit', 650.00, 11, 3, 3, 0),
('Samsung TV', 13, 1, '1 unit', 450.00, 8, 3, 3, 0),
('Sony PlayStation 5', 14, 1, '1 unit', 500.00, 18, 5, 5, 0),
('Apple iPhone 13', 15, 1, '1 unit', 999.00, 12, 4, 4, 0),
('LG Washing Machine', 16, 1, '1 unit', 850.00, 5, 1, 2, 0),
('Toyota Corolla', 17, 3, '1 unit', 18000.00, 3, 1, 1, 0),
('Honda Civic', 18, 3, '1 unit', 21000.00, 2, 1, 1, 0),
('Apple MacBook Pro', 19, 1, '1 unit', 1300.00, 10, 3, 3, 0),
('Samsung Galaxy Tab', 20, 1, '1 unit', 600.00, 12, 4, 4, 0);


INSERT INTO Employees (Fname, Lname, Title, TitleOfCourtesy, DOB, HireDate, EAddress, City, Region, PostalCode, Country, HomePhone, Extension, Notes, ReportsTo)
VALUES
('John', 'Doe', 'Manager', 'Mr.', '1980-05-15', '2020-01-10', '123 Elm St', 'New York', 'NY', '10001', 'USA', '(123) 456-7890', '101', 'Handles project management', 'Jane Smith'),
('Jane', 'Smith', 'Assistant Manager', 'Ms.', '1985-03-22', '2021-03-15', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA', '(234) 567-8901', '102', 'Supports management team', 'John Doe'),
('Emily', 'Johnson', 'Sales Representative', 'Ms.', '1990-07-30', '2022-06-01', '789 Pine St', 'Chicago', 'IL', '60601', 'USA', '(345) 678-9012', '103', 'Manages client relationships', 'John Doe'),
('Michael', 'Brown', 'Sales Representative', 'Mr.', '1988-11-25', '2023-01-10', '101 Maple St', 'Houston', 'TX', '77001', 'USA', '(456) 789-0123', '104', 'Handles sales inquiries', 'John Doe'),
('Jessica', 'Williams', 'HR Specialist', 'Ms.', '1985-09-12', '2020-07-15', '202 Birch St', 'Phoenix', 'AZ', '85001', 'USA', '(567) 890-1234', '105', 'Oversees employee relations', 'Jane Smith'),
('David', 'Jones', 'IT Specialist', 'Mr.', '1982-04-18', '2019-11-20', '303 Cedar St', 'Philadelphia', 'PA', '19101', 'USA', '(678) 901-2345', '106', 'Maintains IT infrastructure', 'John Doe'),
('Sarah', 'Miller', 'Marketing Coordinator', 'Ms.', '1987-12-03', '2021-05-10', '404 Elm St', 'San Antonio', 'TX', '78201', 'USA', '(789) 012-3456', '107', 'Coordinates marketing campaigns', 'Jane Smith'),
('Robert', 'Davis', 'Finance Analyst', 'Mr.', '1984-06-16', '2022-08-25', '505 Oak St', 'San Diego', 'CA', '92101', 'USA', '(890) 123-4567', '108', 'Analyzes financial reports', 'John Doe'),
('Linda', 'Garcia', 'Customer Service', 'Ms.', '1991-02-20', '2020-12-05', '606 Pine St', 'Dallas', 'TX', '75201', 'USA', '(901) 234-5678', '109', 'Handles customer inquiries', 'Jane Smith'),
('James', 'Martinez', 'Product Manager', 'Mr.', '1983-10-13', '2021-02-20', '707 Maple St', 'San Jose', 'CA', '95101', 'USA', '(012) 345-6789', '110', 'Oversees product development', 'John Doe'),
('Mary', 'Hernandez', 'Administrative Assistant', 'Ms.', '1995-05-25', '2023-04-01', '808 Birch St', 'Austin', 'TX', '73301', 'USA', '(123) 456-7891', '111', 'Supports administrative functions', 'Jane Smith'),
('William', 'Lopez', 'Warehouse Manager', 'Mr.', '1986-08-17', '2019-10-05', '909 Cedar St', 'Jacksonville', 'FL', '32201', 'USA', '(234) 567-8902', '112', 'Manages warehouse operations', 'John Doe'),
('Elizabeth', 'Gonzalez', 'Product Specialist', 'Ms.', '1992-07-11', '2021-01-20', '1010 Elm St', 'San Francisco', 'CA', '94101', 'USA', '(345) 678-9013', '113', 'Specializes in product knowledge', 'Jane Smith'),
('Charles', 'Wilson', 'Operations Manager', 'Mr.', '1980-11-19', '2018-08-30', '1111 Oak St', 'Columbus', 'OH', '43201', 'USA', '(456) 789-0124', '114', 'Oversees operations', 'John Doe'),
('Patricia', 'Anderson', 'Sales Manager', 'Ms.', '1987-06-14', '2022-09-01', '1212 Pine St', 'Indianapolis', 'IN', '46201', 'USA', '(567) 890-1235', '115', 'Manages sales team', 'Jane Smith'),
('Daniel', 'Thomas', 'Business Analyst', 'Mr.', '1989-04-22', '2021-05-15', '1313 Maple St', 'Fort Worth', 'TX', '76101', 'USA', '(678) 901-2346', '116', 'Analyzes business processes', 'John Doe'),
('Nancy', 'Jackson', 'Quality Assurance', 'Ms.', '1994-09-30', '2022-12-10', '1414 Cedar St', 'Charlotte', 'NC', '28201', 'USA', '(789) 012-3457', '117', 'Ensures product quality', 'Jane Smith'),
('Christopher', 'White', 'Training Coordinator', 'Mr.', '1981-01-08', '2019-07-01', '1515 Elm St', 'Detroit', 'MI', '48201', 'USA', '(890) 123-4568', '118', 'Coordinates training programs', 'John Doe'),
('Karen', 'Lee', 'Logistics Coordinator', 'Ms.', '1988-05-20', '2023-02-15', '1616 Oak St', 'El Paso', 'TX', '79901', 'USA', '(901) 234-5679', '119', 'Manages logistics operations', 'Jane Smith'),
('Andrew', 'Martin', 'R&D Specialist', 'Mr.', '1993-11-27', '2022-04-20', '1717 Pine St', 'Seattle', 'WA', '98101', 'USA', '(012) 345-6780', '120', 'Specializes in research and development', 'John Doe');




INSERT INTO Shippers (CompanyName, Phone)
VALUES
('FastShip Inc.', '(123) 456-7890'),
('QuickDeliver Ltd.', '(234) 567-8901'),
('ShipFast Co.', '(345) 678-9012'),
('SpeedyShipping LLC', '(456) 789-0123'),
('SwiftTransport Corp.', '(567) 890-1234'),
('FastShip Inc.', '(123) 456-7890'), 
('QuickDeliver Ltd.', '(234) 567-8901'), 
('ShipFast Co.', '(345) 678-9012'), 
('SpeedyShipping LLC', '(456) 789-0123'), 
('SwiftTransport Corp.', '(567) 890-1234'), 
('RapidTransit Inc.', '(678) 901-2345'),
('ExpressCourier Ltd.', '(789) 012-3456'),
('FreightMasters Co.', '(890) 123-4567'),
('CargoShip LLC', '(901) 234-5678'),
('LogisticsPro Corp.', '(012) 345-6789'),
('RapidTransit Inc.', '(678) 901-2345'), 
('ExpressCourier Ltd.', '(789) 012-3456'),  
('FreightMasters Co.', '(890) 123-4567'), 
('CargoShip LLC', '(901) 234-5678'), 
('LogisticsPro Corp.', '(012) 345-6789'),
('LogisticsPro Corp.', '(012) 345-6789'); 


INSERT INTO Customers (CompanyName, ContactName, ContactTitle, cAddress, City, Region, PostalCode, Country, Phone, Fax)
VALUES
('Acme Corp.', 'John Doe', 'Sales Manager', '123 Main St', 'New York', 'NY', '10001', 'USA', '(123) 456-7890', '(123) 456-7891'),
('Beta Industries', 'Jane Smith', 'Marketing Director', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA', '(234) 567-8901', '(234) 567-8902'),
('Gamma LLC', 'Emily Johnson', 'HR Specialist', '789 Pine St', 'Chicago', 'IL', '60601', 'USA', '(345) 678-9012', '(345) 678-9013'),
('Delta Ltd.', 'Michael Brown', 'IT Manager', '101 Maple St', 'Houston', 'TX', '77001', 'USA', '(456) 789-0123', '(456) 789-0124'),
('Epsilon Enterprises', 'Jessica Williams', 'Finance Director', '202 Birch St', 'Phoenix', 'AZ', '85001', 'USA', '(567) 890-1234', '(567) 890-1235'),
('Zeta Co.', 'David Jones', 'Operations Manager', '303 Cedar St', 'Philadelphia', 'PA', '19101', 'USA', '(678) 901-2345', '(678) 901-2346'),
('Eta Corp.', 'Sarah Miller', 'Customer Service', '404 Elm St', 'San Antonio', 'TX', '78201', 'USA', '(789) 012-3456', '(789) 012-3457'),
('Theta Ltd.', 'Robert Davis', 'Product Manager', '505 Oak St', 'San Diego', 'CA', '92101', 'USA', '(890) 123-4567', '(890) 123-4568'),
('Iota Inc.', 'Linda Garcia', 'Administrative Assistant', '606 Pine St', 'Dallas', 'TX', '75201', 'USA', '(901) 234-5678', '(901) 234-5679'),
('Kappa LLC', 'James Martinez', 'Sales Representative', '707 Maple St', 'San Jose', 'CA', '95101', 'USA', '(012) 345-6789', '(012) 345-6790'),
('Lambda Co.', 'Mary Hernandez', 'Logistics Coordinator', '808 Birch St', 'Austin', 'TX', '73301', 'USA', '(123) 456-7892', '(123) 456-7893'),
('Mu Enterprises', 'William Lopez', 'Quality Assurance', '909 Cedar St', 'Jacksonville', 'FL', '32201', 'USA', '(234) 567-8903', '(234) 567-8904'),
('Nu Ltd.', 'Elizabeth Gonzalez', 'Business Analyst', '1010 Elm St', 'San Francisco', 'CA', '94101', 'USA', '(345) 678-9014', '(345) 678-9015'),
('Xi Corp.', 'Charles Wilson', 'Training Coordinator', '1111 Oak St', 'Columbus', 'OH', '43201', 'USA', '(456) 789-0125', '(456) 789-0126'),
('Omicron LLC', 'Patricia Anderson', 'Product Specialist', '1212 Pine St', 'Indianapolis', 'IN', '46201', 'USA', '(567) 890-1236', '(567) 890-1237'),
('Theta Ltd.', 'Robert Davis', 'Product Manager', '505 Oak St', 'San Diego', 'CA', '92101', 'USA', '(890) 123-4567', '(890) 123-4568'),
('Iota Inc.', 'Linda Garcia', 'Administrative Assistant', '606 Pine St', 'Dallas', 'TX', '75201', 'USA', '(901) 234-5678', '(901) 234-5679'),
('Kappa LLC', 'James Martinez', 'Sales Representative', '707 Maple St', 'San Jose', 'CA', '95101', 'USA', '(012) 345-6789', '(012) 345-6790'),
('Lambda Co.', 'Mary Hernandez', 'Logistics Coordinator', '808 Birch St', 'Austin', 'TX', '73301', 'USA', '(123) 456-7892', '(123) 456-7893'),
('Upsilon Co.', 'Andrew Martin', 'Operations Manager', '1717 Pine St', 'Seattle', 'WA', '98101', 'USA', '(012) 345-6781', '(012) 345-6782'),
('Phi LLC', 'Jessica Williams', 'Administrative Assistant', '1818 Birch St', 'Tucson', 'AZ', '85701', 'USA', '(123) 456-7893', '(123) 456-7894'); 


INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
VALUES
(1, 2, '2024-07-01', '2024-07-10', '2024-07-05', 1, 12.50, 'Alpha Corp', '123 Elm St', 'Metropolis', 'East', 'E12345', 'USA'),
(2, 3, '2024-07-02', '2024-07-11', '2024-07-06', 2, 15.00, 'Beta LLC', '456 Oak St', 'Gotham', 'West', 'W67890', 'Canada'),
(3, 4, '2024-07-03', '2024-07-12', '2024-07-07', 3, 20.00, 'Gamma Inc', '789 Pine St', 'Star City', 'North', 'N11223', 'UK'),
(4, 5, '2024-07-04', '2024-07-13', '2024-07-08', 4, 25.00, 'Delta Ltd', '321 Maple St', 'Central City', 'South', 'S33445', 'Germany'),
(5, 1, '2024-07-05', '2024-07-14', '2024-07-09', 5, 30.00, 'Epsilon Corp', '654 Birch St', 'Coast City', 'West', 'W55667', 'Australia'),
(1, 2, '2024-07-06', '2024-07-15', '2024-07-10', 1, 35.00, 'Alpha Corp', '123 Elm St', 'Metropolis', 'East', 'E12345', 'USA'),
(2, 3, '2024-07-07', '2024-07-16', '2024-07-11', 2, 40.00, 'Beta LLC', '456 Oak St', 'Gotham', 'West', 'W67890', 'Canada'),
(3, 4, '2024-07-08', '2024-07-17', '2024-07-12', 3, 45.00, 'Gamma Inc', '789 Pine St', 'Star City', 'North', 'N11223', 'UK'),
(4, 5, '2024-07-09', '2024-07-18', '2024-07-13', 4, 50.00, 'Delta Ltd', '321 Maple St', 'Central City', 'South', 'S33445', 'Germany'),
(5, 1, '2024-07-10', '2024-07-19', '2024-07-14', 5, 55.00, 'Epsilon Corp', '654 Birch St', 'Coast City', 'West', 'W55667', 'Australia'),
(1, 2, '2024-07-11', '2024-07-20', '2024-07-15', 6, 60.00, 'Zeta LLC', '987 Cedar St', 'Blüdhaven', 'East', 'E77889', 'France'),
(2, 3, '2024-07-12', '2024-07-21', '2024-07-16', 7, 65.00, 'Eta Ltd', '654 Spruce St', 'Keystone City', 'North', 'N99001', 'Italy'),
(3, 4, '2024-07-13', '2024-07-22', '2024-07-17', 8, 70.00, 'Theta Inc', '321 Willow St', 'Hub City', 'South', 'S11213', 'Spain'),
(4, 5, '2024-07-14', '2024-07-23', '2024-07-18', 9, 75.00, 'Iota Corp', '789 Aspen St', 'Fawcett City', 'West', 'W44556', 'Netherlands'),
(5, 1, '2024-07-15', '2024-07-24', '2024-07-19', 10, 80.00, 'Kappa Ltd', '123 Redwood St', 'Ivy Town', 'North', 'N66778', 'Brazil'),
(1, 2, '2024-07-16', '2024-07-25', '2024-07-20', 1, 85.00, 'Alpha Corp', '123 Elm St', 'Metropolis', 'East', 'E12345', 'USA'),
(2, 3, '2024-07-17', '2024-07-26', '2024-07-21', 2, 90.00, 'Beta LLC', '456 Oak St', 'Gotham', 'West', 'W67890', 'Canada'),
(3, 4, '2024-07-18', '2024-07-27', '2024-07-22', 3, 95.00, 'Gamma Inc', '789 Pine St', 'Star City', 'North', 'N11223', 'UK'),
(4, 5, '2024-07-19', '2024-07-28', '2024-07-23', 4, 100.00, 'Delta Ltd', '321 Maple St', 'Central City', 'South', 'S33445', 'Germany'),
(5, 1, '2024-07-20', '2024-07-29', '2024-07-24', 5, 105.00, 'Epsilon Corp', '654 Birch St', 'Coast City', 'West', 'W55667', 'Australia');



INSERT INTO OrderDetails (OrderID,ProductID, UnitPrice, Quantity, Discount)
VALUES
(2,1, 15.50, 10, 0.05),
(5,2, 25.75, 5, 0.10),
(3,3, 10.00, 20, 0.02),
(9,4, 30.00, 7, 0.15),
(1,5, 50.00, 3, 0.20),
(1,6, 40.25, 8, 0.05),
(5,7, 60.75, 2, 0.10),
(6,8, 22.50, 15, 0.20),
(7,9, 18.00, 9, 0.00),
(17,10, 35.50, 6, 0.25),
(12,1, 15.50, 10, 0.05), 
(11,2, 25.75, 5, 0.10),
(19,3, 10.00, 20, 0.00),
(13,4, 30.00, 7, 0.15),
(4,5, 50.00, 3, 0.20), 
(8,6, 40.25, 8, 0.05),
(3,7, 60.75, 2, 0.10),
(5,8, 22.50, 15, 0.30),
(2,9, 18.00, 9, 0.01),
(10,10, 35.50, 6, 0.25);
