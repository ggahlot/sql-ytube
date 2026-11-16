/* FableMangoDB — teaching database for "SQL with Gaurav" (T-SQL / SQL Server)
   Structure follows FableMango-MSSQL-Masterclass-v3.md (constraints, fixed dates, a zero-order customer).
   Differences from v3: every product name is fictitious (no real GPU/CPU/board model numbers),
   loyalty tier 'SiliconVIP' is now 'MangoVIP', and "WiFi" is spelled out as "Wireless".
   All people, emails (example.com is reserved) and companies are fictional. */

CREATE DATABASE FableMangoDB;
GO
USE FableMangoDB;
GO

CREATE TABLE Categories (
    CategoryID   INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Products (
    ProductID     INT PRIMARY KEY IDENTITY(100,1),
    ProductName   VARCHAR(100) NOT NULL,
    CategoryID    INT NOT NULL FOREIGN KEY REFERENCES Categories(CategoryID),
    UnitPrice     DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),
    StockQuantity INT NOT NULL CHECK (StockQuantity >= 0),
    Discontinued  BIT NOT NULL DEFAULT 0
);

CREATE TABLE Customers (
    CustomerID  INT PRIMARY KEY IDENTITY(1000,1),
    FullName    VARCHAR(100) NOT NULL,
    Email       VARCHAR(100) NOT NULL UNIQUE,
    Country     VARCHAR(50)  NOT NULL,
    LoyaltyTier VARCHAR(20)  NOT NULL DEFAULT 'Bronze'   -- Bronze, Silver, Gold, MangoVIP
);

CREATE TABLE Orders (
    OrderID     INT PRIMARY KEY IDENTITY(5000,1),
    CustomerID  INT NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate   DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    OrderStatus VARCHAR(20) NOT NULL DEFAULT 'Pending'   -- Pending, Shipped, Delivered, Cancelled
);

CREATE TABLE OrderItems (
    OrderItemID     INT PRIMARY KEY IDENTITY(1,1),
    OrderID         INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID       INT NOT NULL FOREIGN KEY REFERENCES Products(ProductID),
    Quantity        INT NOT NULL CHECK (Quantity > 0),
    UnitPriceAtSale DECIMAL(10,2) NOT NULL
);
GO

INSERT INTO Categories (CategoryName)
VALUES ('GPUs'), ('CPUs'), ('Motherboards'), ('RAM'), ('NVMe Storage');   -- IDs 1..5

INSERT INTO Products (ProductName, CategoryID, UnitPrice, StockQuantity, Discontinued)
VALUES
    ('MangoForce G90 Flagship',            1, 1999.99,  12, 0),  -- 100
    ('MangoForce G80 Aero',                1, 1199.99,  35, 0),  -- 101
    ('MangoForce G40 Legacy',              1,  549.99,   4, 1),  -- 102 (discontinued)
    ('CoreMango C9-900 Unlocked',          2,  629.99,  28, 0),  -- 103
    ('CoreMango C9-950 Max',               2,  649.99,  19, 0),  -- 104
    ('MangoBoard X900 Pro Wireless',       3,  389.99,  42, 0),  -- 105
    ('MangoBoard B600 Creator',            3,  219.99,  60, 0),  -- 106
    ('HyperMango DDR5 64GB Kit (6400MHz)', 4,  229.99,  75, 0),  -- 107
    ('HyperMango DDR5 32GB Kit (6000MHz)', 4,  119.99, 110, 0),  -- 108
    ('MangoDrive Gen5 4TB NVMe SSD',       5,  349.99,  50, 0);  -- 109

INSERT INTO Customers (FullName, Email, Country, LoyaltyTier)
VALUES
    ('Elena Rostova', 'elena.r@example.com',      'Canada',         'MangoVIP'),  -- 1000
    ('Marcus Vance',  'mvance@example.com',       'United States',  'Gold'),      -- 1001
    ('Priya Nair',    'priya.nair@example.com',   'India',          'Silver'),    -- 1002
    ('Liam OConnor',  'liam.oc@example.com',      'United Kingdom', 'Bronze'),    -- 1003
    ('Sofia Chen',    'sofia.chen@example.com',   'Canada',         'Gold'),      -- 1004
    ('Noah Becker',   'n.becker@example.com',     'Germany',        'Bronze');    -- 1005 (zero orders, for LEFT JOIN demos)

INSERT INTO Orders (CustomerID, OrderDate, OrderStatus)
VALUES
    (1000, '2026-10-01 10:15:00', 'Delivered'),  -- 5000
    (1000, '2026-11-02 14:30:00', 'Shipped'),    -- 5001
    (1001, '2026-10-12 09:45:00', 'Delivered'),  -- 5002
    (1002, '2026-10-20 18:20:00', 'Delivered'),  -- 5003
    (1003, '2026-11-05 11:05:00', 'Pending'),    -- 5004
    (1004, '2026-11-10 16:50:00', 'Shipped');    -- 5005

INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPriceAtSale)
VALUES
    (5000, 100, 1, 1999.99),   -- G90 Flagship
    (5000, 107, 2,  229.99),   -- DDR5 64GB
    (5001, 109, 2,  349.99),   -- NVMe 4TB
    (5002, 101, 1, 1199.99),   -- G80 Aero
    (5002, 103, 1,  629.99),   -- C9-900
    (5003, 108, 2,  119.99),   -- DDR5 32GB
    (5004, 106, 1,  219.99),   -- B600 Creator
    (5005, 104, 1,  649.99),   -- C9-950 Max
    (5005, 105, 1,  389.99);   -- X900 Pro Wireless
GO
