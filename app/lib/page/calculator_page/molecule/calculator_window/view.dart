import 'package:calculator/page/calculator_page/molecule/rename_widget/view.dart';
import 'package:calculator/static/size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../provider.dart';

class CalculatorWindow extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeConfig = SizeConfig(context);
    final windowHeightSize = ref.watch(windowHeightSizeProvider);
    const leftPad = 35.0;
    const topPad = 5.0;
    const rightPad = 35.0;
    const bottomPad = 0.0;

    return Container(
      height: windowHeightSize - (topPad + bottomPad),
      padding: const EdgeInsets.fromLTRB(leftPad, topPad, rightPad, bottomPad),
      color: isSelected ? const Color(0xCC3B3B3B) : const Color(0xFF33383F),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RenameWidget(setName: setName, name: name),
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
