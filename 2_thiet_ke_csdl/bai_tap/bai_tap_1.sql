drop database if exists erd_to_db;
create database erd_to_db;
use erd_to_db;

create table so_dien_thoai_cua_ncc (
id int primary key auto_increment,
so_dien_thoai varchar(15)
);

create table phieu_xuat (
ma_so_phieu_xuat int primary key auto_increment,
ngay_xuat datetime
);

create table vat_tu (
ma_so_vat_tu int primary key auto_increment,
ten_vat_tu varchar(50)
);

create table phieu_nhap (
ma_so_phieu_nhap int primary key auto_increment,
ngay_nhap datetime
);

create table nha_cung_cap (
ma_so_nha_cung_cap int primary key auto_increment,
ten_nha_cung_cap varchar(50),
dia_chi varchar(50),
so_dien_thoai_id int,
foreign key (so_dien_thoai_id) references so_dien_thoai_cua_ncc(id)
);

create table don_dat_hang(
ma_so_don_dat_hang int primary key auto_increment,
ngay_dat_hang datetime,
nha_cung_cap_ma_so int,
foreign key (nha_cung_cap_ma_so) references nha_cung_cap(ma_so_nha_cung_cap)
);

create table chi_tiet_phieu_xuat (
phieu_xuat_ma_so int,
vat_tu_ma_so int,
don_gia_xuat int,
so_luong_xuat int,
primary key (phieu_xuat_ma_so, vat_tu_ma_so),
foreign key (phieu_xuat_ma_so) references phieu_xuat(ma_so_phieu_xuat),
foreign key (vat_tu_ma_so) references vat_tu(ma_so_vat_tu)
);

create table chi_tiet_phieu_nhap (
phieu_nhap_ma_so int,
vat_tu_ma_so int,
don_gia_nhap int,
so_luong_nhap int,
primary key (phieu_nhap_ma_so, vat_tu_ma_so),
foreign key(phieu_nhap_ma_so) references phieu_nhap(ma_so_phieu_nhap),
foreign key (vat_tu_ma_so) references vat_tu(ma_so_vat_tu)
);

create table chi_tiet_don_dat_hang (
vat_tu_ma_so int,
don_dat_hang_ma_so int,
primary key (vat_tu_ma_so, don_dat_hang_ma_so),
foreign key(vat_tu_ma_so) references vat_tu(ma_so_vat_tu),
foreign key(don_dat_hang_ma_so) references don_dat_hang(ma_so_don_dat_hang)
);

