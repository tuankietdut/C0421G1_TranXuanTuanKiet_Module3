select * from student;

select *
from student
where `status` = 1;

select *
from `subject`
where credit < 10;

select class.class_name, student.student_name, student.student_id
from student join class on class.class_id = student.class_id
where class.class_name = 'A1';

select student.student_id ,student.student_name,  `subject`.subject_name,  mark.mark
from student join mark on student.student_id = mark.student_id
			join `subject` on mark.subject_id = `subject`.subject_id
where subject_name = 'CF';
	

