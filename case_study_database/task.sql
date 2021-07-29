-- 2. Thông tin nhân viên có tên h k t và tối đa 15 ký tự
select *
from nhan_vien
where substring_index(ho_va_ten_nhan_vien, '_', -1) like 'h%' 
		or substring_index(ho_va_ten_nhan_vien, '_', -1) like 's%'
        or substring_index(ho_va_ten_nhan_vien, '_', -1) like 't%'  
        and length(ho_va_ten_nhan_vien) <16;

-- 3. Khách hàng ở quảng trị hoặc đà nẵng nằm trong độ tuổi 18-50
select *
from khach_hang
where (dia_chi ='da_nang' or dia_chi = 'quang_tri') and (year(curdate()) - year(ngay_sinh) between 18 and 50);

-- 4. Số lần tạo hợp đồng của khách hàng với loại khách diamond
select kh.ho_va_ten, count(hd.id_hop_dong) as so_lan_dat_hop_dong
from hop_dong hd inner join khach_hang kh on hd.khach_hang_id = kh.id_khach_hang
				inner join loai_khach lk on kh.loai_khach_id = lk.id_loai_khach
where lk.ten_loai_khach = 'diamond'
group by kh.id_khach_hang
order by so_lan_dat_hop_dong desc;

-- 5. Tổng tiền mà 1 khách hàng đã trả cho tất cả hợp đồng của họ
select kh.id_khach_hang, kh.ho_va_ten, lk.ten_loai_khach, hd.id_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(dv.chi_phi_thue+ (hdct.so_luong*dvdk.gia) - hd.tien_dat_coc) as tong_tien
from hop_dong hd right join khach_hang kh on hd.khach_hang_id = kh.id_khach_hang
				left join loai_khach lk on kh.loai_khach_id = lk.id_loai_khach
				left join dich_vu dv on hd.dich_vu_id = dv.id_dich_vu
                left join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.hop_dong_id
                left join dich_vu_di_kem dvdk on hdct.dich_vu_di_kem_id = dvdk.id_dich_vu_di_kem
group by kh.id_khach_hang;

-- 6. Dịch vụ chưa từng được book trong tháng 1 2 3 năm 2019 
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong
from dich_vu dv left join hop_dong hd on hd.dich_vu_id = dv.id_dich_vu
				inner join loai_dich_vu ldv on dv.loai_dich_vu_id = ldv.id_loai_dich_vu
where month(ngay_lam_hop_dong) not in (1, 2, 3) and year(ngay_lam_hop_dong) = 2019;

-- 7. Dịch vụ đã book trong năm 2018 nhưng chưa từng được book trong 2019 
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue,ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong
from dich_vu dv inner join hop_dong hd on hd.dich_vu_id = dv.id_dich_vu
				inner join loai_dich_vu ldv on ldv.id_loai_dich_vu = dv.loai_dich_vu_id
where year(hd.ngay_lam_hop_dong) = 2018 and dv.loai_dich_vu_id not in 
(select dv.loai_dich_vu_id
from dich_vu dv inner join hop_dong hd on hd.dich_vu_id = dv.id_dich_vu
where year(hd.ngay_lam_hop_dong) = 2019);

-- 8. Hiển thị họ tên khách hàng trong hệ thống với họ tên không trùng nhau 
select distinct ho_va_ten
 from khach_hang;
 
 -- 9. Thống kê doanh thu theo tháng (có bao nhiêu khách thực hiện đặt phòng trong năm 2019)
 
 create table month_in_2019 (
 month_2019 int,
 so_lan_khach_hang_book int default 0);
 
 insert into month_in_2019 (month_2019)
 values (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);
 
 select month_2019, so_lan_khach_hang_book
 from month_in_2019 
 where  month_2019 not in 
 (select month(hd.ngay_lam_hop_dong)
 from hop_dong hd join khach_hang kh on hd.khach_hang_id = kh.id_khach_hang
 where year(hd.ngay_lam_hop_dong) = 2019
 group by month(hd.ngay_lam_hop_dong))
 union 
 select  month(hd.ngay_lam_hop_dong) as thang_2019, count(kh.id_khach_hang) as so_lan_khach_hang_book
 from hop_dong hd join khach_hang kh on hd.khach_hang_id = kh.id_khach_hang
 where year(hd.ngay_lam_hop_dong) = 2019
 group by month(hd.ngay_lam_hop_dong)
 order by month_2019; 
 
