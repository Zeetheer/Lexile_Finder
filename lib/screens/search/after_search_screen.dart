// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../services/info_image.dart';
import '../services/load_book_service.dart';
import '../services/global_variable.dart';
import '../services/make_list_tiles.dart';
import 'search_screen.dart';
// import '../setting/setting_screen.dart';

class AfterSearchScreen extends StatefulWidget {
  const AfterSearchScreen({
    super.key,
  });

  @override
  State<AfterSearchScreen> createState() => _AfterSearchScreenState();
}

class _AfterSearchScreenState extends State<AfterSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lexile Finder",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            inputText,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListView.builder(
            itemCount: infoTitle.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  makeListTiles(
                    name: infoTitle[index],
                    infoImageUrl:
                        infoImageUrlMap["${infoTitle[index]}" "thumbnail"],
                    authorss: infoAuthors[index],
                    descriptionn: descriptions[index],
                    isbnn: isbn[index],
                    context: context,
                    a: Image.network(
                      checkInfoImage(
                        infoImageUrlMap["${infoTitle[index]}" "thumbnail"],
                      ),
                    ),
                    publishedDate: publishedDateRaw[index],
                  ),
                  Container(
                    height: 20,
                  )
                ],
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
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
      ),
    );
  }
}
