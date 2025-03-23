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
  final String introduction;
  final String authorBio;
  final List<YoutuveModel> youtubeContents;

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
    required this.authorBio,
    required this.youtubeContents,
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
      introduction = json["introduction"],
      authorBio = json["authorBio"],
      youtubeContents =
          json["youtubeContents"]
              .map<YoutuveModel>((content) => YoutuveModel.fromJson(content))
              .toList();

  /* 나중에 최종 모델에 맞게 수정할 것. 
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
      "youtubeContents": youtubeContents,
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
    print("author_bio = $authorBio");
    print("youtubeContents = $youtubeContents");
  }
}

class YoutuveModel {
  final String title;
  final String url;
  final String youtubeid;
  final String creator;

  YoutuveModel({
    required this.title,
    required this.url,
    required this.youtubeid,
    required this.creator,
  });
  YoutuveModel.fromJson(Map<String, dynamic> json)
    : title = json["title"],
      url = json["url"],
      youtubeid = json["youtubeid"],
      creator = json["creator"];

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "url": url,
      "youtubeid": youtubeid,
      "creator": creator,
    };
  }

  void printYoutuveModel() {
    print("title = $title");
    print("url = $url");
    print("url = $url");
    print("youtubeid = $youtubeid");
    print("creator = $creator");
  }
}
