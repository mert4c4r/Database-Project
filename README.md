# Tarım Kooperatifleri Veritabanı

Bu veritabanı yapısı, tarım kooperatiflerinin üyeler, ürünler, tedarikçiler ve finansal veriler gibi çeşitli yönlerini takip etmek amacıyla tasarlanmıştır. Veritabanı, kooperatiflerin etkin yönetimini sağlamak ve sürdürülebilirliklerini desteklemek için geliştirilmiştir.

## Tablolar

### 1. Kooperatif
Kooperatiflerin kimlik bilgilerini saklar.

| Alan Adı      | Veri Tipi | Açıklama                                         |
|---------------|-----------|-------------------------------------------------|
| KooperatifID  | INT       | Kooperatifin benzersiz tanımlayıcısı. (Primary Key) |
| Ad            | VARCHAR   | Kooperatifin adı.                               |
| KurulusYili   | YEAR      | Kooperatifin kurulduğu yıl.                     |
| Lokasyon      | VARCHAR   | Kooperatifin bulunduğu yer.                     |
| UyeSayisi     | INT       | Kooperatifteki toplam üye sayısı.               |

### 2. Üye
Kooperatif üyelerinin kişisel bilgilerini tutar.

| Alan Adı      | Veri Tipi | Açıklama                                         |
|---------------|-----------|-------------------------------------------------|
| UyeID         | INT       | Üyenin benzersiz tanımlayıcısı. (Primary Key)    |
| Ad            | VARCHAR   | Üyenin adı.                                     |
| Soyad         | VARCHAR   | Üyenin soyadı.                                  |
| Telefon       | VARCHAR   | Üyenin telefon numarası.                        |
| Email         | VARCHAR   | Üyenin e-posta adresi.                          |
| KooperatifID  | INT       | Üyenin bağlı olduğu kooperatifin ID’si. (Foreign Key) |

### 3. Kooperatif_Ürün
Kooperatiflerin sunduğu ürünlerin detaylarını saklar.

| Alan Adı         | Veri Tipi | Açıklama                                         |
|------------------|-----------|-------------------------------------------------|
| KooperatifUrunID | INT       | Kooperatif-ürün ilişkisinin benzersiz tanımlayıcısı. (Primary Key) |
| KooperatifID     | INT       | Ürünün ait olduğu kooperatifin ID’si. (Foreign Key) |
| Ad               | VARCHAR   | Ürünün adı.                                     |
| Kategori         | VARCHAR   | Ürünün kategorisi (örn. sebze, meyve, tahıl).   |
| Aciklama         | TEXT      | Ürün hakkında kısa bir açıklama.                |
| Fiyat            | DECIMAL   | Ürünün kooperatif tarafından belirlenen satış fiyatı. |
| StokMiktari      | INT       | Mevcut ürün stok miktarı.                       |

### 4. Tedarikçi
Kooperatiflerin çalıştığı tedarikçilerin bilgilerini tutar.

| Alan Adı      | Veri Tipi | Açıklama                                         |
|---------------|-----------|-------------------------------------------------|
| TedarikciID   | INT       | Tedarikçinin benzersiz tanımlayıcısı. (Primary Key) |
| Ad            | VARCHAR   | Tedarikçinin adı.                               |
| Iletisim      | VARCHAR   | Tedarikçinin iletişim bilgileri.                |
| Adres         | TEXT      | Tedarikçinin adresi.                            |
| KooperatifID  | INT       | Tedarikçinin hizmet verdiği kooperatifin ID’si. (Foreign Key) |

### 5. Tedarikçi_Ürün
Tedarikçilerin sağladığı ürünlerin bilgilerini tutar.

| Alan Adı         | Veri Tipi | Açıklama                                         |
|------------------|-----------|-------------------------------------------------|
| TedarikciUrunID  | INT       | Tedarikçi-ürün ilişkisinin benzersiz tanımlayıcısı. (Primary Key) |
| TedarikciID      | INT       | İlgili tedarikçinin ID’si. (Foreign Key)         |
| Ad               | VARCHAR   | Tedarik edilen ürünün adı.                      |
| Kategori         | VARCHAR   | Ürünün kategorisi (örn. sebze, meyve, tahıl).   |
| Aciklama         | TEXT      | Ürün hakkında kısa bir açıklama.                |
| TedarikFiyati    | DECIMAL   | Tedarikçinin ürün için belirlediği fiyat.       |
| Miktar           | INT       | Tedarik edilen ürünün miktarı.                  |

### 6. Kooperatif_Sipariş
Üyelerin kooperatiften verdikleri siparişlerin bilgilerini tutar.

| Alan Adı      | Veri Tipi | Açıklama                                         |
|---------------|-----------|-------------------------------------------------|
| SiparisID     | INT       | Siparişin benzersiz tanımlayıcısı. (Primary Key) |
| UyeID         | INT       | Siparişi veren üyenin ID’si. (Foreign Key)       |
| SiparisTarihi | DATE      | Siparişin verildiği tarih.                      |
| ToplamTutar   | DECIMAL   | Siparişin toplam maliyeti.                      |

### 7. Kooperatif_Sipariş_Detayı
Her siparişin içerdiği ürünlerin detaylarını tutar.

| Alan Adı         | Veri Tipi | Açıklama                                         |
|------------------|-----------|-------------------------------------------------|
| SiparisDetayID   | INT       | Sipariş detayının benzersiz tanımlayıcısı. (Primary Key) |
| SiparisID        | INT       | İlgili siparişin ID’si. (Foreign Key)            |
| KooperatifUrunID | INT       | Siparişte yer alan kooperatif ürününün ID’si. (Foreign Key) |
| Adet             | INT       | Sipariş edilen ürün adedi.                      |
| Fiyat            | DECIMAL   | Ürünün sipariş edildiği fiyat.                  |

