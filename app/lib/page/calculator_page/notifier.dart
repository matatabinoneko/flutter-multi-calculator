import 'package:calculator/core/uuid.dart';
import 'package:calculator/static/size.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import 'model.dart';
import 'provider.dart';

class CalculatorListNotifier extends StateNotifier<List<CalculatorModel>> {
  Ref ref;
  CalculatorListNotifier(this.ref) : super([]) {
    addCalculator();
    ref.watch(selectedCalculatorIdProvider.notifier).setId(state[0].id);
  }

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

  String getDisplayResult(int index) {
    final result = state[index].result.toStringAsPrecision(5);
    final operator = state[index].operator;
    final inputNumber = state[index].inputNumber;
    if (inputNumber != "") {
      return inputNumber;
    } else if (operator == "") {
      return result;
    } else {
      return "$result $operator";
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

class SelectedIdNotifier extends StateNotifier<String> {
  SelectedIdNotifier() : super("");

  void setId(String id) {
    state = id;
  }
}

class CalculatorHeightSizeNotifier extends StateNotifier<double> {
  CalculatorHeightSizeNotifier() : super(SizeConfig.minCalculatorHeight);

  void setState(double state) {
    this.state = state;
  }
}
