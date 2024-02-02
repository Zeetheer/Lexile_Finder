import 'package:books_finder/books_finder.dart';
import 'package:flutter/material.dart';

import '../search/after_search_screen.dart';
import '../search/search_screen.dart';

List<String> infoTitle = [];
List<dynamic> infoAuthors = [];
Map<String?, Uri?> infoImageUrlMap = {};
List<dynamic> infoImageUrl = [];
List<String> descriptions = [];
List<dynamic> isbn = [];
List id = [];
List<String> publishedDateRaw = [];

void loadBookInfos(dynamic context) async {
  infoTitle = [];
  infoAuthors = [];
  descriptions = [];
  isbn = [];
  final books = await queryBooks(
    inputText,
    maxResults: 40,
    printType: PrintType.books,
    orderBy: OrderBy.relevance,
    reschemeImageLinks: true,
    langRestrict: "en",
  );
  for (var book in books) {
    var info = book.info;
    infoTitle.add(info.title);
    infoImageUrlMap["${info.title}" "thumbnail"] = info.imageLinks["thumbnail"];

    infoImageUrl.add(infoImageUrlMap["${info.title}" "thumbnail"]);
    infoAuthors.add(info.authors);
    descriptions.add(info.description);
    if (info.industryIdentifiers.isNotEmpty) {
      isbn.add(info.industryIdentifiers);
    } else {
      isbn.add("Missing ISBN");
    }
    publishedDateRaw.add(info.rawPublishedDate);
  }
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const AfterSearchScreen(),
    ),
  );
}
