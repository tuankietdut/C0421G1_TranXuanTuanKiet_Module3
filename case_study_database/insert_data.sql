use case_study_db;

insert into vi_tri (ten_vi_tri)
values ('le_tan'),
		('phuc_vu'),
        ('chuyen_vien'),
        ('giam_sat'),
        ('quan_ly'),
        ('giam_doc');

insert into trinh_do (trinh_do)
values ('trung_cap'),
		('cao_dang'),
        ('dai_hoc'),
        ('sau_dai_hoc');
        
insert into bo_phan (ten_bo_phan)
values ('sale_marketing'),
		('hanh_chinh'),
        ('phuc_vu'),
        ('quan_ly');
        
insert into loai_khach (ten_loai_khach)
values ('diamond'),
		('platinium'),
        ('gold'),
        ('silver'),
        ('member');
        
insert into loai_dich_vu (ten_loai_dich_vu)
values ('villa'),
		('house'),
        ('room');
        
insert into kieu_thue (ten_kieu_thue)
values ('theo_ngay'),
		('theo_thang'),
        ('theo_nam');
        
insert into dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
values ('massage', 2, 'nha_nghi_thien_huong', 'cho_phep_su_dung'),
		('karaoke', 5, 'karaoke_phuong_dong', 'cho_phep_su_dung'),
        ('thue_xe_du_lich_resort',7 , 'nha_xe_binh_minh', 'cho_phep_su_dung'),
        ('thuc_an',8 , 'nha_hang_sao_bien','cho_phep_su_dung');

insert into nhan_vien (ho_va_ten_nhan_vien, vi_tri_id, trinh_do_id, bo_phan_id, ngay_sinh, so_id_card, luong, so_dien_thoai, email, dia_chi)
values ('le_van_hoang', 3, 3, 4, '1998/02/20', '1918005437', '600', '01234812541', 'taolakisu@gmail.com', 'da_nang' ),
		('nguyen_van_tien', 2, 2, 1, '1995/04/25', '1918005134', '700', '01234568421', 'loasmccsa@gmail.com', 'quang_tri'),
        ('le_khanh', 4, 1, 1, '1992/02/15', '1918005124', '800', '01234582135', 'loamsnhfw@gmail.com', 'quang_nam'),
        ('tran_xuan_dong', 6, 3, 4, '1990/01/10', '1918005217', '1000', '01254232157', 'sengroup@gmail.com', 'da_nang');

insert into khach_hang (loai_khach_id, ho_va_ten, ngay_sinh, so_id_card, so_dien_thoai, email, dia_chi)
values (1, 'le_van_xuan', '1995/10/10', '811042157', '012345784', 'lmcnshawk@gmail.com', 'da_nang'),
		(1, 'le_van_ha', '2005/10/15', '8110421532', '012345121', 'skchamwjf@gmail.com', 'quang_tri'),
        (2, 'le_van_thu', '1980/4/26', '8114023154', '0123421741', 'scanwkfaj@gmail.com', 'vinh'),
        (4, 'le_van_dong', '1990/5/20', '811402154', '01234841654', 'sckajwfwbn@gmail.com', 'quang_tri');


insert into dich_vu (ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, kieu_thue_id, loai_dich_vu_id, trang_thai)
values ('villa-001', 45, 3, 10, 20, 1,  1, 'cho phep booking'),
		('house-001', 40, 2, 5, 15, 1, 2, 'cho phep booking'),
        ('room-001', 25, 1, 4, 10, 2, 3, 'cho phep booking'),
        ('villa-002', 50, 3, 15, 30, 1, 1, 'cho phep booking');

insert into hop_dong (nhan_vien_id, khach_hang_id, dich_vu_id, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
values (1, 2, 1, '2019/10/20', '2019/10/27', 5),
		(2, 1, 2, '2019/01/15', '2019/01/23', 7),
        (3, 3, 3, '2018/07/10', '2018/07/21', 4),
        (4, 4, 4, '2018/01/05', '2018/01/15', 6),
        (1, 2, 1, '2019/09/15', '2019/09/20', 4),
        (1, 4, 1, '2018/06/20', '2018/06/25', 10),
        (3, 1, 1, '2019/01/10', '2019/01/18', 8);

insert into hop_dong_chi_tiet (hop_dong_id, dich_vu_di_kem_id, so_luong)
values (1, 1, 5),
		(2, 2, 4),
        (3, 4, 5),
        (4, 3, 1),
        (5, 1, 10),
        (6, 4 , 4);

insert into khach_hang (loai_khach_id, ho_va_ten, ngay_sinh, so_id_card, so_dien_thoai, email, dia_chi)
values (1, 'le_van_dong', '1998/10/10', '811421025', '0123513541', 'cakljshwujn@gmail.com', 'quang_tri');

insert into hop_dong_chi_tiet (hop_dong_id, dich_vu_di_kem_id, so_luong)
values (1, 3, 4),
		(1, 4, 2);
        
insert into khach_hang (loai_khach_id, ho_va_ten, ngay_sinh, so_id_card, so_dien_thoai, email, dia_chi)
values (1, 'ngo_diec_pham', '2000/02/10', '81140215651', '012354212854', 'ksckdnsfgkse@gmail.com', 'vinh');

update khach_hang
set dia_chi = 'vinh'
where id_khach_hang = 2;



