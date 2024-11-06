# Tarım Kooperatifleri Yönetim Sistemi

*Proje Ekibindeki Kişiler:*


- *225260050* - Ömer Faruk Mutlu
- *225260066* - Yasin Mert Acar
- *225260012* - Yusuf Vural



## Proje Gereksinimleri

Bu proje, kooperatiflerin üyeleri, tedarikçileri, ürünleri ve sipariş süreçlerini yönetmek amacıyla geliştirilmiş bir veritabanı modelini içermektedir. Sistem, kooperatiflerin mali verilerini, ürün fiyatlandırmalarını, üyelerin verdikleri siparişleri, tedarikçi ilişkilerini ve diğer birçok işlevi takip etmeye yönelik olarak tasarlanmıştır.

## Veritabanı Yapısı

Aşağıda, sistemin kullandığı ana tablolar, kolonlar ve tablolar arasındaki ilişkiler açıklanmıştır:

### 1. Kooperatif

- **Amaç:** Kooperatifler hakkında temel bilgileri saklamak. Bu tablo, her kooperatifin kimliğini, adını ve genel özelliklerini içerir.
- **Kolonlar:**
  - `Kooperatif_ID (PK)`: Kooperatifin benzersiz tanımlayıcısı.
  - `Kooperatif_Ad`: Kooperatifin adı.
  - `Kooperatif_Kuruluş_Yılı`: Kooperatifin kurulduğu yıl.
  - `Kooperatif_Lokasyon`: Kooperatifin bulunduğu yer.
  - `Kooperatif_Üye_Sayısı`: Kooperatifteki toplam üye sayısı.

### 2. Üye

- **Amaç:** Kooperatif üyelerinin kişisel bilgilerini tutmak. Bu tablo, üyelerin iletişim bilgileri ve hangi kooperatife ait olduklarını gösterir.
- **Kolonlar:**
  - `Üye_ID (PK)`: Üyenin benzersiz tanımlayıcısı.
  - `Üye_Ad`: Üyenin adı.
  - `Üye_Soyad`: Üyenin soyadı.
  - `Üye_Telefon_Numarası`: Üyenin iletişim numarası.
  - `Üye_Email`: Üyenin e-posta adresi.
  - `Kooperatif_ID (FK)`: Üyenin bağlı olduğu kooperatifin ID’si.

### 3. Kooperatif_Ürün

- **Amaç:** Kooperatiflerin sunduğu ürünlerin detaylarını saklamak. Bu tablo, her ürünün adını, açıklamasını ve kooperatifin ürün fiyatını içerir.
- **Kolonlar:**
  - `K_Ürun_ID (PK)`: Kooperatif-ürün ilişkisini tanımlayan benzersiz tanımlayıcı.
  - `Kooperatif_ID (FK)`: Ürünün ait olduğu kooperatifin ID’si.
  - `K_Ürün_Ad`: Ürün adı.
  - `K_Ürün_Kategori`: Ürünün kategorisi (örn. sebze, meyve, tahıl).
  - `K_Ürün_Açıklama`: Ürün hakkında kısa bir açıklama.
  - `K_Ürün_Fiyat`: Ürünün kooperatif tarafından belirlenen satış fiyatı.
  - `K_Ürün_Stok_Miktarı`: Kooperatifte mevcut olan ürün miktarı.
  - `Ürun_Fiyat_ID (FK)`: Ürün fiyatlandırma kaydına referans.

### 4. Tedarikçi

- **Amaç:** Kooperatiflerin çalıştığı tedarikçilerin bilgilerini tutmak. Bu tablo, tedarikçilerin iletişim bilgilerini ve hangi kooperatiflere hizmet verdiklerini gösterir.
- **Kolonlar:**
  - `Tedarikci_ID (PK)`: Tedarikçinin benzersiz tanımlayıcısı.
  - `Tedarikçi_Ad`: Tedarikçi adı.
  - `Tedarikçi_İletişim`: Tedarikçinin iletişim bilgileri (telefon, e-posta).
  - `Tedarikçi_Adres`: Tedarikçinin fiziksel adresi.
  - `Kooperatif_ID (FK)`: Tedarikçinin hizmet verdiği kooperatifin ID’si.

