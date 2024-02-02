import 'package:flutter/material.dart';
import 'package:lexile_finder/screens/home/home_screen.dart';
import 'package:lexile_finder/screens/search/info_screen.dart';
import 'package:lexile_finder/screens/search/search_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Lexile Finder",
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SearchScreenHOME extends StatelessWidget {
  const SearchScreenHOME({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lexile Finder',
      home: SearchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InfoScreenHOME extends StatelessWidget {
  const InfoScreenHOME({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Lexile Finder",
      home: InfoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
