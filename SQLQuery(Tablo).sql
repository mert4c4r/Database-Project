CREATE TABLE Kooperatif (
    Kooperatif_ID INT PRIMARY KEY,
    Kooperatif_Ad NVARCHAR(100) NOT NULL,
    Kooperatif_Kurulus_Yili INT NOT NULL,
    Kooperatif_Lokasyon NVARCHAR(255) NOT NULL,
    Kooperatif_Uye_Sayisi INT
);


CREATE TABLE Uye (
    Uye_ID INT PRIMARY KEY,
    Uye_Ad NVARCHAR(100) NOT NULL,
    Uye_Soyad NVARCHAR(100) NOT NULL,
    Uye_Telefon_Numarasi NVARCHAR(15),
    Uye_Email NVARCHAR(100),
    Kooperatif_ID INT,
    FOREIGN KEY (Kooperatif_ID) REFERENCES Kooperatif(Kooperatif_ID)
);


CREATE TABLE Kooperatif_Urun (
    K_Urun_ID INT PRIMARY KEY,
    Kooperatif_ID INT,
    K_Urun_Ad NVARCHAR(100) NOT NULL,
    K_Urun_Kategori NVARCHAR(50),
    K_Urun_Aciklama NVARCHAR(255),
    K_Urun_Fiyat DECIMAL(10, 2) NOT NULL,
    K_Urun_Stok_Miktari INT NOT NULL,
    Urun_Fiyat_ID INT,
    FOREIGN KEY (Kooperatif_ID) REFERENCES Kooperatif(Kooperatif_ID)
);


CREATE TABLE Tedarikci (
    Tedarikci_ID INT PRIMARY KEY,
    Tedarikci_Ad NVARCHAR(100) NOT NULL,
    Tedarikci_Iletisim NVARCHAR(255),
    Tedarikci_Adres NVARCHAR(255),
    Kooperatif_ID INT,
    FOREIGN KEY (Kooperatif_ID) REFERENCES Kooperatif(Kooperatif_ID)
);


CREATE TABLE Tedarikci_Urun (
    T_Urun_ID INT PRIMARY KEY,
    Tedarikci_ID INT,
    T_Urun_Ad NVARCHAR(100) NOT NULL,
    T_Urun_Kategori NVARCHAR(50),
    T_Urun_Aciklama NVARCHAR(255),
    T_Urun_Fiyat DECIMAL(10, 2) NOT NULL,
    T_Urun_Miktar INT NOT NULL,
    Urun_Fiyat_ID INT,
    FOREIGN KEY (Tedarikci_ID) REFERENCES Tedarikci(Tedarikci_ID)
);


CREATE TABLE Kooperatif_Siparis (
    K_Siparis_ID INT PRIMARY KEY,
    Uye_ID INT,
    K_Siparis_Tarihi DATE NOT NULL,
    K_Toplam_Tutar DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Uye_ID) REFERENCES Uye(Uye_ID)
);


CREATE TABLE Kooperatif_Siparis_Detayi (
    K_Siparis_Detayi_ID INT PRIMARY KEY,
    K_Siparis_ID INT,
    K_Urun_ID INT,
    K_Siparis_Detayi_Adet INT NOT NULL,
    K_Siparis_Detayi_Fiyat DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (K_Siparis_ID) REFERENCES Kooperatif_Siparis(K_Siparis_ID),
    FOREIGN KEY (K_Urun_ID) REFERENCES Kooperatif_Urun(K_Urun_ID)
);


CREATE TABLE Tedarikci_Siparis (
    T_Siparis_ID INT PRIMARY KEY,
    Tedarikci_ID INT,
    T_Siparis_Tarihi DATE NOT NULL,
    T_Toplam_Tutar DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Tedarikci_ID) REFERENCES Tedarikci(Tedarikci_ID)
);


CREATE TABLE Tedarikci_Siparis_Detayi (
    T_Siparis_Detayi_ID INT PRIMARY KEY,
    T_Siparis_ID INT,
    T_Urun_ID INT,
    T_Siparis_Detayi_Adet INT NOT NULL,
    T_Siparis_Detayi_Fiyat DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (T_Siparis_ID) REFERENCES Tedarikci_Siparis(T_Siparis_ID),
    FOREIGN KEY (T_Urun_ID) REFERENCES Tedarikci_Urun(T_Urun_ID)
);


CREATE TABLE Finansal_Veriler (
    Kayit_ID INT PRIMARY KEY,
    Kooperatif_ID INT,
    Gelir DECIMAL(10, 2),
    Gider DECIMAL(10, 2),
    Finansal_Tarih NVARCHAR(50),
    FOREIGN KEY (Kooperatif_ID) REFERENCES Kooperatif(Kooperatif_ID)
);

CREATE TABLE Yardim (
    Yardim_ID INT PRIMARY KEY,
    Uye_ID INT,
    Yardim_Tarihi DATE NOT NULL,
    Yardim_Turu NVARCHAR(100),
    Yardim_Miktari DECIMAL(10, 2),
    FOREIGN KEY (Uye_ID) REFERENCES Uye(Uye_ID)
);


