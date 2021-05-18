import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pcms/utils/global.dart';

class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget({
    Key key,
    this.controller,
    this.helperValue = "",
    this.validator,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.hintValue,
    this.onChanged,
    this.type,
    this.textCapitalization = TextCapitalization.none,
    this.fillColor,
    this.textColor,
    this.maxLength = GlobalConstants.maxLength,
    this.onSubmit,
    this.initialValue,
    this.helperTextStyle,
    this.focusNode,
    this.upperLabel,
    this.onEditingComplete,
    this.textInputAction,
    this.inputFormatters,
  }) : super(key: key);
  final String initialValue;
  final String hintValue;
  final String helperValue;
  final TextEditingController controller;
  final validator;
  final bool obscureText;
  final Widget suffixIcon;
  final TextInputType type;
  final upperLabel;
  final TextInputAction textInputAction;
  final dynamic onChanged;
  final dynamic onEditingComplete;
  final int maxLength;
  final dynamic onSubmit;
  TextStyle helperTextStyle;
  TextStyle labelTextStyle;
  FocusNode focusNode;
  Color fillColor;
  Color textColor;
  bool readOnly;
  bool enabled;
  final List<TextInputFormatter> inputFormatters;
  TextCapitalization textCapitalization;
  Widget prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: helperValue.contains("null") ? 40 : 70,
      child: TextFormField(
        initialValue: initialValue,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        enabled: enabled,
        style: new TextStyle(
            color: textColor == null
                ? ThemeConstants.secondaryTextColor
                : textColor),
        focusNode: focusNode,
        keyboardType: type,
        autocorrect: false,
        obscureText: obscureText,
        onEditingComplete: onEditingComplete,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: ThemeConstants.primaryColor,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              color: ThemeConstants.primaryColor,
              width: 1,
            ),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeConstants.secondaryTextColor,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          fillColor:
              fillColor == null ? Colors.white.withOpacity(0.3) : fillColor,
          filled: true,
          // focusColor: ThemeConstants.accentColor,
          prefixIcon: prefixIcon,
          counterText: "",
          helperText: helperValue.contains("null") ? null : helperValue,
          helperStyle: TextStyle(
              color: textColor == null
                  ? ThemeConstants.secondaryTextColor
                  : textColor),
          labelText: upperLabel,
          labelStyle: TextStyle(
              color: textColor == null
                  ? ThemeConstants.secondaryTextColor
                  : textColor),
          hintText: hintValue,
          hintStyle: TextStyle(
              color: textColor == null
                  ? ThemeConstants.secondaryTextColor
                  : textColor),
        ),
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        maxLength: maxLength,
        onFieldSubmitted: onSubmit,
      ),
    );
  }
}