### 5. Tedarikçi_Ürün

- **Amaç:** Tedarikçilerin sağladığı ürünlerin bilgilerini saklamak. Bu tablo, hangi ürünlerin tedarik edildiğini ve tedarik fiyatlarını içerir.
- **Kolonlar:**
  - `T_Ürun_ID (PK)`: Tedarikçi-ürün ilişkisini tanımlayan benzersiz tanımlayıcı.
  - `Tedarikci_ID (FK)`: İlgili tedarikçinin ID’si.
  - `T_Ürun_Ad`: Tedarik edilen ürünün adı.
  - `T_Ürun_Kategori`: Ürünün kategorisi (örn. sebze, meyve, tahıl).
  - `T_Ürun_Açıklama`: Ürün hakkında kısa bir açıklama.
  - `T_Ürun_Fiyat`: Tedarikçinin ürün için belirlediği fiyat.
  - `T_Ürun_Miktar`: Tedarikçiden sağlanan ürünün miktarı.
  - `Ürün_Fiyat_ID (FK)`: Ürün fiyatlandırma kaydına referans.

### 6. Kooperatif_Sipariş

- **Amaç:** Üyelerin kooperatiften verdikleri siparişlerin bilgilerini saklamak. Bu tablo, sipariş tarihi ve toplam tutar gibi bilgileri içerir.
- **Kolonlar:**
  - `K_Siparis_ID (PK)`: Siparişin benzersiz tanımlayıcısı.
  - `Üye_ID (FK)`: Siparişi veren üyenin ID’si.
  - `K_Siparis_Tarihi`: Siparişin verildiği tarih.
  - `K_Toplam_Tutar`: Siparişin toplam maliyeti.

### 7. Kooperatif_Sipariş_Detayı

- **Amaç:** Her siparişin içerdiği ürünlerin detaylarını tutmak. Bu tablo, siparişteki her ürün için adedini ve fiyatını içerir.
- **Kolonlar:**
  - `K_Siparis_Detayı_ID (PK)`: Sipariş detayının benzersiz tanımlayıcısı.
  - `K_Siparis_ID (FK)`: İlgili siparişin ID’si.
  - `K_Urun_ID (FK)`: Siparişte yer alan kooperatif ürününün ID’si.
  - `K_Siparis_Detayı_Adet`: Siparişteki ürün adedini belirtir.
  - `K_Siparis_Detayı_Fiyat`: Sipariş edilen ürünün fiyatını gösterir.

### 8. Tedarikçi_Sipariş

- **Amaç:** Kooperatifin tedarikçilerden yaptığı siparişlerin bilgilerini saklamak. Bu tablo, tedarikçi siparişlerinin toplam tutarını ve tarihini içerir.
- **Kolonlar:**
  - `T_Siparis_ID (PK)`: Tedarikçi siparişinin benzersiz tanımlayıcısı.
  - `Tedarikci_ID (FK)`: İlgili tedarikçinin ID’si.
  - `T_Siparis_Tarihi`: Tedarikçiye verilen sipariş tarihini belirtir.
  - `T_Toplam_Tutar`: Siparişin toplam maliyetini gösterir.

### 9. Tedarikçi_Sipariş_Detayı

- **Amaç:** Tedarikçi siparişlerinin içerdiği ürünlerin detaylarını tutmak. Bu tablo, tedarikçi siparişlerindeki ürünlerin adedini ve fiyatını içerir.
- **Kolonlar:**
  - `T_Siparis_Detayı_ID (PK)`: Tedarikçi sipariş detayının benzersiz tanımlayıcısı.
  - `T_Siparis_ID (FK)`: İlgili tedarikçi siparişinin ID’si.
  - `T_ÜrünID (FK)`: Siparişteki ürünün ID’si.
  - `T_Siparis_Detayı_Adet`: Siparişteki ürün adedini belirtir.
  - `T_Siparis_Detayı_Fiyat`: Sipariş edilen ürünün fiyatını gösterir.

