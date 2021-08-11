insert into customer_type(customer_type_name)
values ('Diamond'),
		('Platinium'),
        ('Gold'),
        ('Silver'),
        ('Member');
        
insert into customer (customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_adress, customer_type_id)
values ('Nguyen Van Dong', '1995-05-20', 0, '123456789', '0123456789', 'vandong@gmail.com', 'Da Nang', 1),
		('Nguyen Van Dong', '1995-05-20', 0, '123456789', '0123456789', 'vandong@gmail.com', 'Da Nang', 1),
        ('Nguyen Van Dong', '1995-05-20', 0, '123456789', '0123456789', 'vandong@gmail.com', 'Da Nang', 1),
        ('Nguyen Van Dong', '1995-05-20', 0, '123456789', '0123456789', 'vandong@gmail.com', 'Da Nang', 1),
        ('Nguyen Van Dong', '1995-05-20', 0, '123456789', '0123456789', 'vandong@gmail.com', 'Da Nang', 1),
        ('Nguyen Van Dong', '1995-05-20', 0, '123456789', '0123456789', 'vandong@gmail.com', 'Da Nang', 1),
        ('Nguyen Van Dong', '1995-05-20', 0, '123456789', '0123456789', 'vandong@gmail.com', 'Da Nang', 1),
        ('Nguyen Van Dong', '1995-05-20', 0, '123456789', '0123456789', 'vandong@gmail.com', 'Da Nang', 1),
        ('Nguyen Van Dong', '1995-05-20', 0, '123456789', '0123456789', 'vandong@gmail.com', 'Da Nang', 1),
        ('Nguyen Van Dong', '1995-05-20', 0, '123456789', '0123456789', 'vandong@gmail.com', 'Da Nang', 1),
        ('Nguyen Van Dong', '1995-05-20', 0, '123456789', '0123456789', 'vandong@gmail.com', 'Da Nang', 1);
        
select customer_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_adress, customer_type_name
from customer c inner join customer_type ct on c.customer_type_id = ct.customer_type_id
where customer_id = ?;

insert into customer (customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_adress, customer_type_id)
values (?, ?, ?, ?, ?, ?, ?, ?);

select customer_type_id, customer_type_name
from customer_type;

update customer
set  customer_name = ?, customer_birthday =?, customer_gender =?, customer_id_card =?, customer_phone =?, customer_email =?, customer_adress =?, customer_type_id =?
where customer_id = ?;

delete from customer
where customer_id = ?;

