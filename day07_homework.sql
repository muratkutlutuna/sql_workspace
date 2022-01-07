create table ogrenci
(
	ogrno int,
    ograd varchar(50),
    ogrsoyad varchar(50),
    cinsiyet char(1),
    sinif char(5)
);
alter table ogrenci 
 add sinif char(5);

INSERT INTO ogrenci VALUES (1,'ahmet','cansever','e','10a');
INSERT INTO ogrenci VALUES (2,'niyazi','sevinc','e','11b');
INSERT INTO ogrenci VALUES (3,'ismail ','sevinc','e','10b');
INSERT INTO ogrenci VALUES (4,'kenan','emin','e','9a');
INSERT INTO ogrenci VALUES (5,'sema','bakir','k','9b');
INSERT INTO ogrenci VALUES (6,'beyda','kara','k','9c');
INSERT INTO ogrenci VALUES (7,'betül','coskun','k','11a');
INSERT INTO ogrenci VALUES (8,'sema','rüzgar','k','9c');
INSERT INTO ogrenci VALUES (9,'fadime','dönmez','k','9a');
INSERT INTO ogrenci VALUES (10,'riza','koc','e','10b');
INSERT INTO ogrenci VALUES (11,'beyza','kabak','k','10b');
INSERT INTO ogrenci VALUES (12,'deniz','akcakaya','e','11a');
INSERT INTO ogrenci VALUES (13,'kemal','karapinar','e','11a');
INSERT INTO ogrenci VALUES (14,'derya','yilbur','k','10c');
INSERT INTO ogrenci VALUES (15,'filiz','akat','k','10a');
INSERT INTO ogrenci VALUES (16,'niyazi','dönmez','e','11a');
INSERT INTO ogrenci VALUES (17,'sema','sekmen','k','10b');
create table kitaplar(
kitapno int primary key,
yazarno int,
turno int,
sayfasayisi int
);
INSERT INTO kitaplar VALUES (1,26,3,368);
INSERT INTO kitaplar VALUES (2,6,1,220);
INSERT INTO kitaplar VALUES (3,18,6,311);
INSERT INTO kitaplar VALUES (4,22,4,135);
INSERT INTO kitaplar VALUES (5,10,3,179);
INSERT INTO kitaplar VALUES (6,25,1,242);
INSERT INTO kitaplar VALUES (7,22,3,346);
INSERT INTO kitaplar VALUES (8,28,6,389);
INSERT INTO kitaplar VALUES (9,6,4,259);
INSERT INTO kitaplar VALUES (10,27,2,391);
INSERT INTO kitaplar VALUES (11,19,6,89);
INSERT INTO kitaplar VALUES (12,6,4,265);
INSERT INTO kitaplar VALUES (13,20,6,160);
INSERT INTO kitaplar VALUES (14,27,5,383);
INSERT INTO kitaplar VALUES (15,5,6,188);
select * from kitaplar;
create table islemler(
turno int primary key,
turadi varchar(50)
);
INSERT INTO islemler VALUES (1,'Dram');
INSERT INTO islemler VALUES (2,'Komedi');
INSERT INTO islemler VALUES (3,'Roman');
INSERT INTO islemler VALUES (4,'Hikaye');
INSERT INTO islemler VALUES (5,'Arastirma');
INSERT INTO islemler VALUES (6,'Fikra');
INSERT INTO islemler VALUES (7,'Deneme');
select * from islemler;

-- Örnek 1: Hangi isimden kaç tane olduğunu bulun.
select ograd, count(ograd)isim_sayisi from ogrenci;
-- Örnek 2: Sınıflardaki öğrenci sayısını bulun.
select sinif, count(ogrno) from ogrenci group by sinif;
-- Örnek 3: Her sınıftaki erkek ve kız öğrenci sayısını bulun.(cinsiyet ve sinifa göre grupla)
select count(ogrno), sinif, cinsiyet from ogrenci group by cinsiyet, sinif having cinsiyet='e'
union
select count(ogrno),sinif, cinsiyet from ogrenci group by cinsiyet,sinif having cinsiyet='k';
-- Örnek 4: Her türden kaç tane kitap olduğunu listeleyiniz.
select turno, count(kitapno)kitap_sayisi,(select turadi from islemler where islemler.turno=kitaplar.turno)turu from kitaplar group by turno order by turno;
-- Örnek 5: Her türdeki en fazla sayfa sayısı olan kitapları listeleyiniz.
select turno, max(sayfasayisi)maksimum_sayfa_sayisi, kitapno from kitaplar group by turno order by turno;
-- Örnek 6: Her türdeki en az sayfa sayısı olan kitapları listeleyiniz.
select turno, min(sayfasayisi)maksimum_sayfa_sayisi, kitapno from kitaplar group by turno order by turno;
-- Örnek 7***: Her türden kaç tane kitap olduğunu listeleyiniz.(Tür isimleri de olsun) (edited) 
select (select turadi from islemler where islemler.turno=kitaplar.turno)tur_adi, count(kitapno)kitap_sayisi from kitaplar group by turno;
