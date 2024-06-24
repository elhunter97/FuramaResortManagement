create database FuramaResortManagement;
use furamaresortmanagement;
/*Bảng ViTri lưu trữ thông tin vị trí làm tại resort của nhân viên*/
create table ViTri(
id_vitri int,
ten_vitri varchar(45),
PRIMARY KEY(id_vitri)
);

/*Bảng TrinhDo lưu trữ thông tin trình độ của nhân viên*/
create table TrinhDo(
id_trinhdo int,
trinhdo varchar(45),
PRIMARY KEY(id_trinhdo)
);

/*Bảng BoPhan lưu trữ thông tin Nhân viên nào sẽ thuộc phòng ban nao*/
create table BoPhan(
id_bophan int,
ten_bophan varchar(45),
PRIMARY KEY(id_bophan)
);

/*NhanVien lưu trữ thông tin nhân viên*/
create table NhanVien(
id_nhanvien int,
hoten varchar(45),
id_vitri int,
id_trinhdo int,
id_bophan int,
ngaysinh date,
so_cmtnd varchar(45),
luong int,
sdt varchar(45),
email varchar(45),
diachi varchar(45),
PRIMARY KEY(id_nhanvien),
FOREIGN KEY(id_vitri) REFERENCES ViTri(id_vitri),
FOREIGN KEY(id_trinhdo) REFERENCES TrinhDo(id_trinhdo),
FOREIGN KEY(id_bophan)  REFERENCES BoPhan(id_bophan)
);


/*Bảng DichVuDiKem lưu trữ thông tin các dịch vụ đi kèm khi Khách hàng thuê Phòng, Villa, House tại resort*/
create table DichVuDiKem(
id_dichvudikem int, 
ten_dichvudikem varchar(45),
gia int,
donvi varchar(20),
trangthai_khadung varchar(45),
PRIMARY KEY(id_dichvudikem)
);

/*LoaiKhach lưu trữ thông tin các loại khách hàng*/
create table LoaiKhach(
id_loaikhach int,
ten_loaikhach varchar(45),
PRIMARY KEY(id_loaikhach)
);

/*KhachHang lưu trữ thông tin khách hàng*/
create table KhachHang(
id_khachhang int,
id_loaikhach int,
hoten varchar(45),
ngaysinh date,
so_cmtnd varchar(45),
sdt varchar(45),
email varchar(45),
diachi varchar(45),
PRIMARY KEY(id_khachhang),
FOREIGN KEY(id_loaikhach) REFERENCES LoaiKhach(id_loaikhach)
);

/*KieuThue*/
create table KieuThue(
id_kieuthue int,
ten_kieuthue varchar(45),
gia int,
PRIMARY KEY(id_kieuthue)
);

/*LoaiDichVu*/
create table LoaiDichVu(
id_loaidichvu int,
ten_loaidichvu varchar(45),
PRIMARY KEY(id_loaidichvu)
);

/*Bảng DichVu lưu trữ thông tin các dịch vụ mà resort cung cấp*/
create table DichVu(
id_dichvu int,
ten_dichvu varchar(45),
dientich int,
so_tang int,
so_nguoi_toida int,
chiphithue int,
id_kieuthue int,
id_loaidichvu int,
PRIMARY KEY(id_dichvu),
FOREIGN KEY(id_kieuthue) REFERENCES KieuThue(id_kieuthue),
FOREIGN KEY(id_loaidichvu) REFERENCES LoaiDichVu(id_loaidichvu)
);


