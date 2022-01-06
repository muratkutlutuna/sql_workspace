CREATE TABLE Hastaneler
(
    id char (4) primary key,
    isim varchar(30),
    sehir varchar(30),
    ozel char
);
INSERT INTO Hastaneler VALUES ('H101', 'ACI MADEM HASTANESI', 'ISTANBUL', 'Y');
INSERT INTO Hastaneler VALUES ('H102', 'HASZEKI HASTANESI', 'ISTANBUL', 'N');
INSERT INTO Hastaneler VALUES ('H103', 'MEDIKOL HASTANESI', 'IZMIR', 'Y');
INSERT INTO Hastaneler VALUES ('H104', 'NEMORYIL HASTANESI', 'ANKARA', 'Y');
CREATE TABLE Hastalar 
(
    kimlik_no char(11) primary key,
    isim varchar(30), 
    teshis varchar(50)
);
INSERT INTO Hastalar VALUES ('12345678901', 'Ali Can', 'Gizli Seker');
INSERT INTO Hastalar VALUES ('45678901121', 'Ayse Yilmaz', 'Hipertansyon');
INSERT INTO Hastalar VALUES ('78901123451','Steve Job','Pankreatit');
INSERT INTO Hastalar VALUES ('12344321251','Tom Hanks','COVID19');
CREATE TABLE Bolumler_tablosu 
(
    bolum_id CHAR(5) primary key,
    bolum_adi VARCHAR(50)
);
INSERT INTO bolumler_tablosu VALUES ('DHL','Dahiliye');
INSERT INTO bolumler_tablosu VALUES ('KBB','Kulak-Burun-Bogaz');
INSERT INTO bolumler_tablosu VALUES ('NRJ','Noroloji');
INSERT INTO bolumler_tablosu VALUES ('GAST','Gastroloji');
INSERT INTO bolumler_tablosu VALUES ('KARD','Kardioloji');
INSERT INTO bolumler_tablosu VALUES ('PSK','Psikiyatri');
INSERT INTO bolumler_tablosu VALUES ('GOZ','Goz Hastaliklari');
CREATE TABLE Hasta_kayitlar
(
kimlik_no char(11) primary key,
hasta_isim varchar(30),
hastane_adi varchar(50),
bolum_adi varchar(50),
teshis varchar(50)
);
INSERT INTO hasta_kayitlar VALUES ('1111','NONAME','NULL','NULL','NULL');
INSERT INTO hasta_kayitlar VALUES ('2222','NONAME','NULL','NULL','NULL');
INSERT INTO hasta_kayitlar VALUES ('3333','NONAME','NULL','NULL','NULL');
/*
4-) hasta_kayıtlar tablosundaki ‘3333’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : ‘Salvadore Dali’ ismi ile
hastane_adi: ‘John Hopins’
bolum_adi: ‘Noroloji’
teshis: ‘Parkinson’
kimlik_no: ‘99991111222’*/
update hasta_kayitlar
set hasta_isim='Salvador Dali', hastane_adi='John Hopins', bolum_adi='Noroloji', teshis='Parkinson', kimlik_no='99991111222'
where kimlik_no='3333';
select * from hasta_kayitlar;
/*5-) hasta_kayıtlar tablosundaki ‘1111’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : hastalar tablosundaki ‘Ali Can’ ismi ile
hastane_adi: hastaneler tablosundaki 'H104' bolum_id kodlu hastanenin ismi ile
bolum_adi: bolumler tablosundaki 'DHL' bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki 'Ali Can' isimli hastanın teshis bilgisi ile
kimlik_no: hastalar tablosundaki 'Ali Can' isimli hastanın kimlik_no kodu ile*/
update hasta_kayitlar
set hasta_isim=(select isim from hastalar where hasta_isim='Ali Can'), 
hastane_adi=(select isim from hastaneler where id='h104'), 
bolum_adi=(select bolum_adi from bolumler_tablosu where bolum_id='dhl'), 
teshis=(select teshis from hastalar where isim='Ali Can'), 
kimlik_no=(select kimlik_no from hastalar where isim='Ali Can')
where kimlik_no='1111';
/*6-) hasta_kayıtlar tablosundaki ‘2222’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : hastalar tablosundaki ‘Ayşe Yılmaz’ ismi ile
hastane_adi: hastaneler tablosundaki 'H103' bolum_id kodlu hastanenin ismi ile
bolum_adi: bolumler tablosundaki ‘KBB’ bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki ‘Tom Hanks' isimli hastanın teshis bilgisi ile
kimlik_no: hastalar tablosundaki 'Stevev Job' isimli hastanın kimlik_no kodu ile
Güncellemeden Sonra hasta_kayıtlar tablosu aşağıdaki gibi görünmelidir.
NOT: TABLONUN ŞEKİL VE STILLERİNİN BİR ÖNEMİ YOKTUR.ÖNEMLİ OLAN İÇERİSİNDEKİ
VERİLERİN DOĞRULUĞUDUR.*/
update hasta_kayitlar
set hasta_isim=(select isim from hastalar where hasta_isim='Ayse Yilmaz'), 
hastane_adi=(select isim from hastaneler where id='h103'), 
bolum_adi=(select bolum_adi from bolumler_tablosu where bolum_id='kbb'), 
teshis=(select teshis from hastalar where isim='Tom Hanks'), 
kimlik_no=(select kimlik_no from hastalar where isim='Steve Job')
where kimlik_no='2222';

