import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imagePath;

  const ProductImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: const Color(0xFFFFE9EF),
          child: const Icon(Icons.image_not_supported_outlined, size: 40, color: Colors.black26),
        );
      },
    );
  }
}