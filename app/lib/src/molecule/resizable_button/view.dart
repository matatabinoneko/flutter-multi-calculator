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

  const ResizableButton(this.text,
      {Key? key,
      required this.onPressed,
      required this.isPushed,
      required this.color,
      required this.pushedColor,
      required this.width,
      required this.height,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
        child: Text(text),
        onPressed: onPressed,
        color: isPushed ? pushedColor : color,
        textColor: ButtonCSS.textColor,
        height: height,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
