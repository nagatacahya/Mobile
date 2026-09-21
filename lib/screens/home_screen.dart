import 'package:flutter/material.dart';

/// =======================================================================
/// screens/home_screen.dart
/// Screen 1 (Beranda/Katalog) -> StatelessWidget
/// Screen 2 (Detail Katalog)  -> StatefulWidget (event & state)
/// =======================================================================

class KatalogItem {
  final String nama;
  final String harga;
  final String deskripsi;
  final IconData icon;
  final Color warnaPastel;

  const KatalogItem({
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.icon,
    required this.warnaPastel,
  });
}

final List<KatalogItem> daftarKatalog = [
  const KatalogItem(
    nama: 'Kopi Susu Gula Aren',
    harga: 'Rp 18.000',
    deskripsi:
        'Perpaduan espresso, susu segar, dan gula aren asli yang manis '
        'legit. Cocok dinikmati saat santai maupun begadang mengerjakan tugas.',
    icon: Icons.coffee,
    warnaPastel: Color(0xFFFFE0B2),
  ),
  const KatalogItem(
    nama: 'Matcha Latte',
    harga: 'Rp 22.000',
    deskripsi:
        'Bubuk matcha premium dari Jepang dicampur susu creamy, memberikan '
        'rasa earthy yang khas dan menyegarkan.',
    icon: Icons.emoji_food_beverage,
    warnaPastel: Color(0xFFC8E6C9),
  ),
  const KatalogItem(
    nama: 'Choco Frappe',
    harga: 'Rp 20.000',
    deskripsi:
        'Minuman dingin dengan campuran coklat premium dan es krim, '
        'disajikan dengan whipped cream di atasnya.',
    icon: Icons.icecream,
    warnaPastel: Color(0xFFD1C4E9),
  ),
];

/// ---- SCREEN 1: BERANDA / KATALOG (StatelessWidget) ----
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Katalog Minuman'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        itemCount: daftarKatalog.length,
        itemBuilder: (context, index) {
          final item = daftarKatalog[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              leading: CircleAvatar(
                backgroundColor: item.warnaPastel,
                child: Icon(item.icon, color: Colors.black87),
              ),
              title: Text(
                item.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item.harga),
              trailing: ElevatedButton(
                onPressed: () => _bukaDetail(context, item),
                child: const Text('Lihat'),
              ),
              onTap: () => _bukaDetail(context, item),
            ),
          );
        },
      ),
    );
  }

  void _bukaDetail(BuildContext context, KatalogItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(item: item)),
    );
  }
}

/// ---- SCREEN 2: DETAIL KATALOG (StatefulWidget) ----
class DetailScreen extends StatefulWidget {
  final KatalogItem item;

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  int jumlahPesanan = 1;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          isFavorite
              ? '${widget.item.nama} ditambahkan ke favorit'
              : '${widget.item.nama} dihapus dari favorit',
        ),
      ),
    );
  }

  void _ubahJumlah(int delta) {
    setState(() {
      final hasil = jumlahPesanan + delta;
      if (hasil >= 1) {
        jumlahPesanan = hasil;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.nama),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Kembali ke Katalog',
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: item.warnaPastel,
                child: Icon(item.icon, size: 60, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              item.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              item.harga,
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: item.warnaPastel.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(item.deskripsi),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Jumlah Pesanan',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => _ubahJumlah(-1),
                    ),
                    Text(
                      '$jumlahPesanan',
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => _ubahJumlah(1),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
