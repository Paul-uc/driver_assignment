import 'package:flutter/material.dart';
import 'package:user_management_system/src/constants/colors.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
      headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold  ,color:TColors.darkColor),
      headlineMedium: const TextStyle().copyWith(fontSize: 22.0, fontWeight: FontWeight.w700  ,color:TColors.darkColor),
      headlineSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600  ,color:TColors.darkColor),

      bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal  ,color:TColors.darkColor),
      bodyMedium: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.normal  ,color:TColors.darkColor),

      titleLarge: const TextStyle().copyWith(color: Colors.black54, fontSize: 24),
      titleMedium: const TextStyle().copyWith(color: Colors.black54, fontSize: 24),
      titleSmall: const TextStyle().copyWith(color: Colors.black54, fontSize: 24),

      labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
      labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),
  );



  static TextTheme darkTextTheme = TextTheme(
      headlineLarge: const TextStyle().copyWith(fontSize: 28.0, fontWeight: FontWeight.bold  ,color:TColors.whiteColor),
      headlineMedium: const TextStyle().copyWith(fontSize: 22.0, fontWeight: FontWeight.w700  ,color:TColors.whiteColor),
      headlineSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600  ,color:TColors.whiteColor),

      bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal  ,color:TColors.whiteColor),
      bodyMedium: const TextStyle().copyWith(fontSize: 10.0, fontWeight: FontWeight.normal  ,color:TColors.whiteColor),

      titleLarge: const TextStyle().copyWith(color:TColors.whiteColor, fontSize: 24),
      titleMedium: const TextStyle().copyWith(color:TColors.whiteColor, fontSize: 24),
      titleSmall: const TextStyle().copyWith(color:TColors.whiteColor, fontSize: 24),

      labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
      labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.5)),
  );
}
