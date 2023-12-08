import 'package:crypto_app/core/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets.dart';

class AppTextField extends StatelessWidget {
  final String? title, hintText, initialText, labelText;
  final TextInputType? textInputType;
  final Widget? icon, suffixIcon, prefixIcon;
  final bool? obscureText, enabled, autofocus, showCursor, isDense;
  final String? obscureChar, suffixText, errorText;
  final TextEditingController? controller;
  final Function()? onTap;
  final double? fontSize,
      borderWidth,
      focusBorderWidth,
      borderRadius,
      textHeight;
  final int? maxLines, minLines, maxLength, hintMaxLines;
  final EdgeInsets? margin;
  final Iterable<String>? autofillHints;
  final EdgeInsets? padding;
  final Function(String)? onChanged, onSubmitted;
  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final TextStyle? errorStyle, labelTextStyle;
  final TextAlign? textAlign;
  final BoxConstraints? suffixBoxConstraints, prefixBoxConstraints, constraints;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final FontWeight? fontWeight;
  final AutovalidateMode? autoValidateMode;
  final OutlineInputBorder? disabledBorder,
      enabledBorder,
      focusedBorder,
      errorBorder;
  final Color? borderColor,
      focusBorderColor,
      backgroundColor,
      errorBorderColor,
      hintTextColor,
      textColor;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization? textCapitalization;
  final Widget? counter;
  final bool loading;
  final Widget? Function(BuildContext context,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;
  const AppTextField(
      {super.key,
      this.title,
      this.hintText,
      this.textInputType,
      this.icon,
      this.suffixIcon,
      this.obscureText,
      this.obscureChar,
      this.onTap,
      this.fontSize,
      this.maxLines,
      this.minLines,
      this.margin,
      this.padding,
      this.onChanged,
      this.onEditingComplete,
      this.counter,
      this.suffixText,
      this.validator,
      this.initialText,
      this.controller,
      this.enabled,
      this.suffixBoxConstraints,
      this.prefixBoxConstraints,
      this.errorText,
      this.errorStyle,
      this.maxLength,
      this.inputFormatters,
      this.autofocus,
      this.textAlign,
      this.focusNode,
      this.showCursor,
      this.borderWidth,
      this.autofillHints,
      this.prefixIcon,
      this.borderColor,
      this.borderRadius,
      this.backgroundColor,
      this.focusBorderColor,
      this.focusBorderWidth,
      this.textHeight,
      this.errorBorderColor,
      this.textInputAction,
      this.onSubmitted,
      this.disabledBorder,
      this.enabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.labelText,
      this.labelTextStyle,
      this.textAlignVertical,
      this.constraints,
      this.textColor,
      this.fontWeight,
      this.buildCounter,
      this.textCapitalization,
      this.isDense,
      this.hintTextColor,
      this.loading = false,
      this.hintMaxLines,
      this.autoValidateMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          AppText(
            title ?? '',
            style: context.textTheme.small!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacing.smallHeight()
        ],
        Container(
          margin: margin,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: TextFormField(
            autofillHints: autofillHints,
            focusNode: focusNode,
            autofocus: autofocus ?? false,
            maxLength: maxLength,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            validator: validator,
            textAlign: textAlign ?? TextAlign.start,
            style: context.textTheme.small?.copyWith(
              color: (enabled ?? true) ? null : Palette.grey1,
              fontSize: fontSize,
            ),
            initialValue: initialText == null ? null : initialText!,
            onEditingComplete: onEditingComplete,
            onChanged: onChanged,
            onTap: onTap,
            cursorColor: Palette.white,
            showCursor: showCursor ?? true,
            obscureText: obscureText == null ? false : obscureText!,
            obscuringCharacter: obscureChar != null ? obscureChar! : '*',
            keyboardType: textInputType,
            textInputAction: textInputAction,
            onFieldSubmitted: onSubmitted,
            maxLines: maxLines ?? 1,
            textAlignVertical: textAlignVertical,
            minLines: minLines,
            buildCounter: buildCounter,
            controller: controller,
            enabled: enabled ?? true,
            autovalidateMode: autoValidateMode,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              counter: counter,
              alignLabelWithHint: true,
              labelText: labelText,
              labelStyle: labelTextStyle,
              prefixIcon: prefixIcon,
              errorStyle: errorStyle ??
                  context.textTheme.small?.copyWith(
                    color: Colors.red,
                  ),
              errorText: errorText,
              isDense: isDense ?? true,
              contentPadding: padding ??
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
              suffixText: suffixText,
              suffixIconConstraints: suffixBoxConstraints,
              suffixIcon: suffixIcon == null ? null : suffixIcon!,
              icon: icon == null && !loading
                  ? null
                  : Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: loading
                          ? AppCircularProgressIndicator(
                              size: 16,
                              color: context.colorTheme.foregroundColor,
                            )
                          : icon,
                    ),
              constraints: constraints,
              // focusedBorder: focusedBorder ??
              //     OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(borderRadius ?? 50),
              //       borderSide: BorderSide(
              //         color: focusBorderColor ?? Palette.greyText,
              //         width: focusBorderWidth ?? 0.5,
              //       ),
              //     ),
              // disabledBorder: disabledBorder ??
              //     OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(borderRadius ?? 50),
              //       borderSide: BorderSide(
              //         color: borderColor ?? Palette.greyText,
              //         width: borderWidth ?? 0.5,
              //       ),
              //     ),
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 12),
                    borderSide: BorderSide.none,
                  ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
                borderSide: BorderSide.none,
              ),
              // errorBorder: errorBorder ??
              //     OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(borderRadius ?? 50),
              //       borderSide: BorderSide(
              //         color: errorBorderColor ?? Colors.red,
              //         width: borderWidth ?? 0.5,
              //       ),
              //     ),
              filled: true,
              fillColor: backgroundColor ?? Palette.primary,
              hintText: hintText,
              hintMaxLines: hintMaxLines,
              hintStyle: context.textTheme.small!.copyWith(
                color: Palette.grey2,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
