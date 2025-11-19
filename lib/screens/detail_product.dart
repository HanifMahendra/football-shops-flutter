import 'package:flutter/material.dart';
import 'package:football_shops/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            if (product.fields.thumbnail.isNotEmpty)
              Center(
                child: Image.network(
                  product.fields.thumbnail,
                  height: 200,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, size: 100);
                  },
                ),
              ),
            const SizedBox(height: 20),
            
            // Name
            Text(
              product.fields.name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            
            // Price
            Text(
              "Rp ${product.fields.price}",
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            
            // Description
            const Text(
              "Description:",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.fields.description,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20),
            
            // Category
            Row(
              children: [
                const Text(
                  "Category: ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Chip(
                  label: Text(product.fields.category),
                  backgroundColor: Colors.blue.shade100,
                ),
              ],
            ),
            const SizedBox(height: 10),
            
            // Featured
            Row(
              children: [
                Icon(
                  product.fields.isFeatured ? Icons.star : Icons.star_border,
                  color: product.fields.isFeatured ? Colors.amber : Colors.grey,
                  size: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  product.fields.isFeatured ? "Featured Product" : "Regular Product",
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Back Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Product List'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}