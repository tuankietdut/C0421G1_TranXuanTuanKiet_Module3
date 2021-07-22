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
where month(ngay_lam_hop_dong) not in (1 or 2 or 3) and year(ngay_lam_hop_dong) = 2019;

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
 
-- 10. Hiển thị tương ứng mỗi dịch vụ đã sử dụng bao nhiêu dịch vụ đi kèm
 
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

-- 12. 
 



