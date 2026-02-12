import 'package:flutter/material.dart';
import 'package:via/theme/color.dart';

enum MainTextFieldVariant { outline, filled, underline, none }

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.variant = MainTextFieldVariant.outline,
    this.borderRadius = 12,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    this.width,
    this.filledColor,
    this.labelSpacing = 8,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool obscureText;
  final int maxLines;
  final int? minLines;
  final MainTextFieldVariant variant;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;
  final double? width;
  final Color? filledColor;
  final double labelSpacing;

  InputBorder _outlineBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  InputBorder _underlineBorder(Color color, {double width = 1}) {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle inputStyle =
        Theme.of(context).textTheme.bodyLarge ?? const TextStyle(fontSize: 16);
    final TextStyle labelStyle =
        Theme.of(context).textTheme.bodyLarge ?? const TextStyle(fontSize: 16);

    final Color defaultBorder = AppColors.gray100;
    final Color focusedBorder = AppColors.primary;
    final Color disabledBorder = AppColors.gray100.withValues(alpha: 0.8);
    final Color errorBorder = AppColors.destructive;

    final bool isFilled =
        variant == MainTextFieldVariant.filled || variant == MainTextFieldVariant.none;
    final InputBorder normal = switch (variant) {
      MainTextFieldVariant.outline || MainTextFieldVariant.filled =>
        _outlineBorder(defaultBorder),
      MainTextFieldVariant.underline => _underlineBorder(defaultBorder),
      MainTextFieldVariant.none => InputBorder.none,
    };

    final InputBorder focused = switch (variant) {
      MainTextFieldVariant.outline || MainTextFieldVariant.filled =>
        _outlineBorder(focusedBorder, width: 1.6),
      MainTextFieldVariant.underline => _underlineBorder(focusedBorder, width: 1.6),
      MainTextFieldVariant.none => InputBorder.none,
    };

    final InputBorder disabled = switch (variant) {
      MainTextFieldVariant.outline || MainTextFieldVariant.filled =>
        _outlineBorder(disabledBorder),
      MainTextFieldVariant.underline => _underlineBorder(disabledBorder),
      MainTextFieldVariant.none => InputBorder.none,
    };

    final InputBorder error = switch (variant) {
      MainTextFieldVariant.outline || MainTextFieldVariant.filled => _outlineBorder(errorBorder),
      MainTextFieldVariant.underline => _underlineBorder(errorBorder),
      MainTextFieldVariant.none => InputBorder.none,
    };

    final InputBorder focusedError = switch (variant) {
      MainTextFieldVariant.outline || MainTextFieldVariant.filled =>
        _outlineBorder(errorBorder, width: 1.6),
      MainTextFieldVariant.underline => _underlineBorder(errorBorder, width: 1.6),
      MainTextFieldVariant.none => InputBorder.none,
    };

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null && labelText!.isNotEmpty) ...[
            Text(labelText!, style: labelStyle),
            SizedBox(height: labelSpacing),
          ],
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            validator: validator,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            enabled: enabled,
            readOnly: readOnly,
            autofocus: autofocus,
            obscureText: obscureText,
            maxLines: maxLines,
            minLines: minLines,
            style: inputStyle,
            decoration: InputDecoration(
              hintText: hintText,
              helperText: helperText,
              errorText: errorText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding: contentPadding,
              filled: isFilled,
              fillColor: filledColor ?? AppColors.gray100,
              border: normal,
              enabledBorder: normal,
              focusedBorder: focused,
              disabledBorder: disabled,
              errorBorder: error,
              focusedErrorBorder: focusedError,
            ),
          ),
        ],
      ),
    );
  }
}
