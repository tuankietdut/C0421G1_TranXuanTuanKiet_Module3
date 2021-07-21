use quan_li_sinh_vien;

select * 
from `subject`
where credit = (select max(credit) from `subject`);

select `subject`.subject_name, mark.mark as so_diem_cao_nhat
from mark inner join `subject` on mark.subject_id = `subject`.subject_id
where mark = (select max(mark) from mark);

select s.student_name,s.address, s.phone, avg(m.mark) as diem_trung_binh
from student s join mark m on s.student_id = m.student_id
group by s.student_id
order by mark desc;

select * from mark;