-- 10. Hiển thị tương ứng với từng hợp đồng đã sử dụng bao nhiêu lần dịch vụ đi kèm
 
 select hd.id_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, count(hdct.id_hop_dong_chi_tiet) as so_luong_dich_vu_da_su_dung
 from hop_dong hd inner join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.hop_dong_id
 group by hd.id_hop_dong;
 
 -- 11. Hiển thị thông tin dịch vụ đi kèm cho khách hàng Diamond và địa chỉ Quảng Ngãi hoặc Vinh
 
 select dvdk.id_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, kh.id_khach_hang, lk.ten_loai_khach, kh.dia_chi
 from khach_hang kh inner join hop_dong hd on hd.khach_hang_id = kh.id_khach_hang
					inner join loai_khach lk on kh.loai_khach_id = lk.id_loai_khach
                    inner join hop_dong_chi_tiet hdct on hdct.hop_dong_id = hd.id_hop_dong
                    inner join dich_vu_di_kem dvdk on hdct.dich_vu_di_kem_id = dvdk.id_dich_vu_di_kem
where lk.ten_loai_khach = 'diamond' and kh.dia_chi = 'vinh';

-- 12. Hiển thị các thông tin idHopDong, Ten nhan vien, ten khach hàng,.... số lượng dịch vụ đi kèm, tổng tiền đặt cọc của tất cả dịch vụ 
-- đặt vào 3 tháng cuối năm 2019 nhưng chưa từng đặt cọc vào 6 tháng đầu năm 2019
 
select hdct.id_hop_dong_chi_tiet, nv.ho_va_ten_nhan_vien, kh.ho_va_ten, kh.so_dien_thoai, dv.ten_dich_vu, count(hdct.dich_vu_di_kem_id) as so_luong_dich_vu_di_kem, sum(hd.tien_dat_coc)
from nhan_vien nv inner join hop_dong hd on hd.nhan_vien_id = nv.id_nhan_vien
				  inner join khach_hang kh on kh.id_khach_hang = hd.khach_hang_id
                  inner join dich_vu dv on hd.dich_vu_id = dv.id_dich_vu
                  inner join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.hop_dong_id
                  inner join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = hdct.dich_vu_di_kem_id
where quarter(hd.ngay_lam_hop_dong) = 4 and quarter(hd.ngay_lam_hop_dong) not in (1 or 2 )
group by hd.id_hop_dong;

-- 13. Hiển thị dịch vụ đi kèm hiển thị nhiều nhất bởi các khách hàng đã đặt phòng

select  dvdk.ten_dich_vu_di_kem ,count(hdct.hop_dong_id) as so_lan_dich_vu_di_kem_duoc_book
from hop_dong_chi_tiet hdct inner join dich_vu_di_kem dvdk on  hdct.dich_vu_di_kem_id = dvdk.id_dich_vu_di_kem
group by dvdk.id_dich_vu_di_kem
having count(hdct.hop_dong_id)  >= all
(
select  count(hdct.hop_dong_id)
from hop_dong_chi_tiet hdct inner join dich_vu_di_kem dvdk on  hdct.dich_vu_di_kem_id = dvdk.id_dich_vu_di_kem
group by dvdk.id_dich_vu_di_kem
);

-- 14. Hiển thị các thông tin dịch vụ đi kèm mới chỉ được sử dụng 1 lần duy nhất

select hdct.hop_dong_id, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.hop_dong_id) as so_lan_su_dung
from hop_dong_chi_tiet hdct inner join dich_vu_di_kem dvdk on hdct.dich_vu_di_kem_id = dvdk.id_dich_vu_di_kem
							inner join hop_dong hd on hdct.hop_dong_id = hd.id_hop_dong
                            inner join dich_vu dv on hd.dich_vu_id = dv.id_dich_vu
                            inner join loai_dich_vu ldv on dv.loai_dich_vu_id = ldv.id_loai_dich_vu
group by dvdk.id_dich_vu_di_kem
having count(hdct.hop_dong_id) = 1;

-- 15. Thông tin của nhân viên mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 -> 2019

select nv.id_nhan_vien, nv.ho_va_ten_nhan_vien, td.trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(hd.id_hop_dong) as so_lan_book
from nhan_vien nv inner join hop_dong hd on hd.nhan_vien_id = nv.id_nhan_vien
				inner join bo_phan bp on nv.bo_phan_id = bp.id_bo_phan
                inner join trinh_do td on nv.trinh_do_id = td.id_trinh_do
group by nv.id_nhan_vien
having count(hd.id_hop_dong) <= 3;

-- 16. Xóa nhân viên chưa từng lập hợp đồng nào từ 2017 -> 2019

