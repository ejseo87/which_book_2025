import 'package:flutter/material.dart';

enum GenreTheme {
  novel,
  philosophy,
  history,
  travel,
  essay;

  static GenreTheme defaultValue = GenreTheme.novel;

  static GenreTheme? convertKey(String key) => switch (key) {
    "novel" => GenreTheme.novel,
    "philosophy" => GenreTheme.philosophy,
    "history" => GenreTheme.history,
    "travel" => GenreTheme.travel,
    "essay" => GenreTheme.essay,
    _ => null,
  };

  String get key => switch (this) {
    GenreTheme.novel => "novel",
    GenreTheme.philosophy => "philosophy",
    GenreTheme.history => "history",
    GenreTheme.travel => "travel",
    GenreTheme.essay => "essay",
  };

  String get genreName => switch (this) {
    GenreTheme.novel => "소설",
    GenreTheme.philosophy => "철학",
    GenreTheme.history => "역사",
    GenreTheme.travel => "여행기",
    GenreTheme.essay => "수필",
  };
  Color get thintColor => switch (this) {
    GenreTheme.novel => Colors.amber.shade100,
    GenreTheme.philosophy => Colors.cyan.shade100,
    GenreTheme.history => Colors.red.shade100,
    GenreTheme.travel => Colors.green.shade100,
    GenreTheme.essay => Colors.purple.shade100,
  };
}
