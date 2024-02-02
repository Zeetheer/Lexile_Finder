// ignore_for_file: unused_field, unnecessary_string_escapes

import '../search/search_screen.dart';
import 'package:flutter/material.dart';
import '../services/global_variable.dart';
// import '../setting/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/lexile_finder.png",
            width: 400,
            height: 200,
          ),
          const SizedBox(
            height: 40,
            width: 100,
          ),
          Center(
            child: SizedBox(
              width: 290.0,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ),
                label: const Text(
                  "검색하기",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SearchScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
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
