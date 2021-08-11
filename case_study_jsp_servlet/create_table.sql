drop database if exists case_study_servlet;
create database case_study_servlet;

use case_study_servlet;

create table position (
position_id int primary key auto_increment,
position_name varchar(50)
);

create table education_degree (
education_degree_id int primary key auto_increment,
education_degree_name varchar(50)
);

create table division (
division_id int primary key auto_increment,
division_name varchar(50)
);

create table `user`(
username varchar(255) primary key,
`password` varchar(255)
);

create table employee (
employee_id int primary key auto_increment,
employee_name varchar(50),
employee_birthdat date,
employee_id_card varchar(50),
employee_salary double,
employee_phone varchar(45),
employee_email varchar(45),
employee_adress varchar(45),
position_id int,
education_degree_id int,
division_id int,
username varchar(255),
foreign key (position_id) references position (position_id) on update cascade on delete cascade,
foreign key (education_degree_id) references education_degree (education_degree_id) on update cascade on delete cascade,
foreign key (division_id) references division (division_id) on update cascade on delete cascade,
foreign key (username) references `user` (username)  on update cascade on delete cascade
);

create table `role` (
role_id int primary key auto_increment,
role_name varchar(50)
);

create table user_role (
role_id int,
username varchar(255),
primary key (role_id,username),
foreign key (role_id) references `role`(role_id) on update cascade on delete cascade,
foreign key (username) references `user`(username) on update cascade on delete cascade
);

create table customer_type (
customer_type_id int primary key auto_increment,
customer_type_name varchar(45)
);

create table customer (
customer_id int auto_increment primary key,
customer_name varchar(45),
customer_birthday date,
customer_gender bit(1),
customer_id_card varchar(45),
customer_phone varchar(45),
customer_email varchar(45),
customer_adress varchar(45),
customer_type_id int,
foreign key (customer_type_id) references customer_type(customer_type_id) on update cascade on delete cascade
);

create table service_type (
service_type_id int primary key auto_increment,
service_type_name varchar(50)
);

create table service (
service_id int auto_increment primary key,
service_name varchar(45),
service_area int,
service_cost double,
service_max_people int,
standard_room varchar(45),
description_other_convenience varchar(50),
pool_area double,
number_of_floors int,
service_type_id int,
foreign key (service_type_id) references service_type (service_type_id) on update cascade on delete cascade
);

create table contract (
contract_id int auto_increment primary key,
contract_start_date datetime,
contract_end_date datetime,
contract_deposit double,
contract_total_money double,
employee_id int,
service_id int,
customer_id int,
foreign key (employee_id) references employee(employee_id) on update cascade on delete cascade,
foreign key (service_id) references service(service_id) on update cascade on delete cascade,
foreign key (customer_id) references customer (customer_id) on update cascade on delete cascade
);

create table attach_service (
attach_service_id int auto_increment primary key,
attach_service_name varchar(45),
attach_service_cost double,
attach_service_unit int,
attach_service_status varchar(45)
);

create table contract_detail (
contract_detail int auto_increment primary key,
contract_id int,
attach_service_id int,
quantity int,
foreign key (attach_service_id) references attach_service (attach_service_id) on update cascade on delete cascade,
foreign key (contract_id) references contract (contract_id) on update cascade on delete cascade
);


