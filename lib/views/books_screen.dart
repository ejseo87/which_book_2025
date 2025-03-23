import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:which_book_2025/models/book_model.dart';
import 'package:which_book_2025/services/json_converter.dart';
import 'package:which_book_2025/views/widgets/background_card.dart';
import 'package:which_book_2025/views/widgets/book_card.dart';
import 'package:which_book_2025/views/widgets/book_cover_card.dart';
import 'package:which_book_2025/views/widgets/book_detail_card.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  List<BookModel> books = [];

  final PageController _cardController = PageController(viewportFraction: 0.8);

  final PageController _bookController = PageController(viewportFraction: 0.8);

  final ValueNotifier<double> _scroll = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    initData();
    _cardController.addListener(() {
      if (_cardController.page == null) return;
      _scroll.value = _cardController.page!;

      _bookController.animateTo(
        _cardController.position.pixels,
        duration: Duration(milliseconds: 200),
        curve: Curves.bounceOut,
      );
    });
  }

  Future<void> initData() async {
    books = await JsonCoverter.getBooks(context);
    setState(() {});
  }

  @override
  void dispose() {
    _cardController.dispose();
    _bookController.dispose();
    super.dispose();
  }

  int _currentPage = 0;
  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  bool _isDetail = false;

  void _onToggleDetail() {
    setState(() {
      _isDetail = !_isDetail;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body:
          books.isEmpty
              ? Center(child: CircularProgressIndicator.adaptive())
              : Stack(
                alignment: Alignment.center,
                children: [
                  BackgroundCard(
                    currentPage: _currentPage,
                    book: books[_currentPage + 1],
                  ),
                  PageView.builder(
                        onPageChanged: _onPageChanged,
                        controller: _cardController,
                        itemCount: books.length - 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ValueListenableBuilder(
                                valueListenable: _scroll,
                                builder: (context, scroll, child) {
                                  final difference = (scroll - index).abs();
                                  final scale = 1 - (difference * 0.1);
                                  return GestureDetector(
                                    onTap: _onToggleDetail,
                                    child: BookCard(
                                      index: index,
                                      scale: scale,
                                      book: books[index + 1],
                                      isDetail: _isDetail,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 90),
                            ],
                          );
                        },
                      )
                      .animate(target: _isDetail ? 1 : 0)
                      .slideY(begin: 0, end: 0.65),
                  Positioned(
                    top: 120,
                    child: Container(
                          height: size.height * 0.3,
                          width: size.width,
                          color: Colors.transparent,

                          child: PageView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _bookController,
                            itemCount: books.length - 1,
                            itemBuilder: (context, index) {
                              return BookCoverCard(
                                size: size,
                                book: books[index + 1],
                              );
                            },
                          ),
                        )
                        .animate(target: _isDetail ? 1 : 0)
                        .slideY(begin: 0, end: 3, duration: 600.ms),
                  ),
                  GestureDetector(
                    onTap: _onToggleDetail,
                    child: BookDetailCard(
                          index: _currentPage + 1,
                          book: books[_currentPage + 1],
                        )
                        .animate(target: _isDetail ? 1 : 0)
                        .slideY(begin: -1, end: 0, duration: 600.ms),
                  ),
                ],
              ),
    );
  }
}
