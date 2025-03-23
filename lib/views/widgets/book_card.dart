import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:readmore/readmore.dart';
import 'package:which_book_2025/models/book_model.dart';

class BookCard extends StatelessWidget {
  final int index;
  final double scale;
  final BookModel book;
  final bool isDetail;

  const BookCard({
    super.key,
    required this.index,
    required this.scale,
    required this.book,
    required this.isDetail,
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

                SizedBox(height: 10),
                SizedBox(
                  height: 20,
                  child: AnimatedTextKit(
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                    repeatForever: true,
                    pause: 100.ms,
                    animatedTexts: [
                      TyperAnimatedText(
                        book.subtitle,
                        speed: 300.ms,
                        curve: Curves.linear,
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
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

                  child: ReadMoreText(
                    book.introduction,
                    trimMode: TrimMode.Line,
                    trimLines: 9,
                    trimCollapsedText: "...더보기",
                    trimExpandedText: "...접기",
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: isDetail ? -50 : -(size.height * 0.22),
            left: size.width * 0.32,
            child: Icon(
              isDetail ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
              size: 60,
              color: Colors.black,
              shadows: [
                Shadow(
                  color: book.genre.thintColor,
                  offset: Offset(3, 3),
                  blurRadius: 20,
                ),
                Shadow(
                  color: book.genre.thintColor,
                  offset: Offset(-3, -3),
                  blurRadius: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
