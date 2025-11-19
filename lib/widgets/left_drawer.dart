import 'package:flutter/material.dart';
import 'package:football_shops/menu.dart';
import 'package:football_shops/productentry_form.dart';
import 'package:football_shops/screens/list_productentry.dart'; // TAMBAHKAN INI

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Football Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Atur produk sepak bola favoritmu di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          // TAMBAHKAN MENU INI
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Daftar Product'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Tambah Product'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}