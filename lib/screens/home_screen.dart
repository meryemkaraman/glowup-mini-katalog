import 'package:flutter/material.dart';
import '../data/products.dart';
import '../models/product.dart';
import '../models/cart_item.dart';
import '../widgets/product_card.dart';
import '../utils/page_transition.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List<CartItem> cartItems = [];
  Set<int> favoriteIds = {};
  String searchQuery = '';
  String selectedCategory = 'Tümü';

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void addToCart(Product product, int quantity) {
    setState(() {
      final index = cartItems.indexWhere((item) => item.product.id == product.id);
      if (index >= 0) {
        cartItems[index].quantity += quantity;
      } else {
        cartItems.add(CartItem(product: product, quantity: quantity));
      }
    });
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} sepete eklendi'),
        duration: const Duration(milliseconds: 900),
        backgroundColor: const Color(0xFFE75480),
      ),
    );
  }

  void toggleFavorite(int productId) {
    setState(() {
      if (favoriteIds.contains(productId)) {
        favoriteIds.remove(productId);
      } else {
        favoriteIds.add(productId);
      }
    });
  }

  void goToCart() async {
    final result = await Navigator.push(
      context,
      fadeSlideRoute(CartScreen(cartItems: cartItems)),
    );
    if (result != null) {
      setState(() => cartItems = result as List<CartItem>);
    }
  }

  void goToDetail(Product product) {
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: {
        'product': product,
        'isFavorite': favoriteIds.contains(product.id),
        'onAddToCart': addToCart,
        'onFavoriteToggle': () => toggleFavorite(product.id),
      },
    );
  }

  void goToFavorites() {
    final favProducts = productList.where((p) => favoriteIds.contains(p.id)).toList();
    Navigator.push(
      context,
      fadeSlideRoute(
        FavoritesScreen(
          favoriteProducts: favProducts,
          favoriteIds: favoriteIds,
          onToggleFavorite: toggleFavorite,
          onAddToCart: addToCart,
        ),
      ),
    ).then((_) => setState(() {}));
  }

  void goToProfile() {
    Navigator.push(context, fadeSlideRoute(const ProfileScreen()));
  }

  int get totalItemCount => cartItems.fold(0, (sum, item) => sum + item.quantity);

  List<Product> get filteredProducts {
    return productList.where((p) {
      final matchesCategory = selectedCategory == 'Tümü' || p.category == selectedCategory;
      final matchesSearch = p.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          p.brand.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // ---- Üst kısım: karşılama + ikonlar ----
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hoş geldin ✨',
                              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                            ),
                            const SizedBox(height: 4),
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [Color(0xFFE75480), Color(0xFFFF8FA3)],
                              ).createShader(bounds),
                              child: const Text(
                                'GlowUp',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: goToFavorites,
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                            ],
                          ),
                          child: const Icon(Icons.favorite_border, color: Color(0xFFE75480)),
                        ),
                      ),
                      GestureDetector(
                        onTap: goToProfile,
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                            ],
                          ),
                          child: const Icon(Icons.person_outline, color: Color(0xFFE75480)),
                        ),
                      ),
                      GestureDetector(
                        onTap: goToCart,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                                ],
                              ),
                              child: const Icon(Icons.shopping_bag_outlined, color: Color(0xFFE75480)),
                            ),
                            if (totalItemCount > 0)
                              Positioned(
                                right: -4,
                                top: -4,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(color: Color(0xFFE75480), shape: BoxShape.circle),
                                  constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                                  child: Text(
                                    '$totalItemCount',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ---- Arama kutusu ----
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    onChanged: (value) => setState(() => searchQuery = value),
                    decoration: InputDecoration(
                      hintText: 'Ürün veya marka ara...',
                      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                      prefixIcon: const Icon(Icons.search, color: Color(0xFFE75480)),
                    ),
                  ),
                ),
              ),

              // ---- Kampanya bannerı ----
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 18, 16, 18),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFE75480), Color(0xFFFFA9C0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(color: const Color(0xFFE75480).withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 8)),
                      ],
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          right: -14,
                          bottom: -14,
                          child: Icon(Icons.spa, size: 90, color: Colors.white.withOpacity(0.15)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Summer Sale',
                              style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Tüm cilt bakım ürünlerinde %20 indirim',
                              style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12.5),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Keşfet',
                                style: TextStyle(color: Color(0xFFE75480), fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ---- Kategori chipleri ----
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 40,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final cat = categoryList[index];
                        final isSelected = cat == selectedCategory;
                        return GestureDetector(
                          onTap: () => setState(() => selectedCategory = cat),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFFE75480) : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2)),
                              ],
                            ),
                            child: Text(
                              cat,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black54,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // ---- Ürünler başlığı ----
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Öne Çıkanlar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('${filteredProducts.length} ürün', style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
                    ],
                  ),
                ),
              ),

              // ---- Ürün Grid ----
              filteredProducts.isEmpty
                  ? SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Center(
                          child: Column(
                            children: [
                              Icon(Icons.search_off, size: 48, color: Colors.grey.shade300),
                              const SizedBox(height: 12),
                              Text('Ürün bulunamadı', style: TextStyle(color: Colors.grey.shade500)),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                      sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.68,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final product = filteredProducts[index];
                            return TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0, end: 1),
                              duration: Duration(milliseconds: 300 + (index * 60)),
                              curve: Curves.easeOut,
                              builder: (context, value, child) {
                                return Opacity(
                                  opacity: value,
                                  child: Transform.translate(
                                    offset: Offset(0, (1 - value) * 20),
                                    child: child,
                                  ),
                                );
                              },
                              child: ProductCard(
                                product: product,
                                isFavorite: favoriteIds.contains(product.id),
                                onTap: () => goToDetail(product),
                                onFavoriteTap: () => toggleFavorite(product.id),
                              ),
                            );
                          },
                          childCount: filteredProducts.length,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}