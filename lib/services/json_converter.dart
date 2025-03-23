import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:which_book_2025/models/book_model.dart';

class JsonCoverter {
  static Future<List<BookModel>> getBooks(BuildContext context) async {
    List<BookModel> bookInstances = [];
    print("getBooks()");
    String data = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/json/books.json");
    //print("data = $data");
    var jsonData = json.decode(data);

    jsonData.forEach((book) {
      //print("book=$book");
      var bookInstance = BookModel.fromJson(book);
      bookInstances.add(bookInstance);
    });

    print(bookInstances.length);
    /*
    for (var book in bookInstances) {
      book.printBookModel();
    } */

    return bookInstances;
  }
}
