import 'package:flutter/material.dart';
import 'style.dart';

import 'package:google_fonts/google_fonts.dart';

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
  final Alignment alignment;

  const ResizableButton(this.text,
      {Key? key,
      required this.onPressed,
      required this.isPushed,
      required this.color,
      required this.pushedColor,
      required this.width,
      required this.height,
      required this.radius,
      this.margin = 0.0,
      this.textColor,
      this.alignment = Alignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: SizedBox(
        width: width,
        child: MaterialButton(
          child: Align(
            alignment: alignment,
            child: Text(
              text,
              style: GoogleFonts.inter(
                color: textColor ?? ButtonCSS.textColor,
                fontSize: height * 0.35
                ),
              ),
          ),
          onPressed: onPressed,
          color: isPushed ? pushedColor : color,
          height: height,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
        ),
      ),
    );
  }
}
