// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import 'package:lexile_finder/screens/services/remember.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:remove/remove.dart';

import '../../main.dart';
import 'global_variable.dart';

// Widget makeListTilesSetting() {
//   return Row(
//     children: [
//       const Flexible(
//         child: ListTile(
//           title: Text("책 구매 사이트"),
//         ),
//       ),
//       LiteRollingSwitch(
//         value: isBookSite,
//         onTap: () {},
//         onDoubleTap: () {},
//         onSwipe: () {},
//         onChanged: (bool isit) {
//           if (isit == true) {
//             isBookSite = true;
//             onBookSiteChangeTure();
//           } else {
//             isBookSite = false;
//             onBookSiteChangeFalse();
//           }
//         },
//         textOn: "교보문고",
//         textOff: "알라딘",
//         colorOn: const Color.fromARGB(255, 109, 179, 41),
//         colorOff: const Color.fromARGB(255, 238, 60, 151),
//         iconOff: Icons.check,
//       )
//     ],
//   );
// }

dynamic theNullCheck(a) {
  if (a == null) {
    return "";
  } else {
    return theSubString("$a");
  }
}

String theSubString(String a) {
  if (a.length > 200) {
    return "${a.substring(0, 200)}" "...";
  } else {
    return a;
  }
}

dynamic theNullCheck2(a) {
  if (a == null) {
    return "";
  } else {
    return a;
  }
}

Widget makeListTiles({
  required dynamic name,
  required dynamic infoImageUrl,
  required dynamic authorss,
  required dynamic descriptionn,
  required dynamic isbnn,
  required dynamic context,
  required String publishedDate,
  required Widget a,
}) {
  return OutlinedButton(
    onPressed: () {
      descriptionss = "";
      isbn_13 = "";
      bookName = name;
      thumbnailUrl = infoImageUrl;
      authors = authorss;
      descriptionss = descriptionn;
      isbn_13 = isbnn;
      aa = a;
      publishedDatee = publishedDate;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const InfoScreenHOME(),
        ),
      );
    },
    child: Row(
      children: [
        a,
        Flexible(
          child: ListTile(
            isThreeLine: true,
            dense: false,
            title: Text(name),
            subtitle: Text(
                "${removeBrakets(authorss)} · ${theNullCheck2(publishedDate)} \n ${theNullCheck(
              descriptionn,
            )}"),
          ),
        ),
      ],
    ),
  );
}
