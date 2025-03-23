import 'package:flutter/material.dart';
import 'package:which_book_2025/views/books_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(primary: Colors.blue),
      ),
      home: BookScreen(),
    );
  }
}
