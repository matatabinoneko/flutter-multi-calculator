import 'package:calculator/src/molecule/calculator_window/view.dart';
import 'package:calculator/static/size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../provider.dart';

class CalculatorWindows extends ConsumerWidget {
  const CalculatorWindows({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeConfig = SizeConfig(context);
    final calculatorList = ref.watch(calculatorListProvider);

    String getDisplayResult(int index) {
      final result = calculatorList[index].result.toStringAsPrecision(5);
      final operator = calculatorList[index].operator;
      final inputNumber = calculatorList[index].inputNumber;
      if (inputNumber != "") {
        return inputNumber;
      } else if (operator == "") {
        return result;
      } else {
        return "$result $operator";
      }
    }

    void deleteCalc(int index) {
      final id = calculatorList[index].id;
      ref.watch(calculatorListProvider.notifier).deleteCaluculator(id);
    }

    void onTap(int index) {
      final id = calculatorList[index].id;
      ref.watch(selectedCalculatorIdProvider.notifier).setId(id);
    }

    void setName(int index, String name) {
      final id = ref.read(calculatorListProvider)[index].id;
      ref.watch(calculatorListProvider.notifier).setName(id, name);
    }

    return ReorderableListView(
      padding: EdgeInsets.only(
          top: sizeConfig.statusBarHeight,
          bottom: ref.watch(calculatorHeightSizeProvider)),
      onReorder: (int oldIndex, int newIndex) {
        ref
            .watch(calculatorListProvider.notifier)
            .reOrderCaluculator(oldIndex: oldIndex, newIndex: newIndex);
      },
      children: <Widget>[
        for (final index in List<int>.generate(calculatorList.length, (i) => i))
          Material(
            key: Key(calculatorList[index].id),
            child: InkWell(
              child: CalculatorWindow(
                result: getDisplayResult(index),
                deleteCalc: () {
                  deleteCalc(index);
                },
                name: calculatorList[index].name,
                setName: (String name) {
                  setName(index, name);
                },
              ),
              onTap: () {
                onTap(index);
              },
            ),
          )
      ],
    );
  }
}
