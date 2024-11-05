# Database-Project
# Kooperatif Yönetim Sistemi Veritabanı

Bu veritabanı yapısı, tarım kooperatiflerinin etkin yönetimi için gerekli tüm bilgileri sistematik bir şekilde saklamayı amaçlamaktadır. Veritabanı, kooperatifler, üyeler, ürünler, tedarikçiler ve finansal işlemler gibi birçok önemli bileşeni yönetir.

## Tablolar ve Amaçları

### 1. Kooperatif
**Amaç**: Kooperatifler hakkında temel bilgileri saklar.

| Alan Adı       | Tip        | Açıklama                                               |
| -------------- | ---------- | ------------------------------------------------------ |
| KooperatifID (PK) | INT       | Kooperatifin benzersiz tanımlayıcısı.                  |
| Ad             | VARCHAR    | Kooperatifin adı.                                      |
| KuruluşYılı    | YEAR       | Kooperatifin kurulduğu yıl.                            |
| Lokasyon       | VARCHAR    | Kooperatifin bulunduğu yer.                            |
| ÜyeSayısı      | INT        | Kooperatifteki toplam üye sayısı.                      |

### 2. Üye
**Amaç**: Kooperatif üyelerinin kişisel bilgilerini tutar.

| Alan Adı       | Tip        | Açıklama                                               |
| -------------- | ---------- | ------------------------------------------------------ |
| UyeID (PK)     | INT        | Üyenin benzersiz tanımlayıcısı.                        |
| Ad             | VARCHAR    | Üyenin adı.                                            |
| Soyad          | VARCHAR    | Üyenin soyadı.                                         |
| Telefon        | VARCHAR    | Üyenin telefon numarası.                               |
| Email          | VARCHAR    | Üyenin e-posta adresi.                                 |
| KooperatifID (FK) | INT     | Üyenin bağlı olduğu kooperatifin ID’si.                |

### 3. Kooperatif_Ürün
**Amaç**: Kooperatiflerin sunduğu ürünlerin detaylarını saklar.

| Alan Adı       | Tip        | Açıklama                                               |
| -------------- | ---------- | ------------------------------------------------------ |
| KooperatifUrunID (PK) | INT   | Kooperatif-ürün ilişkisini tanımlayan benzersiz ID.   |
| KooperatifID (FK) | INT     | Ürünün ait olduğu kooperatifin ID’si.                  |
| Ad             | VARCHAR    | Ürün adı.                                              |
| Kategori       | VARCHAR    | Ürünün kategorisi (örn. sebze, meyve, tahıl).          |
| Açıklama       | TEXT       | Ürün hakkında kısa açıklama.                           |
| Fiyat          | DECIMAL    | Ürünün satış fiyatı.                                   |
| StokMiktarı    | INT        | Mevcut stok miktarı.                                   |
| UrunFiyatID (FK) | INT      | Ürün fiyatlandırma kaydına referans.                   |

### 4. Tedarikçi
**Amaç**: Kooperatiflerin çalıştığı tedarikçilerin bilgilerini tutar.

| Alan Adı       | Tip        | Açıklama                                               |
| -------------- | ---------- | ------------------------------------------------------ |
| TedarikciID (PK) | INT      | Tedarikçinin benzersiz tanımlayıcısı.                  |
| Ad             | VARCHAR    | Tedarikçi adı.                                         |
| İletişim       | VARCHAR    | Tedarikçinin telefon ve e-posta bilgileri.             |
| Adres          | VARCHAR    | Tedarikçinin fiziksel adresi.                          |
| KooperatifID (FK) | INT     | Tedarikçinin hizmet verdiği kooperatifin ID’si.        |

### 5. Tedarikçi_Ürün
**Amaç**: Tedarikçilerin sağladığı ürünlerin bilgilerini saklar.

| Alan Adı       | Tip        | Açıklama                                               |
| -------------- | ---------- | ------------------------------------------------------ |
| TedarikciUrunID (PK) | INT  | Tedarikçi-ürün ilişkisini tanımlayan benzersiz ID.     |
| TedarikciID (FK) | INT      | İlgili tedarikçinin ID’si.                             |
| Ad             | VARCHAR    | Tedarik edilen ürünün adı.                             |
| Kategori       | VARCHAR    | Ürünün kategorisi (örn. sebze, meyve, tahıl).          |
| Açıklama       | TEXT       | Ürün hakkında kısa açıklama.                           |
| TedarikFiyati  | DECIMAL    | Tedarikçinin ürün için belirlediği fiyat.              |
| Miktar         | INT        | Tedarik edilen ürün miktarı.                           |
| UrunFiyatID (FK) | INT      | Ürün fiyatlandırma kaydına referans.                   |

