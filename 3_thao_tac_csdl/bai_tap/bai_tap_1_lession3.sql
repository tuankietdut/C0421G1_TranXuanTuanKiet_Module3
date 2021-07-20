use quan_li_sinh_vien;

select *
from student
where student_name like 'h%';

select *
from class
where month(start_date)=12 ;


select *
from `subject`
where credit between 3 and 5;

set sql_safe_updates = 0;

update student
set class_id = 2
where student_name = 'hung';

update student 
set student_name = 'doanh'
where student_id =1;

select s.student_name, sj.subject_name, m.mark
from student s inner join mark m on s.student_id = m.student_id 
				inner join `subject` sj on m.subject_id = sj.subject_id
order by mark DESC, s.student_name;

update mark
set mark = 12
where student_id = 1 and subject_id = 2;

select * from mark;


