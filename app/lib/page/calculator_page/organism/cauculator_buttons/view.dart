import 'dart:math';

import 'style.dart';
import '../../molecule/resizable_button/view.dart';
import '../../provider.dart';

import 'package:calculator/static/size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalculatorButtons extends ConsumerWidget {
  const CalculatorButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeConfig = SizeConfig(context);
    final selectedcalculatorId = ref.watch(selectedCalculatorIdProvider);
    final calculatorList = ref.watch(calculatorListProvider.notifier);
    final calculatorHeightSize = ref.watch(calculatorHeightSizeProvider);

    const buttonMargin = 2.0;
    final buttonWidth = (sizeConfig.screenWidth - buttonMargin * 8) * 0.25;
    final buttonHeight = max(
        min((calculatorHeightSize - buttonMargin * 10) * 0.2, buttonWidth),
        (sizeConfig.snapPointHeight - buttonMargin * 10) * 0.2);
    final zeroButtonWidth = (buttonWidth + buttonMargin) * 2;

    final calculatorListState = ref.watch(calculatorListProvider);
    final index = calculatorListState
        .map((e) => e.id)
        .toList()
        .indexOf(selectedcalculatorId);
    final isPushClear = calculatorListState[index].pushedButtonHist.isEmpty ||
        calculatorListState[index].pushedButtonHist[
                calculatorListState[index].pushedButtonHist.length - 1] ==
            "C";

    final pushedButtonType = ref.watch(pushedButtonProvider);

    void onPressed(String buttonType) {
      ref.watch(pushedButtonProvider.notifier).setButtonType(buttonType);
    }

    // return Column(
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         isPushClear
    //             ? ResizableButton(
    //                 "AC",
    //                 onPressed: () {
    //                   calculatorList.allClear(selectedcalculatorId);
    //                 },
    //                 isPushed: false,
    //                 color: FunctionButtonStyle.color,
    //                 pushedColor: FunctionButtonStyle.pushedColor,
    //                 width: buttonWidth,
    //                 height: buttonHeight,
    //                 radius: CommonButtonStyle.radius,
    //                 margin: buttonMargin,
    //               )
    //             : ResizableButton(
    //                 "C",
    //                 onPressed: () {
    //                   calculatorList.clear(selectedcalculatorId);
    //                 },
    //                 isPushed: false,
    //                 color: FunctionButtonStyle.color,
    //                 pushedColor: FunctionButtonStyle.pushedColor,
    //                 width: buttonWidth,
    //                 height: buttonHeight,
    //                 radius: CommonButtonStyle.radius,
    //                 margin: buttonMargin,
    //               ),
    //         ResizableButton(
    //           "hoge",
    //           onPressed: () {
    //             print("hoge");
    //           },
    //           isPushed: false,
    //           color: FunctionButtonStyle.color,
    //           pushedColor: FunctionButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "%",
    //           onPressed: () {
    //             print("%");
    //           },
    //           isPushed: false,
    //           color: FunctionButtonStyle.color,
    //           pushedColor: FunctionButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "/",
    //           onPressed: () {
    //             calculatorList.setOperator("/", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: FunctionButtonStyle.color,
    //           pushedColor: FunctionButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //       ],
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         ResizableButton(
    //           "7",
    //           onPressed: () {
    //             calculatorList.addInputNumber("7", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: NumberButtonStyle.color,
    //           pushedColor: NumberButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "8",
    //           onPressed: () {
    //             calculatorList.addInputNumber("8", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: NumberButtonStyle.color,
    //           pushedColor: NumberButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "9",
    //           onPressed: () {
    //             calculatorList.addInputNumber("9", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: NumberButtonStyle.color,
    //           pushedColor: NumberButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "×",
    //           onPressed: () {
    //             calculatorList.setOperator("*", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: FunctionButtonStyle.color,
    //           pushedColor: FunctionButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //       ],
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         ResizableButton(
    //           "4",
    //           onPressed: () {
    //             calculatorList.addInputNumber("4", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: NumberButtonStyle.color,
    //           pushedColor: NumberButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "5",
    //           onPressed: () {
    //             calculatorList.addInputNumber("5", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: NumberButtonStyle.color,
    //           pushedColor: NumberButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "7",
    //           onPressed: () {
    //             calculatorList.addInputNumber("7", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: NumberButtonStyle.color,
    //           pushedColor: NumberButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "-",
    //           onPressed: () {
    //             calculatorList.setOperator("-", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: FunctionButtonStyle.color,
    //           pushedColor: FunctionButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //       ],
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         ResizableButton(
    //           "1",
    //           onPressed: () {
    //             calculatorList.addInputNumber("1", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: NumberButtonStyle.color,
    //           pushedColor: NumberButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "2",
    //           onPressed: () {
    //             calculatorList.addInputNumber("2", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: NumberButtonStyle.color,
    //           pushedColor: NumberButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "3",
    //           onPressed: () {
    //             calculatorList.addInputNumber("3", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: NumberButtonStyle.color,
    //           pushedColor: NumberButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "+",
    //           onPressed: () {
    //             calculatorList.setOperator("+", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: FunctionButtonStyle.color,
    //           pushedColor: FunctionButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //       ],
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         ResizableButton(
    //           "0",
    //           onPressed: () {
    //             calculatorList.addInputNumber("0", selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: ZeroButtonStyle.color,
    //           pushedColor: ZeroButtonStyle.pushedColor,
    //           width: zeroButtonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           ".",
    //           onPressed: () {
    //             calculatorList.addPeriod(selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: NumberButtonStyle.color,
    //           pushedColor: NumberButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //         ResizableButton(
    //           "=",
    //           onPressed: () {
    //             calculatorList.setEqual(selectedcalculatorId);
    //           },
    //           isPushed: false,
    //           color: FunctionButtonStyle.color,
    //           pushedColor: FunctionButtonStyle.pushedColor,
    //           width: buttonWidth,
    //           height: buttonHeight,
    //           radius: CommonButtonStyle.radius,
    //           margin: buttonMargin,
    //         ),
    //       ],
    //     )
    //   ],
    return Container(
      color: const Color(0xFF1F1F1F),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isPushClear
                  ? ResizableButton("AC", onPressed: () {
                      calculatorList.allClear(selectedcalculatorId);
                      onPressed("AC");
                    },
                      isPushed: false,
                      color: FunctionButtonStyle.color,
                      pushedColor: FunctionButtonStyle.pushedColor,
                      width: buttonWidth,
                      height: buttonHeight,
                      radius: CommonButtonStyle.radius,
                      margin: buttonMargin,
                      textColor: FunctionButtonStyle.textColor)
                  : ResizableButton("C", onPressed: () {
                      calculatorList.clear(selectedcalculatorId);
                      onPressed("C");
                    },
                      isPushed: false,
                      color: FunctionButtonStyle.color,
                      pushedColor: FunctionButtonStyle.pushedColor,
                      width: buttonWidth,
                      height: buttonHeight,
                      radius: CommonButtonStyle.radius,
                      margin: buttonMargin,
                      textColor: FunctionButtonStyle.textColor),
              ResizableButton(
                "+/-",
                onPressed: () {
                  print("hoge");
                  onPressed("+/-");
                },
                isPushed: false,
                color: FunctionButtonStyle.color,
                pushedColor: FunctionButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
                textColor: FunctionButtonStyle.textColor,
              ),
              ResizableButton(
                "%",
                onPressed: () {
                  print("%");
                  onPressed("%");
                },
                isPushed: false,
                color: FunctionButtonStyle.color,
                pushedColor: FunctionButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
                textColor: FunctionButtonStyle.textColor,
              ),
              ResizableButton(
                "÷",
                onPressed: () {
                  calculatorList.setOperator("/", selectedcalculatorId);
                  onPressed("÷");
                },
                isPushed: pushedButtonType == "÷",
                color: OperatorButtonStyle.color,
                pushedColor: OperatorButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
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
                  onPressed("7");
                },
                isPushed: false,
                color: NumberButtonStyle.color,
                pushedColor: NumberButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
              ),
              ResizableButton(
                "8",
                onPressed: () {
                  calculatorList.addInputNumber("8", selectedcalculatorId);
                  onPressed("8");
                },
                isPushed: false,
                color: NumberButtonStyle.color,
                pushedColor: NumberButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
              ),
              ResizableButton(
                "9",
                onPressed: () {
                  calculatorList.addInputNumber("9", selectedcalculatorId);
                  onPressed("9");
                },
                isPushed: false,
                color: NumberButtonStyle.color,
                pushedColor: NumberButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
              ),
              ResizableButton(
                "×",
                onPressed: () {
                  calculatorList.setOperator("*", selectedcalculatorId);
                  onPressed("×");
                },
                isPushed: pushedButtonType == "×",
                color: OperatorButtonStyle.color,
                pushedColor: OperatorButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
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
                  onPressed("4");
                },
                isPushed: false,
                color: NumberButtonStyle.color,
                pushedColor: NumberButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
              ),
              ResizableButton(
                "5",
                onPressed: () {
                  calculatorList.addInputNumber("5", selectedcalculatorId);
                  onPressed("5");
                },
                isPushed: false,
                color: NumberButtonStyle.color,
                pushedColor: NumberButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
              ),
              ResizableButton(
                "6",
                onPressed: () {
                  calculatorList.addInputNumber("6", selectedcalculatorId);
                  onPressed("6");
                },
                isPushed: false,
                color: NumberButtonStyle.color,
                pushedColor: NumberButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
              ),
              ResizableButton(
                "-",
                onPressed: () {
                  calculatorList.setOperator("-", selectedcalculatorId);
                  onPressed("-");
                },
                isPushed: pushedButtonType == "-",
                color: OperatorButtonStyle.color,
                pushedColor: OperatorButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
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
                  onPressed("1");
                },
                isPushed: false,
                color: NumberButtonStyle.color,
                pushedColor: NumberButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
              ),
              ResizableButton(
                "2",
                onPressed: () {
                  calculatorList.addInputNumber("2", selectedcalculatorId);
                  onPressed("2");
                },
                isPushed: false,
                color: NumberButtonStyle.color,
                pushedColor: NumberButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
              ),
              ResizableButton(
                "3",
                onPressed: () {
                  calculatorList.addInputNumber("3", selectedcalculatorId);
                  onPressed("3");
                },
                isPushed: false,
                color: NumberButtonStyle.color,
                pushedColor: NumberButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
              ),
              ResizableButton(
                "+",
                onPressed: () {
                  calculatorList.setOperator("+", selectedcalculatorId);
                  onPressed("+");
                },
                isPushed: pushedButtonType == "+",
                color: OperatorButtonStyle.color,
                pushedColor: OperatorButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
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
                  onPressed("0");
                },
                isPushed: false,
                color: ZeroButtonStyle.color,
                pushedColor: ZeroButtonStyle.pushedColor,
                width: zeroButtonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
                alignment: const Alignment(-0.65, 0.0),
              ),
              ResizableButton(
                ".",
                onPressed: () {
                  calculatorList.addPeriod(selectedcalculatorId);
                  onPressed(".");
                },
                isPushed: false,
                color: NumberButtonStyle.color,
                pushedColor: NumberButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
              ),
              ResizableButton(
                "=",
                onPressed: () {
                  calculatorList.setEqual(selectedcalculatorId);
                  onPressed("=");
                },
                isPushed: false,
                color: OperatorButtonStyle.color,
                pushedColor: OperatorButtonStyle.pushedColor,
                width: buttonWidth,
                height: buttonHeight,
                radius: CommonButtonStyle.radius,
                margin: buttonMargin,
              ),
            ],
          )
        ],
      ),
    );
  }
}
