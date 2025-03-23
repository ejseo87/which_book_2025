import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:which_book_2025/models/book_model.dart';

class BookCard extends StatelessWidget {
  final int index;
  final double scale;
  final BookModel book;
  final bool isDetail;
  final VoidCallback onToggleDetail;

  const BookCard({
    super.key,
    required this.index,
    required this.scale,
    required this.book,
    required this.isDetail,
    required this.onToggleDetail,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Transform.scale(
      scale: scale,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: size.height * 0.6,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(125),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(height: 150, color: Colors.white),
                Text(
                      " ${book.title} ",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .boxShadow(
                      duration: 1.seconds,
                      begin: BoxShadow(
                        color: book.genre.thintColor,
                        blurRadius: 1,
                        spreadRadius: 2,
                      ),
                      end: BoxShadow(
                        color: book.genre.thintColor,
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ),

                SizedBox(height: 5),
                Text(
                  book.author,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),

                Container(
                  height: size.height * 0.3,
                  padding: EdgeInsets.all(20),

                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: 100.ms,
                    animatedTexts: [
                      for (var i = 0; i < book.introduction.length; i++)
                        FadeAnimatedText(
                          book.introduction[i].intro,
                          textStyle: TextStyle(height: 1.2),
                          duration: 10.seconds,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: isDetail ? -55 : -(size.height * 0.22),
            left: size.width * 0.32,
            child: IconButton(
              highlightColor: Colors.red,
              color: Colors.black,
              iconSize: 50,
              onPressed: onToggleDetail,
              icon: Icon(
                isDetail ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
