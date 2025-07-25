CREATE DATABASE IF NOT EXISTS DemoDB;
USE DemoDB;

CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) NOT NULL,
    productName VARCHAR(100) NOT NULL,
    productPrice DECIMAL(10, 2) NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus BIT DEFAULT 1
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES 
('P001', 'iPhone 13', 799.99, 10, 'Apple smartphone', 1),
('P002', 'Samsung Galaxy S21', 699.99, 15, 'Samsung flagship', 1),
('P003', 'Xiaomi Redmi Note 10', 299.99, 20, 'Budget phone', 1),
('P004', 'Macbook Air', 999.99, 5, 'Apple laptop', 1);

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX idx_product_code ON Products(productCode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX idx_name_price ON Products(productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM Products WHERE productCode = 'P003';

EXPLAIN SELECT * FROM Products WHERE productName = 'iPhone 13' AND productPrice = 799.99;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW vw_product_basic AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;
-- Tiến hành sửa đổi view
CREATE OR REPLACE VIEW vw_product_basic AS
SELECT productCode, productName, productPrice, productAmount, productStatus
FROM Products;
-- Tiến hành xoá view
DROP VIEW IF EXISTS vw_product_basic;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE sp_get_all_products()
BEGIN
    SELECT * FROM Products;
END;
//
DELIMITER ;

-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE sp_add_product(
    IN pCode VARCHAR(50),
    IN pName VARCHAR(100),
    IN pPrice DECIMAL(10,2),
    IN pAmount INT,
    IN pDesc TEXT,
    IN pStatus BIT
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (pCode, pName, pPrice, pAmount, pDesc, pStatus);
END;
//
DELIMITER ;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE sp_update_product(
    IN pId INT,
    IN pCode VARCHAR(50),
    IN pName VARCHAR(100),
    IN pPrice DECIMAL(10,2),
    IN pAmount INT,
    IN pDesc TEXT,
    IN pStatus BIT
)
BEGIN
    UPDATE Products
    SET productCode = pCode,
        productName = pName,
        productPrice = pPrice,
        productAmount = pAmount,
        productDescription = pDesc,
        productStatus = pStatus
    WHERE Id = pId;
END;
//
DELIMITER ;

-- Tạo store procedure xoá sản phẩm theo id

DELIMITER //
CREATE PROCEDURE sp_delete_product(IN pId INT)
BEGIN
    DELETE FROM Products WHERE Id = pId;
END;
//
DELIMITER ;



