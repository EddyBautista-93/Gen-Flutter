import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// runApp - inflate the given widget and add it to the screen
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This class creates the instance of a widget app
    final wordPair = WordPair.random(); // set the random word var at the top 
    return MaterialApp(
      title: "Welcome to Flutter", // identify the app for the user 
      home: Scaffold( // visual scaffold
        appBar: AppBar(
          title: const Text("Welcome to my first Flutter app"),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase)
          ),
      ),
    );
  }
}
