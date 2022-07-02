import 'package:calculator/static/size.dart';
import 'package:flutter/material.dart';

class StylingRoundButton extends StatelessWidget {
  void Function()? onPressed;
  @override
  Widget? child;
  StylingRoundButton(
      {Key? key,
      Color? color = Colors.grey,
      Color? textColor = Colors.white,
      EdgeInsetsGeometry padding = const EdgeInsets.all(16),
      ShapeBorder shape = const CircleBorder(),
      required this.onPressed,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return MaterialButton(
        color: Colors.grey,
        textColor: Colors.white,
        height: sizeConfig.screenWidth * 0.2,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: child);
  }
}
