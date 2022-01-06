-- ======= SELECT-WHERE =======
CREATE TABLE OGRENCILER(
ID INT,
ISIM VARCHAR(45),
ADRES VARCHAR(100),
SINAV_NOTU INT
);

    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);
    
/*   ============================================================================
   Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanılabilir.
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adı WHERE koşul;
==============================================================================*/
/*-----------------------------------------------------------------------------
  ORNEK1: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
SELECT * FROM OGRENCILER WHERE SINAV_NOTU>80;
-- ORNEK2: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
select ISIM , ADRES from OGRENCILER WHERE ADRES = 'ANKARA';
-- ORNEK3: id’si 124 olan öğrencilerin tüm bilgilerini listele
SELECT * FROM OGRENCILER WHERE ID=124;

select * FROM OGRENCILER WHERE ID BETWEEN 123 AND 124;
/*======================= SELECT - BETWEEN ==================================*/ 
    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR(50),
        maas int
    );
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayşe Can', 4000);
    select * from personel where id between '10001' and '10003' and maas > '7000';
	select * from personel where id between '10001' and '10005';
	select * from personel where id>='10001' and id<='10005';
    /* -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
 select * from personel where isim between 'Mehmet Yilmaz' and 'Veli';
 select * from personel;
 /* ======================= SELECT - IN ======================================
    IN birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları 
    tek komutla yazabilme imkânı verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adı
    WHERE sutun_adı IN (deger1, deger2, ...);
/* ========================================================================== */
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/ 
 select id, isim from personel where id in (10003,10005,10004);
 /* -----------------------------------------------------------------------------
  ORNEK8: Maaşı sadece 7000  veya 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/
select * from personel where maas in(7000,12000);
-- select * from personel where maas in(7000,'meryem); yanlistir
select * from personel where maas=7000 or isim='meryem';
/* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak sağlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adı WHERE sütunN LIKE pattern
    
    PATTERN İÇİN
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir. 
    _    ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */
-- ornek9:ismi A harfi ile baslayanlari listeleyiniz
select * from personel where isim like 'ay%';
/* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim like '%n';
 select * from personel where isim like '_e%';
 select * from personel where isim like '%a__';
 select * from personel where isim like '_e%y%'; -- harfi e olup diger harflerinde y olanlari listeleyin
 select * from personel where isim not like '%a%'; -- isminde a harfi olmayanlar
select * from personel where maas like '_____'; -- maasi 5 haneli olanlari listeleyiniz
select * from personel where maas not like '%00'; -- maaşının son 2 hanesi 00 olmayanları listeleyiniz
select * from personel where maas not like '4000'; -- maaşının 4000 olmayanları listeleyiniz
select * from personel where isim like 'a_____a'; -- 1. harfi A ve 7.harfi A olan personeli listeleyiniz.
select * from personel where isim like 'a_____a%';
/*====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.  
     -- 'c' => case-sentisitive demektir 
     -- 'i' => incase-sentisitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */
    
    CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hoooooot', 4);
    
    
    DROP TABLE kelimeler;
   
    
    
    
/* -----------------------------------------------------------------------------
  ORNEK22: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat
  ederek listeleyiniz 
 -----------------------------------------------------------------------------*/ 
    -- VEYA işlemi için | karakteri kullanılır.
    select * from kelimeler where REGEXP_LIKE(KELIME, 'at|ot','c');
   
/* -----------------------------------------------------------------------------
  ORNEK23: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
        select * from kelimeler where REGEXP_LIKE(KELIME, 'at|ot'); 
      
   
 /* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Başlangıcı göstermek için ^ karakteri kullanılır.
select * from kelimeler where REGEXP_LIKE(KELIME, '^hi|^ho'); 

    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz. (i yazmaya gerek yok)
 -----------------------------------------------------------------------------*/   
     --  Bitişi göstermek için $ karakteri kullanılır.
     select * from kelimeler where REGEXP_LIKE(KELIME, 't$|m$'); 

    
/* -----------------------------------------------------------------------------
  ORNEK26: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli 
  olanlari) listeleyeniz
 -----------------------------------------------------------------------------*/ 
SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9]t','c');
SELECT * FROM kelimeler WHERE kelime LIKE 'h_t';  --  buyuk kucuk harf olayini bu yontem ile yapamam   
SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9]t','c');
SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'h[a-zA-Z0-9]{2}t','c');

/* -----------------------------------------------------------------------------
  ORNEK27: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalım.
 -----------------------------------------------------------------------------*/ 
   SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'h[ai]t');
SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'H[AI]T');


/* -----------------------------------------------------------------------------
  ORNEK28: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/     
      SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, '[mie]');

 
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, '^[as]');
SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, '^a|^s');

/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 

    SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'o{2,}');-- bu olmaz yan yana olmayan o lari da getirir
    SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, '[o]{2,}'); -- bu olmaz yan yana olmayan o lari da getirir
	SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'o{2}');
    SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'oo+');
    SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'oo');
    SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'oo{1}');
    SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'oo{1,}');
 select * from kelimeler where REGEXP_LIKE(kelime,'[o][o]');
 select * from kelimeler where REGEXP_LIKE(kelime,'o[o]');

 

 
 
 
 
 

    
    
    
    
    
    

