import 'package:calculator/core/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'model.dart';

// class Calculator extends StateNotifier<CalculatorModel> {
//   Calculator(String id) : super(CalculatorModel(id));

//   // 電卓のCボタン
//   void clear() {
//     state = state.copyWith(inputNumber: "");
//   }

//   //電卓のACボタン
//   void allClear() {
//     state = state.copyWith(inputNumber: "", operator: "", result: 0);
//   }

//   // 電卓の小数点 (.) ボタン
//   void addPeriod() {
//     if (state.inputNumber.contains(".")) {
//       return null;
//     } else {
//       state = state.copyWith(inputNumber: "${state.inputNumber}.");
//     }
//     return state.inputNumber;
//   }

//   //電卓の数字ボタン
//   void addInputNumber(String input) {
//     if (!_validateInputNumber(input)) {
//       return null;
//     }
//     state = state.copyWith(inputNumber: "${state.inputNumber}$input");
//     return state.inputNumber;
//   }

//   // 電卓の演算子ボタン
//   void setOperator(String input) {
//     if (!_validateInputOperator(input)) {
//       return null;
//     }

//     if (state.inputNumber != "") {
//       doCalc();
//     }
//     state = state.copyWith(operator: input);

//     return state.operator;
//   }

//   // 計算する関数
//   double doCalc() {
//     double inputValue = double.parse(state.inputNumber);
//     switch (state.operator) {
//       case "":
//         state = state.copyWith(result: inputValue);
//         break;
//       case "+":
//         state = state.copyWith(result: state.result + inputValue);
//         break;
//       case "-":
//         state = state.copyWith(result: state.result - inputValue);
//         break;
//       case "*":
//         state = state.copyWith(result: state.result * inputValue);
//         break;
//       case "/":
//         state = state.copyWith(result: state.result / inputValue);
//         break;
//       case "=":
//         break;
//     }
//     state = state.copyWith(inputNumber: "");
//     return state.result;
//   }

//   // 入力テキストが有効な数字か確認するvalidator
//   bool _validateInputNumber(String input) {
//     if (input.length != 1) {
//       return false;
//     }

//     if (!state.invalidNumbers.contains(input)) {
//       return false;
//     }
//     return true;
//   }

//   //入力されたテキストが有効な演算子か確認するvalidator
//   bool _validateInputOperator(String input) {
//     if (input.length != 1) {
//       return false;
//     }
//     if (!state.invalidOperators.contains(input)) {
//       return false;
//     }
//     return true;
//   }
// }

class CalculatorList extends StateNotifier<List<CalculatorModel>> {
  CalculatorList() : super([CalculatorModel(createUUID(), name: "電卓0")]);

  void addCalculator() {
    state = [
      ...state,
      CalculatorModel(createUUID(), name: "電卓${state.length}")
    ];
  }

  void deleteCaluculator(String id) {
    if (1 < state.length) {
      state = state
          .where((CalculatorModel calculator) => calculator.id != id)
          .toList();
    }
  }

  void reOrderCaluculator({required int oldIndex, required int newIndex}) {
    var newCalcList = [...state];
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final CalculatorModel item = newCalcList.removeAt(oldIndex);
    newCalcList.insert(newIndex, item);
    state = [...newCalcList];
  }

  void setName(String id, String name) {
    state = [
      for (final calculator in state)
        if (calculator.id == id) calculator.copyWith(name: name) else calculator
    ];
  }

  // 電卓のCボタン
  void clear(String id) {
    state = [
      for (final calculator in state)
        if (calculator.id == id)
          calculator.copyWith(inputNumber: "", operator: "", result: 0)
        else
          calculator,
    ];
  }

  //電卓のACボタン
  void allClear(String id) {
    state = [
      for (final calculator in state)
        if (calculator.id == id)
          calculator.copyWith(inputNumber: "", operator: "", result: 0)
        else
          calculator,
    ];
  }

  // 電卓の小数点 (.) ボタン
  void addPeriod(String id) {
    state = [
      for (final calculator in state)
        if (calculator.id == id && !calculator.inputNumber.contains("."))
          calculator.copyWith(inputNumber: "${calculator.inputNumber}.")
        else
          calculator,
    ];
  }

  //電卓の数字ボタン
  void addInputNumber(String input, String id) {
    state = [
      for (final calculator in state)
        if (calculator.id == id)
          calculator.copyWith(inputNumber: "${calculator.inputNumber}$input")
        else
          calculator,
    ];
  }

  // 電卓の演算子ボタン
  void setOperator(String input, String id) {
    final index = state.map((e) => e.id).toList().indexOf(id);
    if (state[index].inputNumber != "") {
      doCalc(index);
    }
    state = [
      for (final calculator in state)
        if (calculator.id == id)
          calculator.copyWith(operator: input)
        else
          calculator,
    ];
  }

  // 計算する関数
  double doCalc(int index) {
    double inputValue = double.parse(state[index].inputNumber);

    switch (state[index].operator) {
      case "":
        state = [
          ...state.sublist(0, index),
          state[index].copyWith(result: inputValue),
          ...state.sublist(index + 1)
        ];
        break;
      case "+":
        state = [
          ...state.sublist(0, index),
          state[index].copyWith(result: state[index].result + inputValue),
          ...state.sublist(index + 1)
        ];
        break;
      case "-":
        state = [
          ...state.sublist(0, index),
          state[index].copyWith(result: state[index].result - inputValue),
          ...state.sublist(index + 1)
        ];
        break;
      case "*":
        state = [
          ...state.sublist(0, index),
          state[index].copyWith(result: state[index].result * inputValue),
          ...state.sublist(index + 1)
        ];
        break;
      case "/":
        state = [
          ...state.sublist(0, index),
          state[index].copyWith(result: state[index].result / inputValue),
          ...state.sublist(index + 1)
        ];
        break;
      case "=":
        break;
    }
    state = [
      ...state.sublist(0, index),
      state[index].copyWith(inputNumber: ""),
      ...state.sublist(index + 1)
    ];
    return state[index].result;
  }
}
