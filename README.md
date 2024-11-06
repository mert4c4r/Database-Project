# Tarım Kooperatifleri Yönetim Sistemi

## Proje Üyeleri


- *225260050* - Ömer Faruk Mutlu
- *225260066* - Yasin Mert Acar



## Proje Gereksinimleri

Bu proje, kooperatiflerin üyeleri, tedarikçileri, ürünleri ve sipariş süreçlerini yönetmek amacıyla geliştirilmiş bir veritabanı modelini içermektedir. Sistem, kooperatiflerin mali verilerini, ürün fiyatlandırmalarını, üyelerin verdikleri siparişleri, tedarikçi ilişkilerini ve diğer birçok işlevi takip etmeye yönelik olarak tasarlanmıştır.

## Veritabanı Yapısı

Aşağıda, sistemin kullandığı ana tablolar, kolonlar ve tablolar arasındaki ilişkiler açıklanmıştır:

### 1. Kooperatif

- **Amaç:** Kooperatifler hakkında temel bilgileri saklamak. Bu tablo, her kooperatifin kimliğini, adını ve genel özelliklerini içerir.
- **Kolonlar:**
  - `KooperatifID (PK)`: Kooperatifin benzersiz tanımlayıcısı.
  - `Ad`: Kooperatifin adı.
  - `KuruluşYılı`: Kooperatifin kurulduğu yıl.
  - `Lokasyon`: Kooperatifin bulunduğu yer.
  - `ÜyeSayısı`: Kooperatifteki toplam üye sayısı.

### 2. Üye

- **Amaç:** Kooperatif üyelerinin kişisel bilgilerini tutmak. Bu tablo, üyelerin iletişim bilgileri ve hangi kooperatife ait olduklarını gösterir.
- **Kolonlar:**
  - `UyeID (PK)`: Üyenin benzersiz tanımlayıcısı.
  - `Ad`: Üyenin adı.
  - `Soyad`: Üyenin soyadı.
  - `Telefon`: Üyenin iletişim numarası.
  - `Email`: Üyenin e-posta adresi.
  - `KooperatifID (FK)`: Üyenin bağlı olduğu kooperatifin ID’si.

### 3. Kooperatif_Ürün

- **Amaç:** Kooperatiflerin sunduğu ürünlerin detaylarını saklamak. Bu tablo, her ürünün adını, açıklamasını ve kooperatifin ürün fiyatını içerir.
- **Kolonlar:**
  - `KooperatifUrunID (PK)`: Kooperatif-ürün ilişkisini tanımlayan benzersiz tanımlayıcı.
  - `KooperatifID (FK)`: Ürünün ait olduğu kooperatifin ID’si.
  - `Ad`: Ürün adı.
  - `Kategori`: Ürünün kategorisi (örn. sebze, meyve, tahıl).
  - `Açıklama`: Ürün hakkında kısa bir açıklama.
  - `Fiyat`: Ürünün kooperatif tarafından belirlenen satış fiyatı.
  - `StokMiktarı`: Kooperatifte mevcut olan ürün miktarı.
  - `UrunFiyatID (FK)`: Ürün fiyatlandırma kaydına referans.

### 4. Tedarikçi

- **Amaç:** Kooperatiflerin çalıştığı tedarikçilerin bilgilerini tutmak. Bu tablo, tedarikçilerin iletişim bilgilerini ve hangi kooperatiflere hizmet verdiklerini gösterir.
- **Kolonlar:**
  - `TedarikciID (PK)`: Tedarikçinin benzersiz tanımlayıcısı.
  - `Ad`: Tedarikçi adı.
  - `İletişim`: Tedarikçinin iletişim bilgileri (telefon, e-posta).
  - `Adres`: Tedarikçinin fiziksel adresi.
  - `KooperatifID (FK)`: Tedarikçinin hizmet verdiği kooperatifin ID’si.

### 5. Tedarikçi_Ürün

- **Amaç:** Tedarikçilerin sağladığı ürünlerin bilgilerini saklamak. Bu tablo, hangi ürünlerin tedarik edildiğini ve tedarik fiyatlarını içerir.
- **Kolonlar:**
  - `TedarikciUrunID (PK)`: Tedarikçi-ürün ilişkisini tanımlayan benzersiz tanımlayıcı.
  - `TedarikciID (FK)`: İlgili tedarikçinin ID’si.
  - `Ad`: Tedarik edilen ürünün adı.
  - `Kategori`: Ürünün kategorisi (örn. sebze, meyve, tahıl).
  - `Açıklama`: Ürün hakkında kısa bir açıklama.
  - `TedarikFiyati`: Tedarikçinin ürün için belirlediği fiyat.
  - `Miktar`: Tedarikçiden sağlanan ürünün miktarı.
  - `UrunFiyatID (FK)`: Ürün fiyatlandırma kaydına referans.

### 6. Kooperatif_Sipariş