/*Bảng HopDong lưu trữ thông tin khách hàng thực hiện thuê dịch vụ tại villa*/
create table HopDong(
id_hopdong int,
id_nhanvien int,
id_khachhang int,
id_dichvu int,
ngay_lam_hopdong date,
ngay_ketthuc date,
tien_datcoc int,
PRIMARY KEY(id_hopdong),
FOREIGN KEY(id_nhanvien) REFERENCES NhanVien(id_nhanvien),
FOREIGN KEY(id_khachhang) REFERENCES KhachHang(id_khachhang),
FOREIGN KEY(id_dichvu) REFERENCES DichVu(id_dichvu)
);
/*Bảng HopDongChiTiet lưu trữ thông tin một khách hàng có thể thuê nhiều dịch vụ đi kèm*/
create table HopDongChiTiet(
id_hopdongchitiet int,
id_hopdong int,
id_dichvudikem int,
soluong int not null,
PRIMARY KEY(id_hopdongchitiet),
FOREIGN KEY(id_hopdong) REFERENCES HopDong(id_hopdong),
FOREIGN KEY(id_dichvudikem) REFERENCES DichVuDiKem(id_dichvudikem)
);

/*-----Insert Data cho các bảng-----*/
/*Loại khách*/
insert into LoaiKhach values
                          (1,'Diamond'),
                          (2,'Platinum'),
                          (3,'Gold'),
                          (4,'Silver'),
                          (5,'Member');
/*Khách hàng*/
insert into KhachHang values
                          (1,5,'Nguyễn Thị Hào','1970-11-07','643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng'),
                          (2,3,'Phạm Xuân Diệu','1992-08-08','865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị'),
                          (3,1,'Trương Đình Nghệ','1990-02-27','488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh'),
                          (4,1,'Dương Văn Quan','1981-07-08','543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng'),
                          (5,4,'Hoàng Trần Nhi Nhi','1995-12-09','795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai'),
                          (6,4,'Tôn Nữ Mộc Châu','2005-12-06','732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng'),
                          (7,1,'Nguyễn Mỹ Kim','1984-04-08','856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh'),
                          (8,3,'Nguyễn Thị Hào','1999-04-08','965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum'),
                          (9,1,'Trần Đại Danh','1994-07-01','432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi'),
                          (10,2,'Nguyễn Tâm Đắc','1989-07-01','344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng');



/*Kiểu thuê*/
insert into kieuthue values
                         (1,'year',999000000),
                         (2,'month',14000000),
                         (3,'day',5200000),
                         (4,'hour',500000);

/*Loại dịch vụ*/
insert into loaidichvu values
                           (1,'Villa'),
                           (2,'House'),
                           (3,'Room');

/*Dịch vụ*/
insert into dichvu values
                       (1,'Villa Beach Front',25000,4,10,10000000,3,1),
                       (2,'House Princess 01',14000,3,7,5000000,2,2),
                       (3,'Room Twin 01',5000,null,2,1000000,4,3),
                       (4,'Villa No Beach Front',22000,3,8,9000000,3,1),
                       (5,'House Princess 02',10000,2,5,4000000,3,2),
                       (6,'Room Twin 02',3000,null,2,900000,4,3);

/*vị trí*/
insert into vitri values
                       (1,'Quản lý'),
                       (2,'Nhân viên');
/*trình độ*/
insert into trinhdo values
                        (1,'Trung Cấp'),
                        (2,'Cao Đẳng'),
                        (3,'Đại học'),
                        (4,'Sau đại học');

/* bộ phận */
insert into bophan values
                       (1,'Sale-Marketing'),
                       (2,'Hành chính'),
                       (3,'Phục vụ'),
                       (4,'Quản lý');

