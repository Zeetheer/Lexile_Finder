// Copyright 2023 Snap_Lan
// ignore_for_file: avoid_print, unused_local_variable, use_build_context_synchronously, unused_field

import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../services/load_book_service.dart';
import '../services/global_variable.dart';
// import '../setting/setting_screen.dart';

String inputText = '';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              textInputAction: TextInputAction.go,
              onSubmitted: (value) {
                loadBookInfos(context);
              },
              onChanged: (text) {
                setState(() {
                  inputText = text;
                });
              },
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '검색...',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () => _searchController.clear(),
                ),
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    loadBookInfos(context);
                  },
                ),
              ),
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: "검색",
          ),
        ],
        onTap: (index) {
          idx = index;
          setState(() {});
          if (idx == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HomeScreen(),
                ));
          } else if (idx == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SearchScreen(),
                ));
          } /* else if (idx == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingScreen(),
                ));
          } */
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: idx,
      ),
    );
  }
}
