import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:via/theme/color.dart';

enum MainSearchBarVariant { outline, filled, none }

class MainSearchBar extends StatelessWidget {
  const MainSearchBar({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText = 'Search',
    this.leading,
    this.trailing,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.enabled = true,
    this.width,
    this.elevation = 1,
    this.variant = MainSearchBarVariant.outline,
    this.borderRadius = 12,
    this.horizontalPadding = 12,
    this.filledColor,
    this.labelSpacing = 8,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String hintText;
  final Widget? leading;
  final List<Widget>? trailing;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final bool enabled;
  final double? width;
  final double elevation;
  final MainSearchBarVariant variant;
  final double borderRadius;
  final double horizontalPadding;
  final Color? filledColor;
  final double labelSpacing;

  @override
  Widget build(BuildContext context) {
    final TextStyle bodyLarge =
        Theme.of(context).textTheme.bodyLarge ?? const TextStyle(fontSize: 16);
    final TextStyle bodyMedium =
        Theme.of(context).textTheme.bodyMedium ?? const TextStyle(fontSize: 14);

    final Color bgColor = filledColor ?? AppColors.gray100;

    final WidgetStateProperty<Color?> backgroundColor =
        WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.gray100.withValues(alpha: 0.6);
      }
      return switch (variant) {
        MainSearchBarVariant.outline => AppColors.white,
        MainSearchBarVariant.filled => bgColor,
        MainSearchBarVariant.none => Colors.transparent,
      };
    });

    final WidgetStateProperty<BorderSide?> side =
        WidgetStateProperty.resolveWith((states) {
      if (variant == MainSearchBarVariant.none) {
        return BorderSide.none;
      }

      if (states.contains(WidgetState.disabled)) {
        return const BorderSide(color: AppColors.gray100, width: 1);
      }

      if (states.contains(WidgetState.focused)) {
        return const BorderSide(color: AppColors.primary, width: 1);
      }

      return const BorderSide(color: AppColors.gray100, width: 1);
    });

    final WidgetStateProperty<OutlinedBorder?> shape =
        WidgetStatePropertyAll<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null && labelText!.isNotEmpty) ...[
            Text(labelText!, style: bodyLarge),
            SizedBox(height: labelSpacing),
          ],
          SearchBar(
            controller: controller,
            focusNode: focusNode,
            hintText: hintText,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            onTap: onTap,
            enabled: enabled,
            elevation: WidgetStatePropertyAll<double>(elevation),
            textStyle: WidgetStatePropertyAll<TextStyle?>(bodyLarge),
            hintStyle: WidgetStatePropertyAll<TextStyle?>(bodyMedium),
            backgroundColor: backgroundColor,
            side: side,
            shape: shape,
            padding: WidgetStatePropertyAll<EdgeInsetsGeometry?>(
              EdgeInsets.symmetric(horizontal: horizontalPadding),
            ),
            leading: leading ?? const Icon(LucideIcons.search, size: 20, color: AppColors.gray200),
            trailing: trailing,
          ),
        ],
      ),
    );
  }
}