CREATE TABLE Etkinlik (
    Etkinlik_ID INT PRIMARY KEY,
    Etkinlik_Ad NVARCHAR(100) NOT NULL,
    Etkinlik_Tarih DATE NOT NULL,
    Etkinlik_Yer NVARCHAR(255),
    Kooperatif_ID INT,
    FOREIGN KEY (Kooperatif_ID) REFERENCES Kooperatif(Kooperatif_ID)
);


CREATE TABLE Urun_Fiyatlandirma (
    Urun_Fiyat_ID INT PRIMARY KEY,
    K_Urun_ID INT,
    T_Urun_ID INT,
    Max_Alis DECIMAL(10, 2),
    Min_Alis DECIMAL(10, 2),
    Max_Satis DECIMAL(10, 2),
    Min_Satis DECIMAL(10, 2),
    Gecerlilik_Tarihi DATE,
    FOREIGN KEY (K_Urun_ID) REFERENCES Kooperatif_Urun(K_Urun_ID),
    FOREIGN KEY (T_Urun_ID) REFERENCES Tedarikci_Urun(T_Urun_ID)
);


CREATE TABLE Nakliyat (
    Nakliyat_ID INT PRIMARY KEY,
    Kooperatif_ID INT,
    Tedarikci_ID INT,
    N_Miktar INT NOT NULL,
    N_Tarih DATE NOT NULL,
    FOREIGN KEY (Kooperatif_ID) REFERENCES Kooperatif(Kooperatif_ID),
    FOREIGN KEY (Tedarikci_ID) REFERENCES Tedarikci(Tedarikci_ID)
);



INSERT INTO Kooperatif (Kooperatif_ID, Kooperatif_Ad, Kooperatif_Kurulus_Yili, Kooperatif_Lokasyon, Kooperatif_Uye_Sayisi)
VALUES
(1, 'Sinop Kooperatifi', 2003, 'Sinop', 157),
(2, 'Mutlu Tar�m', 2000, 'Malatya', 100),
(3, 'Bereket Kooperatifi', 1995, 'Elaz��', 200),
(4, 'Ayas Ticaret', 2015, 'Van', 80),
(5, 'B�y�k �reticiler', 1973, 'Rize', 20);


INSERT INTO Uye (Uye_ID, Uye_Ad, Uye_Soyad, Uye_Telefon_Numarasi, Uye_Email, Kooperatif_ID)
VALUES
(1, 'Yasin Mert', 'Acar', '05432433517', 'acaryasinmert@gmail.com', 1),
(2, '�mer Faruk', 'Mutlu', '05489855463', 'mutluomerfaruk@gmail.com', 2),
(3, 'Onur', 'Bilici', '05232232323', 'bilicionur@gmail.com', 3),
(4, 'Ali', 'Ayas', '05676676766', 'ayasali@hotmail.com', 4),
(5, 'Emir', 'Bacanak', '05512345678', 'bacanakemir@hotmail.com', 5),
(6, 'Enes', 'G�kkaya', '05432433518', 'gokkayaenes@gmail.com', 1),
(7, 'Salih', '�st�n', '05987456321', 'ustunsalih@hotmail.com', 2);



INSERT INTO Kooperatif_Urun (K_Urun_ID, Kooperatif_ID, K_Urun_Ad, K_Urun_Kategori, K_Urun_Aciklama, K_Urun_Fiyat, K_Urun_Stok_Miktari)
VALUES
(1, 1, 'Kestane', 'Meyve', 'Sinop Kestanesi', 650.00, 1500),
(2, 2, 'Kay�s�', 'Meyve', 'Malatya Kay�s�', 180.00, 20000),
(3, 3, 'Tereya�', 'S�t �r�nleri', 'Organik Elaz�� Tereya��', 900.00, 750),
(4, 4, 'Otlu Peynir', 'S�t �r�nleri', 'Van Otlu Peyniri', 750.00, 600),
(5, 5, '�ay', '�ay �r�nleri', 'Rize �ay�', 800.00, 5000);


INSERT INTO Tedarikci (Tedarikci_ID, Tedarikci_Ad, Tedarikci_Iletisim, Tedarikci_Adres, Kooperatif_ID)
VALUES
(1, 'Anadolu Tedarik', 'info@anadolutedarik.com', 'Konya', 1),
(2, 'Sivas Tar�m', 'sivastar�m@hotmail.com', 'Sivas', 2),
(3, 'Karde�ler Tedarik', 'crazyboy@gmail.com', 'Antalya', 3),
(4, 'Organik Tar�m ve Tedarik', 'bilgi@organiktar�m.com', 'Mu�la', 4),
(5, 'Sinop �r�nleri', 'sinoplum@gmail.com', 'Sinop', 5);


