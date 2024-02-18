create database garment_database_system;
USE garment_database_system;

create table DEPARTMENT(
 Department_ID varchar(10) not null ,
 Department_Name varchar(20),
 Discription varchar (50) ,
 Department_Head varchar(20),
 primary key(Department_ID));
 
 create table EMPLOYEE(Employee_ID varchar (10) not null primary KEY ,
 Department_ID varchar(10),
 Email varchar(25),
 Born_Year int(4),
 Born_Month int(4),
 Born_Date int(4),
 Age int(3),
 First_Name varchar(20),
 Last_Name varchar(20),
 Salary int (10),
 Position varchar(20),
 foreign key (Department_ID) references DEPARTMENT(Department_ID)on delete set null on update cascade);
 
CREATE TABLE CHILD (
    Child_Name VARCHAR(20) NOT NULL,
    Employee_ID VARCHAR(10),
    Age INT(5),
    Gender VARCHAR(8),
    PRIMARY KEY (Child_Name,Employee_ID),
    FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

 
-- Create table for customers
CREATE TABLE CUSTORMER (
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Customer_ID VARCHAR(10) not null PRIMARY KEY,
    Street_Name VARCHAR(20),
    City VARCHAR(20),
    State VARCHAR(20),
    PostalCode VARCHAR(20),
    Country VARCHAR(30),
    Email VARCHAR(30)
);

-- Create table for customer phone numbers
CREATE TABLE CUS_PHONE_NUMBER (
    Phone_Number CHAR(15) not null,
    Customer_ID VARCHAR(10),
    PRIMARY KEY (Phone_Number, Customer_ID),
    FOREIGN KEY (Customer_ID) REFERENCES CUSTORMER(Customer_ID) ON DELETE cascade ON UPDATE CASCADE
);
 
create table Custormer_Order(Order_ID varchar (10) not null ,
 Customer_ID varchar (10),
 Employee_ID varchar (10) ,
 Order_Date date ,
 Delivery_Date date ,
 Order_status varchar (30),
 Total_Amount int(10),
 foreign key (Employee_ID) REFERENCES EMPLOYEE(Employee_ID) on delete set null on update cascade ,
 foreign key (Customer_ID) REFERENCES CUSTORMER(Customer_ID) on delete set null on update cascade ,
 primary key ( Order_ID));
 

CREATE TABLE DELIVERY (
    Order_ID VARCHAR(10),
    Delivery_ID VARCHAR(10) NOT NULL,
    Street_Name VARCHAR(20),
    City VARCHAR(20),
    State VARCHAR(20),
    PostalCode VARCHAR(20),
    Country VARCHAR(30),
    Delivery_Date DATE,
    PRIMARY KEY (Delivery_ID, Order_ID),
    FOREIGN KEY (Order_ID) REFERENCES Custormer_Order(Order_ID) ON DELETE cascade ON UPDATE CASCADE
);

 create table PAYMENT(
 Customer_ID varchar (10),
 Payment_ID varchar (10) not null ,
 Payment_Date date ,
 cash boolean  ,
 Online_payment boolean,
 foreign key (Customer_ID) REFERENCES CUSTORMER(Customer_ID) on delete set null on update cascade ,
 primary key ( Payment_ID));
 
 create table PRODUCT(
 Product_ID varchar (10) not null ,
 Product_Name varchar (20),
 Product_Description varchar(50),
 Size varchar (10),
 Category varchar (20),
 Price int(20),
 primary key (Product_ID));

 create table ORDER_ITEM(
 Customer_ID varchar (10),
 Item_ID varchar (10) not null ,
 Product_ID varchar (10) ,
 Quantity int(10) ,
 Price int(20) ,
 foreign key (Customer_ID) REFERENCES CUSTORMER(Customer_ID) on delete set null on update cascade ,
 foreign key (Product_ID) REFERENCES PRODUCT(Product_ID) on delete set null on update cascade ,
 primary key (Item_ID));
  
create table SUPPLIER(
 First_Name varchar (20),
 Last_Name varchar (20),
 Suppllier_ID varchar (10) not null ,
 Contact_Person varchar (30),
 Email varchar (30) ,
 Phone_Number int(15),
 primary key (Suppllier_ID));

 create table MATERIAL(
 Material_ID varchar (10) not null ,
 Suppllier_ID varchar (10),
 Material_Name varchar (30) ,
 Product_ID varchar (10),
 Colour varchar (10) ,
 Material_Type varchar (10) ,
 Price_Per_Unit int(10),
 foreign key (Product_ID) REFERENCES PRODUCT(Product_ID) on delete set null on update cascade ,
 foreign key (Suppllier_ID) REFERENCES SUPPLIER(Suppllier_ID) on delete set null on update cascade ,
 primary key (Material_ID));

 
-- DEPARTMENT table
INSERT INTO DEPARTMENT (Department_ID, Department_Name, Discription, Department_Head)
VALUES
    ('D001', 'HR', 'Human Resources', 'John Doe'),
    ('D002', 'IT', 'Information Technology', 'Alice Smith'),
    ('D003', 'Finance', 'Finance and Accounting', 'Bob Johnson'),
    ('D004', 'Sales', 'Sales and Marketing', 'Eva Williams'),
    ('D005', 'Production', 'Production Department', 'Mike Brown'),
    ('D006', 'Research', 'Research and Development', 'Lisa Davis');

-- EMPLOYEE table
INSERT INTO EMPLOYEE (Employee_ID, Department_ID, Email, Born_Year, Born_Month, Born_Date, Age, First_Name, Last_Name, Salary, Position)
VALUES
    ('E001', 'D001', 'john@example.com', 1980, 5, 15, 43, 'John', 'Doe', 50000, 'HR Manager'),
    ('E002', 'D002', 'alice@example.com', 1990, 8, 20, 32, 'Alice', 'Smith', 60000, 'Software Engineer'),
    ('E003', 'D002', 'bob@example.com', 1985, 3, 10, 37, 'Bob', 'Johnson', 55000, null ),
    ('E004', 'D004', 'eva@example.com', 1992, 11, 5, 29, 'Eva', 'Williams', 52000, 'Sales Executive'),
    ('E005', 'D004', 'mike@example.com', 1988, 6, 25, 34, 'Mike', 'Brown', 48000, 'Sales Executive'),
    ('E006', 'D006', 'lisa@example.com', 1987, 9, 30, 35, 'Lisa', 'Davis', 56000, 'Research Scientist');

-- CHILD table
INSERT INTO CHILD (Child_Name, Employee_ID, Age, Gender)
VALUES
    ('Child1', 'E001', 5, 'Male'),
    ('Child2', 'E002', 3, 'Female'),
    ('Child3', 'E004', 6, 'Male'),
    ('Child4', 'E006', 4, 'Female'),
    ('Child5', 'E003', 7, 'Male'),
    ('Child6', 'E005', 5, 'Female');

-- CUSTORMER table
INSERT INTO CUSTORMER (First_Name, Last_Name, Customer_ID, Street_Name, City, State, PostalCode, Country, Email)
VALUES
    ('Saman', 'Perera', 'C001', '123 Main St', 'Colombo', 'Western', '10000', 'Sri Lanka', 'saman@example.com'),
    ('Nimal', 'Fernando', 'C002', '456 Elm St', 'Kandy', 'Central', '20000', 'Sri Lanka', 'nimal@example.com'),
    ('Kamal', 'Silva', 'C003', '789 Oak St', 'Galle', 'Southern', '30000', 'Sri Lanka', 'kamal@example.com'),
    ('Priya', 'Rajapakse', 'C004', '101 Pine St', 'Jaffna', 'Northern', '40000', 'Sri Lanka', 'priya@example.com'),
    ('Rohan', 'Bandara', 'C005', '202 Cedar St', 'Negombo', 'Western', '50000', 'Sri Lanka', 'rohan@example.com'),
    ('Sujitha', 'Fernando', 'C006', '303 Birch St', 'Matara', 'Southern', '60000', 'Sri Lanka', 'sujitha@example.com');

-- CUS_PHONE_NUMBER table
INSERT INTO CUS_PHONE_NUMBER (Phone_Number, Customer_ID)
VALUES
    (0772635432, 'C001'),
    (0775643245, 'C002'),
    (0778598786, 'C003'),
    (0765667788, 'C004'),
    (0756778899, 'C005'),
    (0727889900, 'C006');

-- Custormer_Order table
INSERT INTO Custormer_Order (Order_ID, Customer_ID, Employee_ID, Order_Date, Delivery_Date, Order_status, Total_Amount)
VALUES
    ('O001', 'C001', 'E001', '2023-09-08', '2023-09-15', 'Pending', 5000),
    ('O002', 'C002', 'E002', '2023-09-08', '2023-09-16', 'Shipped', 7500),
    ('O003', 'C003', 'E003', '2023-09-09', '2023-09-17', 'Delivered', 6000),
    ('O004', 'C004', 'E004', '2023-09-10', '2023-09-18', 'Pending', 5500),
    ('O005', 'C004', 'E005', '2023-09-11', '2023-09-19', 'Shipped', 8000),
    ('O006', 'C006', 'E006', '2023-09-12', '2023-09-20', 'Delivered', 7000);

-- DELIVERY table
INSERT INTO DELIVERY (Order_ID, Delivery_ID, Street_Name, City, State, PostalCode, Country, Delivery_Date)
VALUES
    ('O001', 'D001', '123 Main St', 'Colombo', 'Western', '10000', 'Sri Lanka', '2023-09-15'),
    ('O002', 'D002', '456 Elm St', 'Kandy', 'Central', '20000', 'Sri Lanka', '2023-09-16'),
    ('O003', 'D003', '789 Oak St', 'Galle', 'Southern', '30000', 'Sri Lanka', '2023-09-17'),
    ('O004', 'D004', '101 Pine St', 'Jaffna', 'Northern', '40000', 'Sri Lanka', '2023-09-18'),
    ('O005', 'D005', '202 Cedar St', 'Negombo', 'Western', '50000', 'Sri Lanka', '2023-09-19'),
    ('O006', 'D006', '303 Birch St', 'Matara', 'Southern', '60000', 'Sri Lanka', '2023-09-20');


-- PAYMENT table
INSERT INTO PAYMENT (Customer_ID, Payment_ID, Payment_Date, cash, Online_payment)
VALUES
    ('C001', 'P001', '2023-09-10', true, false),
    ('C002', 'P002', '2023-09-11', false, true),
    ('C003', 'P003', '2023-09-12', true, false),
    ('C004', 'P004', '2023-09-13', false, true),
    ('C005', 'P005', '2023-09-14', true, false),
    ('C006', 'P006', '2023-09-15', false, true);

-- PRODUCT table
INSERT INTO PRODUCT (Product_ID, Product_Name, Product_Description, Size, Category, Price)
VALUES
    ('PRD001', 'Shirt', 'Cotton shirt for men', 'M', 'Clothing', 2000),
    ('PRD002', 'Dress', 'Summer dress for women', 'S', 'Clothing', 2500),
    ('PRD003', 'Shoes', 'Leather shoes for men', '10', 'Footwear', 3000),
    ('PRD004', 'Handbag', 'Leather handbag for women', 'Medium', 'Accessories', 1500),
    ('PRD005', 'Hat', 'Sun hat for all', 'One Size', 'Accessories', 800),
    ('PRD006', 'Jeans', 'Denim jeans for men', '32', 'Clothing', 1800);

-- ORDER_ITEM table
INSERT INTO ORDER_ITEM (Customer_ID, Item_ID, Product_ID, Quantity, Price)
VALUES
    ('C001', 'I001', 'PRD001', 2, 4000),
    ('C002', 'I002', 'PRD001', 1, 2500),
    ('C003', 'I003', 'PRD003', 1, 3000),
    ('C004', 'I004', 'PRD003', 3, 4500),
    ('C005', 'I005', 'PRD005', 2, 1600),
    ('C006', 'I006', 'PRD006', 2, 3600);

-- SUPPLIER table
INSERT INTO SUPPLIER (First_Name, Last_Name, Suppllier_ID, Contact_Person, Email, Phone_Number)
VALUES
    ('ABC Textiles', 'Private Ltd', 'S001', 'John Supplier', 'johnsupplier@example.com', 772345678),
    ('XYZ Footwear', 'Suppliers', 'S002', 'Alice Supplier', 'alicesupplier@example.com', 773456789),
    ('Leather World', 'Exports', 'S003', 'Bob Supplier', 'bobsupplier@example.com', 774567890),
    ('FashionHub', 'Supplies', 'S004', 'Eva Supplier', 'evasupplier@example.com', 775678901),
    ('Accessories Plus', 'Imports', 'S005', 'Mike Supplier', 'mikesupplier@example.com', 776789012),
    ('Jeans Inc', 'International', 'S006', 'Lisa Supplier', 'lisasupplier@example.com', 777890123);

-- MATERIAL table
INSERT INTO MATERIAL (Material_ID, Suppllier_ID, Material_Name, Product_ID, Colour, Material_Type, Price_Per_Unit)
VALUES
    ('M001', 'S001', 'Cotton Fabric', 'PRD001', 'White', 'Fabric', 500),
    ('M002', 'S002', 'Leather', 'PRD003', 'Black', 'Leather', 1000),
    ('M003', 'S003', 'Leather', 'PRD004', 'Brown', 'Leather', 800),
    ('M004', 'S004', 'Straw', 'PRD005', 'Beige', 'Straw', 300),
    ('M005', 'S005', 'Denim Fabric', 'PRD006', 'Blue', 'Fabric', 600),
    ('M006', 'S006', 'Cotton Fabric', 'PRD002', 'Red', 'Fabric', 550);
    
    

-- update 

-- Update two rows in the DEPARTMENT table
UPDATE DEPARTMENT
SET Department_Name = 'New Department Name', Discription = 'New Description'
WHERE Department_ID = 'D001';

UPDATE DEPARTMENT
SET Department_Head = 'New Department Head'
WHERE Department_ID = 'D002';

-- Update two rows in the EMPLOYEE table
UPDATE EMPLOYEE
SET Salary = 55000, Position = 'New Position'
WHERE Employee_ID = 'E001';

UPDATE EMPLOYEE
SET Salary = 60000
WHERE Employee_ID = 'E002';

-- Update two rows in the CHILD table
UPDATE CHILD
SET Age = 7
WHERE Child_Name = 'Child3' AND Employee_ID = 'E004';

UPDATE CHILD
SET Gender = 'Male'
WHERE Child_Name = 'Child5' AND Employee_ID = 'E003';

-- Update two rows in the CUSTORMER table
UPDATE CUSTORMER
SET PostalCode = '20001'
WHERE Customer_ID = 'C002';

UPDATE CUSTORMER
SET Email = 'newemail@example.com'
WHERE Customer_ID = 'C004'; 

-- Update two rows in the CUS_PHONE_NUMBER table
UPDATE CUS_PHONE_NUMBER
SET Phone_Number = 0771234567
WHERE Customer_ID = 'C003';

UPDATE CUS_PHONE_NUMBER
SET Phone_Number = 0712345678
WHERE Customer_ID = 'C005';

-- Update two rows in the Custormer_Order table
UPDATE Custormer_Order
SET Total_Amount = 6000
WHERE Order_ID = 'O003';

UPDATE Custormer_Order
SET Order_status = 'Shipped'
WHERE Order_ID = 'O004';

-- Update two rows in the DELIVERY table
UPDATE DELIVERY
SET Street_Name = 'New Street Name'
WHERE Delivery_ID = 'D001';

UPDATE DELIVERY
SET Country = 'New Country'
WHERE Delivery_ID = 'D002';

-- Update two rows in the PAYMENT table
UPDATE PAYMENT
SET Payment_Date = '2023-09-14'
WHERE Payment_ID = 'P001';

UPDATE PAYMENT
SET Online_payment = true
WHERE Payment_ID = 'P002';

-- Update two rows in the PRODUCT table
UPDATE PRODUCT
SET Price = 2200
WHERE Product_ID = 'PRD001';

UPDATE PRODUCT
SET Product_Description = 'New Product Description'
WHERE Product_ID = 'PRD002';

-- Update two rows in the ORDER_ITEM table
UPDATE ORDER_ITEM
SET Quantity = 4
WHERE Item_ID = 'I001';

UPDATE ORDER_ITEM
SET Price = 2700
WHERE Item_ID = 'I002';

-- Update two rows in the SUPPLIER table
UPDATE SUPPLIER
SET Phone_Number = 779876543
WHERE Suppllier_ID = 'S001';

UPDATE SUPPLIER
SET Email = 'newsupplier@example.com'
WHERE Suppllier_ID = 'S002';

-- Update two rows in the MATERIAL table
UPDATE MATERIAL
SET Price_Per_Unit = 600
WHERE Material_ID = 'M001';

UPDATE MATERIAL
SET Colour = 'New Colour'
WHERE Material_ID = 'M002';

-- delete
-- Delete one row from the DEPARTMENT table
DELETE FROM DEPARTMENT WHERE Department_ID = 'D001';

-- Delete one row from the EMPLOYEE table
DELETE FROM EMPLOYEE WHERE Employee_ID = 'E001';

-- Delete one row from the CHILD table
DELETE FROM CHILD WHERE Child_Name = 'Child2' AND Employee_ID = 'E002';

-- Delete one row from the CUSTORMER table
DELETE FROM CUSTORMER WHERE Customer_ID = 'C001';

-- Delete one row from the CUS_PHONE_NUMBER table
DELETE FROM CUS_PHONE_NUMBER WHERE Phone_Number = 775643245 AND Customer_ID = 'C002';

-- Delete one row from the Custormer_Order table
DELETE FROM Custormer_Order WHERE Order_ID = 'O001';

-- Delete one row from the DELIVERY table
DELETE FROM DELIVERY WHERE Order_ID = 'O002' AND Delivery_ID = 'D002';

-- Delete one row from the PAYMENT table
DELETE FROM PAYMENT WHERE Payment_ID = 'P001';

-- Delete one row from the PRODUCT table
DELETE FROM PRODUCT WHERE Product_ID = 'PRD001';

-- Delete one row from the ORDER_ITEM table
DELETE FROM ORDER_ITEM WHERE Item_ID = 'I001';

-- Delete one row from the SUPPLIER table
DELETE FROM SUPPLIER WHERE Suppllier_ID = 'S001';

-- Delete one row from the MATERIAL table
DELETE FROM MATERIAL WHERE Material_ID = 'M001';



-- simple query

-- select
SELECT First_Name, Email FROM CUSTORMER;

-- project
SELECT Customer_ID, Order_status FROM Custormer_Order;

-- cartesian product 
SELECT * from EMPLOYEE cross join CHILD;

 -- Create a user view
CREATE VIEW CustomerOrders AS
SELECT C.First_Name, CO.Order_status
FROM CUSTORMER C
JOIN Custormer_Order CO ON C.Customer_ID = CO.Customer_ID;

-- Rename
alter table SUPPLIER
RENAME COLUMN EMAIL to Customer_Email;

-- Find the average salary of all employees in the EMPLOYEE table.
SELECT AVG(Salary) AS Average_Salary FROM EMPLOYEE;

-- like
SELECT Email FROM CUSTORMER WHERE Email LIKE '%example.com%';


-- complex query


-- UNION
SELECT Product_ID FROM PRODUCT
UNION
SELECT Product_ID FROM ORDER_ITEM;


-- INTERSECTION
SELECT D1.Department_ID
FROM DEPARTMENT as D1
INNER JOIN DEPARTMENT as D2 ON D1.Department_ID = D2.Department_ID;


 -- Set Difference 
 SELECT P.Product_ID
FROM PRODUCT as P
LEFT JOIN ORDER_ITEM AS OI ON P.Product_ID = OI.Product_ID
WHERE OI.Product_ID IS NULL;


-- DIVISION
SELECT CO.Customer_ID AS C_ID
FROM Custormer_Order AS CO
WHERE NOT EXISTS (
    SELECT P.Product_ID
    FROM PRODUCT AS P
    LEFT JOIN ORDER_ITEM AS OI ON P.Product_ID = OI.Product_ID
    WHERE CO.Customer_ID = OI.Customer_ID
    AND OI.Product_ID IS NULL
);


-- inner join
CREATE VIEW EmployeeDepartment AS
SELECT E.First_Name, E.Last_Name, D.Department_Name
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON E.Department_ID = D.Department_ID;


-- naturel join
CREATE VIEW cus_order AS
SELECT C.First_Name, C.Last_Name, CO.Order_status , CO.Total_Amount
FROM CUSTORMER as C
NATURAL JOIN Custormer_Order as CO;


-- LEFT OUTER JOIN
CREATE VIEW employeeDep AS
SELECT D.Department_Name,E.First_Name, E.Last_Name
FROM  DEPARTMENT as D 
LEFT JOIN EMPLOYEE as E ON E.Department_ID = D.Department_ID;


-- right outer join
CREATE VIEW employeePosition AS
SELECT D.Department_Name, E.First_Name, IFNULL(E.Position, 'No position') AS Position 
FROM DEPARTMENT D
RIGHT JOIN EMPLOYEE E ON D.Department_ID = E.Department_ID;


-- full outer join
CREATE VIEW FullOuterJoinView AS
SELECT CO.Order_ID AS CO_Order_ID, CO.Customer_ID AS CO_Customer_ID, CO.Employee_ID AS CO_Employee_ID, CO.Order_Date AS CO_Order_Date, CO.Delivery_Date AS CO_Delivery_Date, CO.Order_status AS CO_Order_status, CO.Total_Amount AS CO_Total_Amount, 
       C.First_Name AS C_First_Name, C.Last_Name AS C_Last_Name, C.Street_Name AS C_Street_Name, C.City AS C_City, C.State AS C_State, C.PostalCode AS C_PostalCode, C.Country AS C_Country, C.Email AS C_Email
FROM Custormer_Order CO
LEFT JOIN CUSTORMER C ON CO.Customer_ID = C.Customer_ID

UNION ALL
SELECT CO.Order_ID AS CO_Order_ID, CO.Customer_ID AS CO_Customer_ID, CO.Employee_ID AS CO_Employee_ID, CO.Order_Date AS CO_Order_Date, CO.Delivery_Date AS CO_Delivery_Date, CO.Order_status AS CO_Order_status, CO.Total_Amount AS CO_Total_Amount, 
       C.First_Name AS C_First_Name, C.Last_Name AS C_Last_Name, C.Street_Name AS C_Street_Name, C.City AS C_City, C.State AS C_State, C.PostalCode AS C_PostalCode, C.Country AS C_Country, C.Email AS C_Email
FROM Custormer_Order CO
RIGHT JOIN CUSTORMER C ON CO.Customer_ID = C.Customer_ID;

-- outer union
-- Outer union between SUPPLIER and MATERIAL tables
CREATE VIEW SupplierMaterial AS
SELECT S.Suppllier_ID, S.First_Name AS Supplier_First_Name, S.Last_Name AS Supplier_Last_Name,
       M.Material_ID, M.Material_Name, M.Product_ID, M.Colour, M.Material_Type, M.Price_Per_Unit
FROM SUPPLIER S
LEFT JOIN MATERIAL M ON S.Suppllier_ID = M.Suppllier_ID
UNION ALL
SELECT S.Suppllier_ID, S.First_Name AS Supplier_First_Name, S.Last_Name AS Supplier_Last_Name,
       M.Material_ID, M.Material_Name, M.Product_ID, M.Colour, M.Material_Type, M.Price_Per_Unit
FROM SUPPLIER S
RIGHT JOIN MATERIAL M ON S.Suppllier_ID = M.Suppllier_ID;


 -- nested q
 -- 1
SELECT First_Name, Email
FROM CUSTORMER
WHERE Email LIKE '%example.com%'
UNION
SELECT C.First_Name, 'Order Placed' AS Email
FROM CUSTORMER C
WHERE C.Customer_ID IN (SELECT DISTINCT Customer_ID FROM Custormer_Order);
-- 2
SELECT C.First_Name, CO.Order_status
FROM CUSTORMER C
JOIN Custormer_Order CO ON C.Customer_ID = CO.Customer_ID
WHERE CO.Order_ID IN (SELECT Order_ID FROM PAYMENT);
-- 3
SELECT C.First_Name, CO.Order_status
FROM CUSTORMER C
JOIN Custormer_Order CO ON C.Customer_ID = CO.Customer_ID
WHERE CO.Order_ID IN (
    SELECT Order_ID
    FROM PAYMENT
);


use garment_database_system ;

-- tunning part

-- before tuning 
explain SELECT Product_ID FROM PRODUCT
UNION
SELECT Product_ID FROM ORDER_ITEM;

-- after tunning
explain SELECT Product_ID FROM PRODUCT
UNION
SELECT Product_ID FROM ORDER_ITEM;

-- INTERSECTION
-- before tunning
SELECT D1.Department_ID
FROM DEPARTMENT as D1
INNER JOIN DEPARTMENT as D2 ON D1.Department_ID = D2.Department_ID;

-- after tunning
explain SELECT D1.Department_ID
FROM DEPARTMENT as D1
INNER JOIN DEPARTMENT as D2 ON D1.Department_ID = D2.Department_ID;

-- Set Difference 
-- before tunning
 explain SELECT P.Product_ID
FROM PRODUCT as P
LEFT JOIN ORDER_ITEM AS OI ON P.Product_ID = OI.Product_ID
WHERE OI.Product_ID IS NULL;
-- this also already tuned


-- DIVISION
-- before tunning
explain SELECT CO.Customer_ID AS C_ID
FROM Custormer_Order AS CO
WHERE NOT EXISTS (
    SELECT P.Product_ID
    FROM PRODUCT AS P
    LEFT JOIN ORDER_ITEM AS OI ON P.Product_ID = OI.Product_ID
    WHERE CO.Customer_ID = OI.Customer_ID
    AND OI.Product_ID IS NULL
);
-- already tuned
    
-- inner join   
-- before tunning  
explain SELECT E.First_Name, E.Last_Name, D.Department_Name
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON E.Department_ID = D.Department_ID;

-- after tunning
CREATE INDEX idx_employee_Dip_ID ON EMPLOYEE (Department_ID);
CREATE INDEX idx_employee_first_name ON EMPLOYEE (First_Name);
CREATE INDEX idx_employee_last_name ON EMPLOYEE (Last_Name);

explain SELECT E.First_Name, E.Last_Name, D.Department_Name
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON E.Department_ID = D.Department_ID;


-- before tuning naturel join
explain SELECT C.First_Name, C.Last_Name, CO.Order_status , CO.Total_Amount
FROM CUSTORMER as C
NATURAL JOIN Custormer_Order as CO;

-- after tunning
CREATE INDEX idx_custormer_order_customer_id2 ON Custormer_Order (Customer_ID);
CREATE INDEX idx_customer_customer_name ON CUSTORMER (First_Name);
CREATE INDEX idx_customer_customer_name2 ON CUSTORMER (Last_Name);
CREATE INDEX idx_custormer_order_customer_id3 ON Custormer_Order (Customer_ID);
CREATE INDEX idx_custormer_order_order_status2 ON Custormer_Order (Order_status);
CREATE INDEX idx_custormer_order_total_amount2 ON Custormer_Order (Total_Amount);

explain SELECT C.First_Name, C.Last_Name, CO.Order_status , CO.Total_Amount
FROM CUSTORMER as C
NATURAL JOIN Custormer_Order as CO;
  
  
  -- LEFT OUTER JOIN
explain
SELECT D.Department_Name,E.First_Name, E.Last_Name
FROM  DEPARTMENT as D 
LEFT JOIN EMPLOYEE as E ON E.Department_ID = D.Department_ID;

-- AFTER tunning
CREATE INDEX idx_employee_Dip_ID2 ON EMPLOYEE (Department_ID);
CREATE INDEX idx_employee_fname ON EMPLOYEE (First_Name);
CREATE INDEX idx_employee_fname2 ON EMPLOYEE (Last_Name);

explain
SELECT D.Department_Name,E.First_Name, E.Last_Name
FROM  DEPARTMENT as D 
LEFT JOIN EMPLOYEE as E ON E.Department_ID = D.Department_ID;


-- right outer join 
explain
SELECT D.Department_Name, E.First_Name, IFNULL(E.Position, 'No position') AS Position 
FROM DEPARTMENT D
RIGHT JOIN EMPLOYEE E ON D.Department_ID = E.Department_ID;

 -- after tunning
 CREATE INDEX idx_employee_Position  ON EMPLOYEE (Position );
 
 explain
SELECT D.Department_Name, E.First_Name, IFNULL(E.Position, 'No position') AS Position 
FROM DEPARTMENT D
RIGHT JOIN EMPLOYEE E ON D.Department_ID = E.Department_ID;

-- full outer join
explain SELECT CO.Order_ID AS CO_Order_ID, CO.Customer_ID AS CO_Customer_ID, CO.Employee_ID AS CO_Employee_ID, CO.Order_Date AS CO_Order_Date, CO.Delivery_Date AS CO_Delivery_Date, CO.Order_status AS CO_Order_status, CO.Total_Amount AS CO_Total_Amount, 
       C.First_Name AS C_First_Name, C.Last_Name AS C_Last_Name, C.Street_Name AS C_Street_Name, C.City AS C_City, C.State AS C_State, C.PostalCode AS C_PostalCode, C.Country AS C_Country, C.Email AS C_Email
FROM Custormer_Order CO
LEFT JOIN CUSTORMER C ON CO.Customer_ID = C.Customer_ID

UNION ALL
SELECT CO.Order_ID AS CO_Order_ID, CO.Customer_ID AS CO_Customer_ID, CO.Employee_ID AS CO_Employee_ID, CO.Order_Date AS CO_Order_Date, CO.Delivery_Date AS CO_Delivery_Date, CO.Order_status AS CO_Order_status, CO.Total_Amount AS CO_Total_Amount, 
       C.First_Name AS C_First_Name, C.Last_Name AS C_Last_Name, C.Street_Name AS C_Street_Name, C.City AS C_City, C.State AS C_State, C.PostalCode AS C_PostalCode, C.Country AS C_Country, C.Email AS C_Email
FROM Custormer_Order CO
RIGHT JOIN CUSTORMER C ON CO.Customer_ID = C.Customer_ID;


-- after tunning

CREATE INDEX idx_CUSTORMER_Customer_ID ON CUSTORMER(Customer_ID);
CREATE INDEX idx_Customer_Order_Customer_ID ON Custormer_Order(Customer_ID);
CREATE INDEX idx_Custormer_Order_Order_ID ON Custormer_Order(Order_ID);
CREATE INDEX idx_Custormer_Order_Employee_ID ON Custormer_Order(Employee_ID);
CREATE INDEX idx_Custormer_Order_Order_Date ON Custormer_Order(Order_Date);


explain SELECT CO.Order_ID AS CO_Order_ID, CO.Customer_ID AS CO_Customer_ID, CO.Employee_ID AS CO_Employee_ID, CO.Order_Date AS CO_Order_Date, CO.Delivery_Date AS CO_Delivery_Date, CO.Order_status AS CO_Order_status, CO.Total_Amount AS CO_Total_Amount, 
       C.First_Name AS C_First_Name, C.Last_Name AS C_Last_Name, C.Street_Name AS C_Street_Name, C.City AS C_City, C.State AS C_State, C.PostalCode AS C_PostalCode, C.Country AS C_Country, C.Email AS C_Email
FROM Custormer_Order CO
LEFT JOIN CUSTORMER C ON CO.Customer_ID = C.Customer_ID

UNION ALL
SELECT CO.Order_ID AS CO_Order_ID, CO.Customer_ID AS CO_Customer_ID, CO.Employee_ID AS CO_Employee_ID, CO.Order_Date AS CO_Order_Date, CO.Delivery_Date AS CO_Delivery_Date, CO.Order_status AS CO_Order_status, CO.Total_Amount AS CO_Total_Amount, 
       C.First_Name AS C_First_Name, C.Last_Name AS C_Last_Name, C.Street_Name AS C_Street_Name, C.City AS C_City, C.State AS C_State, C.PostalCode AS C_PostalCode, C.Country AS C_Country, C.Email AS C_Email
FROM Custormer_Order CO
RIGHT JOIN CUSTORMER C ON CO.Customer_ID = C.Customer_ID;





