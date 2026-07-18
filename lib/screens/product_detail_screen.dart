import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_image.dart';
import '../widgets/rating_stars.dart';
import '../widgets/review_card.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final bool isFavorite;
  final Function(Product, int) onAddToCart;
  final VoidCallback onFavoriteToggle;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onAddToCart,
    required this.onFavoriteToggle,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 340,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black87, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: const Color(0xFFE75480),
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() => isFavorite = !isFavorite);
                      widget.onFavoriteToggle();
                    },
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'product-image-${product.id}',
                child: ProductImage(imagePath: product.imagePath),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              transform: Matrix4.translationValues(0, -20, 0),
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.brand, style: TextStyle(fontSize: 13, color: Colors.grey.shade500, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      RatingStars(rating: product.rating, size: 16),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE75480).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      product.category,
                      style: const TextStyle(color: Color(0xFFE75480), fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${product.price.toStringAsFixed(2)} TL',
                    style: const TextStyle(fontSize: 24, color: Color(0xFFE75480), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  const Text('Ürün Açıklaması', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 14, height: 1.5, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      const Text('Adet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF0F3),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => setState(() => quantity = quantity > 1 ? quantity - 1 : 1),
                              icon: const Icon(Icons.remove, size: 18),
                              color: const Color(0xFFE75480),
                            ),
                            Text('$quantity', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            IconButton(
                              onPressed: () => setState(() => quantity = quantity < 10 ? quantity + 1 : 10),
                              icon: const Icon(Icons.add, size: 18),
                              color: const Color(0xFFE75480),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Değerlendirmeler', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Row(
                        children: [
                          RatingStars(rating: product.rating, size: 14),
                          const SizedBox(width: 4),
                          Text('(${sampleReviews.length})', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...sampleReviews.map((r) => ReviewCard(review: r)),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        widget.onAddToCart(product, quantity);
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.shopping_bag_outlined, size: 20),
                      label: Text('Sepete Ekle • ${(product.price * quantity).toStringAsFixed(2)} TL'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}