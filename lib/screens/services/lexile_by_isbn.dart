import 'package:url_launcher/url_launcher.dart';

onLongPressByISBN(var arg) async {
  final url = Uri.parse(
    "https://hub.lexile.com/find-a-book/book-details/$arg",
  );
  await launchUrl(url);
}
