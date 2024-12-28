CREATE DATABASE seven_summit;

-- DROP DATABASE seven_summit;

USE seven_summit;

CREATE TABLE User
( 
	id_User char(5) PRIMARY KEY NOT NULL
    , nama_Lengkap varchar(200) NOT NULL
    , Alamat varchar(200) NOT NULL
    , Tanggal_Lahir date NOT NULL
);

-- DROP TABLE User

CREATE TABLE Data_Gunung
(
	id_Gunung char(3) PRIMARY KEY NOT NULL
    , Nama_Gunung varchar(40) NOT NULL
    , Ketinggian char(4) NOT NULL
    , Lokasi varchar(20) NOT NULL
    , Jalur_Pendakian varchar(2) NOT NULL
    , Status_Gunung varchar(11) NOT NULL
    , Biaya_Simaksi int NULL
);

-- DROP TABLE Data_Gunung

CREATE TABLE Histori_Pendakian
( 	
	id_Histori char(5) PRIMARY KEY NOT NULL
	, id_User char(5)
	, id_Gunung char(3)
    , Tanggal_Pendakian date NOT NULL
    , Catatan varchar(100)
    , CONSTRAINT User_id FOREIGN KEY (id_User) REFERENCES User(id_User) ON UPDATE CASCADE ON DELETE SET NULL
    , CONSTRAINT Gunung_id FOREIGN KEY (id_Gunung) REFERENCES Data_Gunung(id_Gunung) ON UPDATE CASCADE ON DELETE SET NULL
);

-- DROP TABLE Histori_Pendakian

CREATE TABLE Booking
(
	NIK char(16) PRIMARY KEY NOT NULL
    , id_User char(5)
    , id_Gunung char(3)
    , Tanggal_Pelaksanaan date NOT NULL
    , Nomor_HP char(12)
    , Email mediumtext NOT NULL
    , Jumlah_Pendaki char(2) NOT NULL
    , Catatan varchar(100)
    , CONSTRAINT U_id FOREIGN KEY (id_User) REFERENCES User(id_User) ON UPDATE CASCADE ON DELETE SET NULL
    , CONSTRAINT G_id FOREIGN KEY (id_Gunung) REFERENCES Data_Gunung(id_Gunung) ON UPDATE CASCADE ON DELETE SET NULL
);

-- DROP TABLE Booking

CREATE TABLE Jalur_Pendakian
(
	id_Jalur char(3) PRIMARY KEY NOT NULL
    , id_Gunung char(3)
    , Nama_Jalur varchar(20) NOT NULL
    , Panjang_Jalur char(2) NOT NULL
    , Kesulitan char(6)
    , Deskripsi varchar(20)
    , CONSTRAINT id_G FOREIGN KEY (id_Gunung) REFERENCES Data_Gunung(id_Gunung) ON UPDATE CASCADE ON DELETE SET NULL
);

-- DROP TABLE Jalur_Pendakian

SELECT b.NIK, u.nama_Lengkap AS "Nama", dg.Nama_Gunung AS "Nama Gunung", b.Tanggal_Pelaksanaan AS "Tanggal", b.Nomor_HP AS "Nomor HP", b.Email, b.Jumlah_Pendaki AS "Jumlah Pendaki", b.Catatan
FROM Booking b
JOIN User u USING (id_User)
JOIN Data_Gunung dg USING (id_Gunung);

SELECT hp.id_Histori AS "ID", u.nama_Lengkap AS "Nama Pendaki", dg.Nama_Gunung AS "Nama Gunung", hp.Tanggal_Pendakian AS "Tanggal Pendakian", hp.Catatan
FROM Histori_Pendakian hp
JOIN User u USING(id_User)
JOIN Data_Gunung dg USING(id_Gunung);

select * from Data_Gunung;
INSERT INTO Data_Gunung
VALUES ('G01', 'Gunung Leuser', '3119', 'Aceh', '2', 'Tidak Aktif', 70000)
, ('G03',  'Gunung Kerinci', '3805', 'Sumatra Barat', '1', 'Aktif', 30000)
, ('G04',  'Gunung Marapi', '2891', 'Sumatra Barat', '1', 'Aktif', 15000)
, ('G06',  'Gunung Dempo', '3159', 'Sumatra Selatan', '2', 'Aktif', 10000)
, ('G08',  'Gunung Semeru', '3676', 'Jawa Timur', '1', 'Aktif', 24000)
, ('G09',  'Gunung Slamet', '3428', 'Jawa Tengah', '4', 'Aktif', 20000)
, ('G10',  'Gunung Sumbing', '3371', 'Jawa Tengah', '3', 'Tidak Aktif', 20000)
, ('G11',  'Gunung Arjuno', '3339', 'Jawa Timur', '3', 'Tidak Aktif', 20000)
, ('G12',  'Gunung Raung', '3344', 'Jawa Timur', '2', 'Aktif', 20000)
, ('G13',  'Gunung Lawu', '3265', 'Jawa Tengah', '3', 'Tidak Aktif', 20000)
, ('G14',  'Gunung Merbabu', '3145', 'Jawa Tengah', '4', 'Tidak Aktif', 20000)
, ('G15',  'Gunung Agung', '3142', 'Bali', '2', 'Aktif', 30000)
, ('G16',  'Gunung Batur', '1717', 'Bali', '1', 'Aktif', 250000)
, ('G17',  'Gunung Abang', '2152', 'Bali', '1', 'Tidak Aktif', 75000)
, ('G18',  'Gunung Rinjani', '3726', 'NTB', '2', 'Aktif', 2500000)
, ('G19',  'Gunung Tambora', '2851', 'NTB', '1', 'Aktif', 100000)
, ('G22',  'Gunung Bukit Tiga Puluh', '1900', 'NTB', '1', 'Tidak Aktif', 20000)
, ('G23',  'Gunung Carstensz Pyramid', '4884', 'Papua', '2', 'Tidak Aktif', 15000000)
, ('G24',  'Gunung Trikora', '4750', 'Papua', '2', 'Tidak Aktif', 30000000)
, ('G25',  'Gunung Puncak Mandala', '4760', 'Papua', '2', 'Tidak Aktif', 30000000)
, ('G26',  'Gunung Puncak Ngga Pilimsit', '4465', 'Papua', '2', 'Tidak Aktif', 30000000)
, ('G27',  'Gunung Binaiya', '3027', 'Maluku', '1', 'Tidak Aktif', 7000000)
, ('G28',  'Gunung Salas', '2524', 'Maluku', '2', 'Tidak Aktif', 5000000)
, ('G29',  'Gunung Gandang Dewata', '3037', 'Sulawesi Selatan', '1', 'Tidak Aktif', 1500000)
, ('G30',  'Gunung Rantemario', '3478', 'Sulawesi Selatan', '3', 'Tidak Aktif', 1000000);

INSERT INTO Data_Gunung (id_Gunung, Nama_Gunung, Ketinggian, Lokasi, Jalur_Pendakian, Status_Gunung)
VALUES ('G02', 'Gunung Bandahara', '3030', 'Aceh', '1', 'Tidak Aktif')
, ('G05',  'Gunung Talamau', '2982', 'Sumatra Barat', '1', 'Tidak Aktif')
, ('G07',  'Gunung Geureudong', '2885', 'Aceh', '1', 'Tidak Aktif')
, ('G20',  'Gunung Rokatenda', '2500', 'NTT', '1', 'Aktif')
, ('G21',  'Gunung Sumbawa', '2300', 'NTB', '1', 'Tidak Aktif');