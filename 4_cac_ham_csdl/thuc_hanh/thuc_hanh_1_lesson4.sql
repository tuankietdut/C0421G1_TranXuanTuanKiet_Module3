use quan_li_sinh_vien;

select address ,count(student_id) as so_luong_hoc_vien
from student
group by address;

select s.student_id ,s.student_name ,avg(m.mark) as diem_trung_binh
from student s inner join mark m on s.student_id = m.student_id
group by s.student_id; 

select s.student_id ,s.student_name ,avg(m.mark) as diem_trung_binh
from student s inner join mark m on s.student_id = m.student_id
group by s.student_id
having avg(m.mark)> 10; 

select s.student_id ,s.student_name ,avg(m.mark) as diem_trung_binh
from student s inner join mark m on s.student_id = m.student_id
group by s.student_id
having avg(m.mark) >= all(select avg(mark.mark) from mark group by mark.student_id); 
