import 'package:flutter/material.dart';

import 'tiered_pricing_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kumpulan Tugas Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Tugas Mobile'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Pilih Tugas yang Ingin Dibuka:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(
                  Icons.alt_route,
                  size: 40,
                  color: Colors.blue,
                ),
                title: const Text(
                  'Tugas 1: Routing & Navigation',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Daftar pengguna & detail profil Stateful',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LayarBeranda(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            Card(
              elevation: 3,
              child: ListTile(
                leading: const Icon(
                  Icons.card_membership,
                  size: 40,
                  color: Colors.amber,
                ),
                title: const Text(
                  'Tugas 2: Pricing Card',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Layout Stack & Card paket langganan'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TieredPricingPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LayarBeranda extends StatelessWidget {
  const LayarBeranda({super.key});

  final List<Map<String, String>> daftarPengguna = const [
    {
      'nama': 'Budi Santoso',
      'bio': 'Software Engineer yang menyukai pemrograman Flutter dan kopi.',
    },
    {
      'nama': 'Siti Rahma',
      'bio': 'UI/UX Designer fokus pada desain aplikasi mobile yang ramah pengguna.',
    },
    {
      'nama': 'Ahmad Fauzi',
      'bio':
          'Data Scientist yang senang mengeksplorasi AI dan machine learning.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 1: Daftar Pengguna'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: daftarPengguna.length,
        itemBuilder: (context, index) {
          final pengguna = daftarPengguna[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(pengguna['nama']!),
            subtitle: const Text('Ketuk untuk melihat detail'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LayarDetailProfil(
                    nama: pengguna['nama']!,
                    bio: pengguna['bio']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class LayarDetailProfil extends StatefulWidget {
  final String nama;
  final String bio;

  const LayarDetailProfil({super.key, required this.nama, required this.bio});

  @override
  State<LayarDetailProfil> createState() => _LayarDetailProfilState();
}

class _LayarDetailProfilState extends State<LayarDetailProfil> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil ${widget.nama}'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.account_circle, size: 120, color: Colors.blue),
            const SizedBox(height: 16),
            Text(
              widget.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.bio,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isFollowing ? Colors.grey : Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                setState(() {
                  _isFollowing = !_isFollowing;
                });
              },
              child: Text(_isFollowing ? 'Following' : 'Follow'),
            ),
          ],
        ),
      ),
    );
  }
}
