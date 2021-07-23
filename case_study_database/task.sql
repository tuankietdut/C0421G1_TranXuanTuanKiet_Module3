-- 2. Thông tin nhân viên có tên h k t và tối đa 15 ký tự
select *
from nhan_vien
where (ho_va_ten_nhan_vien like '%h%' or '%k%' or '%t%') and length(ho_va_ten_nhan_vien) <16;

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













