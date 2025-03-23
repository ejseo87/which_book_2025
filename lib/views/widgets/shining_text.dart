import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShiningText extends StatelessWidget {
  const ShiningText({
    super.key,
    required this.text,
    required this.textSize,
    required this.shiningColor,
  });

  final String text;
  final double textSize;
  final Color shiningColor;

  @override
  Widget build(BuildContext context) {
    return Text(
          " $text ",
          style: TextStyle(fontSize: textSize, fontWeight: FontWeight.w600),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .boxShadow(
          duration: 1.seconds,
          begin: BoxShadow(color: shiningColor, blurRadius: 1, spreadRadius: 2),
          end: BoxShadow(color: shiningColor, blurRadius: 20, spreadRadius: 2),
        );
  }
}
