drop database if exists demo;
create database demo;

use demo;

create table products (
id int primary key auto_increment,
product_code varchar(20),
product_name varchar(50),
product_price int,
product_amount int,
product_description varchar(50),
product_status int
);

insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
values ('chuoi_001', 'chuoi', 30, 5, 'chuoi xanh viet nam', 1),
		('tao_001', 'tao', 60, 10, 'tao do my', 1),
        ('dua_hau_001', 'dua_hau', 45, 20, 'dua hau quang ngai', 1),
        ('kiwi_001', 'kiwi', 100, 40, 'kiwi my', 1);

create unique index idx_product_code on products(product_code);
create index idx_name_price on products(product_name, product_price);

create view tepm_table as
select product_code, product_name, product_price, product_status
from products;

select * from tepm_table;

update tepm_table
set product_status = 0
where product_code = 'dua_hau_001';

drop view tepm_table;

delimiter //

create procedure get_all_info_products()
begin
select * from products;
end //

delimiter ;

drop procedure if exists insert_into_products;

delimiter //

create procedure insert_into_products(p_product_code varchar(20), p_product_name varchar(50), p_product_price int, p_product_amount int, p_product_description varchar(50),  p_product_status int)
begin
insert into products ( product_code,product_name, product_price, product_amount, product_description , product_status)
values (p_product_code, p_product_name, p_product_price, p_product_amount, p_product_description, p_product_status);
end //

delimiter ;

delimiter //

create procedure modify_product_with_id(p_product_id int, p_product_code varchar(20), p_product_name varchar(50), p_product_price int, p_product_amount int, p_product_description varchar(50),  p_product_status int)
begin
update products
set product_code = p_product_code,
	product_name = p_product_name,
    product_price = p_product_price,
    product_amount = p_product_amount,
    product_description = p_product_description,
    product_status = p_product_status
where id = p_product_id;
end //

delimiter ;

delimiter //

create procedure delete_product_with_id(p_product_id int)
begin
delete from products
where id = p_product_id;
end //

delimiter ;

call get_all_info_products;
call insert_into_products('man_001', 'man', 75, 8, 'man viet nam', 1);
call modify_product_with_id(5,'man_001', 'man', 75, 8, 'man thai lan', 0 );
call delete_product_with_id(5);
