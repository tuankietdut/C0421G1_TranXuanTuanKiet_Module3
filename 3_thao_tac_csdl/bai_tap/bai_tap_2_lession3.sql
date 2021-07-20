
use quan_ly_ban_hang;

insert into customer
values (1, 'minh quan', 10),
		(3, 'ngoc oanh', 20),
        (2,'hong ha', 50);

insert into orders (customer_id, orders_date)
values (1, '2006/3/21'),
		(2, '2006/3/23'),
        (1, '2006/3/17');
        

insert into product (product_name, product_price)
values ('may giat', 3),
		('tu lanh', 5),
        ('dieu hoa',7),
        ('quat', 1),
        ('bep dien',2);
        
        
insert into order_detail 
values (1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,3);
        
select *
from orders;

select cu.customer_name, pr.product_name as ten_san_pahm, odd.order_detail_qty as so_luong
from order_detail odd join product pr on odd.product_id = pr.product_id
				inner join orders ods on ods.orders_id = odd.orders_id
                inner join customer cu on ods.customer_id = cu.customer_id;
                
select cu.customer_id, cu.customer_name as khach_hang, count(odd.orders_id) as so_lan_mua
from order_detail odd inner join product pr on odd.product_id = pr.product_id
				inner join orders ods on ods.orders_id = odd.orders_id
                right join customer cu on ods.customer_id = cu.customer_id
group by cu.customer_id
having count(odd.orders_id) = 0;
