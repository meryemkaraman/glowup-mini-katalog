import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'models/product.dart';
import 'models/cart_item.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'utils/page_transition.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const GlowUpApp());
}

class GlowUpApp extends StatelessWidget {
  const GlowUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GlowUp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE75480),
          brightness: Brightness.light,
          surface: const Color(0xFFFFF8FA),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black87,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE75480),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
        cardTheme: const CardThemeData(
          color: Colors.white,
        ),
      ),
initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/detail':
            final args = settings.arguments as Map<String, dynamic>;
            return fadeSlideRoute(
              ProductDetailScreen(
                product: args['product'] as Product,
                isFavorite: args['isFavorite'] as bool,
                onAddToCart: args['onAddToCart'],
                onFavoriteToggle: args['onFavoriteToggle'],
              ),
            );
          case '/cart':
            final cartItems = settings.arguments as List<CartItem>;
            return fadeSlideRoute(CartScreen(cartItems: cartItems));
         case '/':
          default:
            return fadeSlideRoute(const SplashScreen());
        }
      },    );
  }
}