### 8. Tedarikçi_Sipariş
Kooperatifin tedarikçilerden yaptığı siparişlerin bilgilerini tutar.

| Alan Adı           | Veri Tipi | Açıklama                                         |
|--------------------|-----------|-------------------------------------------------|
| TedarikciSiparisID | INT       | Tedarikçi siparişinin benzersiz tanımlayıcısı. (Primary Key) |
| TedarikciID        | INT       | İlgili tedarikçinin ID’si. (Foreign Key)         |
| SiparisTarihi      | DATE      | Siparişin verildiği tarih.                      |
| ToplamTutar        | DECIMAL   | Siparişin toplam maliyeti.                      |

### 9. Tedarikçi_Sipariş_Detayı
Tedarikçi siparişlerinin içerdiği ürünlerin detaylarını tutar.

| Alan Adı               | Veri Tipi | Açıklama                                         |
|------------------------|-----------|-------------------------------------------------|
| TedarikciSiparisDetayID| INT       | Tedarikçi sipariş detayının benzersiz tanımlayıcısı. (Primary Key) |
| TedarikciSiparisID     | INT       | İlgili tedarikçi siparişinin ID’si. (Foreign Key) |
| TedarikciUrunID        | INT       | Siparişteki tedarikçi ürününün ID’si. (Foreign Key) |
| Adet                   | INT       | Siparişteki ürün adedi.                          |
| Fiyat                  | DECIMAL   | Ürünün sipariş edildiği fiyat.                  |

### 10. Finansal_Veriler
Kooperatiflerin mali durumlarını takip eder.

| Alan Adı     | Veri Tipi | Açıklama                                         |
|--------------|-----------|-------------------------------------------------|
| KayitID      | INT       | Finansal kaydın benzersiz tanımlayıcısı. (Primary Key) |
| KooperatifID | INT       | Kooperatifin ID’si. (Foreign Key)                |
| Gelir        | DECIMAL   | Belirli bir dönemde elde edilen gelir tutarı.    |
| Gider        | DECIMAL   | Belirli bir dönemde yapılan gider tutarı.        |
| Tarih        | VARCHAR   | Kayıt tarih aralığı (örn. 2023 Q1).              |

### 11. Yardım
Kooperatif üyelerine sağlanan yardımları takip eder.

| Alan Adı     | Veri Tipi | Açıklama                                         |
|--------------|-----------|-------------------------------------------------|
| YardimID     | INT       | Yardım kaydının benzersiz tanımlayıcısı. (Primary Key) |
| UyeID        | INT       | Yardım alan üyenin ID’si. (Foreign Key)          |
| YardimTarihi | DATE      | Yardımın sağlandığı tarih.                       |
| YardimTuru   | VARCHAR   | Yardımın türü (örn. malzeme, nakit).             |
| Miktar       | DECIMAL   | Sağlanan yardımın miktarı.                       |

### 12. Etkinlik
Kooperatiflerin düzenlediği etkinlikleri takip eder.

| Alan Adı        | Veri Tipi | Açıklama                                         |
|-----------------|-----------|-------------------------------------------------|
| EtkinlikID      | INT       | Etkinliğin benzersiz tanımlayıcısı. (Primary Key) |
| KooperatifID    | INT       | Etkinliği düzenleyen kooperatifin ID’si. (Foreign Key) |
| EtkinlikAdi     | VARCHAR   | Etkinliğin adı.                                  |
| EtkinlikTarihi  | DATE      | Etkinliğin düzenlendiği tarih.                   |
| KatilimciSayisi | INT       | Etkinliğe katılan kişi sayısı.                   |
| Aciklama        | TEXT      | Etkinlik hakkında kısa bir açıklama.             |

### 13. Eğitim
Kooperatif üyelerine sağlanan eğitimleri takip eder.

| Alan Adı     | Veri Tipi | Açıklama                                         |
|--------------|-----------|-------------------------------------------------|
| EgitimID     | INT       | Eğitimin benzersiz tanımlayıcısı. (Primary Key) |
| KooperatifID | INT       | Eğitimi düzenleyen kooperatifin ID’si. (Foreign Key) |
| EgitimAdi    | VARCHAR   | Eğitimin adı.                                   |
| EgitimTarihi | DATE      | Eğitimin verildiği tarih.                       |
| Egitmen      | VARCHAR   | Eğitimi veren kişi veya kurumun adı.            |
| KatilimciSayisi | INT     | Eğitime katılan kişi sayısı.                    |
| Aciklama     | TEXT      | Eğitim hakkında kısa bir açıklama.              |

### 14. Üye_Geri_Bildirim
Üyelerin kooperatif hakkında yaptığı geri bildirimleri içerir.

| Alan Adı      | Veri Tipi | Açıklama                                         |
|---------------|-----------|-------------------------------------------------|
| GeriBildirimID| INT       | Geri bildirimin benzersiz tanımlayıcısı. (Primary Key) |
| UyeID         | INT       | Geri bildirim yapan üyenin ID’si. (Foreign Key) |
| GeriBildirimTarihi | DATE  | Geri bildirimin yapıldığı tarih.               |
| GeriBildirim  | TEXT      | Üyenin geri bildirimi.                          |

Bu yapı, kooperatiflerin çeşitli operasyonel süreçlerini etkili bir şekilde takip etmelerini sağlar. Hem finansal veriler, hem tedarik zinciri hem de üye memnuniyeti gibi kritik konular için güçlü bir veri altyapısı oluşturur.
