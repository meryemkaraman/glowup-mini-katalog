# GlowUp - Mini Katalog Uygulaması

Flutter ile geliştirilmiş, kozmetik ürünleri sergileyen bir mini katalog mobil uygulaması.

## Proje Açıklaması

GlowUp, kullanıcıların kozmetik ürünlerini kategori bazında inceleyebildiği, favorilerine ekleyebildiği, sepete ürün ekleyip sipariş simülasyonu yapabildiği bir Flutter uygulamasıdır. Uygulama; ürün listeleme, detay sayfası, sepet, favoriler ve profil ekranlarından oluşmaktadır.

## Özellikler

- 101 ürün, 7 kategori (Dudak, Göz, Yüz, Cilt Bakımı, Parfüm, Saç Bakımı, Vücut Bakımı)
- Arama ve kategori filtreleme
- Ürün detay sayfası (açıklama, yıldız puanı, yorumlar, adet seçimi)
- Sepet sistemi (adet artırma/azaltma, toplam tutar, ödeme simülasyonu)
- Favoriler sayfası
- Profil sayfası
- Splash screen (açılış animasyonu)
- Sayfa geçişlerinde fade/slide animasyonları
- Named Routes ve Route Arguments kullanımı
- JSON model yapısı (fromJson / toJson)

## Kullanılan Flutter Sürümü

Flutter 3.44.6 (stable channel)

## Kullanılan Araçlar

- Flutter SDK
- Dart
- Visual Studio Code
- Android Studio (Emulator için)

## Projeyi Çalıştırma Adımları

1. Bu repository'i klonlayın:
2. Proje klasörüne girin:
   cd glowup-mini-katalog
3. Gerekli paketleri yükleyin:
   flutter pub get
4. Bir emülatör açın (Android Studio üzerinden) veya bir cihaz bağlayın, ardından uygulamayı çalıştırın:
   flutter run
