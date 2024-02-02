import 'package:url_launcher/url_launcher.dart';
import 'global_variable.dart';

onPurchaseTapByName(var arg) async {
  var url = Uri.parse(
      "https://search.kyobobook.co.kr/search?gbCode=TOT&target=total&keyword=$arg");
  if (isBookSite == false) {
    url = Uri.parse(
        "https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=All&SearchWord=$arg&x=0&y=0");
  }
  await launchUrl(url);
}
