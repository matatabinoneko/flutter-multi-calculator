import 'package:calculator/static/size.dart';
import 'package:flutter/material.dart';

class CalculatorWindow extends StatelessWidget {
  final String result;
  final String name;
  final void Function() deleteCalc;
  final void Function(String) setName;

  const CalculatorWindow(
      {Key? key,
      this.result = "",
      required this.name,
      required this.deleteCalc,
      required this.setName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Row(
      children: [
        SizedBox(
          width: sizeConfig.calculatorNameTextWidth,
          child: TextField(
            controller: TextEditingController(text: name),
            obscureText: false,
            onSubmitted: setName,
          ),
        ),
        Text(result),
        InkWell(
          child: const Icon(Icons.delete),
          onTap: deleteCalc,
        ),
      ],
    );
  }
}
