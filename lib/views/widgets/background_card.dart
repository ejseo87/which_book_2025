import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:which_book_2025/models/book_model.dart';

class BackgroundCard extends StatelessWidget {
  final int currentPage;
  final BookModel book;
  const BackgroundCard({
    super.key,
    required this.book,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: Container(
        key: ValueKey(currentPage),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(book.cover),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: Colors.black.withAlpha(50)),
        ),
      ),
    );
  }
}
