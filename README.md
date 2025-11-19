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


-Tugas 7-
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

-- (Pemisah, biar nomornya ga kegabung di github)

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

Aspek:

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

-Tugas 8-

Pertanyaan:
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Jawaban:
1. Navigator.push() vs Navigator.pushReplacement():

Navigator.push() -> Menambahkan halaman baru di atas stack navigasi, halaman sebelumnya tetap ada di memori.
Contoh:
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProductDetailPage()),
);
Kapan digunakan:
- Melihat detail produk dari halaman utama
- Membuka form tambah produk dari menu
- Navigasi ke halaman keranjang
- Semua navigasi yang user perlu kembali ke halaman sebelumnya

Navigator.pushReplacement() -> Mengganti halaman saat ini dengan halaman baru, halaman lama dihapus dari stack.
Contoh:
dartNavigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => HomePage()),
);
Kapan digunakan:
- Setelah login berhasil → ke homepage (user tidak perlu kembali ke login)
- Setelah logout → ke login page (user tidak bisa back ke homepage)
- Setelah submit form produk → ke halaman daftar produk (menghindari submit ganda)
- Splash screen → main screen

Contoh kasus konkret:
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      // Simpan data produk
      saveProduct();
      
      // Gunakan pushReplacement agar user tidak bisa
      // kembali ke form dan submit lagi
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductListPage()),
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produk berhasil ditambahkan!')),
      );
    }
  },
  child: Text('Simpan Produk'),
)

2. Hierarcy Widget untuk Struktur yang Konsisten:
(Scaffold - Struktur Dasar Halaman)
Scaffold menyediakan struktur material design standar:

ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Football Shop'),
        backgroundColor: Colors.green[800],
      ),
      drawer: ShopDrawer(), // Widget drawer yang reusable
      body: ProductGrid(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddProductPage()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

(AppBar - Header Konsisten)
Membuat AppBar yang seragam di seluruh aplikasi:

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  
  const ShopAppBar({required this.title});
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.sports_soccer),
          SizedBox(width: 8),
          Text(title),
        ],
      ),
      backgroundColor: Colors.green[800],
      elevation: 4,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          ),
        ),
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

(Drawer - Menu Navigasi Global)
Drawer konsisten untuk navigasi antar halaman:

ShopDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[800],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.sports_soccer, size: 48, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  'Football Shop',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  'Your Football Partner',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Daftar Produk'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text('Tambah Produk'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddProductPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              // Logout dan kembali ke login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

3. Kelebihan Layout Widget untuk Form
(Padding - Jarak dan Ruang - Space between)
Kelebihan:
- Memberi ruang antara elemen dengan border
- Meningkatkan readability
- Konsistensi spacing

AddProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Margin dari edge
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0), // Jarak antar field
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Nama Produk',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Harga',
                border: OutlineInputBorder(),
                prefixText: 'Rp ',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}

(SingleChildScrollView - Prevent Overflow)
Kelebihan:
- Mencegah overflow saat keyboard muncul
- Form panjang tetap accessible
- Smooth scrolling experience

ProductFormPage extends StatefulWidget {
  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(title: 'Tambah Produk'),
      body: SingleChildScrollView( // Membuat form bisa di-scroll
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nama Produk'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama produk tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Harga'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Deskripsi'),
                  maxLines: 5,
                  // Ketika keyboard muncul, SingleChildScrollView
                  // memastikan field ini tetap bisa diakses
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Submit form
                    }
                  },
                  child: Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

(ListView - Daftar Dinamis)
Kelebihan:
- Efficient rendering untuk list panjang
- Built-in scrolling
- Lazy loading dengan ListView.builder()