INSERT INTO Tedarikci_Urun (T_Urun_ID, Tedarikci_ID, T_Urun_Ad, T_Urun_Kategori, T_Urun_Aciklama, T_Urun_Fiyat, T_Urun_Miktar)
VALUES
(1, 1, 'Un', 'Bakliyat', 'Esmer Un', 4.00, 500),
(2, 2, 'Sucuk', 'Et �r�nleri', 'Kangal Sucuk', 450.00, 300),
(3, 3, 'Muz', 'Meyve', 'Antalya Muz', 17.00, 2000),
(4, 4, 'Zeytin', 'Meyve', 'Siyah zeytin', 57.00, 4000),
(5, 5, 'Pirin�', 'Bakliyat', 'Baldo Pirin�', 10.00, 6000);


INSERT INTO Kooperatif_Siparis (K_Siparis_ID, Uye_ID, K_Siparis_Tarihi, K_Toplam_Tutar)
VALUES
(1, 1, '2026-01-01', 100.50),
(2, 2, '2026-01-02', 250.75),
(3, 3, '2026-01-03', 300.00),
(4, 4, '2026-01-04', 50.00),
(5, 5, '2026-01-05', 120.25);


INSERT INTO Kooperatif_Siparis_Detayi (K_Siparis_Detayi_ID, K_Siparis_ID, K_Urun_ID, K_Siparis_Detayi_Adet, K_Siparis_Detayi_Fiyat)
VALUES
(1, 1, 1, 10, 3.50),
(2, 2, 2, 20, 2.00),
(3, 3, 3, 5, 20.00),
(4, 4, 4, 2, 50.00),
(5, 5, 5, 15, 10.00);


INSERT INTO Tedarikci_Siparis (T_Siparis_ID, Tedarikci_ID, T_Siparis_Tarihi, T_Toplam_Tutar)
VALUES
(1, 1, '2026-01-01', 500.00),
(2, 2, '2026-02-01', 1200.00),
(3, 3, '2026-03-01', 300.00),
(4, 4, '2026-04-01', 800.00),
(5, 5, '2026-05-01', 400.00);


INSERT INTO Tedarikci_Siparis_Detayi (T_Siparis_Detayi_ID, T_Siparis_ID, T_Urun_ID, T_Siparis_Detayi_Adet, T_Siparis_Detayi_Fiyat)
VALUES
(1, 1, 1, 50, 4.00),
(2, 2, 2, 100, 6.00),
(3, 3, 3, 20, 25.00),
(4, 4, 4, 30, 12.00),
(5, 5, 5, 40, 10.00);


INSERT INTO Finansal_Veriler (Kayit_ID, Kooperatif_ID, Gelir, Gider, Finansal_Tarih)
VALUES
(1, 1, 5000.00, 2000.00, '2025-01'),
(2, 2, 10000.00, 8000.00, '2025-02'),
(3, 3, 7000.00, 3000.00, '2025-03'),
(4, 4, 2000.00, 1500.00, '2025-04'),
(5, 5, 3000.00, 1000.00, '2025-05');


INSERT INTO Yardim (Yardim_ID, Uye_ID, Yardim_Tarihi, Yardim_Turu, Yardim_Miktari)
VALUES
(1, 1, '2025-01-01', 'Nakit', 500.00),
(2, 2, '2025-01-02', 'Burs', 4000.00),
(3, 3, '2025-01-03', 'G�da', 200.00),
(4, 4, '2025-01-04', 'E�itim', 300.00),
(5, 5, '2025-01-05', 'Sa�l�k', 400.00);


INSERT INTO Etkinlik (Etkinlik_ID, Etkinlik_Ad, Etkinlik_Tarih, Etkinlik_Yer, Kooperatif_ID)
VALUES
(1, 'Bal�kesir �enli�i', '2026-06-01', 'Bal�kesir', 1),
(2, 'Kooperatif Bulu�mas�', '2026-07-15', '�zmir', 2),
(3, '��ft�i G�n�', '2026-08-20', 'Konya', 3),
(4, 'Tar�msal E�itim', '2026-09-10', 'Antalya', 4),
(5, 'K�y �r�nleri Fuar�', '2026-10-05', 'Kahramanmara�', 5);


INSERT INTO Urun_Fiyatlandirma (Urun_Fiyat_ID, K_Urun_ID, T_Urun_ID, Max_Alis, Min_Alis, Max_Satis, Min_Satis, Gecerlilik_Tarihi)
VALUES
(1, 1, 1, 3.50, 3.00, 4.00, 3.50, '2026-01-01'),
(2, 2, 2, 2.00, 1.80, 2.50, 2.00, '2026-02-01'),
(3, 3, 3, 20.00, 18.00, 22.00, 20.00, '2026-03-01'),
(4, 4, 4 ,50.00, 45.00, 55.00, 50.00, '2026-04-01'),
(5, 5, 5, 10.00, 9.00, 12.00, 10.00, '2026-05-01');


INSERT INTO Nakliyat (Nakliyat_ID, Kooperatif_ID, Tedarikci_ID, N_Miktar, N_Tarih)
VALUES
(1, 1, 1, 500, '2026-01-01'),
(2, 2, 2, 400, '2026-02-01'),
(3, 3, 3, 300, '2026-03-01'),
(4, 4, 4, 200, '2026-04-01'),
(5, 5, 5, 100, '2026-05-01');
