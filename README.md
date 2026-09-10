# Aplikasi Katalog Profil - Tugas Module Mobile Dev #4

Aplikasi Flutter sederhana yang menampilkan daftar katalog profil pengguna dan halaman detail interaktif menggunakan prinsip *Stack Navigation* (`Navigator.push`) serta *State Management* dasar (`StatefulWidget`).

---

## Tujuan Pembelajaran
* Memahami konsep dasar **Routing & Navigation** pada Flutter.
* Menggunakan kelas `Navigator` dan prinsip **Stack Navigation** untuk berpindah antar screen.
* Menyusun tata letak (layout) UI menggunakan widget `Column`, `ListView`, `ListTile`, `Container`, `Icon`, dan `Text`.
* Memahami perbedaan siklus hidup (*lifecycle*) antara `StatelessWidget` dan `StatefulWidget`.

---

## Fitur Aplikasi

1. **Screen 1 (Beranda / Katalog Profil)**
   * Menampilkan daftar berisi 3 `Card` katalog profil pengguna.
   * Masing-masing card memiliki tombol/area interaktif (*Call to Action*).
   * Menavigasikan pengguna ke Screen Detail saat card diklik menggunakan `Navigator.push`.

2. **Screen 2 (Detail Katalog Profil)**
   * Menampilkan informasi detail profil pengguna yang dipilih.
   * Dibangun menggunakan `StatefulWidget`.
   * Memiliki perubahan *state* interaktif pada tombol (misal: Follow/Unfollow atau Like) yang memperbarui tampilan secara langsung.