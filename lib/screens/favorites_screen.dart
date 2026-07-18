import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../utils/page_transition.dart';
import 'product_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Product> favoriteProducts;
  final Set<int> favoriteIds;
  final Function(int) onToggleFavorite;
  final Function(Product, int) onAddToCart;

  const FavoritesScreen({
    super.key,
    required this.favoriteProducts,
    required this.favoriteIds,
    required this.onToggleFavorite,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Favorilerim', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: favoriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  Text('Henüz favori ürünün yok', style: TextStyle(fontSize: 15, color: Colors.grey.shade500)),
                  const SizedBox(height: 6),
                  Text('Beğendiğin ürünlere kalp ikonuna dokun', style: TextStyle(fontSize: 13, color: Colors.grey.shade400)),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.68,
              ),
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final product = favoriteProducts[index];
                return ProductCard(
                  product: product,
                  isFavorite: favoriteIds.contains(product.id),
                  onFavoriteTap: () => onToggleFavorite(product.id),
                  onTap: () {
                    Navigator.push(
                      context,
                      fadeSlideRoute(
                        ProductDetailScreen(
                          product: product,
                          isFavorite: favoriteIds.contains(product.id),
                          onAddToCart: onAddToCart,
                          onFavoriteToggle: () => onToggleFavorite(product.id),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}