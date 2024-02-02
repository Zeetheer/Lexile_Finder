// ignore_for_file: depend_on_referenced_packages, avoid_print, unused_local_variable, use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lexile_finder/screens/home/home_screen.dart';
import 'package:lexile_finder/screens/search/search_screen.dart';
// import 'package:lexile_finder/screens/setting/setting_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/error_code.dart';
import '../services/global_variable.dart';
import '../services/info_image.dart';
import 'package:remove/remove.dart';

import '../services/lexile_by_isbn.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    Future<dynamic> getTranslation(
      String arg,
    ) async {
      String clientId = "YOUR_CLIENT_ID";
      String clientSecret = "YOUR_CLIENT_SECRET";
      String contentType = "application/x-www-form-urlencoded; charset=UTF-8";
      String url = "https://openapi.naver.com/v1/papago/n2mt";

      http.Response trans = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': contentType,
          'X-Naver-Client-Id': clientId,
          'X-Naver-Client-Secret': clientSecret
        },
        body: {
          'source': "en",
          'target': "ko",
          'text': arg,
        },
      );
      if (trans.statusCode == 200) {
        var dataJson;
        dataJson = jsonDecode(trans.body);
        var resultPapago = dataJson['message']['result']['translatedText'];
        descriptionss = resultPapago;
        setState(() {});
        return null;
      } else {
        return onErrorCode(trans.statusCode);
      }
    }

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return Colors.white;
    }

    Color getColor2(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return Colors.black;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          bookName,
          style: const TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bookName,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                removeBrakets(authors),
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 250,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.network(
                    checkInfoImage(thumbnailUrl),
                    width: 128,
                    height: 178,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        getTranslation(descriptionss);
                      },
                      icon: const Icon(Icons.translate),
                      label: const Text("번역"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith(getColor),
                        foregroundColor:
                            MaterialStateProperty.resolveWith(getColor2),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith(getColor),
                        foregroundColor:
                            MaterialStateProperty.resolveWith(getColor2),
                      ),
                      onPressed: () {
                        onLongPressByISBN("${isbn_13[0]}".split(":")[1]);
                      },
                      child: const Text("렉사일 수치",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                ],
              ),
              Text(descriptionss),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.all(0.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "책 구매",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "교보문고",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 26,
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            var url = Uri.parse(
                                "https://search.kyobobook.co.kr/search?gbCode=TOT&target=total&keyword=$bookName");
                            await launchUrl(url);
                          },
                          label: const Text(
                            "교보문고 검색",
                            style: TextStyle(color: Colors.black),
                          ),
                          icon: const Icon(
                            Icons.search_rounded,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "알라딘ㅤ",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 26,
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            var url = Uri.parse(
                                "https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=All&SearchWord=$bookName&x=0&y=0");
                            await launchUrl(url);
                          },
                          label: const Text(
                            "알라딘 검색ㅤ",
                            style: TextStyle(color: Colors.black),
                          ),
                          icon: const Icon(
                            Icons.search_rounded,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "인터파크",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 26,
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            var url = Uri.parse(
                                "https://bsearch.interpark.com/dsearch/book.jsp?sch=all&sc.shopNo=&bookblockname=s_main&booklinkname=s_main&bid1=search_auto&bid2=product&bid3=000&bid4=001&query=$bookName");
                            await launchUrl(url);
                          },
                          label: const Text(
                            "인터파크 검색",
                            style: TextStyle(color: Colors.black),
                          ),
                          icon: const Icon(
                            Icons.search_rounded,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
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