### 6. Kooperatif_Sipariş
**Amaç**: Üyelerin kooperatiften verdikleri siparişlerin bilgilerini saklar.

| Alan Adı       | Tip        | Açıklama                                               |
| -------------- | ---------- | ------------------------------------------------------ |
| SiparisID (PK) | INT        | Siparişin benzersiz tanımlayıcısı.                     |
| UyeID (FK)     | INT        | Siparişi veren üyenin ID’si.                           |
| SiparisTarihi  | DATE       | Siparişin verildiği tarih.                             |
| ToplamTutar    | DECIMAL    | Siparişin toplam maliyeti.                             |

### 7. Kooperatif_Sipariş_Detayı
**Amaç**: Her siparişin içerdiği ürünlerin detaylarını tutar.

| Alan Adı       | Tip        | Açıklama                                               |
| -------------- | ---------- | ------------------------------------------------------ |
| SiparisDetayID (PK) | INT    | Sipariş detayının benzersiz tanımlayıcısı.             |
| SiparisID (FK) | INT        | İlgili siparişin ID’si.                                |
| KooperatifUrunID (FK) | INT  | Siparişte yer alan kooperatif ürününün ID’si.          |
| Adet           | INT        | Siparişteki ürün adedi.                                |
| Fiyat          | DECIMAL    | Sipariş edilen ürünün fiyatı.                          |

### 8. Tedarikçi_Sipariş
**Amaç**: Kooperatifin tedarikçilerden yaptığı siparişlerin bilgilerini saklar.

| Alan Adı       | Tip        | Açıklama                                               |
| -------------- | ---------- | ------------------------------------------------------ |
| TedarikciSiparisID (PK) | INT | Tedarikçi siparişinin benzersiz tanımlayıcısı.         |
| TedarikciID (FK) | INT      | İlgili tedarikçinin ID’si.                             |
| SiparisTarihi  | DATE       | Tedarikçiye verilen sipariş tarihi.                    |
| ToplamTutar    | DECIMAL    | Siparişin toplam maliyeti.                             |

### 9. Tedarikçi_Sipariş_Detayı
**Amaç**: Tedarikçi siparişlerinin içerdiği ürünlerin detaylarını tutar.

| Alan Adı       | Tip        | Açıklama                                               |
| -------------- | ---------- | ------------------------------------------------------ |
| TedarikciSiparisDetayID (PK) | INT | Tedarikçi sipariş detayının benzersiz ID’si.     |
| TedarikciSiparisID (FK) | INT | İlgili tedarikçi siparişinin ID’si.                  |
| TedarikciUrunID (FK) | INT    | Siparişteki ürünün ID’si.                             |
| Adet           | INT        | Siparişteki ürün adedi.                                |
| Fiyat          | DECIMAL    | Sipariş edilen ürünün fiyatı.                          |

### 10. Finansal_Veriler
**Amaç**: Kooperatiflerin mali durumlarını takip eder.

| Alan Adı       | Tip        | Açıklama                                               |
| -------------- | ---------- | ------------------------------------------------------ |
| KayitID (PK)   | INT        | Finansal kaydın benzersiz ID’si.                       |
| KooperatifID (FK) | INT     | Kooperatifin ID’si.                                    |
| Gelir          | DECIMAL    | Belirli bir dönemde elde edilen gelir.                 |
| Gider          | DECIMAL    | Belirli bir dönemde yapılan giderler.                  |
| Tarih          | VARCHAR    | Kayıt tarih aralığı (örn. 2023 Q1).                    |

### 11. Yardım
**Amaç**: Kooperatif üyelerine sağlanan yardımları takip eder.

| Alan Adı       | Tip        | Açıklama                                               |
| -------------- | ---------- | ------------------------------------------------------ |
| YardimID (PK)  | INT        | Yardım kaydının benzersiz tanımlayıcısı.               |
| UyeID (FK)     | INT        | Yardım alan üyenin ID’si.                              |
| YardimTarihi   | DATE       | Yardımın sağlandığı tarih.                             |
|