delete nv
from nhan_vien nv inner join hop_dong hd on hd.nhan_vien_id = nv.id_nhan_vien
where year(hd.ngay_lam_hop_dong) not in (2019, 2018, 2017);

-- 17. Cập nhật khách hàng từ planium -> Diamond nếu tổng tiền thanh toán > 10tr trong năm 2019

select kh.id_khach_hang, kh.ho_va_ten, sum(dv.chi_phi_thue), dvdk.gia ,sum(hdct.so_luong) as so_lan_su_dung , sum(dv.chi_phi_thue + dvdk.gia*hdct.so_luong) as total
from khach_hang kh inner join hop_dong hd on hd.khach_hang_id = kh. id_khach_hang
					inner join dich_vu dv on hd.dich_vu_id = dv.id_dich_vu
                    inner join hop_dong_chi_tiet hdct on hdct.hop_dong_id = hd.id_hop_dong
                    inner join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = hdct.dich_vu_di_kem_id
where year(hd.ngay_lam_hop_dong) = 2019
group by kh.id_khach_hang
having total >10;

update khach_hang 
set loai_khach_id = 1
where loai_khach_id = 2 and id_khach_hang in 
(
select *
from ( select kh.id_khach_hang
			from khach_hang kh inner join hop_dong hd on hd.khach_hang_id = kh. id_khach_hang
							inner join dich_vu dv on hd.dich_vu_id = dv.id_dich_vu
							inner join hop_dong_chi_tiet hdct on hdct.hop_dong_id = hd.id_hop_dong
							inner join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = hdct.dich_vu_di_kem_id
		where year(hd.ngay_lam_hop_dong) = 2019
		group by kh.id_khach_hang
		having sum(dv.chi_phi_thue + dvdk.gia*hdct.so_luong) >10
	) kh2
);

-- 18 Xóa hợp đồng trước năm 2016 chú ý ràng buộc

delete from hop_dong
where id_hop_dong in (
select * 
from (
select id_hop_dong
from hop_dong hd
where year(hd.ngay_lam_hop_dong) <2016) as tabletemp
);

-- 19. Update giá cho các dịch vụ đi kèm khi số lần sử dụng >10

update dich_vu_di_kem
set gia = gia*2
where id_dich_vu_di_kem in (
select * 
from (
select dvdk.id_dich_vu_di_kem
from hop_dong_chi_tiet hdct inner join dich_vu_di_kem dvdk on hdct.dich_vu_di_kem_id = dvdk.id_dich_vu_di_kem
group by dvdk.id_dich_vu_di_kem
having sum(hdct.so_luong) > 10) as tepm_table
);

-- 20. Hiển thị tất cả thông tin của nhân viên và khách hàng trong hệ thống

select concat(nv.id_nhan_vien, ' - ', kh.id_khach_hang) as id_nhan_vien_khach_hang, concat(nv.ho_va_ten_nhan_vien,' - ', kh.ho_va_ten) ho_ten_nhan_vien_khach_hang,
		concat(nv.ngay_sinh,' - ', kh.ngay_sinh) as ngay_sinh_nhan_vien_khach_hang, concat(nv.email, ' - ', kh.email) email_nhan_vien_khach_hang, concat(nv.dia_chi,' - ', kh.dia_chi) dia_chi_nhan_vien_khach_hang
from nhan_vien nv left join hop_dong hd on nv.id_nhan_vien = hd.nhan_vien_id
					right join khach_hang kh on hd.khach_hang_id = kh.id_khach_hang;

-- 21 Tạo khung nhìn view có tên v_nhanvien của tất cả nhân viên có địa chỉ là hải châu và đã từng lập hợp đồng cho 1 khách hoặc nhiều khách 
-- với ngày lập hợp đồng là 12-12-2019

create view v_nhan_vien as
select nv.id_nhan_vien, nv.ho_va_ten_nhan_vien,nv.vi_tri_id, nv.trinh_do_id, nv.bo_phan_id, nv.ngay_sinh, nv.so_id_card, nv.luong ,nv.email, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv inner join hop_dong hd on nv.id_nhan_vien = hd.nhan_vien_id
				inner join khach_hang kh on kh.id_khach_hang = hd.khach_hang_id
where nv.dia_chi ='hai_chau'
group by nv.id_nhan_vien
having count(kh.id_khach_hang) >= 1;

-- 22. Cập nhật địa chỉ -> Liên chiểu của tất cả các nhân viên trong view (các record trong view cũng mất luôn???)

update nhan_vien
set dia_chi = 'lien_chieu'
where id_nhan_vien in (
select id_nhan_vien
from v_nhan_vien vnv
);

