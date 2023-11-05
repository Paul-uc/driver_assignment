import 'package:flutter/material.dart';


class TOutlinedButtonTheme {

  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0, // No elevation for outlined buttons
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,
        side: const BorderSide(color: Colors.blue),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20), // Button padding
        textStyle: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), // Button shape
      ),);

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0, // No elevation for outlined buttons
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.blueAccent),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20), // Button padding
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), // Button shape
    ),);
}
