import 'package:calculator/static/size.dart';
import 'package:flutter/material.dart';
import 'style.dart';

class CollapsedBar extends StatelessWidget {
  final void Function() onPressed;

  const CollapsedBar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BarCSS.backGroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              padding: const EdgeInsets.all(0),
              iconSize: SizeConfig.minCalculatorHeight,
              onPressed: onPressed,
              icon: Icon(
                Icons.calculate_outlined,
                color: BarCSS.iconColor,
              ))
        ],
      ),
    );
  }
}