-- 23. Tạo procedure Xóa 1 khách hàng với in tham số truyền vào là 1 id khách hàng
delimiter //
create procedure sp_1 (p_id_khach_hang int)

begin
delete 
from khach_hang
where id_khach_hang = p_id_khach_hang;
end //

 delimiter ;

 call sp_1(6);
 
 -- 24. Kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc ko được trùng khóa chính và đảm bảo vẹn toàn tham chiếu đến các bảng liên quan
 
 delimiter //
 create procedure sp_2 (p_nhan_vien_id int, p_khach_hang_id int, p_dich_vu_id int, p_ngay_lam_hop_dong date, p_ngay_ket_thuc date, p_tien_dat_coc int)
 begin
if ((p_nhan_vien_id in (select id_nhan_vien from nhan_vien)) and (p_khach_hang_id in (select id_khach_hang from khach_hang))
			and (p_dich_vu_id in (select id_dich_vu from dich_vu)) and (p_tien_dat_coc >= 0))  then
	insert into hop_dong (nhan_vien_id, khach_hang_id, dich_vu_id, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
	values (p_nhan_vien_id, p_khach_hang_id, p_dich_vu_id, p_ngay_lam_hop_dong, p_ngay_ket_thuc, p_tien_dat_coc);
    select * from hop_dong;
else 
	select  'can`t insert into hop_dong';
end if;
 end //
 
 delimiter ;
 
 call sp_2(1,2,10,'2018-10-10', '2018-10-20', 5);
 
 -- 25 Hiển thị tổng số bản ghi còn lại trong bảng hợp đồng ra database
set @result =0;
 
 delimiter //

 create trigger tr_1
 after delete 
 on hop_dong for each row
 begin 
set @result =  (select count(id_hop_dong)
				from hop_dong);
signal sqlstate'20000'
set message_text = @result;
 end //
 
 delimiter ;
 
 delete 
 from hop_dong
 where id_hop_dong =9;
 
 select @result;
 
 -- 26 Tạo trigger khi cập nhật ngày kết thúc cho hợp đồng thì hiển thị ra kết quả hợp lệ hay không
 
 delimiter //

drop trigger if exists tr_2;
create trigger tr_2
before update
on hop_dong for each row
begin
	declare error_message varchar(50);
	set error_message = concat(new.ngay_ket_thuc, ' must bigger 2 day than ', old.ngay_lam_hop_dong);
	if (datediff(new.ngay_ket_thuc, old.ngay_lam_hop_dong) <2) then
		signal sqlstate '45000'
		set message_text = error_message;
	end if;
end //
 
 delimiter ;

update hop_dong
set ngay_ket_thuc = '2016-08-11'
where id_hop_dong = 9;


-- 27 Tạo funcion 1 đếm các dịch vụ đã được sử dụng với tổng tiền >2.000.000
-- function 2 tính khoảng thời gian dài nhất mà khách hàng đã thuê dịch vụ với mã khách hàng là tham số

delimiter //

create function fun_1 (p_id_dich_vu int)
returns int
deterministic
begin
declare result int;
set result = (
	select count(dv.id_dich_vu)
	from hop_dong hd inner join dich_vu dv on hd.dich_vu_id = dv.id_dich_vu
	where dv.id_dich_vu = p_id_dich_vu
	having sum(dv.chi_phi_thue) > 50);
return result;
end //

delimiter ;

select fun_1(1);

delimiter //
create function fun_2(p_id_khach_hang int)
returns int
deterministic
begin
declare result int;
set result = 
	(select datediff(ngay_ket_thuc ,ngay_lam_hop_dong)
	from hop_dong hd
	where khach_hang_id = 2 and datediff(hd.ngay_ket_thuc , hd.ngay_lam_hop_dong) >= all(
		select datediff(hd_tepm.ngay_ket_thuc , hd_tepm.ngay_lam_hop_dong)
		from hop_dong hd_tepm
		where khach_hang_id = 2)
    );
return result;
end //
delimiter ;

select fun_2(2);

-- 28 Tạo store procedure để xóa các dịch vụ là room từ 2015 -> 2019 

delimiter //

create procedure sp_3()
begin
delete 
from dich_vu
where id_dich_vu in (
		select * 
        from (
			select id_dich_vu
			from dich_vu dv inner join loai_dich_vu ldv on dv.loai_dich_vu_id = ldv.id_loai_dich_vu
							inner join hop_dong hd on hd.dich_vu_id = dv.id_dich_vu
			where ldv.ten_loai_dich_vu = 'room') tepm_table
		);
end//

delimiter ;

call sp_3;




