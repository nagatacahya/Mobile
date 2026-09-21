1. Alur Navigasi
Screen 1 (Beranda) menampilkan 3 card minuman menggunakan ListView.builder + ListTile.
Saat title item atau tombol "Lihat" (CTA) ditekan → Navigator.push() membuka Screen 2 (Detail Katalog) sambil membawa data item terpilih (Stack Navigation).
Di Screen 2, tombol back (baik icon custom maupun tombol back bawaan AppBar) memanggil Navigator.pop() untuk kembali ke Screen 1.

2. Konsep Event & State yang Diimplementasikan

DetailScreen dijadikan StatefulWidget karena memiliki dua variabel state yang berubah akibat interaksi pengguna (event):

isFavorite (bool) — berubah ketika tombol ikon hati (favorit) di AppBar ditekan. Setiap perubahan dibungkus setState() sehingga Flutter me-rebuild UI (icon & warna berubah, muncul SnackBar).
jumlahPesanan (int) — berubah ketika tombol tambah/kurang pada counter jumlah pesanan ditekan, juga melalui setState().

Pola umumnya:

Event (user menekan tombol)
      ↓
Event handler dipanggil (mis. _toggleFavorite())
      ↓
setState(() { /* ubah variabel state */ })
      ↓
Flutter membangun ulang (rebuild) widget dengan tampilan terbaru

Ini berbeda dengan HomeScreen (Screen 1) yang tetap StatelessWidget karena tidak memiliki data internal yang berubah — ia hanya menampilkan daftar statis dan mendelegasikan aksi (navigasi) ke Navigator.

3. Elemen Visual Screen 2 (sesuai requirement)
Icon back (kembali ke Screen 1)
Text nama & harga katalog
Container dengan latar pastel + padding sebagai tempat deskripsi
Layout vertikal menggunakan Column
AppBar agar tombol "Kembali" bawaan perangkat otomatis tersedia