import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:readmore/readmore.dart';
import 'package:which_book_2025/models/book_model.dart';
import 'package:which_book_2025/views/widgets/book_youtube_player.dart';
import 'package:which_book_2025/views/widgets/draw_stars.dart';
import 'package:which_book_2025/views/widgets/shining_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BookDetailCard extends StatefulWidget {
  final int index;
  final BookModel book;
  const BookDetailCard({super.key, required this.index, required this.book});

  @override
  State<BookDetailCard> createState() => _BookDetailCardState();
}

class _BookDetailCardState extends State<BookDetailCard> {
  late final YoutubePlayerController _youtubeController =
      YoutubePlayerController(initialVideoId: "RyeLupM53DM");

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 100,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShiningText(
                text: book.title,
                textSize: 22,
                shiningColor: book.genre.thintColor,
              ),

              SizedBox(height: 10),
              ShiningText(
                text: book.subtitle,
                textSize: 14,
                shiningColor: book.genre.thintColor,
              ),
              SizedBox(height: 10),
              ShiningText(
                text:
                    "${book.genre.genreName} / ${book.publication}년 / ${book.publisher}",
                textSize: 14,
                shiningColor: book.genre.thintColor,
              ),
              SizedBox(height: 30),
              DrawStars(
                rating: book.rating,
                iconSize: 32,
                iconAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 30),
              ShiningText(
                text: book.author,
                textSize: 14,
                shiningColor: book.genre.thintColor,
              ),
              SizedBox(height: 10),
              Container(
                    width: size.width * 0.8,
                    //height: size.height * 0.2,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ReadMoreText(
                      book.authorBio,
                      trimMode: TrimMode.Line,
                      trimLines: 3,
                      trimCollapsedText: "더보기",
                      trimExpandedText: "접기",
                      moreStyle: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      lessStyle: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
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
              SizedBox(height: 30),
              for (var video in book.youtubeContents) ...[
                Container(
                      width: size.width * 0.8,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: BookYoutubePlayer(
                        key: ValueKey(video.youtubeid),
                        id: video.youtubeid,
                        title: video.title,
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
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

                SizedBox(height: 30),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