ProductListPage extends StatelessWidget {
  final List<Product> products = getProducts();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(title: 'Daftar Produk'),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[800],
                child: Icon(Icons.sports_soccer, color: Colors.white),
              ),
              title: Text(product.name),
              subtitle: Text('Rp ${product.price.toString()}'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

4. Kustomisasi Tema untuk Brand Identity
(Definisi Tema Global)
MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        // Primary color - warna hijau lapangan sepak bola
        primaryColor: Color(0xFF1B5E20), // Dark green
        primarySwatch: Colors.green,
        
        // Accent color - warna aksen
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF1B5E20),
          secondary: Color(0xFFFFEB3B), // Kuning seperti kartu kuning
        ),
        
        // AppBar theme
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1B5E20),
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
        ),
        
        // Button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1B5E20),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        
        // Card theme
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.all(8),
        ),
        
        // Input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF1B5E20), width: 2),
          ),
          labelStyle: TextStyle(color: Color(0xFF1B5E20)),
        ),
        
        // Text theme
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B5E20),
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1B5E20),
          ),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        
        // Icon theme
        iconTheme: IconThemeData(color: Color(0xFF1B5E20)),
      ),
      home: HomePage(),
    );
  }
}

(Penggunaan Tema di Komponen)
ProductCard extends StatelessWidget {
  final Product product;
  
  const ProductCard({required this.product});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      // Otomatis menggunakan CardTheme dari tema global
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.sports_soccer,
                    size: 64,
                    color: Theme.of(context).primaryColor, // Menggunakan warna tema
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineMedium, // Menggunakan text theme
              ),
              Text(
                'Rp ${product.price}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Manfaat Konsistensi Tema:
- Brand Recognition - User langsung mengenali aplikasi dari skema warna
- Maintainability - Ubah satu tempat, semua komponen ikut berubah
- Professional Look - Tampilan seragam dan polished
- Development Speed - Tidak perlu set warna manual di setiap widget
- Dark Mode Ready - Mudah menambahkan darkTheme parameter

-Tugas 9-
Pertanyaan:

1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Jawaban:

Mengapa Perlu Model Dart:

Type Safety
Model Dart memberikan type checking pada compile time. Ketika kita akses properti product.name, Flutter tahu bahwa itu String. Jika langsung pakai Map, semua data bertipe dynamic sehingga error baru ketahuan saat runtime.

Null Safety
Dengan model, kita bisa tentukan field mana yang nullable dan mana yang required. Misalnya String? untuk optional field dan String untuk required field. Map tidak memberi informasi ini sehingga potensi NullPointerException lebih tinggi.

Autocomplete & IntelliSense
IDE bisa kasih suggestion properti apa saja yang tersedia dalam model. Kalau pakai Map, IDE tidak tahu ada key apa saja, sehingga harus hafal atau cek dokumentasi terus.

Maintainability
Jika struktur JSON berubah, cukup update model di satu tempat. Kalau pakai Map langsung, harus cari semua tempat yang akses data tersebut dan update manual satu-satu.

Validation & Transformation
Di model bisa tambahkan logic seperti validasi harga tidak boleh negatif, format tanggal, atau konversi data. Dengan Map, logic tersebar di mana-mana.

Konsekuensi Tanpa Model:

Runtime Errors
Typo key name seperti "naem" instead of "name" baru ketahuan saat app crash. Dengan model, compile error langsung muncul.

Sulit Debugging
Error message kurang jelas karena semua dynamic. "Null is not a subtype of String" tanpa info field mana yang bermasalah.

Refactoring Nightmare
Kalau ada perubahan struktur data, harus cari manual semua tempat yang pakai data tersebut. Risiko miss satu tempat sangat tinggi.

Tidak Ada Dokumentasi
Programmer lain atau diri sendiri 3 bulan kemudian tidak tahu struktur data seperti apa tanpa buka dokumentasi API atau cek JSON response.

Performance Issue
Setiap akses data perlu type checking runtime karena semua dynamic, sedikit lebih lambat dibanding type yang sudah pasti.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Jawaban:

Package http:

Basic HTTP Operations
Package http adalah library standar untuk melakukan HTTP request seperti GET, POST, PUT, DELETE ke server. Fungsinya murni mengirim request dan menerima response.

Stateless
Setiap request berdiri sendiri, tidak menyimpan state atau session. Tidak ada mekanisme otomatis untuk menyimpan cookies atau authentication token antar request.

Simple & Lightweight
Cocok untuk API calls sederhana yang tidak perlu session management, seperti fetch data publik atau one-time request.

CookieRequest (dari pbp_django_auth):

Session Management
CookieRequest otomatis menangani cookies dan session. Setelah login, semua request berikutnya otomatis membawa session cookie tanpa perlu set manual.

Authentication Handling
Menyimpan status authenticated user, sehingga bisa cek apakah user sudah login atau belum dengan mudah.

Django Integration
Dirancang khusus untuk bekerja dengan Django backend, otomatis handle CSRF token dan Django session cookies.

Persistent State
Menyimpan state login di seluruh aplikasi. Setelah login sekali, semua request otomatis authenticated sampai logout.

Perbedaan Peran:

http - Stateless Worker
Seperti kurir yang setiap kali antar paket harus perkenalan dari awal. Tidak ingat siapa Anda atau transaksi sebelumnya. Cocok untuk public API atau request tanpa autentikasi.

CookieRequest - Stateful Worker
Seperti pegawai toko yang ingat Anda sebagai member. Sekali login, dia ingat Anda sampai logout. Otomatis bawa kartu member di setiap transaksi. Cocok untuk aplikasi yang perlu login dan session.

Kapan Pakai Mana:

Gunakan http kalau hanya perlu fetch data publik tanpa login, atau API yang pakai token di header manual.

Gunakan CookieRequest kalau ada sistem login/register, perlu maintain session, atau backend pakai Django session authentication.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Jawaban:

Single Source of Truth:

Konsistensi Session
Satu instance CookieRequest memastikan semua komponen melihat status login yang sama. Kalau user login di halaman A, halaman B langsung tahu user sudah login tanpa perlu login lagi.

Synchronized State
Jika ada perubahan status seperti logout, semua komponen otomatis aware. Tidak ada situasi di mana sebagian komponen pikir user masih login padahal sudah logout.

Shared Cookies
Cookies dan session token disimpan di satu tempat. Semua request dari komponen manapun otomatis membawa cookies yang sama untuk authentikasi.

Efficiency:

Memory Efficient
Hemat memory karena hanya satu instance, bukan setiap komponen bikin instance sendiri yang duplikat.

Network Efficiency
Koneksi HTTP dapat di-reuse untuk multiple requests, tidak perlu establish connection baru setiap kali.

No Re-authentication
User tidak perlu login berulang kali saat pindah halaman atau komponen.

Developer Experience:

Easy Access
Setiap komponen bisa akses CookieRequest dengan mudah via Provider.of<CookieRequest>(context) tanpa perlu pass-down lewat constructor bertingkat.

Centralized Logic
Logic authentication dan session handling terpusat di satu tempat, mudah di-maintain dan di-debug.

Loose Coupling
Komponen tidak perlu tahu detail implementasi session, cukup akses CookieRequest yang sudah ready to use.

Implementasi dengan Provider:

Provider pattern memungkinkan CookieRequest tersedia di seluruh widget tree. Widget manapun bisa akses instance yang sama tanpa perlu explicit passing. Ini membuat kode lebih bersih dan maintainable.

Analogi:
Seperti kartu ATM bank. Satu kartu (instance) dipakai di berbagai ATM (komponen). Semua ATM baca data yang sama dari kartu tersebut. Kalau bikin instance baru di setiap komponen, seperti punya banyak kartu ATM berbeda untuk satu rekening - membingungkan dan tidak efisien.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Jawaban:

Konfigurasi Django:

ALLOWED_HOSTS dengan 10.0.2.2:

Mengapa Perlu:
10.0.2.2 adalah special IP address yang emulator Android gunakan untuk mengakses localhost komputer host. Ketika Flutter app di emulator mencoba connect ke Django di laptop, request dikirim ke 10.0.2.2 bukan localhost atau 127.0.0.1.

Django secara default hanya menerima request dari localhost. Untuk terima request dari emulator, perlu explicitly tambahkan 10.0.2.2 ke ALLOWED_HOSTS.

Jika Tidak Dikonfigurasi:
Django akan reject semua request dari emulator dengan error 400 Bad Request. App Flutter tidak bisa connect ke backend sama sekali. Error message: "Invalid HTTP_HOST header".

CORS (Cross-Origin Resource Sharing):

Mengapa Perlu:
Flutter dan Django berjalan di origin yang berbeda (different host/port). Browser security policy secara default block request lintas origin untuk keamanan.

CORS headers memberitahu browser bahwa Django mengizinkan request dari Flutter origin tertentu. Ini mencegah CORS policy error.

Jika Tidak Dikonfigurasi:
Browser akan block semua HTTP request dari Flutter dengan CORS policy error. Network request gagal sebelum sampai ke Django. Di console browser muncul: "Access to XMLHttpRequest has been blocked by CORS policy".

SameSite Cookie Settings:

Mengapa Perlu:
Modern browser menerapkan SameSite cookie policy ketat untuk keamanan. Default-nya cookie tidak dikirim pada cross-site request.

Setting SameSite=None dan Secure=True memungkinkan cookie (termasuk session cookie) dikirim dari Flutter ke Django meskipun berbeda origin.

Jika Tidak Dikonfigurasi:
Session cookies tidak ter-attach pada request. User harus login berulang kali karena Django tidak recognize session. Authenticated request gagal karena tidak ada cookie authentication.

CSRF Trusted Origins:

Mengapa Perlu:
Django punya CSRF protection untuk prevent malicious request. Flutter perlu ditambahkan sebagai trusted origin agar POST request tidak di-reject.

Jika Tidak Dikonfigurasi:
Semua POST, PUT, DELETE request ditolak dengan error 403 Forbidden CSRF verification failed. Hanya GET request yang sukses.

Konfigurasi Android:

Internet Permission di AndroidManifest.xml:

Mengapa Perlu:
Android secara default tidak mengizinkan aplikasi akses internet untuk security reason. Perlu explicit declaration di manifest file bahwa app butuh internet access.

Jika Tidak Dikonfigurasi:
App tidak bisa melakukan network request sama sekali. Semua HTTP calls gagal dengan security exception. Tidak ada koneksi ke backend.

Network Security Config (untuk HTTP non-HTTPS):

Mengapa Perlu:
Android 9 ke atas block cleartext (HTTP) traffic secara default, hanya allow HTTPS. Untuk development dengan localhost HTTP, perlu tambahkan security config yang allow cleartext.

Jika Tidak Dikonfigurasi:
Request ke HTTP localhost fail dengan cleartext not permitted error. App hanya bisa connect ke HTTPS endpoints.

Skenario Error Lengkap:

Tanpa 10.0.2.2:
Flutter app kirim request ke Django, Django jawab "I don't serve that host" - HTTP 400.

Tanpa CORS:
Request sampai ke Django tapi browser block response - CORS error di Flutter console.

Tanpa SameSite Config:
Request sukses tapi cookies tidak ter-save/ter-kirim - User tidak bisa maintain login session.

Tanpa Internet Permission:
App bahkan tidak bisa initiate network request - Security exception sebelum request dikirim.

Tanpa Network Security Config:
Cleartext HTTP blocked - Connection refused atau security error.

Semua konfigurasi ini harus lengkap agar komunikasi Flutter-Django lancar, terutama untuk fitur authentication dan session management.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Jawaban:

Alur Pengiriman Data:

Input di Flutter:

User mengisi form di Flutter app, misalnya form tambah produk dengan field nama, harga, dan deskripsi. Data divalidasi dulu di Flutter untuk ensure format benar dan required field terisi.

Setelah validasi lokal pass, Flutter mengambil semua nilai dari form controllers dan menyusunnya menjadi JSON object yang sesuai dengan format yang Django expect.

Serialisasi dan Request:

Data dari form di-convert menjadi JSON string. CookieRequest atau http package membuat HTTP POST request dengan JSON data tersebut di body dan session cookies di header untuk authentication.

Request dikirim ke Django endpoint yang tepat, misalnya /api/products/create/ dengan method POST dan Content-Type application/json.

Penerimaan di Django:

Django menerima request dan pertama-tama cek authentication via session cookie atau token. Jika tidak authenticated, langsung return 401 Unauthorized.

Django view function mem-parse JSON dari request.body menjadi Python dictionary yang bisa diproses.

Validasi dan Pemrosesan di Django:

Django melakukan validasi server-side, cek apakah semua required field ada, tipe data benar, dan business logic terpenuhi seperti harga tidak boleh negatif.

Jika validasi gagal, Django return response error dengan detail masalahnya. Jika sukses, Django create model instance baru atau update yang ada.

Penyimpanan Database:

Django model instance di-save ke database. ORM Django otomatis generate SQL query yang sesuai dan eksekusi ke database PostgreSQL/MySQL/SQLite.

Database return confirmation bahwa data berhasil tersimpan atau error jika ada constraint violation seperti duplicate unique field.

Response ke Flutter:

Django serialize model instance yang baru dibuat menjadi JSON menggunakan serializers atau manual dict conversion. Include semua field yang Flutter butuhkan plus metadata seperti ID dan timestamp.

Django return HTTP response 200 OK atau 201 Created dengan JSON data di body. Include success message atau detail object yang baru dibuat.

Penerimaan Response di Flutter:

Flutter menerima response dan pertama cek status code. Jika 200-299 berarti success, selain itu berarti error.

JSON response di-parse menjadi Map atau langsung di-deserialize menjadi Dart model object menggunakan fromJson factory constructor.

Update UI:

Jika pakai state management seperti Provider atau setState, Flutter update state dengan data baru dari server. Ini trigger rebuild widget yang listen ke state tersebut.

UI otomatis refresh menampilkan data terbaru. Bisa tampilkan SnackBar success message, navigate ke halaman list yang updated, atau refresh current page.

Penampilan Data di List:

Untuk menampilkan data, Flutter fetch list dari Django via GET request. Django query database, serialize semua objects jadi JSON array, dan return sebagai response.

Flutter deserialize JSON array menjadi List of model objects. List ini kemudian di-map ke widget list items menggunakan ListView.builder atau GridView.

Setiap item ditampilkan dengan data dari model seperti nama, harga, dan gambar. User bisa tap item untuk lihat detail atau edit.

Caching dan Offline:

Untuk performa lebih baik, Flutter bisa cache response di local storage atau memory. Data ditampilkan langsung dari cache sambil fetch update dari server di background.

Jika offline, app tetap bisa tampilkan cached data dan queue request untuk dikirim saat online kembali.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Jawaban:

Proses Register:

Input di Flutter:
User mengisi form registrasi dengan username, password, dan confirm password. Flutter validasi lokal seperti password minimal 8 karakter dan kedua password harus sama.

Setelah validasi pass, Flutter kirim POST request ke Django endpoint /auth/register/ dengan JSON berisi username dan password. Tidak perlu session cookie karena belum login.

Pemrosesan di Django:
Django terima request dan cek apakah username sudah dipakai. Jika ya, return error "Username already exists".

Jika username available, Django create User object baru dengan password yang di-hash menggunakan Django password hasher untuk security. Password tidak pernah disimpan plain text.

Django save user ke database dan return success response dengan pesan "User created successfully" dan status 201 Created.

Response di Flutter:
Flutter terima response sukses dan tampilkan SnackBar confirmation. Kemudian otomatis navigate ke halaman login atau langsung login user tersebut.

Proses Login:

Input di Flutter:
User input username dan password di login form. Flutter tidak validasi password format karena sudah ada user yang existing.

Flutter kirim POST request ke /auth/login/ dengan credentials. CookieRequest digunakan untuk otomatis handle session cookies yang akan di-return.

Autentikasi di Django:
Django view function authenticate credentials menggunakan Django authentication system yang cek username dan verify password hash.

Jika credentials salah, return error 401 dengan message "Invalid username or password". Tidak specify mana yang salah untuk security.

Jika credentials benar, Django create session untuk user. Session ID di-generate dan disimpan di database atau cache, kemudian di-set sebagai cookie di response.

Django return response sukses dengan user data seperti username dan email, plus set session cookie di header Set-Cookie.

Session Management:
CookieRequest otomatis simpan session cookie yang dikembalikan Django. Cookie ini akan otomatis di-attach ke semua request berikutnya tanpa intervensi manual.

Session cookie punya expiry time, biasanya 2 minggu default Django. Setelah expire, user harus login lagi.

Update State di Flutter:
Flutter update authentication state via Provider atau state management lain, set isLoggedIn = true dan simpan user data.

Semua widget yang listen ke auth state otomatis rebuild. App navigate dari login page ke home page atau main menu.

Protected Routes:
Home page dan fitur lain yang butuh authentication cek auth state. Jika belum login, otomatis redirect ke login page.

Setiap request ke protected Django endpoints otomatis bawa session cookie untuk verification. Django cek session validity sebelum process request.

Akses Menu dan Fitur:

Authenticated Requests:
Ketika user akses fitur seperti lihat produk atau tambah item, Flutter kirim request dengan session cookie yang ter-attach otomatis via CookieRequest.

Django terima request, cek session cookie, dan verify bahwa session valid dan belum expire. Django juga load user object yang terkait dengan session.

Jika session valid, Django process request dan return data. Jika invalid atau expire, return 401 Unauthorized dan Flutter redirect user ke login.

User-Specific Data:
Django bisa return data yang specific untuk logged in user, seperti request.user.username atau filter produk yang dibuat user tersebut.

Flutter tampilkan data ini di UI, seperti "Welcome, John" di header atau show hanya produk milik user di dashboard personal.

Proses Logout:

Trigger di Flutter:
User tap logout button di drawer atau menu. Flutter kirim POST request ke /auth/logout/ dengan session cookie.

Cleanup di Django:
Django terima request, verify session, kemudian delete session dari database/cache. Session cookie di-invalidate.

Django return success response dan clear session cookie dengan Set-Cookie header yang expire cookie.

State Reset di Flutter:
CookieRequest clear semua cookies dan session data. Auth state di-reset ke logged out via Provider atau setState.

Flutter navigate user ke login page atau welcome screen. Semua cached user data dibersihkan untuk privacy.

Security Measures:

Password Hashing:
Django gunakan PBKDF2 algorithm untuk hash password dengan salt random. Ini mencegah password breach jika database leaked.

Session Hijacking Prevention:
Session cookie set dengan HttpOnly flag sehingga tidak bisa diakses JavaScript, dan Secure flag agar hanya dikirim via HTTPS di production.

CSRF Protection:
Django enforce CSRF token untuk semua state-changing requests. Flutter perlu include CSRF token yang di-fetch dari Django atau exempted untuk API endpoints.

Token Expiry:
Session otomatis expire setelah periode inactivity. User harus re-authenticate untuk continue, mencegah akses tidak authorized jika device tidak di-lock.

Whole Flow Summary:
Register membuat user baru, login create session dan return cookie, session cookie otomatis ter-attach di semua request untuk authenticate, protected features cek session validity, dan logout destroy session untuk end authentication. Semua ini seamless dari perspektif user yang hanya input credentials dan dapat akses fitur.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!

Jawaban:

Setup Django Authentication:

Pertama saya setup Django backend dengan install package django-cors-headers dan pbp-django-auth untuk handle CORS dan cookie authentication. Package ini penting agar Flutter bisa berkomunikasi dengan Django.

Di settings.py, saya tambahkan konfigurasi CORS dengan allow credentials True dan whitelist origin Flutter app. Juga setup SameSite cookie None dengan Secure False untuk development localhost.

Tambahkan 10.0.2.2 ke ALLOWED_HOSTS agar Django terima request dari Android emulator. Ini penting karena emulator akses laptop host via special IP tersebut bukan localhost biasa.

Buat Django app baru untuk authentication bernama authentication. Di app ini buat views untuk login, register, dan logout yang handle JSON request dari Flutter dan return JSON response.

Setup URL routing untuk authentication endpoints di urls.py, seperti /auth/login/, /auth/register/, dan /auth/logout/. Endpoint ini akan dipanggil Flutter untuk autentikasi.

Integrasi Authentication di Flutter:

Di Flutter, tambahkan dependency pbp_django_auth dan provider ke pubspec.yaml. Run flutter pub get untuk install packages.

Setup Provider di main.dart untuk share CookieRequest instance ke seluruh app. Wrap MaterialApp dengan Provider widget agar semua child bisa akses CookieRequest.

Buat halaman login.dart dengan form username dan password. Form ini pakai TextFormField dengan validation untuk ensure tidak kosong.

Implementasi logic login yang panggil CookieRequest.login dengan credentials. Jika sukses, navigate ke home page dan simpan auth state. Jika gagal, tampilkan error message via SnackBar.

Buat halaman register.dart mirip dengan login tapi ada field confirm password. Validasi bahwa kedua password sama sebelum kirim request.

Implementasi register logic yang panggil endpoint register Django. Jika sukses, navigate ke login page dengan message untuk user login dengan akun baru.

Membuat Custom Model:

Ambil sample JSON response dari Django endpoint menggunakan Postman atau browser. Copy JSON structure untuk produk atau data lain yang akan dipakai Flutter.

Gunakan tool Quicktype atau converter online untuk generate Dart model dari JSON. Paste JSON dan tool otomatis generate class dengan fromJson dan toJson methods.

Buat file baru di lib/models/ untuk simpan model class. Modify generated code jika perlu, seperti tambah validation atau custom methods.

Ensure model punya factory constructor fromJson yang parse Map menjadi model object, dan method toJson yang convert model ke Map untuk kirim ke Django.

Implementasi Fetch Data:

Buat halaman list untuk tampilkan data dari Django, seperti list_product.dart. Halaman ini StatefulWidget karena perlu manage loading state.

Di initState, panggil method untuk fetch data dari Django menggunakan CookieRequest.get dengan endpoint API yang return JSON array.

Parse JSON response menjadi List of model objects menggunakan fromJson constructor. Simpan list ini di state variable.

Tampilkan data menggunakan ListView.builder atau FutureBuilder yang otomatis handle async data fetching dan loading state.

Untuk setiap item, tampilkan card atau tile dengan informasi produk. Tambahkan onTap handler untuk navigate ke detail page dengan pass product object.

Implementasi Form Input:

Buat halaman form untuk tambah data baru, seperti productentry_form.dart. Form ini pakai Form widget dengan GlobalKey untuk validasi.

Tambahkan TextFormField untuk setiap field yang diperlukan dengan validator function. Validator cek apakah field kosong atau format salah.

Buat tombol submit yang trigger validation. Jika form valid, ambil data dari controllers dan buat JSON object.

Kirim POST request ke Django create endpoint menggunakan CookieRequest.postJson dengan JSON data. Tunggu response dari server.

Handle response, jika sukses tampilkan SnackBar dan navigate ke list page dengan pushReplacement agar user tidak bisa back ke form dan submit duplicate.

Jika gagal, parse error message dari response dan tampilkan di SnackBar atau dialog untuk inform user apa yang salah.

Filter dan Search:

Untuk fitur filter, tambahkan parameter query di GET request seperti /api/products/?category=shoes. Django view handle parameter ini untuk filter database query.

Di Flutter, buat dropdown atau chip filter yang update query parameter saat user pilih category atau filter option.

Reload data dengan call fetch function lagi dengan parameter baru. ListView otomatis update dengan filtered results.

Untuk search, tambahkan TextField di AppBar atau floating above list. Listen onChange event untuk update search query state.

Debounce search input agar tidak terlalu banyak request. Setelah user stop typing 500ms, baru kirim request dengan search query ke Django.

Django view search di database fields yang relevan seperti name atau description. Return filtered results sebagai JSON yang Flutter parse dan display.

Logout Implementation:

Tambahkan logout button di drawer atau profile menu. Button ini trigger logout function saat pressed.

Logout function panggil CookieRequest.logout yang kirim request ke Django logout endpoint. Django clear session dan return confirmation.

Setelah logout sukses, clear auth state di Provider dan navigate user ke login page dengan pushReplacement agar tidak bisa back.

Semua page yang butuh authentication cek auth state di build method. Jika tidak logged in, otomatis redirect ke login page.

Testing dan Debugging:

Test register flow dengan buat akun baru, verify di Django admin bahwa user created. Test login dengan credentials yang baru dibuat.

Test fetch data, ensure list ditampilkan dengan benar dan data match dengan yang ada di Django database. Test jika tidak ada data, loading state, dan error handling.

Test form submission, verify data masuk database Django dengan correct fields. Test validation error handling jika user submit invalid data.

Test logout, ensure session cleared dan user tidak bisa akses protected page tanpa login lagi. Test session persistence saat close dan reopen app.

Fix bugs yang ditemukan seperti null safety issues, async timing problems, atau UI glitches. Ensure error messages user-friendly dan informative.

Polish dan Finalisasi:

Tambahkan loading indicators saat fetch data atau submit form agar user tahu app sedang process request.

Improve error handling dengan try-catch block dan graceful error messages instead of crash.

Ensure consistent theming di semua pages sesuai brand identity Football Shop dengan green color scheme.

Add navigation flow yang smooth dengan proper page transitions dan back button handling.

Test di emulator dan physical device untuk ensure performance good dan tidak ada platform-specific issues.

Review code untuk ensure best practices, clean architecture, dan proper documentation dengan comments di bagian complex logic.