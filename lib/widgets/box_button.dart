import 'package:flutter/material.dart';
import 'package:pcms/utils/app_theme.dart';

class BoxButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color color;

  const BoxButton({Key key, this.title, this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.0,
      child: RaisedButton(
        color: color ?? AppTheme.primaryColors,
        child: Text(title),
        onPressed: onPressed,
      ),
    );
  }
}
