/*=======================================
		TABLO OLUSTURMA(CRUD-create)
=======================================*/
-- TEK SATIRLIK YORUM
use sys;
CREATE TABLE student 
(   
    id VARCHAR(4)  ,
    name VARCHAR(20),
    age int
);
/* ========================================================= 
                     VERİ GİRİSİ 
===========================================================*/
INSERT INTO student VALUES( null,'MEHMET ALİ', 25);
INSERT INTO student VALUES('1002', 'AYSE YILMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN STAR', 56);
INSERT INTO student VALUES('1004', 'MARY BROWN', 17);
/* ========================================================= 
				PARCALI VERİ GİRİSİ 
===========================================================*/
INSERT INTO STUDENT(name,age)VALUES('Samet ay','29');
/* ========================================================= 
				TABLODAN VERI SORGULAMA
===========================================================*/
select*from student;
/* ========================================================= 
					TABLO SILME
===========================================================*/
drop table urunler;