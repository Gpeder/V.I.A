import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFF2BE24);
  static const Color primaryDark = Color(0xFFC49000);
  static const Color black = Color(0xFF1F1F1F);
  static const Color allBlack = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray100 = Color(0xFFDEE0E3);
  static const Color gray200 = Color(0xFF808080);
  static const Color destructive = Color(0xFFDC2828);
  static const Color success = Color(0xFF2E7D32);

  static final shadowSoft = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      offset: const Offset(0, 4),
      blurRadius: 12,
      spreadRadius: -2,
    ),
  ];
}
