ASP.NET Web Talep Formu Uygulaması
Bu proje, ASP.NET Web Forms kullanılarak geliştirilen bir Talep Formu Yönetim Sistemi'dir. Uygulama, admin ve yetkili kullanıcıların giriş yapabildiği, ürün taleplerinin yönetildiği bir web tabanlı çözümdür.

📌 Temel Özellikler
Admin Girişi:

Kullanıcı Adı: admin
Şifre: 123456
Yeni yetkili kullanıcılar oluşturabilir.
Her yetkili için yetkililik süresi gün olarak belirlenebilir.
Yetkili Girişi:

Giriş sonrası talep formu ekranına yönlendirilir.
Talep Formu:

15 satır × 3 sütundan oluşan bir GridView üzerinden ürün talepleri girilir.
Her satırda: Malzeme Kısa Metni, Kg/Adet ve Açıklaması bulunur.
Formun yan tarafında girilen ek bilgiler:
İstek Yapan Kişi
Bölüm
SAP Numarası
Bölüm Müdürü
Talep Tarihi
Veritabanı İşlemleri:

Talepler SQL Server veritabanına kaydedilir.
Kayıtlı talepler:
SAP Numarası'na göre
İstek Yapan Kişi'ye göre filtrelenebilir.
İstenirse talepler seçilerek silinebilir.
🗃️ Veritabanı Bilgisi
Proje ile birlikte Database/Talepler.bak adlı örnek bir SQL Server yedeği sağlanmıştır.

Veritabanını Yüklemek için:
SQL Server Management Studio (SSMS) ile sunucuya bağlanın.
Databases → sağ tıklayın → Restore Database... seçeneğini seçin.
"Device" seçeneğini işaretleyin ve .bak dosyasını ekleyin.
Restore işlemini tamamlayın.
Web.config Connection String:
	<connectionStrings>
		<add name="Baglanti"
             connectionString="Data Source=.;Initial Catalog=Talepler;Integrated Security=True"
             providerName="System.Data.SqlClient" />
	</connectionStrings>
