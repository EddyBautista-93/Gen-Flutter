import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// runApp - inflate the given widget and add it to the screen
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This class creates the instance of a widget app 
    return MaterialApp(
      title: "Welcome to Flutter", // identify the app for the user 
      home: Scaffold( // visual scaffold
        appBar: AppBar(
          title: const Text("Welcome to my first Flutter app"),
        ),
        body: Center(
          child: RandomWords(),
          ),
      ),
    );
  }
}


class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; // list view widget
  final _biggerFont = const TextStyle(fontSize: 18.0);
 Widget _buildSuggestions() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
}
Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name Generator'),
      ),
      body: _buildSuggestions(),
    );

  }
}
