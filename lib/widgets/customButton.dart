import 'package:flutter/material.dart';
import 'package:pcms/utils/global.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key key,
    this.lable,
    this.textColor,
    this.buttonColor,
    this.fontSize,
    this.elevation,
    this.bold,
    this.enabled,
    // this.width,
    // this.height,
    this.onTap,
  }) : super(key: key);

  final String lable;
  final dynamic onTap;
  final double fontSize;
  final double elevation;
  final Color buttonColor;
  final Color textColor;
  final bool bold;
  final bool enabled;
  // final double width;
  // final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: enabled == false ? ThemeConstants.greyIconColor : buttonColor,
      elevation: enabled == false ? 0.0 : (elevation == null ? 0.0 : elevation),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: InkWell(
          // splashColor: Colors.red,
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap,
          child: Container(
            // width: width == null ? 100 : width,
            // height: height == null ? 50 : height,
            // color:
            //     enabled == false ? ThemeConstants.greyIconColor : buttonColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Center(
                child: Text(
                  lable,
                  style: TextStyle(
                      fontSize: fontSize == null ? 12 : fontSize,
                      color: textColor,
                      fontWeight:
                          bold == true ? FontWeight.bold : FontWeight.w400),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
