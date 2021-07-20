use quan_li_sinh_vien;

insert into class
values (1, 'A1','2008/12/20' ,1);

insert into class
values (2, 'A2', '2008/12/20' ,1);

insert into class
values (3, 'B3', current_date(), 0);

insert into student (student_name, address, phone, `status`, class_id)
values ('hung', 'ha_noi', '0912113113', 1, 1);

insert into student (student_name, address, `status`, class_id)
values ('hoa', 'hai_phong', 1, 1);

insert into student (student_name, address, phone, `status`, class_id)
values ('manh', 'hcm', '0123123123', 0, 2);

insert into `subject`
values (1 ,'cf', 5, 1),
	(2, 'c', 6, 1),
	(3,'hdj', 5 , 1),
    (4, 'rdbms', 10, 1);

-- insert into `subject`
-- values (c, 6, 1);

-- insert into `subject`
-- values (hdj, 5,1);

-- insert into `subject`
-- values (rdbms, 10, 1);

insert into mark (subject_id, student_id, mark, examtimes)
values (1,1,8,1),
	(1,2,10,2),
    (2,1,12,1);
