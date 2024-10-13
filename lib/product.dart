// product.dart
class Product {
  final String name;
  final String imageUrl;
  final double price;
  final bool isAssetImage;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isAssetImage = true, // By default, we assume asset images
  });
}

List<Product> products = [
  Product(name: "Self Care", imageUrl: "assets/img1.jpg", price: 49.99),
  Product(name: "Ladies Pride", imageUrl: "assets/img2.jpg", price: 79.99),
  Product(name: "Mommy's Special", imageUrl: "assets/img3.jpg", price: 99.99),
];