### 10. Finansal_Veriler

- **Amaç:** Kooperatiflerin mali durumlarını takip etmek. Bu tablo, kooperatifin gelir ve gider bilgilerini içerir.
- **Kolonlar:**
  - `Kayıt_ID (PK)`: Finansal kaydın benzersiz tanımlayıcısı.
  - `Kooperatif_ID (FK)`: Kooperatifin ID’si.
  - `Gelir`: Belirli bir dönemde elde edilen gelir tutarı.
  - `Gider`: Belirli bir dönemde yapılan gider tutarı.
  - `Finansal_Tarih`: Kayıt tarih aralığı (örn. 2023 Q1).

### 11. Yardım

- **Amaç:** Kooperatif üyelerine sağlanan yardımları takip etmek. Bu tablo, yardım türü ve miktarını içerir.
- **Kolonlar:**
  - `Yardim_ID (PK)`: Yardım kaydının benzersiz tanımlayıcısı.
  - `Uye_ID (FK)`: Yardım alan üyenin ID’si.
  - `Yardim_Tarihi`: Yardımın sağlandığı tarihi belirtir.
  - `Yardim_Türü`: Sağlanan yardımın türünü (örn. malzeme, nakit).
  - `Yardım_Miktarı`: Sağlanan yardımın miktarını belirtir.

### 12. Etkinlik

- **Amaç:** Kooperatiflerin düzenlediği etkinliklerin bilgilerini saklamak. Bu tablo, etkinliklerin tarihini ve yerini içerir.
- **Kolonlar:**
  - `Etkinlik_ID (PK)`: Etkinliğin benzersiz tanımlayıcısı.
  - `Etkinlik_Ad`: Etkinliğin adı.
  - `Etkinlik_Tarih`: Etkinliğin gerçekleştirileceği tarih.
  - `Etkinlik_Yer`: Etkinliğin yapılacağı yer.
  - `Kooperatif_ID (FK)`: Etkinliğin düzenlendiği kooperatifin ID’si.

### 13. Ürün_Fiyatlandırma

- **Amaç:** Kooperatif ürünlerinin fiyatlandırma bilgilerini saklamak. Bu tablo, ürünlerin maksimum ve minimum alış ve satış fiyatlarını içerir.
- **Kolonlar:**
  - `Ürün_Fiyat_ID (PK)`: Ürün fiyatlandırmasının benzersiz tanımlayıcısı.
  - `K_Ürün_ID (FK)`: Fiyatlandırılan kooperatif ürününün ID’si.
  - `T_Ürün_ID (FK)`: Fiyatlandırılan tedarikçi ürününün ID’si.
  - `Max_Alış`: Ürünün maksimum alış fiyatı.
  - `Min_Alış`: Ürünün minimum alış fiyatı.
  - `Max_Satış`: Ürünün maksimum satış fiyatı.
  - `Min_Satış`: Ürünün minimum satış fiyatı.
  - `Geçerlilik_Tarihi`: Fiyatlandırmanın geçerli olduğu tarih.

### 14. Nakliyat

- **Amaç:** Ürün nakil işlemlerini takip etmek. Bu tablo, hangi ürünlerin ne zaman ve hangi kooperatif veya tedarikçi arasında nakledildiğini içerir.
- **Kolonlar:**
  - `Nakliyat_ID (PK)`: Nakil kaydının benzersiz tanımlayıcısı.
  - `Kooperatif_ID (FK)`: Nakil işleminin yapıldığı kooperatifin ID’si.
  - `Tedarikci_ID (FK)`: Nakil yapılan tedarikçinin ID’si.
  - `N_Miktar`: Nakil edilen ürün miktarı.
  - `N_Tarih`: Nakil işleminin gerçekleştiği tarih.

