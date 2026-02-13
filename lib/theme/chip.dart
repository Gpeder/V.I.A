import 'package:flutter/material.dart';
import 'package:via/theme/color.dart';

ChipThemeData chip(TextTheme textTheme) {
  return ChipThemeData(
    backgroundColor: AppColors.primary,
    selectedColor: AppColors.primary,
    disabledColor: AppColors.gray100,
    labelStyle: textTheme.bodyLarge!.copyWith(color: AppColors.primaryNearBlack),
    elevation: 1,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: AppColors.gray100, width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
