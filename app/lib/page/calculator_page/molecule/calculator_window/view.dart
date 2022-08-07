import 'package:calculator/static/size.dart';
import 'package:flutter/material.dart';

class CalculatorWindow extends StatelessWidget {
  final String result;
  final String name;
  final void Function() deleteCalc;
  final void Function(String) setName;
  final bool isSelected;

  const CalculatorWindow(
      {Key? key,
      this.result = "",
      required this.name,
      required this.deleteCalc,
      required this.setName,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 25, 35, 45),
      color: isSelected ? const Color(0xCC3B3B3B) : const Color(0xFF33383F),
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
