import 'package:url_launcher/url_launcher.dart';

onErrorCode(var arg) async {
  final url =
      Uri.parse("https://developer.mozilla.org/docs/Web/HTTP/Status/$arg");
  await launchUrl(url);
}
