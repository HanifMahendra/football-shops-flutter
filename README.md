# football_shops

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Pertanyaan:
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Jawaban:
1. Widget Tree pada Flutter

**Widget Tree** adalah struktur hierarki berbentuk pohon yang menggambarkan bagaimana widget-widget di Flutter disusun dan saling berhubungan.

**Cara kerja hubungan parent-child:**
- Setiap widget dapat memiliki widget lain sebagai child (anak)
- Widget parent mengatur dan membungkus widget child-nya
- Informasi dan constraint mengalir dari parent ke child (top-down)
- Child mewarisi konteks dari parent-nya
- Perubahan pada parent dapat mempengaruhi semua child di bawahnya

2. Widget yang Digunakan dalam Proyek Ini

Berikut adalah semua widget yang saya gunakan beserta fungsinya:

**A. Widget Struktural & Layout**

**MaterialApp** (`lib/main.dart`)
- Root widget aplikasi yang menyediakan Material Design
- Mengatur theme, title, dan home page aplikasi

**Scaffold** (`lib/menu.dart`)
- Menyediakan struktur visual dasar halaman (AppBar, Body)
- Framework untuk layout halaman dengan komponen standar Material Design

**AppBar** (`lib/menu.dart`)
- Bar di bagian atas aplikasi
- Menampilkan judul "Football Shop"

**Padding** (`lib/menu.dart`)
- Menambahkan padding/jarak di sekitar child widget
- Digunakan di body dan beberapa widget lain untuk spacing

**Column** (`lib/menu.dart`)
- Menyusun widget children secara vertikal
- Digunakan untuk layout utama halaman

**Row** (`lib/menu.dart`)
- Menyusun widget children secara horizontal
- Digunakan untuk menampilkan InfoCard (NPM, Name, Class) secara berjajar

**Center** (`lib/menu.dart`)
- Menempatkan child widget di tengah
- Digunakan untuk memusatkan konten

**SizedBox** (`lib/menu.dart`)
- Box dengan ukuran tertentu untuk memberikan jarak
- Memberi spacing antar widget (16.0 dan 8.0)

**Container** (`lib/menu.dart`)
- Widget serbaguna untuk styling, padding, dan layout
- Digunakan di InfoCard dan ItemCard untuk mengatur tampilan

**GridView.count** (`lib/menu.dart`)
- Menampilkan widget dalam bentuk grid dengan jumlah kolom tetap
- Digunakan untuk menampilkan 3 tombol product dalam grid 3 kolom


**B. Widget Tampilan**

**Text** (`lib/menu.dart`)
- Menampilkan teks
- Digunakan untuk judul, content InfoCard, dan label tombol

**Icon** (`lib/menu.dart`)
- Menampilkan icon Material Design
- Digunakan di ItemCard (shopping_bag, inventory, add_box)

**Card** (`lib/menu.dart`)
- Container dengan elevasi dan rounded corners
- Digunakan untuk InfoCard yang menampilkan NPM, Name, dan Class


**C. Widget Interaktif**

**Material** (`lib/menu.dart`)
- Menyediakan Material Design visual effects
- Digunakan sebagai wrapper ItemCard dengan warna dan border radius

**InkWell** (`lib/menu.dart`)
- Area yang responsif terhadap touch dengan efek ripple
- Menangani event onTap untuk menampilkan SnackBar saat tombol ditekan

**SnackBar** (`lib/menu.dart`)
- Pesan sementara yang muncul di bagian bawah layar
- Menampilkan konfirmasi saat tombol product ditekan


**D. Widget Utility & Helper**

**MediaQuery** (`lib/menu.dart`)
- Mengakses informasi tentang ukuran dan orientasi device
- Digunakan untuk menentukan lebar responsif InfoCard (`size.width / 3.5`)

**Theme** (`lib/main.dart` & `lib/menu.dart`)
- Mengakses theme data aplikasi
- Digunakan untuk mengatur warna AppBar (`colorScheme.primary`)

**ScaffoldMessenger** (`lib/menu.dart`)
- Mengelola SnackBar di dalam Scaffold
- Digunakan untuk show/hide SnackBar saat interaksi user


**E. Custom Widget (Dibuat Sendiri)**

**MyHomePage** (`lib/menu.dart`)
- StatelessWidget custom untuk halaman utama aplikasi
- Menampilkan Row of InfoCard dan GridView of ItemCard

**InfoCard** (`lib/menu.dart`)
- StatelessWidget custom untuk menampilkan informasi NPM, Name, dan Class
- Berupa Card dengan title dan content yang di-display secara vertikal

**ItemCard** (`lib/menu.dart`)
- StatelessWidget custom untuk tombol product
- Menampilkan icon, text, dan warna berbeda untuk setiap item
- Memiliki interaksi tap dengan SnackBar