## İlişkiler

### 1.) Kooperatif - Üye
- **İlişki Türü:** 1 Kooperatif ⇔ N Üye
- **Açıklama:** Bir kooperatif birden fazla üye barındırabilir, ancak her üye yalnızca bir kooperatifle ilişkilidir.

### 2.) Kooperatif - Kooperatif_Ürün
- **İlişki Türü:** 1 Kooperatif ⇔ N Kooperatif_Ürün
- **Açıklama:** Bir kooperatif birçok ürün sunabilir.

### 3.) Kooperatif - Tedarikçi
- **İlişki Türü:** 1 Kooperatif ⇔ N Tedarikçi
- **Açıklama:** Bir kooperatif, birden fazla tedarikçiden ürün alabilir.

### 4.) Kooperatif_Ürün - Ürün_Fiyatlandırma
- **İlişki Türü:** 1 Kooperatif_Ürün ⇔ 1 Ürün_Fiyatlandırma
- **Açıklama:** Her kooperatif ürününün belirli bir fiyatlandırma kaydı vardır.

### 5.) Tedarikçi - Tedarikçi_Ürün
- **İlişki Türü:** 1 Tedarikçi ⇔ N Tedarikçi_Ürün
- **Açıklama:** Her tedarikçi birden fazla ürünü tedarik edebilir.

### 6.) Tedarikçi_Ürün - Ürün_Fiyatlandırma
- **İlişki Türü:** 1 Tedarikçi_Ürün ⇔ 1 Ürün_Fiyatlandırma
- **Açıklama:** Tedarikçi ürünlerinin de belirli bir fiyatlandırma kaydı vardır.

### 7.) Üye - Kooperatif_Sipariş
- **İlişki Türü:** 1 Üye ⇔ N Kooperatif_Sipariş
- **Açıklama:** Her üye birden fazla sipariş verebilir.

### 8.) Kooperatif_Sipariş - Kooperatif_Sipariş_Detayı
- **İlişki Türü:** 1 Kooperatif_Sipariş ⇔ N Kooperatif_Sipariş_Detayı
- **Açıklama:** Bir sipariş birden fazla ürün içerebilir.

### 9.) Tedarikçi_Sipariş - Tedarikçi_Sipariş_Detayı
- **İlişki Türü:** 1 Tedarikçi_Sipariş ⇔ N Tedarikçi_Sipariş_Detayı
- **Açıklama:** Bir tedarikçi siparişi birden fazla ürün içerebilir.

### 10.) Kooperatif - Finansal_Veriler
- **İlişki Türü:** 1 Kooperatif ⇔ N Finansal_Veriler
- **Açıklama:** Her kooperatif birden fazla finansal kayıt tutar.

### 11.) Üye - Yardım
- **İlişki Türü:** 1 Üye ⇔ N Yardım
- **Açıklama:** Her üye birden fazla yardım alabilir.

### 12.) Kooperatif - Etkinlik
- **İlişki Türü:** 1 Kooperatif ⇔ N Etkinlik
- **Açıklama:** Her kooperatif birden fazla etkinlik düzenleyebilir.

### 13.) Kooperatif - Nakliyat
- **İlişki Türü:** 1 Kooperatif ⇔ N Nakil
- **Açıklama:** Bir kooperatif birden fazla nakil işlemi gerçekleştirebilir.

### 14.) Tedarikçi - Nakliyat
- **İlişki Türü:** 1 Tedarikçi ⇔ N Nakil
- **Açıklama:** Her tedarikçi birden fazla nakil işlemi yapabilir.

### 15.) Tedarikçi - Tedarikçi_Sipariş
- **İlişki Türü:** 1 Tedarikçi ⇔ N Tedarikçi_Sipariş
- **Açıklama:** Bir tedarikçi birden fazla sipariş alabilir.

## ER Diyagramı


![E-R Diyagramı](https://github.com/user-attachments/assets/9110178d-1a57-4f0c-a1bc-b78939d3f2c7)



