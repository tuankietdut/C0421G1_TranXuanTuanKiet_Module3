-- CREATE DATABASE QUAN_LI_DIEM_THI;
create table HOC_SINH (
ma_hoc_sinh varchar(20) primary key,
ten_hoc_sinh varchar(50) not null,
ngay_sinh date,
gioi_tinh varchar(5));
create table mon_hoc (
ma_mon_hoc varchar(20) primary key,
ten_mon_hoc varchar(30));
create table bang_diem (
ma_hoc_sinh varchar(20),
ma_mon_hoc varchar(20),
diem_thi int,
ngay_kiem_tra datetime,
primary key (ma_hoc_sinh, ma_mon_hoc),
foreign key(ma_hoc_sinh) references hoc_sinh(ma_hoc_sinh),
foreign key(ma_mon_hoc) references mon_hoc(ma_mon_hoc));
create table giao_vien (
ma_giao_vien varchar(20) primary key,
ten_giao_vien varchar(20),
sdt varchar(20));
alter table hoc_sinh 
add ma_giao_vien varchar(20);
alter table hoc_sinh
add  foreign key (ma_giao_vien) references giao_vien(ma_giao_vien);
alter table mon_hoc
add ma_giao_vien varchar(20);
alter table mon_hoc
add foreign key (ma_giao_vien) references giao_vien(ma_giao_vien);

