import 'dart:io';

import 'package:flutter/material.dart';

// #1f3e66      rgb(31, 62, 102)  darkbluesokin
// #fb342c primary
// #e6f8fb       rgb(230, 248, 251)     light blue
// #d6edf2       rgb(214, 237, 242)      light blue grey
// #ba030f       rgb(186, 3, 13)         maroon red button
class AppTheme {
  static bool isLightTheme = true;
  static Color primaryColors = HexColor("#ff2e2e");
  static Color lightBlueColor = HexColor("#B1CDFF");
  static Color greyTileColor = HexColor("#F0F2F6");
  static Color greyTileBorderColor = Colors.grey[200];
  // HexColor("#585858");
  static Color darkBlueColor = HexColor("#163CB9");
  static Color blueshade = HexColor('#2545BD');
  static Color darkGreyBorderColor = HexColor("#707070");
  static Color lightGreyColor = HexColor("#E1E6EE");
  static Color lightGreyBorderColor = HexColor("#1C1C1C33");
  static Color placeHolderColor = HexColor("#D0D0D0");
  static Color normalGreyColor = HexColor('#A4A2AC');
  static Color lightGreyFieldBorderColor = HexColor("#00000029");
  static Color maroonRedColor = HexColor("#7A0830");
  static Color primaryGreen = HexColor("#35CB53");
  static Color successGreenColor = HexColor("#36cc55");
  static Color caveGreyColor = HexColor("#a7b2c6");
  static Color kycstatusPendingColor = HexColor("#ffa500");
  static Color blackColor = HexColor('#1C1C1C');
  static Color circleAvatarColor = HexColor('#A4B2CC');
  static Color warningColor = HexColor('#f1c40f');

  static TextTheme _buildTextTheme(TextTheme base) {
    var fontName = Platform.isIOS ? 'SF Pro' : "Roboto";
    return base.copyWith(
      headline6: base.headline6.copyWith(fontFamily: fontName),
      headline5: base.headline6.copyWith(fontFamily: fontName),
      headline4: base.headline6.copyWith(fontFamily: fontName),
      headline3: base.headline6.copyWith(fontFamily: fontName),
      headline2: base.headline6.copyWith(fontFamily: fontName),
      headline1: base.headline6.copyWith(fontFamily: fontName),
      bodyText2: base.headline6.copyWith(fontFamily: fontName),
      bodyText1: base.headline6.copyWith(fontFamily: fontName),
      subtitle2: base.headline6.copyWith(fontFamily: fontName),
      subtitle1: base.headline6.copyWith(fontFamily: fontName),
      button: base.headline6.copyWith(fontFamily: fontName),
      caption: base.headline6.copyWith(fontFamily: fontName),
      overline: base.headline6.copyWith(fontFamily: fontName),
    );
  }

  static ThemeData getTheme() {
    if (isLightTheme) {
      return newLightTheme();
    } else {
      return newDarkTheme();
    }
  }

  static ThemeData newLightTheme() {
    Color primaryColor = primaryColors;
    Color secondaryColor = primaryColors;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      buttonColor: HexColor("#ff2e2e"),
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      accentColor: secondaryColor,
      canvasColor: Colors.white,
      backgroundColor: const Color(0xFFF7F9FC),
      scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      errorColor: const Color(0xFFB00020),
      iconTheme: IconThemeData(color: primaryColor, size: 30),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: HexColor("#ff2e2e"),
          secondary: HexColor("#ba030f"),
        ),
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        // fillColor: Colors.white,
        // filled: true,
        contentPadding: const EdgeInsets.all(15.0),
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(4.0),
          ),
          borderSide: BorderSide(color: darkGreyBorderColor, width: 0.8),
        ),
        enabledBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderRadius: const BorderRadius.all(
            const Radius.circular(4.0),
          ),
          borderSide: BorderSide(color: darkGreyBorderColor, width: 0.8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(4.0),
          ),
          borderSide: BorderSide(color: darkGreyBorderColor, width: 0.8),
        ),
        hintStyle: TextStyle(
          // fontWeight: FontWeight.w500,
          fontFamily: Platform.isIOS ? 'SF Pro' : "Roboto",
          color: darkGreyBorderColor,
        ),
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      // platform: TargetPlatform.iOS,
    );
  }

  // WILL BE SET WHEN NEEDED

  static ThemeData newDarkTheme() {
    Color primaryColor = primaryColors;
    Color secondaryColor = primaryColors;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      buttonColor: HexColor("#000000"),
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      accentColor: secondaryColor,
      canvasColor: Colors.white,
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: const Color(0xFF0F0F0F),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: HexColor("#000000"),
          secondary: HexColor("#ba030f"),
        ),
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
