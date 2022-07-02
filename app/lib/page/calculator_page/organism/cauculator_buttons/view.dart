import 'dart:math';

import 'style.dart';
import 'package:calculator/src/molecule/resizable_button/view.dart';
import 'package:calculator/static/size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider.dart';

class CalculatorButtons extends ConsumerWidget {
  const CalculatorButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeConfig = SizeConfig(context);
    final selectedcalculatorId = ref.watch(selectedCalculatorIdProvider);
    final calculatorList = ref.watch(calculatorListProvider.notifier);
    final calculatorButtonHeight = ref.watch(calculatorButtonHeightProvider);
    final numberButtonStyle = NumberButtonStyle(context);
    final functionButtonStyle = FunctionButtonStyle(context);
    final zeroButtonStyle = ZeroButtonStyle(context);
    final numberButtonHeight =
        min(calculatorButtonHeight, sizeConfig.screenWidth * 0.2);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResizableButton(
              "AC",
              onPressed: () {
                calculatorList.allClear(selectedcalculatorId);
              },
              isPushed: false,
              color: functionButtonStyle.color,
              pushedColor: functionButtonStyle.pushedColor,
              width: functionButtonStyle.width,
              height: numberButtonHeight,
              radius: functionButtonStyle.radius,
            ),
            ResizableButton(
              "hoge",
              onPressed: () {
                print("hoge");
              },
              isPushed: false,
              color: functionButtonStyle.color,
              pushedColor: functionButtonStyle.pushedColor,
              width: functionButtonStyle.width,
              height: numberButtonHeight,
              radius: functionButtonStyle.radius,
            ),
            ResizableButton(
              "%",
              onPressed: () {
                print("%");
              },
              isPushed: false,
              color: functionButtonStyle.color,
              pushedColor: functionButtonStyle.pushedColor,
              width: functionButtonStyle.width,
              height: numberButtonHeight,
              radius: functionButtonStyle.radius,
            ),
            ResizableButton(
              "/",
              onPressed: () {
                calculatorList.setOperator("/", selectedcalculatorId);
              },
              isPushed: false,
              color: functionButtonStyle.color,
              pushedColor: functionButtonStyle.pushedColor,
              width: functionButtonStyle.width,
              height: numberButtonHeight,
              radius: functionButtonStyle.radius,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResizableButton(
              "7",
              onPressed: () {
                calculatorList.addInputNumber("7", selectedcalculatorId);
              },
              isPushed: false,
              color: numberButtonStyle.color,
              pushedColor: numberButtonStyle.pushedColor,
              width: numberButtonStyle.width,
              height: numberButtonHeight,
              radius: numberButtonStyle.radius,
            ),
            ResizableButton(
              "8",
              onPressed: () {
                calculatorList.addInputNumber("8", selectedcalculatorId);
              },
              isPushed: false,
              color: numberButtonStyle.color,
              pushedColor: numberButtonStyle.pushedColor,
              width: numberButtonStyle.width,
              height: numberButtonHeight,
              radius: numberButtonStyle.radius,
            ),
            ResizableButton(
              "9",
              onPressed: () {
                calculatorList.addInputNumber("9", selectedcalculatorId);
              },
              isPushed: false,
              color: numberButtonStyle.color,
              pushedColor: numberButtonStyle.pushedColor,
              width: numberButtonStyle.width,
              height: numberButtonHeight,
              radius: numberButtonStyle.radius,
            ),
            ResizableButton(
              "×",
              onPressed: () {
                calculatorList.setOperator("*", selectedcalculatorId);
              },
              isPushed: false,
              color: functionButtonStyle.color,
              pushedColor: functionButtonStyle.pushedColor,
              width: functionButtonStyle.width,
              height: numberButtonHeight,
              radius: functionButtonStyle.radius,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResizableButton(
              "4",
              onPressed: () {
                calculatorList.addInputNumber("4", selectedcalculatorId);
              },
              isPushed: false,
              color: numberButtonStyle.color,
              pushedColor: numberButtonStyle.pushedColor,
              width: numberButtonStyle.width,
              height: numberButtonHeight,
              radius: numberButtonStyle.radius,
            ),
            ResizableButton(
              "5",
              onPressed: () {
                calculatorList.addInputNumber("5", selectedcalculatorId);
              },
              isPushed: false,
              color: numberButtonStyle.color,
              pushedColor: numberButtonStyle.pushedColor,
              width: numberButtonStyle.width,
              height: numberButtonHeight,
              radius: numberButtonStyle.radius,
            ),
            ResizableButton(
              "7",
              onPressed: () {
                calculatorList.addInputNumber("7", selectedcalculatorId);
              },
              isPushed: false,
              color: numberButtonStyle.color,
              pushedColor: numberButtonStyle.pushedColor,
              width: numberButtonStyle.width,
              height: numberButtonHeight,
              radius: numberButtonStyle.radius,
            ),
            ResizableButton(
              "-",
              onPressed: () {
                calculatorList.setOperator("-", selectedcalculatorId);
              },
              isPushed: false,
              color: functionButtonStyle.color,
              pushedColor: functionButtonStyle.pushedColor,
              width: functionButtonStyle.width,
              height: numberButtonHeight,
              radius: functionButtonStyle.radius,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResizableButton(
              "1",
              onPressed: () {
                calculatorList.addInputNumber("1", selectedcalculatorId);
              },
              isPushed: false,
              color: numberButtonStyle.color,
              pushedColor: numberButtonStyle.pushedColor,
              width: numberButtonStyle.width,
              height: numberButtonHeight,
              radius: numberButtonStyle.radius,
            ),
            ResizableButton(
              "2",
              onPressed: () {
                calculatorList.addInputNumber("2", selectedcalculatorId);
              },
              isPushed: false,
              color: numberButtonStyle.color,
              pushedColor: numberButtonStyle.pushedColor,
              width: numberButtonStyle.width,
              height: numberButtonHeight,
              radius: numberButtonStyle.radius,
            ),
            ResizableButton(
              "3",
              onPressed: () {
                calculatorList.addInputNumber("3", selectedcalculatorId);
              },
              isPushed: false,
              color: numberButtonStyle.color,
              pushedColor: numberButtonStyle.pushedColor,
              width: numberButtonStyle.width,
              height: numberButtonHeight,
              radius: numberButtonStyle.radius,
            ),
            ResizableButton(
              "+",
              onPressed: () {
                calculatorList.setOperator("+", selectedcalculatorId);
              },
              isPushed: false,
              color: functionButtonStyle.color,
              pushedColor: functionButtonStyle.pushedColor,
              width: functionButtonStyle.width,
              height: numberButtonHeight,
              radius: functionButtonStyle.radius,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResizableButton(
              "0",
              onPressed: () {
                calculatorList.addInputNumber("0", selectedcalculatorId);
              },
              isPushed: false,
              color: zeroButtonStyle.color,
              pushedColor: zeroButtonStyle.pushedColor,
              width: zeroButtonStyle.width,
              height: numberButtonHeight,
              radius: zeroButtonStyle.radius,
            ),
            ResizableButton(
              ".",
              onPressed: () {
                calculatorList.addPeriod(selectedcalculatorId);
              },
              isPushed: false,
              color: numberButtonStyle.color,
              pushedColor: numberButtonStyle.pushedColor,
              width: numberButtonStyle.width,
              height: numberButtonHeight,
              radius: numberButtonStyle.radius,
            ),
            ResizableButton(
              "=",
              onPressed: () {
                calculatorList.setOperator("=", selectedcalculatorId);
              },
              isPushed: false,
              color: functionButtonStyle.color,
              pushedColor: functionButtonStyle.pushedColor,
              width: functionButtonStyle.width,
              height: numberButtonHeight,
              radius: functionButtonStyle.radius,
            ),
          ],
        )
      ],
    );
  }
}
