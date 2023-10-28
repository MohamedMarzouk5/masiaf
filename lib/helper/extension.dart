import 'package:flutter/material.dart';

//الكلاس ده علشان اللون اللي موجود علي الفاير استور مستخدم كسترنج واحنا مبستخدمش استرنج احنا بستخدم كلاس كولور

// Color(0xff  + hexcolor )     مبقتش استخدم الكلاس ده وبقيت استخدم سطر الكود ده
// Color(0xffF1B15A)

// extension HexColor on Color {
//   /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
//   static Color fromHex(String hexString) {
//     final buffer = StringBuffer();
//     if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
//     buffer.write(hexString.replaceFirst('#', ''));
//     return Color(int.parse(buffer.toString(), radix: 16));
//   }

//   /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
//   String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
//       '${alpha.toRadixString(16).padLeft(2, '0')}'
//       '${red.toRadixString(16).padLeft(2, '0')}'
//       '${green.toRadixString(16).padLeft(2, '0')}'
//       '${blue.toRadixString(16).padLeft(2, '0')}';
// }

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff75797B, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff75797B), //10%
      100: Color(0xff75797B), //20%
      200: Color(0xff75797B), //30%
      300: Color(0xff75797B), //40%
      400: Color(0xff75797B), //50%
      500: Color(0xff75797B), //60%
      600: Color(0xff75797B), //70%
      700: Color(0xff75797B), //80%
      800: Color(0xff75797B), //90%
      900: Color(0xff75797B), //100%
    },
  );
}
