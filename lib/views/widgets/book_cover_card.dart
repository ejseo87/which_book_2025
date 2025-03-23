import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:which_book_2025/models/book_model.dart';

class BookCoverCard extends StatelessWidget {
  const BookCoverCard({super.key, required this.size, required this.book});

  final Size size;
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
            width: size.width * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(book.cover),
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.grey.shade500),
            ),
          )
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .boxShadow(
            duration: 1.seconds,
            begin: BoxShadow(
              color: book.genre.thintColor,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 2),
            ),
            end: BoxShadow(
              color: book.genre.thintColor,
              blurRadius: 20,
              spreadRadius: 2,
              offset: Offset(0, 8),
            ),
          ),
    );
  }
}
