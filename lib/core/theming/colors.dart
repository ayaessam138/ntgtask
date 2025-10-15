import 'package:flutter/material.dart';

// class ColorsManager {
//   static const Color mainColor = Color(0xff015b8a);
//   static const Color darkMainColor = Color(0xff002538);
//   static const Color white = Color(0xffffffff);
//   static const Color black = Color(0xff000000);
//   static const Color greyColor = Color(0xfff1f1f1);
//   static const Color darkGraeyColor = Color(0xffb3babd);
//   static const Color yellowColor = Color(0xffF7CE46);
//   static const Color redColor= Color(0xffE62B3B);


// }




class ColorsManager {
  // Colors that change with theme
  static Color mainColor(BuildContext context) =>
      _isDark(context) ? const Color(0xFF015B8A) : const Color(0xFF015B8A);

  static Color darkMainColor(BuildContext context) =>
      _isDark(context) ? const Color(0xFF002538) : const Color(0xFF002538);

  static Color white(BuildContext context) =>
      _isDark(context) ? Colors.black : Colors.white;

  static Color black(BuildContext context) =>
      _isDark(context) ? Colors.white : Colors.black;

  static Color greyColor(BuildContext context) =>
      _isDark(context) ? const Color(0xFF2C2C2C) : const Color(0xFFF1F1F1);

  static Color darkGreyColor(BuildContext context) =>
      _isDark(context) ? const Color(0xFFB3BABD) : const Color(0xFFB3BABD);

  static Color yellowColor(BuildContext context) =>
      const Color(0xFFF7CE46);

  static Color redColor(BuildContext context) =>
      const Color(0xFFE62B3B);

  // Private helper
  static bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