- **Amaç:** Üyelerin kooperatiften verdikleri siparişlerin bilgilerini saklamak. Bu tablo, sipariş tarihi ve toplam tutar gibi bilgileri içerir.
- **Kolonlar:**
  - `SiparisID (PK)`: Siparişin benzersiz tanımlayıcısı.
  - `UyeID (FK)`: Siparişi veren üyenin ID’si.
  - `SiparisTarihi`: Siparişin verildiği tarih.
  - `ToplamTutar`: Siparişin toplam maliyeti.

### 7. Kooperatif_Sipariş_Detayı

- **Amaç:** Her siparişin içerdiği ürünlerin detaylarını tutmak. Bu tablo, siparişteki her ürün için adedini ve fiyatını içerir.
- **Kolonlar:**
  - `SiparisDetayID (PK)`: Sipariş detayının benzersiz tanımlayıcısı.
  - `SiparisID (FK)`: İlgili siparişin ID’si.
  - `KooperatifUrunID (FK)`: Siparişte yer alan kooperatif ürününün ID’si.
  - `Adet`: Siparişteki ürün adedini belirtir.
  - `Fiyat`: Sipariş edilen ürünün fiyatını gösterir.

### 8. Tedarikçi_Sipariş

- **Amaç:** Kooperatifin tedarikçilerden yaptığı siparişlerin bilgilerini saklamak. Bu tablo, tedarikçi siparişlerinin toplam tutarını ve tarihini içerir.
- **Kolonlar:**
  - `TedarikciSiparisID (PK)`: Tedarikçi siparişinin benzersiz tanımlayıcısı.
  - `TedarikciID (FK)`: İlgili tedarikçinin ID’si.
  - `SiparisTarihi`: Tedarikçiye verilen sipariş tarihini belirtir.
  - `ToplamTutar`: Siparişin toplam maliyetini gösterir.

### 9. Tedarikçi_Sipariş_Detayı

- **Amaç:** Tedarikçi siparişlerinin içerdiği ürünlerin detaylarını tutmak. Bu tablo, tedarikçi siparişlerindeki ürünlerin adedini ve fiyatını içerir.
- **Kolonlar:**
  - `TedarikciSiparisDetayID (PK)`: Tedarikçi sipariş detayının benzersiz tanımlayıcısı.
  - `TedarikciSiparisID (FK)`: İlgili tedarikçi siparişinin ID’si.
  - `TedarikciUrunID (FK)`: Siparişteki ürünün ID’si.
  - `Adet`: Siparişteki ürün adedini belirtir.
  - `Fiyat`: Sipariş edilen ürünün fiyatını gösterir.

### 10. Finansal_Veriler

- **Amaç:** Kooperatiflerin mali durumlarını takip etmek. Bu tablo, kooperatifin gelir ve gider bilgilerini içerir.
- **Kolonlar:**
  - `KayitID (PK)`: Finansal kaydın benzersiz tanımlayıcısı.
  - `KooperatifID (FK)`: Kooperatifin ID’si.
  - `Gelir`: Belirli bir dönemde elde edilen gelir tutarı.
  - `Gider`: Belirli bir dönemde yapılan gider tutarı.
  - `Tarih`: Kayıt tarih aralığı (örn. 2023 Q1).

### 11. Yardım

- **Amaç:** Kooperatif üyelerine sağlanan yardımları takip etmek. Bu tablo, yardım türü ve miktarını içerir.
- **Kolonlar:**
  - `YardimID (PK)`: Yardım kaydının benzersiz tanımlayıcısı.
  - `UyeID (FK)`: Yardım alan üyenin ID’si.
  - `YardimTarihi`: Yardımın sağlandığı tarihi belirtir.
  - `YardimTuru`: Sağlanan yardımın türünü (örn. malzeme, nakit).
  - `Miktar`: Sağlanan yardımın miktarını belirtir.

### 12. Etkinlik

- **Amaç:** Kooperatiflerin düzenlediği etkinliklerin bilgilerini saklamak. Bu tablo, etkinliklerin tarihini ve yerini içerir.
- **Kolonlar:**
  - `EtkinlikID (PK)`: Etkinliğin benzersiz tanımlayıcısı.
  - `Ad`: Etkinliğin adı.
  - `Tarih`: Etkinliğin gerçekleştirileceği tarih.
  - `Yer`: Etkinliğin yapılacağı yer.
  - `KooperatifID (FK)`: Etkinliğin düzenlendiği kooperatifin ID’si.

### 13. Ürün_Fiyatlandırma

