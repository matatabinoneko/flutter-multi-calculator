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
    return Container(
      color: const Color(0xFF33383F),
      padding: const EdgeInsets.fromLTRB(35, 25, 35, 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: sizeConfig.calculatorNameTextWidth,
                child: TextField(
                  controller: TextEditingController(text: name),
                  obscureText: false,
                  onSubmitted: setName,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: deleteCalc,
                iconSize: 25,
              ),
            ],
          ),
          Text(
            result,
            textAlign: TextAlign.end,
            style: const TextStyle(color: Colors.white, fontSize: 40),
          ),
        ],
      ),
    );
  }
}
