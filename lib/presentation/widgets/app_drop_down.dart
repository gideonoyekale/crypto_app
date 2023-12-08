import 'package:crypto_app/core/cores.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class AppDropDown extends StatelessWidget {
  final List<String>? list;
  final bool loading, enabled;
  final String? hint, title;
  final String? selected;
  final Function(String?)? onChangeValue;
  final String? Function(String?)? validator;
  final TextEditingController? Function(String?)? controller;
  final EdgeInsets? margin, padding;
  final Color? background,
      borderColor,
      iconEnabledColor,
      iconDisabledColor,
      dropDownTextColor,
      textColor,
      hintTextColor;
  final FontWeight? dropDownTextWeight, textWeight;
  final double? borderRadius,
      borderWidth,
      height,
      width,
      dropDownTextSize,
      hintFontSize,
      textSize;
  const AppDropDown({
    Key? key,
    this.list,
    this.selected,
    this.onChangeValue,
    this.hint,
    this.margin,
    this.background,
    this.borderColor,
    this.padding,
    this.borderRadius,
    this.borderWidth,
    this.height,
    this.width,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.textColor,
    this.textSize = 16,
    this.dropDownTextColor,
    this.dropDownTextWeight,
    this.textWeight,
    this.dropDownTextSize,
    this.loading = false,
    this.enabled = true,
    this.hintFontSize,
    this.hintTextColor,
    this.title,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          // padding: padding ??
          //     EdgeInsets.symmetric(
          //       horizontal: 20,
          //       vertical: 16,
          //     ),
          // // height: height ?? 50,
          // width: width ?? double.infinity,
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: borderColor ?? Palette.greyText,
          //     width: borderWidth ?? 0.5,
          //   ),
          //   // color: background ?? Colors.white,
          //   borderRadius: BorderRadius.circular(borderRadius ?? 50),
          // ),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    isDense: true,
                    icon: (loading)
                        ? AppCircularProgressIndicator(
                            size: 20,
                            color: context.colorTheme.foregroundColor,
                          )
                        : Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: context.colorTheme.foregroundColor,
                          ),
                    hint: AppText(
                      hint ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.small!.copyWith(
                        color: hintTextColor ?? Palette.grey2,
                      ),
                      alignment: TextAlign.left,
                    ),
                    alignment: Alignment.centerLeft,
                    borderRadius: BorderRadius.circular(12),
                    value: selected,
                    onChanged: enabled ? onChangeValue : null,
                    iconEnabledColor: iconEnabledColor,
                    iconDisabledColor: iconDisabledColor,
                    dropdownColor: context.colorTheme.appBg,
                    items: buildDropDownMenuItems(context, list ?? []),
                    validator: validator,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      errorStyle: context.textTheme.small?.copyWith(
                        color: Colors.red,
                      ),
                      isDense: true,
                      enabled: enabled,
                      contentPadding: padding ??
                          const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(borderRadius ?? 50),
                      //   borderSide: const BorderSide(
                      //     color: Palette.greyText,
                      //     width: 0.5,
                      //   ),
                      // ),
                      // disabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(borderRadius ?? 50),
                      //   borderSide: BorderSide(
                      //     color: borderColor ?? Palette.greyText,
                      //     width: borderWidth ?? 0.5,
                      //   ),
                      // ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(borderRadius ?? 50),
                      //   borderSide: BorderSide(
                      //     color: borderColor ?? Palette.greyText,
                      //     width: borderWidth ?? 0.5,
                      //   ),
                      // ),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(borderRadius ?? 50),
                      //   borderSide: BorderSide(
                      //     color: borderColor ?? Palette.greyText,
                      //     width: borderWidth ?? 0.5,
                      //   ),
                      // ),
                      // errorBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(borderRadius ?? 50),
                      //   borderSide: BorderSide(
                      //     color: Colors.red,
                      //     width: borderWidth ?? 0.5,
                      //   ),
                      // ),
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: hint,
                      hintMaxLines: 1,
                      hintStyle: context.textTheme.small!.copyWith(
                        color: Palette.grey2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> buildDropDownMenuItems(
      BuildContext context, List<String> list) {
    final items = <DropdownMenuItem<String>>[];
    for (var i = 0; i < list.length; i++) {
      final item = list[i];
      items.add(
        DropdownMenuItem(
          value: item,
          enabled: true,
          // enabled: i == 0 ? false : true,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: AppText(
              item,
              maxLines: 1,
              // fontSize: dropDownTextSize ?? textSize,
              // fontWeight: dropDownTextWeight,
              overflow: TextOverflow.ellipsis,
              // color: dropDownTextColor ?? context.colorTheme.foregroundColor,
              style: context.textTheme.small?.copyWith(
                height: 1.5,
                color: (enabled) ? null : Palette.grey2,
              ),
              // color: i == 0 ? Colors.grey : Colors.black
            ),
          ),
        ),
      );
    }
    return items;
  }
}
