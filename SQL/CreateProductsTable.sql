-- Run this script in SSMS to create the Products table

USE UserDb;
GO

-- Create Products Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Products')
BEGIN
    CREATE TABLE Products (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Name VARCHAR(200) NOT NULL,
        Description VARCHAR(500),
        Price DECIMAL(18,2) NOT NULL,
        Stock INT NOT NULL,
        Category VARCHAR(100),
        CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
        UpdatedAt DATETIME
    );

    PRINT 'Products table created successfully!';
END
ELSE
BEGIN
    PRINT 'Products table already exists!';
END
GO

-- Insert sample data (optional)
INSERT INTO Products (Name, Description, Price, Stock, Category)
VALUES 
    ('Laptop', 'High-performance laptop', 999.99, 10, 'Electronics'),
    ('Mouse', 'Wireless mouse', 29.99, 50, 'Electronics'),
    ('Keyboard', 'Mechanical keyboard', 79.99, 30, 'Electronics');
GO

SELECT * FROM Products;
GO
