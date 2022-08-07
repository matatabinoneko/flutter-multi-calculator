import 'package:flutter/material.dart';
import 'style.dart';

class ResizableButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool isPushed;
  final Color color;
  final Color pushedColor;
  final double width;
  final double height;
  final double radius;
  final double margin;
  final Color? textColor;

  const ResizableButton(this.text,
      {Key? key,
      required this.onPressed,
      required this.isPushed,
      required this.color,
      required this.pushedColor,
      required this.width,
      required this.height,
      required this.radius,
      this.textColor,
      this.margin = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: SizedBox(
        width: width,
        child: MaterialButton(
          child: Text(text),
          onPressed: onPressed,
          color: isPushed ? pushedColor : color,
          textColor: textColor == null ? ButtonCSS.textColor : textColor,
          height: height,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
        ),
      ),
    );
  }
}
