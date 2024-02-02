// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../home/home_screen.dart';
// import '../search/search_screen.dart';
// import '../services/global_variable.dart';
// import '../services/make_list_tiles.dart';

// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key});

//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingScreen> {
//   Future initPrefs() async {
//     prefs = await SharedPreferences.getInstance();
//     final bookSite = prefs.getBool('bookSite');
//     if (bookSite != null) {
//       if (bookSite == true) {
//         setState(() {
//           isBookSite = true;
//         });
//       } else {
//         setState(() {
//           isBookSite = false;
//         });
//       }
//     } else {
//       await prefs.setBool('bookSite', true);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     initPrefs();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         title: const Text(
//           "설정",
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(children: [
//         Flexible(
//           flex: 12,
//           child: ListView.builder(
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               return makeListTilesSetting();
//             },
//           ),
//         ),
//         const Flexible(
//             flex: 1,
//             child: Text(
//               "Lexile Finder v 1.0.0"
//               "\n"
//               "Copyright 2023. Blackcat Software. All rights reserved.",
//               style: TextStyle(
//                 fontWeight: FontWeight.w400,
//               ),
//             ))
//       ]),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               color: Colors.black,
//             ),
//             label: "홈",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.search,
//               color: Colors.black,
//             ),
//             label: "검색",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.settings,
//               color: Colors.black,
//             ),
//             label: "설정",
//           ),
//         ],
//         onTap: (index) {
//           idx = index;
//           setState(() {});
//           if (idx == 0) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const HomeScreen(),
//                 ));
//           } else if (idx == 1) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const SearchScreen(),
//                 ));
//           } else if (idx == 2) {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => const SettingScreen(),
//                 ));
//           }
//         },
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.black,
//         currentIndex: idx,
//       ),
//     );
//   }
// }
