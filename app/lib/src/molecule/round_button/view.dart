import 'package:flutter/material.dart';
import 'style.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Function? onClick;

  const RoundButton(this.text, {Key? key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StylingRoundButton(
      onPressed: () {
        onClick!();
      },
      child: Text(text),
    );
  }
}
