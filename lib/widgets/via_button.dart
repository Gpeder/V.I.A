import 'package:flutter/material.dart';
import 'package:via/theme/color.dart';

enum MainButtonVariant { primary, outline, destructive }

class MainButton extends StatelessWidget {
  const MainButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.variant = MainButtonVariant.primary,
    this.isLoading = false,
    this.enabled = true,
    this.width,
    this.height = 44,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.loadingLabel,
  });

  final String label;
  final String? loadingLabel;
  final VoidCallback? onPressed;
  final MainButtonVariant variant;
  final bool isLoading;
  final bool enabled;
  final double? width;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  bool get _isDisabled => !enabled || onPressed == null;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.titleSmall ??
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

    final ButtonStyle style = ButtonStyle(
      animationDuration: const Duration(milliseconds: 180),
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(padding),
      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.gray100;
        }

        switch (variant) {
          case MainButtonVariant.primary:
            return AppColors.primary;
          case MainButtonVariant.outline:
            return Colors.transparent;
          case MainButtonVariant.destructive:
            return AppColors.destructive;
        }
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.gray200;
        }

        switch (variant) {
          case MainButtonVariant.primary:
          case MainButtonVariant.outline:
            return AppColors.black;
          case MainButtonVariant.destructive:
            return AppColors.white;
        }
      }),
      side: WidgetStateProperty.resolveWith<BorderSide>((states) {
        if (states.contains(WidgetState.disabled)) {
          return const BorderSide(color: AppColors.gray100);
        }

        switch (variant) {
          case MainButtonVariant.primary:
          case MainButtonVariant.destructive:
            return BorderSide.none;
          case MainButtonVariant.outline:
            return const BorderSide(color: AppColors.gray200, width: 1);
        }
      }),
      overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (!states.contains(WidgetState.pressed)) {
          return Colors.transparent;
        }

        return switch (variant) {
          MainButtonVariant.primary => AppColors.allBlack.withValues(alpha: 0.08),
          MainButtonVariant.outline => AppColors.black.withValues(alpha: 0.06),
          MainButtonVariant.destructive => AppColors.allBlack.withValues(alpha: 0.1),
        };
      }),
      textStyle: WidgetStatePropertyAll<TextStyle>(textStyle),
    );

    final String effectiveLabel = isLoading ? (loadingLabel ?? 'Carregando...') : label;

    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: style,
        onPressed: _isDisabled ? null : () {
          if (isLoading) {
            return;
          }
          onPressed?.call();
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 180),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: isLoading
              ? Row(
                  key: const ValueKey('loading'),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          variant == MainButtonVariant.destructive
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(effectiveLabel),
                  ],
                )
              : Text(
                  effectiveLabel,
                  key: const ValueKey('idle'),

                ),
        ),
      ),
    );
  }
}


