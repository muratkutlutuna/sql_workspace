--  concat---
CREATE TABLE customer (
    musteri_no INT,
    ad VARCHAR(22),
    soyad VARCHAR(25),
    sehir VARCHAR(45),
    cinsiyet VARCHAR(15),
    puan INT
);
INSERT INTO customer VALUES(111,'ebru', 'akar','denizli','kadin',78);
INSERT INTO customer VALUES(222,'ayse', 'kara','ankara','kadin',90);
INSERT INTO customer VALUES(333,'ali','gel','istanbul','erkek',66);
INSERT INTO customer VALUES(444, 'mehmet','okur','mus','erkek',98);
select concat('Adiniz Soyadiniz:', ad, ' ',soyad ) ad_soyad from customer;
select concat(musteri_no,'.)', ad, ' ', soyad) ad_soyad, sehir, cinsiyet, puan from customer;
-- ****************************************  length-left-right (String functions) ********************************************************
select ad ,length(ad),soyad,length(soyad) from customer;
select ad,left(ad,1),soyad,left(soyad,1)from customer;
select ad,soyad,concat(left(ad,1),'.',left(soyad,1),'.') as bas_harfler from customer;
-- soru:  5 ve 5 karakterden büyük olan isimleri MORRIS -> MRS şeklinde yazdırınız.
-- yani 1. , 3. ve 5. karakterleri alınız
select concat(left(ad,1),right(left(ad,3),1) , right(left(ad,5),1))from customer where length(ad)>4;