- **Amaç:** Kooperatif ürünlerinin fiyatlandırma bilgilerini saklamak. Bu tablo, ürünlerin maksimum ve minimum alış ve satış fiyatlarını içerir.
- **Kolonlar:**
  - `UrunFiyatID (PK)`: Ürün fiyatlandırmasının benzersiz tanımlayıcısı.
  - `KooperatifUrunID (FK)`: Fiyatlandırılan kooperatif ürününün ID’si.
  - `MaxAlisFiyati`: Ürünün maksimum alış fiyatı.
  - `MinAlisFiyati`: Ürünün minimum alış fiyatı.
  - `MaxSatisFiyati`: Ürünün maksimum satış fiyatı.
  - `MinSatisFiyati`: Ürünün minimum satış fiyatı.
  - `GeçerlilikTarihi`: Fiyatlandırmanın geçerli olduğu tarih.

### 14. Nakil

- **Amaç:** Ürün nakil işlemlerini takip etmek. Bu tablo, hangi ürünlerin ne zaman ve hangi kooperatif veya tedarikçi arasında nakledildiğini içerir.
- **Kolonlar:**
  - `NakilID (PK)`: Nakil kaydının benzersiz tanımlayıcısı.
  - `KooperatifID (FK)`: Nakil işleminin yapıldığı kooperatifin ID’si.
  - `TedarikciID (FK)`: Nakil yapılan tedarikçinin ID’si.
  - `Miktar`: Nakil edilen ürün miktarı.
  - `Tarih`: Nakil işleminin gerçekleştiği tarih.

## İlişkiler

### Kooperatif - Üye
- **İlişki Türü:** 1 Kooperatif ⇔ N Üye
- **Açıklama:** Bir kooperatif birden fazla üye barındırabilir, ancak her üye yalnızca bir kooperatifle ilişkilidir.

### Kooperatif - Kooperatif_Ürün
- **İlişki Türü:** 1 Kooperatif ⇔ N Kooperatif_Ürün
- **Açıklama:** Bir kooperatif birçok ürün sunabilir.

### Kooperatif - Tedarikçi
- **İlişki Türü:** 1 Kooperatif ⇔ N Tedarikçi
- **Açıklama:** Bir kooperatif, birden fazla tedarikçiden ürün alabilir.

### Kooperatif_Ürün - Ürün_Fiyatlandırma
- **İlişki Türü:** 1 Kooperatif_Ürün ⇔ 1 Ürün_Fiyatlandırma
- **Açıklama:** Her kooperatif ürününün belirli bir fiyatlandırma kaydı vardır.

### Tedarikçi - Tedarikçi_Ürün
- **İlişki Türü:** 1 Tedarikçi ⇔ N Tedarikçi_Ürün
- **Açıklama:** Her tedarikçi birden fazla ürünü tedarik edebilir.

### Tedarikçi_Ürün - Ürün_Fiyatlandırma
- **İlişki Türü:** 1 Tedarikçi_Ürün ⇔ 1 Ürün_Fiyatlandırma
- **Açıklama:** Tedarikçi ürünlerinin de belirli bir fiyatlandırma kaydı vardır.

### Üye - Kooperatif_Sipariş
- **İlişki Türü:** 1 Üye ⇔ N Kooperatif_Sipariş
- **Açıklama:** Her üye birden fazla sipariş verebilir.

### Kooperatif_Sipariş - Kooperatif_Sipariş_Detayı
- **İlişki Türü:** 1 Kooperatif_Sipariş ⇔ N Kooperatif_Sipariş_Detayı
- **Açıklama:** Bir sipariş birden fazla ürün içerebilir.

### Tedarikçi_Sipariş - Tedarikçi_Sipariş_Detayı
- **İlişki Türü:** 1 Tedarikçi_Sipariş ⇔ N Tedarikçi_Sipariş_Detayı
- **Açıklama:** Bir tedarikçi siparişi birden fazla ürün içerebilir.

### Kooperatif - Finansal_Veriler
- **İlişki Türü:** 1 Kooperatif ⇔ N Finansal_Veriler
- **Açıklama:** Her kooperatif birden fazla finansal kayıt tutar.

### Üye - Yardım
- **İlişki Türü:** 1 Üye ⇔ N Yardım
- **Açıklama:** Her üye birden fazla yardım alabilir.

### Kooperatif - Etkinlik
- **İlişki Türü:** 1 Kooperatif ⇔ N Etkinlik
- **Açıklama:** Her kooperatif birden fazla etkinlik düzenleyebilir.

### Kooperatif - Nakil
- **İlişki Türü:** 1 Kooperatif ⇔ N Nakil
- **Açıklama:** Bir kooperatif birden fazla nakil işlemi gerçekleştirebilir.

### Tedarikçi - Nakil
- **İlişki Türü:** 1 Tedarikçi ⇔ N Nakil
- **Açıklama:** Her tedarikçi birden fazla nakil işlemi yapabilir.

### Tedarikçi - Tedarikçi_Sipariş
- **İlişki Türü:** 1 Tedarikçi ⇔ N Tedarikçi_Sipariş
- **Açıklama:** Bir tedarikçi birden fazla sipariş alabilir.
