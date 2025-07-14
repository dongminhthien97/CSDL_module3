create database if not exists quan_ly_don_hang;
use quan_ly_don_hang;

create table nhacc(
manhacc int primary key,
tennhacc varchar(200),
diachi varchar(200)
);

create table sodienthoai(
id int primary key auto_increment,
Sodienthoai int,
nhacc_manhacc int,
foreign key(nhacc_manhacc) references nhacc(manhacc)
);

create table dondh(
sodh int primary key,
ngaydh date,
nhacc_manhacc int,
foreign key(nhacc_manhacc) references nhacc(manhacc)
);

create table vattu(
mavtu int primary key,
tenvtu varchar(200)
);

create table dondh_vattu(
dondh_sodh int,
vattu_mavtu int,
tenhang varchar(200),
soluong int,
ngaydat date,
nguoidat varchar(200),
primary key(dondh_sodh,vattu_mavtu),
foreign key(dondh_sodh) references dondh(sodh),
foreign key(vattu_mavtu) references vattu(mavtu)
);

create table phieuxuat(
sopx int primary key,
ngayxuat date
);

create table vattu_phieuxuat(
vattu_mavtu int,
phieuxuat_sopx int,
dgxuat int,
slxuat int,
primary key(phieuxuat_sopx,vattu_mavtu),
foreign key(phieuxuat_sopx) references phieuxuat(sopx),
foreign key(vattu_mavtu) references vattu(mavtu)
);

create table phieunhap(
sopn int primary key,
ngaynhap int
);

create table vattu_phieunhap(
vattu_mavtu int,
phieunhap_sopn int,
dgnhap int,
slnhap int,
primary key(phieunhap_sopn,vattu_mavtu),
foreign key(phieunhap_sopn) references phieunhap(sopn),
foreign key(vattu_mavtu) references vattu(mavtu)
);

















