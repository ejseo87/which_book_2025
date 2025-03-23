import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DrawStars extends StatelessWidget {
  final double rating;
  final double iconSize;
  final MainAxisAlignment iconAlignment;
  const DrawStars({
    super.key,
    required this.rating,
    required this.iconSize,
    required this.iconAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: iconAlignment,
      children: [
        for (var i = 1; i <= rating ~/ 2; i++)
          Icon(
            Icons.star,
            color: Colors.amber,
            size: iconSize,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 5),
            ],
          ),
        Icon(
          (rating % 2) == 0 ? Icons.star_border_outlined : Icons.star_half,
          color: Colors.amber,
          size: iconSize,
          shadows: const [
            Shadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 5),
          ],
        ),
      ],
    );
  }
}
