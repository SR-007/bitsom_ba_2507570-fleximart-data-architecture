INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,false),
(20240120,'2024-01-20','Saturday',20,1,'January','Q1',2024,true),

(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,true),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,false),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,false),
(20240218,'2024-02-18','Sunday',18,2,'February','Q1',2024,true),
(20240225,'2024-02-25','Sunday',25,2,'February','Q1',2024,true);

INSERT INTO dim_product
(product_id, product_name, category, subcategory, unit_price)
VALUES
('P001','Laptop Pro','Electronics','Laptops',75000),
('P002','Smartphone X','Electronics','Mobiles',45000),
('P003','Bluetooth Headphones','Electronics','Audio',6000),
('P004','Smart Watch','Electronics','Wearables',12000),
('P005','4K Television','Electronics','TV',85000),

('P006','Running Shoes','Fashion','Footwear',5000),
('P007','Casual Sneakers','Fashion','Footwear',4000),
('P008','Formal Shirt','Fashion','Clothing',2500),
('P009','Denim Jeans','Fashion','Clothing',3500),
('P010','Jacket','Fashion','Clothing',7000),

('P011','Office Chair','Furniture','Seating',15000),
('P012','Dining Table','Furniture','Table',30000),
('P013','Bookshelf','Furniture','Storage',12000),
('P014','Sofa Set','Furniture','Living',55000),
('P015','Bed Frame','Furniture','Bedroom',40000);

INSERT INTO dim_customer
(customer_id, customer_name, city, state, customer_segment)
VALUES
('C001','Rahul Sharma','Bangalore','Karnataka','Premium'),
('C002','Priya Patel','Mumbai','Maharashtra','Retail'),
('C003','Amit Kumar','Delhi','Delhi','Retail'),
('C004','Sneha Reddy','Hyderabad','Telangana','Premium'),
('C005','Vikram Singh','Chennai','Tamil Nadu','Retail'),
('C006','Anjali Mehta','Bangalore','Karnataka','Corporate'),
('C007','Ravi Verma','Pune','Maharashtra','Retail'),
('C008','Pooja Iyer','Bangalore','Karnataka','Premium'),
('C009','Karthik Nair','Kochi','Kerala','Retail'),
('C010','Deepa Gupta','Delhi','Delhi','Corporate'),
('C011','Arjun Rao','Hyderabad','Telangana','Retail'),
('C012','Lakshmi Krishnan','Chennai','Tamil Nadu','Retail');

INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
(20240101,1,1,1,75000,0,75000),
(20240102,2,2,2,45000,5000,85000),
(20240103,3,3,3,6000,0,18000),
(20240104,4,4,1,12000,1000,11000),
(20240105,5,5,1,85000,5000,80000),

(20240106,6,6,2,5000,0,10000),
(20240107,7,7,1,4000,0,4000),
(20240110,8,8,3,2500,0,7500),
(20240115,9,9,2,3500,0,7000),
(20240120,10,10,1,7000,0,7000),

(20240201,11,11,1,15000,0,15000),
(20240202,12,12,1,30000,0,30000),
(20240203,13,1,2,12000,0,24000),
(20240204,14,2,1,55000,5000,50000),
(20240205,15,3,1,40000,0,40000),

(20240210,1,4,1,75000,0,75000),
(20240212,2,5,1,45000,2000,43000),
(20240215,3,6,2,6000,0,12000),
(20240218,4,7,1,12000,0,12000),
(20240225,5,8,1,85000,0,85000);
