import 'package:flutter/material.dart';
import 'rating_stars.dart';

class Review {
  final String name;
  final double rating;
  final String comment;
  final String date;

  const Review({
    required this.name,
    required this.rating,
    required this.comment,
    required this.date,
  });
}

// Ürünlerde gösterilecek örnek (statik) yorumlar
const List<Review> sampleReviews = [
  Review(name: 'Zeynep A.', rating: 5, comment: 'Kokusu harika, cildimde hiç tahriş yapmadı. Kesinlikle tekrar alırım.', date: '2 hafta önce'),
  Review(name: 'Elif K.', rating: 4, comment: 'Ürün güzel ama biraz daha uzun sürsün isterdim. Yine de memnun kaldım.', date: '1 ay önce'),
  Review(name: 'Deniz Y.', rating: 5, comment: 'Beklediğimden çok daha kaliteli çıktı, ambalajı da çok şık.', date: '3 hafta önce'),
];

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7F9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: const Color(0xFFE75480).withOpacity(0.15),
                    child: Text(
                      review.name[0],
                      style: const TextStyle(color: Color(0xFFE75480), fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(review.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                ],
              ),
              Text(review.date, style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
            ],
          ),
          const SizedBox(height: 8),
          RatingStars(rating: review.rating, size: 14),
          const SizedBox(height: 6),
          Text(review.comment, style: TextStyle(fontSize: 13, height: 1.4, color: Colors.grey.shade700)),
        ],
      ),
    );
  }
}