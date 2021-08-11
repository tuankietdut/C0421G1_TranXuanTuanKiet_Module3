insert into position (position_name)
values ('Le tan'),
		('Phuc vu'),
        ('Chuyen vien'),
        ('Giam sat'),
        ('Quan ly'),
        ('Giam doc');
        
insert into education_degree (education_degree_name)
values ('Trung cap'),
		('Cao dang'),
        ('Dai hoc'),
        ('Sau dai hoc');
        
insert into division(division_name)
values ('Sale Makerting'),
		('Hanh chinh'),
        ('Phuc vu'),
        ('Quan ly');
        
insert into employee( employee_name, employee_birthdat, employee_id_card, employee_salary,
			employee_phone, employee_email, employee_adress, position_id, education_degree_id, division_id )
 values ('Le Van Dong', '1998-05-20', '123456789', 6000000, '0123456789', 'dong@gmail.com', 'Da Nang', 3, 3, 4),
		('Le Van Xuan', '1995-09-10', '123456789', 7000000, '0123456789', 'dong@gmail.com', 'Da Nang', 3, 3, 4),
        ('Le Van Ha', '1992-03-25', '123456789', 8000000, '0123456789', 'levanha@gmail.com', 'Da Nang', 3, 3, 4),
        ('Le Van Thu', '1991-09-20', '123456789', 9000000, '0123456789', 'levanthu@gmail.com', 'Da Nang', 3, 3, 4),
        ('Nguyen Tien', '1990-05-25', '123456789', 10000000, '0123456789', 'nguyentien@gmail.com', 'Da Nang', 3, 3, 4),
        ('Quan vu', '1998-05-28', '123456789', 6000000, '0123456789', 'quanvu@gmail.com', 'Da Nang', 3, 3, 4),
        ('Luu Bi', '1993-09-30', '123456789', 7000000, '0123456789', 'luubi@gmail.com', 'Da Nang', 3, 3, 4);
        
select employee_id ,employee_name, employee_birthdat, employee_id_card, employee_salary,
			employee_phone, employee_email, employee_adress, position_name, education_degree_name, division_name
from employee e inner join position p on e.position_id = p.position_id
				inner join education_degree ed on e.education_degree_id = ed.education_degree_id
                inner join division d on d.division_id = e.division_id;
                
update employee
set employee_name = ?, employee_birthdat = ?, employee_id_card = ?, employee_salary =?,
			employee_phone =? , employee_email =?, employee_adress =?, position_id =?, education_degree_id = ?, division_id = ?
where employee_id = ?;

delete from employee
where employee_id = ?;
