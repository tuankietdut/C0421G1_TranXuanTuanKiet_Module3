drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
customer_id int primary key auto_increment,
customer_name varchar(30),
custimer_age int
);

create table product(
product_id int primary key auto_increment,
product_name varchar(50),
product_price float
);

create table orders(
orders_id int primary key auto_increment,
orders_date datetime,
orders_total_price float,
customer_id int,
foreign key (customer_id) references customer(customer_id)
);

create table order_detail (
orders_id int,
product_id int,
order_detail_qty int,
foreign key (orders_id) references orders(orders_id),
foreign key (product_id) references product(product_id),
primary key (orders_id, product_id)
);