import 'package:flutter/material.dart';
import '../models/product.dart';

final List<Map<String, dynamic>> rawProductsJson = [
  // ================= DUDAK (15) =================
  {'id': 1, 'name': 'Bal Özlü Dudak Balmı', 'brand': 'HoneyLip', 'price': 79.90, 'rating': 4.5, 'category': 'Dudak', 'imagePath': 'assets/images/balm1.png', 'description': 'Bal özü içeren, dudakları besleyen ve yumuşatan doğal balm.'},
  {'id': 2, 'name': 'Gül Kokulu Nemlendirici Balm', 'brand': 'RoseTouch', 'price': 89.90, 'rating': 4.4, 'category': 'Dudak', 'imagePath': 'assets/images/balm2.png', 'description': 'Hafif gül kokulu, gün boyu nemlendiren dudak bakım balmı.'},
  {'id': 3, 'name': 'Vanilyalı Dudak Bakım Balmı', 'brand': 'VelvetLip', 'price': 74.90, 'rating': 4.6, 'category': 'Dudak', 'imagePath': 'assets/images/balm3.png', 'description': 'Tatlı vanilya kokulu, yumuşak dokulu günlük bakım balmı.'},
  {'id': 4, 'name': 'Şeftali Aromalı Renkli Balm', 'brand': 'PeachGlow', 'price': 84.90, 'rating': 4.3, 'category': 'Dudak', 'imagePath': 'assets/images/balm4.png', 'description': 'Hafif renk veren, şeftali kokulu nemlendirici dudak balmı.'},
  {'id': 5, 'name': 'Karite Yağlı Onarıcı Balm', 'brand': 'ShearButter', 'price': 94.90, 'rating': 4.7, 'category': 'Dudak', 'imagePath': 'assets/images/balm5.png', 'description': 'Karite yağı ile çatlamış dudakları onaran yoğun bakım balmı.'},
  {'id': 18, 'name': 'Aynalı Parlak Dudak Parlatıcısı', 'brand': 'MirrorGloss', 'price': 99.90, 'rating': 4.5, 'category': 'Dudak', 'imagePath': 'assets/images/glos1.png', 'description': 'Aynalı parlaklık etkisi veren, yapışkan olmayan dudak parlatıcı.'},
  {'id': 27, 'name': 'Şeftalili Dudak Yağı', 'brand': 'GlowDrop', 'price': 109.90, 'rating': 4.5, 'category': 'Dudak', 'imagePath': 'assets/images/oil1.png', 'description': 'Hafif şeftali kokulu, parlaklık veren besleyici dudak yağı.'},
  {'id': 28, 'name': 'Vanilyalı Parlak Dudak Yağı', 'brand': 'GlowDrop', 'price': 114.90, 'rating': 4.4, 'category': 'Dudak', 'imagePath': 'assets/images/oil2.png', 'description': 'Tatlı vanilya kokulu, aynalı parlaklık veren dudak yağı.'},
  {'id': 29, 'name': 'Kiraz Aromalı Dudak Yağı', 'brand': 'CherryPop', 'price': 99.90, 'rating': 4.6, 'category': 'Dudak', 'imagePath': 'assets/images/oil3.png', 'description': 'Canlı kiraz tonu veren, hafif kokulu besleyici dudak yağı.'},
  {'id': 30, 'name': 'Gül Kokulu Besleyici Dudak Yağı', 'brand': 'RoseTouch', 'price': 119.90, 'rating': 4.5, 'category': 'Dudak', 'imagePath': 'assets/images/oil4.png', 'description': 'Gül özü içeren, dudakları yumuşatan nemlendirici yağ formülü.'},
  {'id': 31, 'name': 'Nar Özlü Dudak Yağı', 'brand': 'PomeGlow', 'price': 104.90, 'rating': 4.3, 'category': 'Dudak', 'imagePath': 'assets/images/oil5.png', 'description': 'Antioksidan nar özü ile besleyici, hafif renkli dudak yağı.'},
  {'id': 32, 'name': 'Mat Bitişli Kırmızı Ruj', 'brand': 'Bloom & Co', 'price': 89.90, 'rating': 4.6, 'category': 'Dudak', 'imagePath': 'assets/images/ruj1.png', 'description': 'Klasik kırmızı tonda, uzun süre kalıcı mat bitişli ruj.'},
  {'id': 33, 'name': 'Kadife Dokulu Nude Ruj', 'brand': 'Bloom & Co', 'price': 94.90, 'rating': 4.5, 'category': 'Dudak', 'imagePath': 'assets/images/ruj2.png', 'description': 'Günlük kullanım için yumuşak nude tonlu kadife dokulu ruj.'},
  {'id': 34, 'name': 'Parlak Bitişli Pembe Ruj', 'brand': 'Bloom & Co', 'price': 84.90, 'rating': 4.4, 'category': 'Dudak', 'imagePath': 'assets/images/ruj3.png', 'description': 'Canlı pembe tonda, hafif parlak bitişli nemlendirici ruj.'},
  {'id': 35, 'name': 'Uzun Süre Kalıcı Bordo Ruj', 'brand': 'Bloom & Co', 'price': 99.90, 'rating': 4.7, 'category': 'Dudak', 'imagePath': 'assets/images/ruj4.png', 'description': 'Zengin bordo tonda, gün boyu kalıcı yoğun pigmentli ruj.'},

  // ================= GÖZ (16) =================
  {'id': 6, 'name': 'Suya Dayanıklı Likit Eyeliner', 'brand': 'LineArt', 'price': 129.90, 'rating': 4.5, 'category': 'Göz', 'imagePath': 'assets/images/eyeliner1.png', 'description': 'Keskin çizgi veren, suya dayanıklı uzun süre kalıcı likit eyeliner.'},
  {'id': 7, 'name': 'Keçe Uçlu Siyah Eyeliner', 'brand': 'PrecisionLine', 'price': 99.90, 'rating': 4.4, 'category': 'Göz', 'imagePath': 'assets/images/eyeliner2.png', 'description': 'İnce keçe uç sayesinde kolay ve hassas uygulama sağlar.'},
  {'id': 8, 'name': 'Kadife Dokulu Jel Eyeliner', 'brand': 'VelvetLine', 'price': 139.90, 'rating': 4.6, 'category': 'Göz', 'imagePath': 'assets/images/eyeliner3.png', 'description': 'Yoğun pigmentli, kadife dokulu, akmayan jel eyeliner.'},
  {'id': 9, 'name': 'Parlak Bitişli Eyeliner Kalem', 'brand': 'GlowLiner', 'price': 109.90, 'rating': 4.3, 'category': 'Göz', 'imagePath': 'assets/images/eyeliner4.png', 'description': 'Hafif parlak bitişli, kolay uygulanan eyeliner kalem.'},
  {'id': 10, 'name': 'Nude Tonlar Far Paleti', 'brand': 'NudeMuse', 'price': 249.90, 'rating': 4.6, 'category': 'Göz', 'imagePath': 'assets/images/far1.png', 'description': 'Günlük kullanım için nude ve toprak tonlarından oluşan palet.'},
  {'id': 11, 'name': 'Mor Tonlar Işıltılı Far Paleti', 'brand': 'VioletDust', 'price': 259.90, 'rating': 4.5, 'category': 'Göz', 'imagePath': 'assets/images/far2.png', 'description': 'Işıltılı mor ve leylak tonlarından oluşan iddialı far paleti.'},
  {'id': 12, 'name': 'Toprak Tonları Mat Far Paleti', 'brand': 'EarthMatte', 'price': 229.90, 'rating': 4.4, 'category': 'Göz', 'imagePath': 'assets/images/far3.png', 'description': 'Mat bitişli, sıcak toprak tonlarından oluşan çok amaçlı palet.'},
  {'id': 13, 'name': 'Bakır Simli Far Paleti', 'brand': 'CopperShine', 'price': 269.90, 'rating': 4.7, 'category': 'Göz', 'imagePath': 'assets/images/far4.png', 'description': 'Bakır ve altın simli, gece kullanımına uygun far paleti.'},
  {'id': 19, 'name': 'Suya Dayanıklı Göz Kalemi', 'brand': 'SoftLine', 'price': 89.90, 'rating': 4.4, 'category': 'Göz', 'imagePath': 'assets/images/kalem1.png', 'description': 'Yumuşak dokulu, kolay uygulanan suya dayanıklı göz kalemi.'},
  {'id': 20, 'name': 'Kahverengi Göz Kalemi', 'brand': 'EarthLine', 'price': 84.90, 'rating': 4.3, 'category': 'Göz', 'imagePath': 'assets/images/kalem2.png', 'description': 'Doğal görünüm için yumuşak kahverengi tonlu göz kalemi.'},
  {'id': 21, 'name': 'Kohl Siyah Göz Kalemi', 'brand': 'KohlEdge', 'price': 94.90, 'rating': 4.5, 'category': 'Göz', 'imagePath': 'assets/images/kalem3.png', 'description': 'Yoğun pigmentli, klasik kohl etkili siyah göz kalemi.'},
  {'id': 22, 'name': 'Su Geçirmez Lacivert Göz Kalemi', 'brand': 'MidnightLine', 'price': 99.90, 'rating': 4.6, 'category': 'Göz', 'imagePath': 'assets/images/kalem4.png', 'description': 'İddialı bakışlar için su geçirmez lacivert tonlu göz kalemi.'},
  {'id': 23, 'name': 'Hacim Veren Maskara', 'brand': 'VolumeLash', 'price': 119.90, 'rating': 4.5, 'category': 'Göz', 'imagePath': 'assets/images/maskara1.png', 'description': 'Kirpiklere yoğun hacim kazandıran özel fırça tasarımlı maskara.'},
  {'id': 24, 'name': 'Uzatma Etkili Maskara', 'brand': 'LengthLash', 'price': 129.90, 'rating': 4.6, 'category': 'Göz', 'imagePath': 'assets/images/maskara2.png', 'description': 'Kirpikleri belirgin şekilde uzatan lifli formüllü maskara.'},
  {'id': 25, 'name': 'Su Geçirmez Maskara', 'brand': 'AquaLash', 'price': 139.90, 'rating': 4.7, 'category': 'Göz', 'imagePath': 'assets/images/maskara3.png', 'description': 'Gün boyu akmayan, su geçirmez formüllü yoğun siyah maskara.'},
  {'id': 26, 'name': 'Kıvrım Veren Maskara', 'brand': 'CurlLash', 'price': 124.90, 'rating': 4.4, 'category': 'Göz', 'imagePath': 'assets/images/maskara4.png', 'description': 'Kirpiklere kalıcı kıvrım kazandıran eğri fırçalı maskara.'},

  // ================= YÜZ (15) =================
  {'id': 71, 'name': 'Açık Ton Kapatıcı', 'brand': 'FlawlessBase', 'price': 149.90, 'rating': 4.4, 'category': 'Yüz', 'imagePath': 'assets/images/consiler1.png', 'description': 'Açık ten tonları için hafif dokulu, doğal bitişli kapatıcı.'},
  {'id': 72, 'name': 'Gül Tonu Kapatıcı', 'brand': 'FlawlessBase', 'price': 149.90, 'rating': 4.3, 'category': 'Yüz', 'imagePath': 'assets/images/consiler2.png', 'description': 'Pembemsi ton dengesizliklerini kapatan orta ton kapatıcı.'},
  {'id': 73, 'name': 'Şeftali Tonu Kapatıcı', 'brand': 'FlawlessBase', 'price': 154.90, 'rating': 4.5, 'category': 'Yüz', 'imagePath': 'assets/images/consiler3.png', 'description': 'Sıcak şeftali tonlu ciltler için yüksek kapatıcılık sağlar.'},
  {'id': 74, 'name': 'C Vitaminli Kapatıcı', 'brand': 'GlowBase', 'price': 164.90, 'rating': 4.6, 'category': 'Yüz', 'imagePath': 'assets/images/consiler4.png', 'description': 'C vitamini içeren, aydınlatıcı etkili nemlendiricili kapatıcı.'},
  {'id': 87, 'name': 'Rose Gold Aydınlatıcı', 'brand': 'GlowMuse', 'price': 199.90, 'rating': 4.6, 'category': 'Yüz', 'imagePath': 'assets/images/aydinlatici1.png', 'description': 'Rose gold tonunda, elmacık kemiklerine doğal ışıltı katan aydınlatıcı.'},
  {'id': 88, 'name': 'Bronz Aydınlatıcı', 'brand': 'GlowMuse', 'price': 189.90, 'rating': 4.4, 'category': 'Yüz', 'imagePath': 'assets/images/aydinlatici2.png', 'description': 'Sıcak bronz tonuyla güneşte yanmış etkisi veren aydınlatıcı.'},
  {'id': 89, 'name': 'Güneş Öpücüğü Aydınlatıcı', 'brand': 'SunKissed', 'price': 194.90, 'rating': 4.5, 'category': 'Yüz', 'imagePath': 'assets/images/aydinlatici3.png', 'description': 'Terrakota tonlu, yaz ışıltısı hissi veren aydınlatıcı pudra.'},
  {'id': 90, 'name': 'Elmas Parıltı Aydınlatıcı', 'brand': 'DiamondGlow', 'price': 209.90, 'rating': 4.7, 'category': 'Yüz', 'imagePath': 'assets/images/aydinlatici4.png', 'description': 'Yoğun parıltılı, elmas tozu etkili aydınlatıcı.'},
  {'id': 91, 'name': 'Ay Işığı Aydınlatıcı', 'brand': 'LunarGlow', 'price': 199.90, 'rating': 4.5, 'category': 'Yüz', 'imagePath': 'assets/images/aydinlatici5.png', 'description': 'Soğuk lavanta tonlu, ay ışığı gibi parlayan aydınlatıcı.'},
  {'id': 92, 'name': 'Altın Bal Aydınlatıcı', 'brand': 'HoneyGlow', 'price': 199.90, 'rating': 4.6, 'category': 'Yüz', 'imagePath': 'assets/images/aydinlatici6.png', 'description': 'Altın bal tonunda, sıcak ve doğal görünüm veren aydınlatıcı.'},
  {'id': 93, 'name': 'Şampanya Altın Aydınlatıcı', 'brand': 'ChampagneGlow', 'price': 214.90, 'rating': 4.7, 'category': 'Yüz', 'imagePath': 'assets/images/aydinlatici7.png', 'description': 'Şampanya altın tonunda, molten etkili aydınlatıcı pudra.'},
  {'id': 94, 'name': 'Yumuşak Pembe Allık', 'brand': 'BlushMuse', 'price': 129.90, 'rating': 4.5, 'category': 'Yüz', 'imagePath': 'assets/images/allik1.png', 'description': 'Soft pembe tonda, doğal görünüm veren günlük allık.'},
  {'id': 95, 'name': 'Şeftali Mercan Allık', 'brand': 'BlushMuse', 'price': 129.90, 'rating': 4.4, 'category': 'Yüz', 'imagePath': 'assets/images/allik2.png', 'description': 'Canlı şeftali-mercan tonunda taze görünüm veren allık.'},
  {'id': 96, 'name': 'Gül Kurusu Allık', 'brand': 'BlushMuse', 'price': 134.90, 'rating': 4.6, 'category': 'Yüz', 'imagePath': 'assets/images/allik3.png', 'description': 'Gül kurusu tonunda, sonbahar esintili zarif allık.'},
  {'id': 97, 'name': 'Terracotta Allık', 'brand': 'BlushMuse', 'price': 134.90, 'rating': 4.5, 'category': 'Yüz', 'imagePath': 'assets/images/allik4.png', 'description': 'Sıcak terracotta tonunda, bronzlaşmış cilt etkisi veren allık.'},
  {'id': 98, 'name': 'Doğal Bitişli Fondöten', 'brand': 'FlawlessBase', 'price': 219.90, 'rating': 4.6, 'category': 'Yüz', 'imagePath': 'assets/images/fndtn1.png', 'description': 'Hafif dokulu, doğal bitişli, gün boyu kalıcı fondöten.'},
  {'id': 99, 'name': 'Mat Bitişli Fondöten', 'brand': 'FlawlessBase', 'price': 224.90, 'rating': 4.5, 'category': 'Yüz', 'imagePath': 'assets/images/fndtn2.png', 'description': 'Yağlı ciltler için mat bitişli, uzun süre kalıcı fondöten.'},
  {'id': 100, 'name': 'Nemlendiricili Fondöten', 'brand': 'GlowBase', 'price': 229.90, 'rating': 4.7, 'category': 'Yüz', 'imagePath': 'assets/images/fndtn3.png', 'description': 'İçerdiği nemlendirici ile kuru ciltlere uygun hafif fondöten.'},
  {'id': 101, 'name': 'Yüksek Kapatıcılıklı Fondöten', 'brand': 'FlawlessBase', 'price': 234.90, 'rating': 4.6, 'category': 'Yüz', 'imagePath': 'assets/images/fndtn4.png', 'description': 'Yüksek kapatıcılık sağlayan, cilt kusurlarını gizleyen fondöten.'},

  // ================= CİLT BAKIMI (22) =================
  {'id': 14, 'name': 'SPF50 Yüz Güneş Kremi', 'brand': 'SunKiss', 'price': 179.90, 'rating': 4.4, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/gk1.png', 'description': 'Yüksek koruma faktörlü, yağsız dokulu yüz güneş kremi.'},
  {'id': 15, 'name': 'Hafif Dokulu Güneş Kremi', 'brand': 'SunKiss', 'price': 169.90, 'rating': 4.5, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/gk2.png', 'description': 'Hızlı emilen, beyaz iz bırakmayan hafif dokulu güneş kremi.'},
  {'id': 16, 'name': 'Çocuklar için Güneş Kremi SPF50', 'brand': 'KidSafe', 'price': 149.90, 'rating': 4.6, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/gk3.png', 'description': 'Hassas çocuk cildi için özel formüllü yüksek koruma kremi.'},
  {'id': 17, 'name': 'Vücut için Güneş Losyonu', 'brand': 'SunKiss', 'price': 189.90, 'rating': 4.3, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/gk4.png', 'description': 'Geniş alanlara kolay uygulanan losyon formunda güneş koruyucu.'},
  {'id': 65, 'name': 'Nemlendirici Hyaluronik Serum', 'brand': 'AquaLux', 'price': 249.90, 'rating': 4.7, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/serum1.png', 'description': 'Hyaluronik asit içeren, derin nemlendirme sağlayan serum.'},
  {'id': 66, 'name': 'C Vitamini Aydınlatıcı Serum', 'brand': 'VitaBright', 'price': 259.90, 'rating': 4.6, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/serum2.png', 'description': 'Cilt tonunu eşitleyen, aydınlatıcı etkili C vitamini serumu.'},
  {'id': 67, 'name': 'Lavanta Sakinleştirici Serum', 'brand': 'CalmLeaf', 'price': 229.90, 'rating': 4.5, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/serum3.png', 'description': 'Hassas ciltleri yatıştıran, lavanta özlü sakinleştirici serum.'},
  {'id': 68, 'name': 'Mavi Yosun Nemlendirici Serum', 'brand': 'AquaLux', 'price': 239.90, 'rating': 4.4, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/serum4.png', 'description': 'Deniz yosunu özütlü, yoğun nemlendirme sağlayan serum.'},
  {'id': 69, 'name': 'Portakal Çiçeği C Vitamini Serumu', 'brand': 'VitaBright', 'price': 254.90, 'rating': 4.6, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/serum5.png', 'description': 'Portakal çiçeği özlü, canlandırıcı C vitamini serumu.'},
  {'id': 70, 'name': 'Turunçgil Canlandırıcı Serum', 'brand': 'CitrusGlow', 'price': 244.90, 'rating': 4.5, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/serum6.png', 'description': 'Yorgun cilde canlılık kazandıran turunçgil özlü serum.'},
  {'id': 75, 'name': 'Hydra Boost Temizleme Jeli', 'brand': 'PureSkin', 'price': 139.90, 'rating': 4.5, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/tj1.png', 'description': 'Cildi kurutmadan derinlemesine temizleyen nemlendirici jel.'},
  {'id': 76, 'name': 'Cilt Dengeleyici Temizleme Jeli', 'brand': 'PureSkin', 'price': 129.90, 'rating': 4.4, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/tj2.png', 'description': 'Yağ dengesini koruyan, ferahlatıcı günlük temizleme jeli.'},
  {'id': 77, 'name': 'Aydınlatıcı Temizleme Jeli', 'brand': 'GlowClean', 'price': 144.90, 'rating': 4.6, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/tj3.png', 'description': 'C vitamini içeren, cildi aydınlatan temizleme jeli.'},
  {'id': 78, 'name': 'Ferahlatıcı Temizleme Jeli', 'brand': 'PureSkin', 'price': 134.90, 'rating': 4.3, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/tj4.png', 'description': 'Serinletici etkili, gün boyu birikimi temizleyen jel formül.'},
  {'id': 79, 'name': 'Aqua Fresh Nemlendirici', 'brand': 'HydroDaily', 'price': 189.90, 'rating': 4.5, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/nem1.png', 'description': 'Hafif dokulu, hızlı emilen günlük nemlendirici krem.'},
  {'id': 80, 'name': 'Rose Glow Nemlendirici', 'brand': 'RoseTouch', 'price': 194.90, 'rating': 4.4, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/nem2.png', 'description': 'Gül özlü, cilde canlılık ve nem kazandıran krem.'},
  {'id': 81, 'name': 'C Vitamini Günlük Nemlendirici', 'brand': 'VitaBright', 'price': 199.90, 'rating': 4.6, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/nem3.png', 'description': 'C vitamini içeren, cilt tonunu eşitleyen günlük nemlendirici.'},
  {'id': 82, 'name': 'Derin Nemlendirici Krem', 'brand': 'HydroDaily', 'price': 209.90, 'rating': 4.5, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/nem4.png', 'description': 'Kuru ciltler için yoğun ve besleyici nemlendirici krem.'},
  {'id': 83, 'name': 'Hafif Nemlendirici Jel', 'brand': 'HydroDaily', 'price': 179.90, 'rating': 4.3, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/nem5.png', 'description': 'Yağlı ciltler için hafif, yağsız jel dokulu nemlendirici.'},
  {'id': 84, 'name': 'Bariyer Onarıcı Krem', 'brand': 'SkinBarrier', 'price': 219.90, 'rating': 4.7, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/nem6.png', 'description': 'Cilt bariyerini güçlendiren, onarıcı etkili yoğun krem.'},
  {'id': 85, 'name': 'Gece Onarıcı Krem', 'brand': 'NightRepair', 'price': 229.90, 'rating': 4.6, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/nem7.png', 'description': 'Uyku sırasında cildi onaran, yoğun besleyici gece kremi.'},
  {'id': 86, 'name': 'Bal Özlü Nemlendirici', 'brand': 'HoneyGlow', 'price': 184.90, 'rating': 4.5, 'category': 'Cilt Bakımı', 'imagePath': 'assets/images/nem8.png', 'description': 'Bal özü içeren, yumuşatıcı ve besleyici günlük nemlendirici.'},

  // ================= PARFÜM (9) =================
  {'id': 56, 'name': 'Çiçek Bahçesi Parfüm', 'brand': 'Luna Beauty', 'price': 349.90, 'rating': 4.8, 'category': 'Parfüm', 'imagePath': 'assets/images/parfum1.png', 'description': 'Çiçeksi notalarla hazırlanmış, gün boyu kalıcı kadın parfümü.'},
  {'id': 57, 'name': 'Turunç Parfüm', 'brand': 'CitrusHouse', 'price': 329.90, 'rating': 4.5, 'category': 'Parfüm', 'imagePath': 'assets/images/parfum2.png', 'description': 'Taze turunçgil notalı, gündüz kullanımına uygun ferah parfüm.'},
  {'id': 58, 'name': 'Lavanta Rüyası Parfüm', 'brand': 'VioletDust', 'price': 339.90, 'rating': 4.6, 'category': 'Parfüm', 'imagePath': 'assets/images/parfum3.png', 'description': 'Lavanta ve leylak notalarıyla sakinleştirici bir koku deneyimi.'},
  {'id': 59, 'name': 'Vanilya Çiçeği Parfüm', 'brand': 'Luna Beauty', 'price': 359.90, 'rating': 4.7, 'category': 'Parfüm', 'imagePath': 'assets/images/parfum4.png', 'description': 'Tatlı vanilya ve beyaz çiçek notalarından oluşan zarif parfüm.'},
  {'id': 60, 'name': 'Gül Bahçesi Parfüm', 'brand': 'RoseTouch', 'price': 344.90, 'rating': 4.6, 'category': 'Parfüm', 'imagePath': 'assets/images/parfum5.png', 'description': 'Taze gül yapraklarından ilham alan romantik bir koku.'},
  {'id': 61, 'name': 'Gece Parfümü (Noir Intense)', 'brand': 'NoirHouse', 'price': 379.90, 'rating': 4.8, 'category': 'Parfüm', 'imagePath': 'assets/images/parfum6.png', 'description': 'Odunsu ve yoğun notalarla gece kullanımına özel iddialı parfüm.'},
  {'id': 62, 'name': 'Amber Parfüm', 'brand': 'AmberGlow', 'price': 364.90, 'rating': 4.5, 'category': 'Parfüm', 'imagePath': 'assets/images/parfum7.png', 'description': 'Sıcak amber ve baharat notalarıyla kalıcı bir imza koku.'},
  {'id': 63, 'name': 'Okyanus Esintisi Parfüm', 'brand': 'OceanAir', 'price': 334.90, 'rating': 4.4, 'category': 'Parfüm', 'imagePath': 'assets/images/parfum8.png', 'description': 'Ferah deniz notalarıyla hazırlanmış hafif ve dinamik parfüm.'},
  {'id': 64, 'name': 'Deniz Havası Parfüm', 'brand': 'OceanAir', 'price': 334.90, 'rating': 4.5, 'category': 'Parfüm', 'imagePath': 'assets/images/parfum9.png', 'description': 'Su notaları ve hafif turunç akorlarıyla serinletici bir parfüm.'},

  // ================= SAÇ BAKIMI (4) =================
  {'id': 48, 'name': 'Zeytin Yağlı Şampuan', 'brand': 'PureRoots', 'price': 149.90, 'rating': 4.5, 'category': 'Saç Bakımı', 'imagePath': 'assets/images/shampoo1.png', 'description': 'Zeytin yağı özütlü, saçları besleyen onarıcı şampuan.'},
  {'id': 49, 'name': 'Gül Özlü Şampuan', 'brand': 'RoseTouch', 'price': 154.90, 'rating': 4.4, 'category': 'Saç Bakımı', 'imagePath': 'assets/images/shampoo2.png', 'description': 'Gül özü içeren, saçlara parlaklık ve hafif koku katan şampuan.'},
  {'id': 50, 'name': 'Lavanta Şampuanı', 'brand': 'CalmLeaf', 'price': 144.90, 'rating': 4.5, 'category': 'Saç Bakımı', 'imagePath': 'assets/images/shampoo3.png', 'description': 'Lavanta özlü, saç derisini sakinleştiren rahatlatıcı şampuan.'},
  {'id': 51, 'name': 'Argan Yağlı Şampuan', 'brand': 'PureRoots', 'price': 159.90, 'rating': 4.7, 'category': 'Saç Bakımı', 'imagePath': 'assets/images/shampoo4.png', 'description': 'Argan yağı ile saçları onaran, besleyici yoğun bakım şampuanı.'},

  // ================= VÜCUT BAKIMI (16) =================
  {'id': 36, 'name': 'Lavanta Duş Jeli', 'brand': 'LUXÉA', 'price': 119.90, 'rating': 4.4, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/dj1.png', 'description': 'Lavanta özlü, rahatlatıcı kokulu günlük duş jeli.'},
  {'id': 37, 'name': 'Portakal Duş Jeli', 'brand': 'LUXÉA', 'price': 114.90, 'rating': 4.3, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/dj2.png', 'description': 'Turunçgil kokulu, enerji veren ferahlatıcı duş jeli.'},
  {'id': 38, 'name': 'Deniz Ferahlığı Duş Jeli', 'brand': 'LUXÉA', 'price': 124.90, 'rating': 4.5, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/dj3.png', 'description': 'Deniz notalarıyla serinletici, canlandırıcı duş jeli.'},
  {'id': 39, 'name': 'Gül Duş Jeli', 'brand': 'LUXÉA', 'price': 119.90, 'rating': 4.6, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/dj4.png', 'description': 'Gül kokulu, cildi yumuşatan nemlendirici duş jeli.'},
  {'id': 40, 'name': 'Hindistan Cevizi Vücut Spreyi', 'brand': 'LUXÉA', 'price': 139.90, 'rating': 4.5, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/bodymist1.png', 'description': 'Tropik hindistan cevizi kokulu, hafif dokulu vücut spreyi.'},
  {'id': 41, 'name': 'Deniz Esintisi Vücut Spreyi', 'brand': 'LUXÉA', 'price': 134.90, 'rating': 4.4, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/bodymist2.png', 'description': 'Ferah deniz esintisi kokulu, gün boyu tazelik veren sprey.'},
  {'id': 42, 'name': 'Vanilya Vücut Spreyi', 'brand': 'LUXÉA', 'price': 139.90, 'rating': 4.6, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/bodymist3.png', 'description': 'Tatlı vanilya kokulu, cazibeli bir vücut spreyi.'},
  {'id': 43, 'name': 'Kiraz Çiçeği Vücut Spreyi', 'brand': 'LUXÉA', 'price': 134.90, 'rating': 4.5, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/bodymist4.png', 'description': 'Kiraz çiçeği notalı, hafif ve romantik bir vücut spreyi.'},
  {'id': 44, 'name': 'Hindistan Cevizi Vücut Losyonu', 'brand': 'LUXÉA', 'price': 149.90, 'rating': 4.5, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/bodylotion1.png', 'description': 'Tropik kokulu, yoğun nemlendiren vücut losyonu.'},
  {'id': 45, 'name': 'Lavanta Vücut Losyonu', 'brand': 'LUXÉA', 'price': 144.90, 'rating': 4.4, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/bodylotion2.png', 'description': 'Lavanta özlü, rahatlatıcı kokulu nemlendirici losyon.'},
  {'id': 46, 'name': 'Vanilya Vücut Losyonu', 'brand': 'LUXÉA', 'price': 149.90, 'rating': 4.6, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/bodylotion3.png', 'description': 'Tatlı vanilya kokulu, yumuşacık bir cilt hissi bırakan losyon.'},
  {'id': 47, 'name': 'Gül Vücut Losyonu', 'brand': 'LUXÉA', 'price': 149.90, 'rating': 4.5, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/bodylotion4.png', 'description': 'Gül kokulu, cildi besleyen hafif dokulu vücut losyonu.'},
  {'id': 52, 'name': 'Ferahlatıcı Deodorant', 'brand': 'LUXÉA', 'price': 89.90, 'rating': 4.3, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/deo1.png', 'description': 'Gün boyu ferahlık veren, hafif kokulu deodorant.'},
  {'id': 53, 'name': 'Sport Deodorant', 'brand': 'LUXÉA Sport', 'price': 94.90, 'rating': 4.4, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/deo2.png', 'description': 'Aktif kullanım için güçlü koruma sağlayan spor deodorantı.'},
  {'id': 54, 'name': 'Pudra Kokulu Deodorant', 'brand': 'LUXÉA', 'price': 89.90, 'rating': 4.5, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/deo3.png', 'description': 'Yumuşak pudra kokulu, hassas ciltlere uygun deodorant.'},
  {'id': 55, 'name': 'Lavanta Deodorant', 'brand': 'LUXÉA', 'price': 89.90, 'rating': 4.4, 'category': 'Vücut Bakımı', 'imagePath': 'assets/images/deo4.png', 'description': 'Lavanta özlü, sakinleştirici kokulu günlük deodorant.'},
];

List<Product> productList =
    rawProductsJson.map((json) => Product.fromJson(json)).toList();

List<String> categoryList = [
  'Tümü',
  'Dudak',
  'Göz',
  'Yüz',
  'Cilt Bakımı',
  'Parfüm',
  'Saç Bakımı',
  'Vücut Bakımı',
];

Color categoryColor(String category) {
  switch (category) {
    case 'Dudak':
      return const Color(0xFFFFC1CC);
    case 'Göz':
      return const Color(0xFFD8C4F2);
    case 'Yüz':
      return const Color(0xFFFFE0B2);
    case 'Cilt Bakımı':
      return const Color(0xFFB8E3D1);
    case 'Parfüm':
      return const Color(0xFFF9D5E5);
    case 'Saç Bakımı':
      return const Color(0xFFE8D5B7);
    case 'Vücut Bakımı':
      return const Color(0xFFCDE7F0);
    default:
      return const Color(0xFFE75480);
  }
}