**ItemHomepage** (`lib/menu.dart`)
- Class model (bukan widget) untuk menyimpan data item
- Menyimpan properti: name, icon, dan color untuk setiap product button

3. Fungsi Widget MaterialApp

**MaterialApp** adalah widget yang menyediakan struktur dan konfigurasi dasar untuk aplikasi Material Design.

**Fungsi utama:**
- Menyediakan **theme** (warna, font, style) untuk seluruh aplikasi
- Mengatur **routing** dan navigasi antar halaman
- Menyediakan **localization** untuk multi-bahasa
- Mengatur **title** aplikasi
- Menyediakan widget-widget Material Design lainnya

**Mengapa sering jadi root widget?**
1. **Menyediakan konteks Material Design** - Widget di bawahnya bisa menggunakan Material Design components
2. **Navigator bawaan** - Memudahkan navigasi antar screen
3. **Theme konsisten** - Semua widget child mengikuti theme yang sama
4. **Best practice** - Standar dalam Flutter development
5. **MediaQuery & Directionality** - Menyediakan informasi penting tentang device

4. StatelessWidget vs StatefulWidget

**---StatelessWidget---**
Widget yang **tidak berubah** (immutable) setelah dibuat.

**Karakteristik:**
- Tidak memiliki state internal
- Hanya rebuild ketika parent-nya rebuild
- Lebih ringan dan cepat
- Hanya memiliki method `build()`

**Kapan digunakan:**
- Tampilan statis (teks, icon, gambar)
- Widget yang hanya menampilkan data tanpa interaksi
- UI yang tidak perlu diupdate

**---StatefulWidget---**
Widget yang **bisa berubah** (mutable) dan memiliki state.

**Karakteristik:**
- Memiliki state internal yang bisa berubah
- Dapat rebuild UI dengan `setState()`
- Terdiri dari 2 class: Widget class & State class
- Lebih kompleks tapi lebih fleksibel

**Kapan digunakan:**
- Form dengan input user
- Animasi
- Data yang berubah dari API
- Counter, timer, atau nilai yang berubah
- Interaksi user (button press, checkbox, dll)

5. apa itu BuildContext?

**BuildContext** adalah handle/reference ke lokasi widget dalam widget tree.

**Fungsi penting:**
- **Mengakses theme** - `Theme.of(context)`
- **Navigasi** - `Navigator.of(context).push()`
- **MediaQuery** - `MediaQuery.of(context)` untuk ukuran screen
- **Menampilkan dialog/snackbar** - `showDialog(context: context)`
- **Mengakses InheritedWidget** - Mengambil data dari parent

**Mengapa penting:**
- Setiap widget punya context unik yang menunjukkan posisinya di tree
- Memungkinkan widget berkomunikasi dengan widget lain di tree
- Menyediakan akses ke data dan service dari parent widgets

**Penggunaan di method build:**
```dart
@override
Widget build(BuildContext context) {
  // Mengakses theme
  final theme = Theme.of(context);
  
  // Mengakses ukuran screen
  final screenWidth = MediaQuery.of(context).size.width;
  
  // Navigasi
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => NewPage())
  );
  
  return Container(
    color: theme.primaryColor,
    width: screenWidth,
  );
}
```

6. Hot Reload vs Hot Restart

**Hot Reload**
Memuat ulang **kode yang berubah** tanpa kehilangan state aplikasi.

**Karakteristik:**
- Sangat cepat (biasanya < 1 detik)
- **State tetap terjaga**
- Hanya reload file yang berubah
- Shortcut: `r` di terminal

**Kapan digunakan:**
- Mengubah UI (layout, warna, text)
- Menambah widget baru
- Mengubah logic di method
- Development sehari-hari

**Contoh:** Mengubah `Text('Hello')` menjadi `Text('Hi')` - state counter tetap pada nilai sebelumnya.

**Hot Restart**
Restart aplikasi dari awal dan **reset semua state**.

**Karakteristik:**
- Lebih lambat dari hot reload (beberapa detik)
- **Semua state hilang**
- Aplikasi dimulai dari awal (`main()`)
- Shortcut: `R` (kapital) di terminal

**Kapan digunakan:**
- Mengubah global variables atau constants
- Mengubah `main()` function
- Menambah/mengubah dependencies baru
- Ketika hot reload tidak berfungsi
- Mengubah enum atau class constructor

**Perbedaan Utama:**
**Aspek:**
-KECEPATAN-
Hot Reload: Sangat cepat
Hot Restart: Sedang

-STATE-
Hot Reload: Dipertahankan
Hot Restart: Direset

-SCOPE-
Hot Reload: File yang berubah
Hot Restart: Seluruh aplikasi

-KAPAN-
Hot Reload: Perubahan UI
Hot Restart: Perubahan struktur