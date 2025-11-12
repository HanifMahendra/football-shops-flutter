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