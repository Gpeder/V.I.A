import 'package:flutter/material.dart';
import 'package:via/theme/color.dart';

class MainCard extends StatelessWidget {
  final Widget widget;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  const MainCard({
    super.key,
    this.backgroundColor,
    this.padding,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray100, width: 0.3),
        color: backgroundColor ?? AppColors.white,
        boxShadow: AppColors.shadowSoft,
        borderRadius: BorderRadius.circular(20),
      ),
      child: widget,
    );
  }
}