CREATE DATABASE CheckpointDQL;
use CheckpointDQL;
CREATE TABLE Customer (
    Customer_id int NOT NULL AUTO_INCREMENT,
    Customer_Name varchar(255) NOT NULL,
    Customer_Tel varchar(255),
    PRIMARY KEY (Customer_id)
);
CREATE TABLE Product (
    Product_id int NOT NULL AUTO_INCREMENT,
    Product_Name varchar(255) NOT NULL,
    category varchar(255),
    Price int,
    PRIMARY KEY (Product_id)
);
CREATE TABLE Orders (
    Customer_id int,
    Product_id int,
    OrderDate date,
    quantity int,
    total_amount int,
    foreign key (Customer_id) references Customer (Customer_id),
    foreign key (Product_id) references Product (Product_id)
);

insert into Orders values (01,02,NULL,2,9198);
insert into Orders values (02,01,STR_TO_DATE("May 28 2020", "%M %d %Y"),1,3299);
delete from Orders where Customer_id=02;

select * from Orders;
select * from Customer;
select Product_Name,category from Product where Price between 5000 and 10000;
select * from Product order by Price desc;
select count(*), avg(total_amount), max(total_amount), min(total_amount), count(Product_id) from Orders;
select count(*),Customer_id from Orders group by Customer_id having count(*)>2;
select month(2020),count(*) from Orders group by month(2020);
select Orders.OrderDate, Product.Product_Name, Customer.Customer_Name
from Orders inner join Product on Orders.Product_id=Product.Product_id join Customer on Orders.Customer_id=Customer.Customer_id;
select * from Orders where OrderDate > now() - INTERVAL 3 MONTH;
select Customer.Customer_id from Customer left join Orders on Customer.Customer_id=Orders.Customer_id where Orders.Customer_id is null;


