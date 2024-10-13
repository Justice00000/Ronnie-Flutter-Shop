// lib/main.dart
// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';
import 'product.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ronnie Flutter Store',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light, // Set the initial theme mode to light
      home: CatalogPage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class CatalogPage extends StatelessWidget {
  final RxBool isDarkMode = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ronnie Flutter Store'),
        actions: [
          Obx(() => IconButton(
                icon: Icon(isDarkMode.value ? Icons.dark_mode : Icons.light_mode),
                onPressed: () {
                  isDarkMode.value = !isDarkMode.value;
                  Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
                },
              )),
        ],
      ),
      body: ProductGrid(), // Display product grid
    );
  }
}

// GridView for displaying the products
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 2 / 3, // Aspect ratio for product cards
          crossAxisSpacing: 10, // Space between columns
          mainAxisSpacing: 10, // Space between rows
        ),
        itemCount: products.length, // Number of products in the list
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

// ProductCard widget displaying individual products
class ProductCard extends StatelessWidget {
  final Product product;

  // ignore: use_super_parameters
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.snackbar('Product Selected', product.name, snackPosition: SnackPosition.BOTTOM);
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(product.imageUrl, height: 100), // Load from assets
            const SizedBox(height: 10),
            Text(product.name, style: const TextStyle(fontSize: 16)),
            Text("\$${product.price.toStringAsFixed(2)}", style: const TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}