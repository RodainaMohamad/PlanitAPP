import 'package:flutter/material.dart';
import 'package:planit/utils/Colors.dart';

abstract class AppTheme
{
  static TextStyle textStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);
  static const TextStyle taskTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colours.taskText);
  static const TextStyle taskDescriptionTextStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colours.textDescription);
  static const TextStyle bottomSheetTitleTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colours.bottomSheetTitle);

  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(size: 21),
        unselectedIconTheme: IconThemeData(size: 21),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colours.header,
        unselectedItemColor: Colours.grey
    ),
    scaffoldBackgroundColor: Colours.background,
    dividerTheme: const DividerThemeData(thickness: 3, color: Colours.grey),
  );
}