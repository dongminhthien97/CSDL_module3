CREATE DATABASE QuanLyKhachSan;
USE QuanLyKhachSan;

CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY,
    ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(45)
);

CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(45)
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(45)
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ma_loai_khach INT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT,
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);

CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(10),
    trang_thai VARCHAR(45)
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    so_luong INT,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- 1. Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.
INSERT INTO vi_tri VALUES 
(1, 'Lễ tân'),
(2, 'Phục vụ'),
(3, 'Chuyên viên'),
(4, 'Giám sát'),
(5, 'Quản lý'),
(6, 'Giám đốc');

INSERT INTO trinh_do VALUES 
(1, 'Trung cấp'),
(2, 'Cao đẳng'),
(3, 'Đại học'),
(4, 'Sau đại học');

INSERT INTO bo_phan VALUES 
(1, 'Sale – Marketing'),
(2, 'Hành Chính'),
(3, 'Phục vụ'),
(4, 'Quản lý');

INSERT INTO nhan_vien VALUES
(1, 'Hoàng Văn Hoa', '1988-04-20', '321654987', 11000000, '0901111222', 'hoangh@gmail.com', 'Huế', 2, 1, 1),
(2, 'Trần Thị Thi', '1991-08-10', '654987321', 10500000, '0902222333', 'trantt@gmail.com', 'Quảng Nam', 3, 2, 2),
(3, 'Khuất Duy Kha', '1987-12-05', '789456123', 11500000, '0903333444', 'kdk@gmail.com', 'Quảng Bình', 4, 3, 3),
(4, 'Mai Ngọc Minh', '1994-11-15', '987321654', 9500000, '0904444555', 'maingocm@gmail.com', 'Đà Nẵng', 1, 4, 2),
(5, 'Quách Tùng Quang', '1989-07-22', '456123789', 10200000, '0905555666', 'qtq@gmail.com', 'TP.HCM', 5, 2, 4);

INSERT INTO loai_khach VALUES 
(1, 'Diamond'),
(2, 'Platinum'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member');
DROP TABLE IF EXISTS vi_tri;

INSERT INTO khach_hang VALUES
(1, 1, 'Nguyễn Văn Minh', '1985-01-15', 1, '123456789', '0911000001', 'a.nguyen@gmail.com', 'Hà Nội'),
(2, 2, 'Trần Thị Binh', '1990-06-30', 0, '234567891', '0911000002', 'b.tran@gmail.com', 'TP.HCM'),
(3, 3, 'Lê Văn Canh', '1988-03-22', 1, '345678912', '0911000003', 'c.le@gmail.com', 'Đà Nẵng'),
(4, 4, 'Phạm Thị Dui', '1995-09-12', 0, '456789123', '0911000004', 'd.pham@gmail.com', 'Quảng Ninh'),
(5, 5, 'Hoàng Minh Thanh', '1992-12-05', 1, '567891234', '0911000005', 'e.hoang@gmail.com', 'Huế');

INSERT INTO kieu_thue VALUES 
(1, 'Năm'),
(2, 'Tháng'),
(3, 'Ngày'),
(4, 'Giờ');

INSERT INTO loai_dich_vu VALUES 
(1, 'Villa'),
(2, 'House'),
(3, 'Room');

INSERT INTO dich_vu VALUES 
(1, 'Villa Hướng Biển', 120, 2000000, 4, 2, 1, '5 sao', 'Hồ bơi riêng', 40, 2),
(2, 'House Gia Đình', 80, 1200000, 3, 3, 2, '4 sao', 'Phòng bếp', NULL, 1),
(3, 'Room Tiêu Chuẩn', 45, 500000, 2, 4, 3, '3 sao', 'Miễn phí nước uống', NULL, NULL);

INSERT INTO hop_dong VALUES 
(1, '2025-07-01 10:00:00', '2025-07-05 10:00:00', 1000000, 1, 1, 1),
(2, '2025-07-10 14:00:00', '2025-07-12 12:00:00', 500000, 2, 2, 2);

INSERT INTO dich_vu_di_kem VALUES 
(1, 'Massage', 300000, 'lượt', 'Hoạt động'),
(2, 'Karaoke', 150000, 'giờ', 'Hoạt động'),
(3, 'Đồ ăn', 200000, 'phần', 'Hoạt động'),
(4, 'Nước uống', 30000, 'chai', 'Hoạt động'),
(5, 'Thuê xe', 150000, 'giờ', 'Ngừng phục vụ');

INSERT INTO hop_dong_chi_tiet VALUES 
(1, 1, 1, 2),
(2, 1, 3, 3),
(3, 2, 4, 4);

SELECT * FROM nhan_vien;
SELECT * FROM khach_hang;
SELECT * FROM dich_vu;
SELECT * FROM hop_dong;
SELECT * FROM trinh_do;

SELECT *
FROM nhan_vien
WHERE (ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%')
  AND LENGTH(ho_ten) <= 15;








