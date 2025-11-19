import 'package:flutter/material.dart';
import 'package:football_shops/models/product_entry.dart';
import 'package:football_shops/screens/detail_product.dart';
import 'package:football_shops/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // GANTI URL dengan endpoint Django Anda
    final response = await request.get('http://localhost:8000/json/');
    
    var data = response;
    
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data produk pada Football Shop.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  var product = snapshot.data![index].fields;
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Rp ${product.price}"),
                          const SizedBox(height: 10),
                          Text(product.description),
                          const SizedBox(height: 10),
                          Text("Category: ${product.category}"),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                product.isFeatured
                                    ? Icons.star
                                    : Icons.star_border,
                                color: product.isFeatured
                                    ? Colors.amber
                                    : Colors.grey,
                              ),
                              const SizedBox(width: 5),
                              Text(product.isFeatured
                                  ? "Featured"
                                  : "Not Featured"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}