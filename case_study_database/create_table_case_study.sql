drop database if exists case_study_db;

create database case_study_db;

use case_study_db;

create table vi_tri (
id_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45)
);

create table trinh_do (
id_trinh_do int primary key auto_increment,
trinh_do varchar(45)
);

create table bo_phan (
id_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45)
);

create table nhan_vien (
id_nhan_vien int primary key auto_increment,
ho_va_ten_nhan_vien varchar(30),
vi_tri_id int,
trinh_do_id int,
bo_phan_id int,
ngay_sinh date,
so_id_card varchar(45),
luong varchar(45),
so_dien_thoai varchar(20),
email varchar(45),
dia_chi varchar(45),
foreign key (vi_tri_id) references vi_tri (id_vi_tri) on update cascade on delete cascade,
foreign key (trinh_do_id) references trinh_do(id_trinh_do) on update cascade on delete cascade,
foreign key (bo_phan_id) references bo_phan(id_bo_phan) on update cascade on delete cascade
);

create table loai_khach(
id_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45)
);

create table khach_hang (
id_khach_hang int primary key auto_increment,
loai_khach_id int,
ho_va_ten varchar(45),
ngay_sinh date,
so_id_card varchar(45),
so_dien_thoai varchar(20),
email varchar(45),
dia_chi varchar(45),
foreign key (loai_khach_id) references loai_khach (id_loai_khach) on update cascade on delete cascade
);

create table loai_dich_vu (
id_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);

create table kieu_thue (
id_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45)
);

create table dich_vu (
id_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45),
dien_tich int,
so_tang int,
so_nguoi_toi_da int,
chi_phi_thue int,
kieu_thue_id int,
loai_dich_vu_id int,
trang_thai varchar(45),
foreign key (kieu_thue_id) references kieu_thue (id_kieu_thue) on update cascade on delete cascade,
foreign key (loai_dich_vu_id) references loai_dich_vu (id_loai_dich_vu) on update cascade on delete cascade
);

create table hop_dong (
id_hop_dong int primary key auto_increment,
nhan_vien_id int,
khach_hang_id int,
dich_vu_id int,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int,
foreign key (nhan_vien_id) references nhan_vien(id_nhan_vien) on update cascade on delete cascade,
foreign key (khach_hang_id) references khach_hang(id_khach_hang) on update cascade on delete cascade,
foreign key (dich_vu_id) references dich_vu (id_dich_vu) on update cascade on delete cascade
);


create table dich_vu_di_kem (
id_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45),
gia int,
don_vi varchar(45),
trang_thai_kha_dung varchar(45)
);

create table hop_dong_chi_tiet (
id_hop_dong_chi_tiet int primary key auto_increment,
hop_dong_id int,
dich_vu_di_kem_id int,
so_luong int,
foreign key (hop_dong_id) references hop_dong (id_hop_dong) on update cascade on delete cascade,
foreign key (dich_vu_di_kem_id) references dich_vu_di_kem (id_dich_vu_di_kem) on update cascade on delete cascade
);