/*Nhân viên*/
insert into nhanvien values
                         (1,'Nguyễn Văn An',1,3,1,'1970-11-07','456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng'),
                         (2,'Lê Văn Bình',1,2,2,'1997-04-09','654231234',7000000,'0934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng'),
                         (3,'Hồ Thị Yến',1,3,2,'1995-12-12','999231723',14000000,'0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai'),
                         (4,'Võ Công Toản',1,4,4,'1980-04-04','123231365',17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị'),
                         (5,'Nguyễn Bỉnh Phát',2,1,1,'1999-12-09','454363232',6000000,'0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng'),
                         (6,'Khúc Nguyễn An Nghi',2,2,3,'2000-11-08','964542311',7000000,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng'),
                         (7,'Nguyễn Hữu Hà',2,3,2,'1993-01-01','534323231',8000000,'0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế'),
                         (8,'Nguyễn Hà Đông',2,4,4,'1989-09-03','234414123',9000000,'0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội'),
                         (9,'Tòng Hoang',2,4,4,'1982-09-03','256781231',6000000,'0245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng'),
                         (10,'Nguyễn Công Đạo',2,3,2,'1994-01-08','755434343',8000000,'0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai');

/*Dịch vụ đi kèm*/
insert into dichvudikem values
                            (1,'Karaoke',10000,'giờ','tiện nghi, hiện tại'),
                            (2,'Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
                            (3,'Thuê xe đạp',20000,'chiếc','tốt'),
                            (4,'Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),
                            (5,'Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),
                            (6,'Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');

/*Hợp đồng*/
insert into hopdong values
                        (1,3,1,3,'2020-12-08','2020-12-08',0),
                        (2,7,3,1,'2020-07-14','2020-07-21',200000),
                        (3,3,4,2,'2021-03-15','2021-03-17',50000),
                        (4,7,5,5,'2021-01-14','2021-01-18',100000),
                        (5,7,2,6,'2021-07-14','2021-07-15',0),
                        (6,7,7,6,'2021-06-01','2021-06-03',0),
                        (7,7,4,4,'2021-09-02','2021-09-05',100000),
                        (8,3,4,1,'2021-06-17','2021-06-18',150000),
                        (9,3,4,3,'2020-11-19','2020-11-19',0),
                        (10,10,3,5,'2021-04-12','2021-04-14',0),
                        (11,2,2,1,'2021-04-25','2021-04-25',0),
                        (12,7,10,1,'2021-05-25','2021-05-27',0);

/*Hợp đồng chi tiết*/
insert into hopdongchitiet values
                               (1,2,4,5),
                               (2,2,5,8),
                               (3,2,6,15),
                               (4,3,1,1),
                               (5,3,2,11),
                               (6,1,3,1),
                               (7,1,2,2),
                               (8,12,2,2);

/*truy vấn*/
/*2-Hiển thị thông tin của tất cả nhân viên có trong hệ thống
có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự*/
select *
from NhanVien
where (hoten like 'H%' or hoten like 'T%' or hoten like 'K%') and char_length(hoten)<=15;

/*3-Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi
  và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.*/
  select *
  from khachhang
  where (ngaysinh between '1974-12-31' and '2005-01-01') and (diachi like '%Đà Nẵng' or diachi like '%Quảng Trị');

/*4-Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần
  Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng
  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”
*/
select HopDong.id_khachhang,hoten,count(HopDong.id_khachhang) as 'so_lan_dat_phong'
    from khachhang
    inner join hopdong on khachhang.id_khachhang = hopdong.id_khachhang
    where KhachHang.id_loaikhach = 1
group by (HopDong.id_khachhang)
order by (count(HopDong.id_khachhang));

/*5-Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien
  TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem)
  cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra)
*/

select hd.id_khachhang,k.hoten,lk.ten_loaikhach,hd.id_hopdong,dv.ten_dichvu,hd.ngay_lam_hopdong,hd.ngay_ketthuc
from KhachHang as k
inner join loaikhach as lk on k.id_loaikhach = lk.id_loaikhach
inner join hopdong as hd on k.id_khachhang = hd.id_khachhang
inner join dichvu as dv on hd.id_dichvu = dv.id_dichvu
inner join hopdongchitiet as hdct on hd.id_hopdong = hdct.id_hopdong
inner join dichvudikem as dvdk on hdct.id_dichvudikem = dvdk.id_dichvudikem;

/*6-Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu
  của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2021
  (Quý 1 là tháng 1, 2, 3).*/
select id_dichvu,ten_dichvu,dientich,chiphithue,ten_loaidichvu
    from dichvu dv
inner join loaidichvu ldv on dv.id_loaidichvu  = ldv.id_loaidichvu
where dv.id_dichvu not in (select hd.id_dichvu from hopdong hd where year(hd.ngay_lam_hopdong) = 2021 and month(hd.ngay_lam_hopdong) between 1 and 3);

/*7-Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu
 của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2020
  nhưng chưa từng được Khách hàng đặt phòng  trong năm 2021. */
  select dv.id_dichvu,ten_dichvu,dientich,so_nguoi_toida,chiphithue,ldv.id_loaidichvu
      from dichvu dv
  inner join loaidichvu ldv on dv.id_loaidichvu = ldv.id_loaidichvu
  inner join hopdong hd on dv.id_dichvu = hd.id_dichvu
  where year(ngay_lam_hopdong) = 2020
  and dv.id_dichvu not in(select distinct dv.id_dichvu
                          from  DichVu dv
                          inner join hopdong on dv.id_dichvu = hopdong.id_dichvu
                          where year(hd.ngay_lam_hopdong) = 2021 )
  group by dv.id_dichvu;

/*8- Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
  Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên*/
  #cach 1
  select *
  from khachhang;
  #cach 2
  select distinct hoten
      from khachhang;
    #cach 3
    select hoten,count(hoten) as same_name
        from khachhang
    group by hoten;

/*9-Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng
  nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng*/
select month(ngay_lam_hopdong) as thang,count(kh.hoten) as so_khach_dat_phong
    from hopdong hd
inner join khachhang kh on hd.id_khachhang = kh.id_khachhang
where year(hd.ngay_lam_hopdong) = 2021
group by month(ngay_lam_hopdong);

/*10-Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm
  Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem
  (được tính dựa trên việc count các IDHopDongChiTiet).*/
  select hd.id_hopdong,ngay_lam_hopdong,ngay_ketthuc,tien_datcoc,sum(hdct.soluong) as so_luong_dich_vu_di_kem
      from  hopdong hd
  left join hopdongchitiet  hdct on hd.id_hopdong = hdct.id_hopdong
  group by hd.id_hopdong;

/*11-Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng
  có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.*/
  select dvdk.id_dichvudikem as ma_dich_vu_Di_kem, dvdk.ten_dichvudikem
      from dichvudikem dvdk
  inner join hopdongchitiet hdct on dvdk.id_dichvudikem = hdct.id_dichvudikem
  inner join hopdong hd on hdct.id_hopdong = hd.id_hopdong
inner join khachhang kh on hd.id_khachhang = kh.id_khachhang
  inner join loaikhach lk on kh.id_loaikhach = lk.id_loaikhach
  where lk.ten_loaikhach = 'Diamond' and kh.diachi like '%Vinh';

/*12-Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem
  (được tính dựa trên tổng Hợp đồng chi tiết),
  TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
  nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2020
 */
 select hd.id_hopdong,nv.hoten,kh.hoten,kh.sdt,dv.id_dichvu,dv.ten_dichvu,sum(hdct.soluong) as so_luong_dich_vu_di_kem,hd.tien_datcoc
     from hopdong hd
 inner join nhanvien nv on hd.id_nhanvien = nv.id_nhanvien
 inner join khachhang kh on hd.id_khachhang = kh.id_khachhang
 inner join dichvu dv on hd.id_dichvu = dv.id_dichvu
 inner join hopdongchitiet hdct on hd.id_hopdong = hdct.id_hopdong
 where year(ngay_lam_hopdong) = 2020 and month(ngay_lam_hopdong) in (10,11,12) and month(ngay_lam_hopdong) not in (1,2,3,4,5,6)
 group by hd.id_hopdong;

/*13-Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).*/


  /*14-Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
    Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.*/
    select hd.id_hopdong,ldv.ten_loaidichvu,dvdk.ten_dichvudikem,count(hdct.id_dichvudikem) as so_luong
    from HopDongChiTiet hdct
        inner join hopdong hd ON hdct.id_hopdong = hd.id_hopdong
        inner join dichvu dv on hd.id_dichvu = dv.id_dichvu
    inner join dichvudikem dvdk ON hdct.id_dichvudikem = dvdk.id_dichvudikem
    inner join  loaidichvu ldv on dv.id_loaidichvu = ldv.id_loaidichvu
    group by hd.id_hopdong, ldv.ten_loaidichvu, dvdk.ten_dichvudikem
    having  count(hdct.id_dichvudikem) = 1;

/*15-Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi
  mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019*/
    SELECT
    nv.id_nhanvien AS IDNhanVien,
    nv.hoten AS HoTen,
    td.trinhdo AS TrinhDo,
    bp.ten_bophan AS TenBoPhan,
    nv.sdt AS SoDienThoai,
    nv.diachi AS DiaChi
from
    nhanvien nv
inner join
    trinhdo td ON nv.id_trinhdo = td.id_trinhdo
inner join
    bophan bp ON nv.id_bophan = bp.id_bophan
inner join
    hopdong hd ON nv.id_nhanvien = hd.id_nhanvien AND hd.ngay_lam_hopdong BETWEEN '2020-01-01' AND '2021-12-31'
group by
    nv.id_nhanvien,
    nv.hoten,
    td.trinhdo,
    bp.ten_bophan,
    nv.sdt,
    nv.diachi
having
    count(hd.id_hopdong) <= 3;

/*16-Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.*/
    delete from nhanvien
where id_nhanvien not in (
    select distinct id_nhanvien
    from hopdong
    where ngay_lam_hopdong between '2020-01-01' and '2021-12-31'
);


/*17-Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond,
  chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2020 là lớn hơn 10.000.000 VNĐ.*/
    UPDATE khachhang kh
JOIN (
    SELECT
        hd.id_khachhang,
        SUM(dv.chiphithue + COALESCE(hdct.soluong * dvdk.gia, 0)) AS tong_tien
    FROM
        hopdong hd
    JOIN
        dichvu dv ON hd.id_dichvu = dv.id_dichvu
    LEFT JOIN
        hopdongchitiet hdct ON hd.id_hopdong = hdct.id_hopdong
    LEFT JOIN
        dichvudikem dvdk ON hdct.id_dichvudikem = dvdk.id_dichvudikem
    WHERE
        hd.ngay_lam_hopdong BETWEEN '2020-01-01' AND '2020-12-31'
    GROUP BY
        hd.id_khachhang
    HAVING
        tong_tien > 10000000
) AS kh_tongtien ON kh.id_khachhang = kh_tongtien.id_khachhang
JOIN loaikhach lk ON kh.id_loaikhach = lk.id_loaikhach
SET kh.id_loaikhach = (
    SELECT id_loaikhach FROM loaikhach WHERE ten_loaikhach = 'Diamond'
)
WHERE lk.ten_loaikhach = 'Platinium';

/*18-Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).*/
    DELETE hdct
FROM hopdongchitiet hdct
JOIN hopdong hd ON hdct.id_hopdong = hd.id_hopdong
WHERE hd.ngay_lam_hopdong < '2021-01-01';
DELETE FROM hopdong
WHERE ngay_lam_hopdong < '2021-01-01';
DELETE FROM khachhang
WHERE id_khachhang IN (
    SELECT DISTINCT id_khachhang
    FROM hopdong
    WHERE ngay_lam_hopdong < '2021-01-01'
);

/*19-Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi*/
UPDATE dichvudikem dvdk
SET dvdk.gia = dvdk.gia * 2
WHERE dvdk.id_dichvudikem IN (
    SELECT hdct.id_dichvudikem
    FROM hopdongchitiet hdct
    JOIN hopdong hd ON hdct.id_hopdong = hd.id_hopdong
    WHERE hd.ngay_lam_hopdong BETWEEN '2021-01-01' AND '2021-12-31'
    GROUP BY hdct.id_dichvudikem
    HAVING SUM(hdct.soluong) > 10
);
/*20-Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống,
  thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.*/
  SELECT
    nv.id_nhanvien AS ID,
    nv.hoten,
    nv.email,
    nv.sdt,
    nv.ngaysinh,
    nv.diachi
FROM
    nhanvien nv

UNION

SELECT
    kh.id_khachhang AS ID,
    kh.hoten,
    kh.email,
    kh.sdt,
    kh.ngaysinh,
    kh.diachi
FROM
    khachhang kh;




























