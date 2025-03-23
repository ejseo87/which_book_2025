import 'package:which_book_2025/models/genre.dart';

class BookModel {
  final int id;
  final String title;
  final String subtitle;
  final String author;
  final String publisher;
  final String publication;
  final GenreTheme genre;
  final double rating;
  final String cover;
  final String backCover;
  final List<IntroModel> introduction;
  final String youtube;

  BookModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publisher,
    required this.publication,
    required this.genre,
    required this.rating,
    required this.cover,
    required this.backCover,
    required this.introduction,
    required this.youtube,
  });

  BookModel.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      title = json["title"],
      subtitle = json["subtitle"],
      author = json["author"],
      publisher = json["publisher"],
      publication = json["publication"],
      genre = GenreTheme.convertKey(json["genre"] ??= "") ?? GenreTheme.novel,
      rating = json["rating"],
      cover = json["cover"],
      backCover = json["back_cover"],
      introduction =
          json["introduction"]
              .map<IntroModel>((intro) => IntroModel.fromJson(intro))
              .toList(),
      youtube = json["youtube"];
  /* 
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "subtitle": subtitle,
      "author": author,
      "publisher": publisher,
      "publication": publication,
      "genre": genre,
      "rating": rating,
      "cover": cover,
      "backCover": backCover,
      "introduction": introduction.,
      "youtube": youtube,
    };
  }
 */
  printBookModel() {
    print("id = $id");
    print("title = $title");
    print("subtitle = $subtitle");
    print("author = $author");
    print("publisher = $publisher");
    print("publication = $publication");
    print("genre = $genre");
    print("rating = $rating");
    print("cover = $cover");
    print("backCover = $backCover");
    print("introduction = $introduction");
    print("youtube = $youtube");
  }
}

class IntroModel {
  final int id;
  final String intro;
  IntroModel({required this.id, required this.intro});
  IntroModel.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      intro = json["intro"];
  Map<String, dynamic> toJson() {
    return {"id": id, "intro": intro};
  }
}
