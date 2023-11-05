

import 'package:flutter/material.dart';

class TColors{
  TColors._();

  static const primary = Color(0xFF4b68ff);
  static const secondary = Color(0xFFFFE248);
  static const accent = Color(0xFFb0c7ff);

  static const Gradient lineGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
    Color(0xffff9a9e),
    Color(0xfffad0c4),
    Color(0xfffad0c4),
  ]);

  static const textPrimary = Color(0xFF333333);
  static const textSecondary = Color(0xFF6C7570);
  static const textWhite = Colors.white;

  static const light = Color(0xFF333333);
  static const dark = Color(0xFF272727);
  static const primaryBackground = Color(0xFFF3F5FF);

  static const cardBgColor = Color(0xFFF7F6F1);
  static const whiteColor = Colors.white;
  static const darkColor = Color(0xFF000000);

  static Color darkGrey = Colors.blueGrey.shade600;
  static const grey = Colors.grey;

}
