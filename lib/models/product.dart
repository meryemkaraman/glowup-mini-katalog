class Product {
  final int id;
  final String name;
  final String brand;
  final double price;
  final double rating;
  final String description;
  final String category;
  final String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.rating,
    required this.description,
    required this.category,
    required this.imagePath,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'price': price,
      'rating': rating,
      'description': description,
      'category': category,
      'imagePath': imagePath,
    };
  }
}