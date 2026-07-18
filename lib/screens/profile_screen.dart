import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF7F9),
        title: const Text('Profilim', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE75480),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person, size: 44, color: Colors.white),
                  ),
                  const SizedBox(height: 14),
                  const Text('Meryem Karaman', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('meryem@glowup.com', style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _ProfileStat(label: 'Sipariş', value: '12'),
                  _ProfileStat(label: 'Favori', value: '8'),
                  _ProfileStat(label: 'Puan', value: '4.9'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Hesap', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 10),
            _ProfileTile(icon: Icons.shopping_bag_outlined, title: 'Siparişlerim'),
            _ProfileTile(icon: Icons.location_on_outlined, title: 'Adreslerim'),
            _ProfileTile(icon: Icons.payment_outlined, title: 'Ödeme Yöntemlerim'),
            const SizedBox(height: 20),
            const Text('Diğer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 10),
            _ProfileTile(icon: Icons.notifications_outlined, title: 'Bildirimler'),
            _ProfileTile(icon: Icons.help_outline, title: 'Yardım & Destek'),
            _ProfileTile(icon: Icons.settings_outlined, title: 'Ayarlar'),
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;
  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFE75480))),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
      ],
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const _ProfileTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFE75480)),
        title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}