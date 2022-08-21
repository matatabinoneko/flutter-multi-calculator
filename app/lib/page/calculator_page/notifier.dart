import 'dart:math';
import 'package:calculator/core/uuid.dart';
import 'package:calculator/static/size.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

import 'model.dart';
import 'provider.dart';

class CalculatorListNotifier extends StateNotifier<List<CalculatorModel>> {
  Ref ref;
  final String _validNumbers = "0123456789.";
  final String _validOperators = "+-*/";
  final String equal = "=";
  final ContextModel _cm = ContextModel();
  final Parser _p = Parser();

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
    final index = _getIndex(id);
    if (1 < state.length) {
      state = state
          .where((CalculatorModel calculator) => calculator.id != id)
          .toList();
      String selectedId =
          ref.watch(selectedCalculatorIdProvider.notifier).state;
      if (selectedId == id) {
        ref
            .watch(selectedCalculatorIdProvider.notifier)
            .setId(state[min(state.length - 1, index)].id);
      }
    }
  }

  bool isPushClear(String id) {
    final index = _getIndex(id);
    return state[index].pushedButtonHist.isNotEmpty &&
        state[index]
                .pushedButtonHist[state[index].pushedButtonHist.length - 1] ==
            "C";
  }

  String getDisplayResult(int index) {
    final result = doCalc(index).toString();
    final operator = state[index].operator;
    final inputNumber = state[index].number;
    final String? lastPushedButton = state[index].pushedButtonHist.isEmpty
        ? null
        : state[index]
            .pushedButtonHist[state[index].pushedButtonHist.length - 1];

    if (lastPushedButton == null || lastPushedButton == equal) {
      return result;
    } else if (_validOperators.contains(lastPushedButton)) {
      if ("*/".contains(lastPushedButton)) {
        return "$inputNumber $operator";
      } else {
        return "$result $operator";
      }
    } else if (_validNumbers.contains(lastPushedButton)) {
      if (3 <= state[index].pushedButtonHist.length &&
          state[index]
                  .pushedButtonHist[state[index].pushedButtonHist.length - 2] ==
              "C" &&
          state[index]
                  .pushedButtonHist[state[index].pushedButtonHist.length - 3] ==
              equal) {
        return state[index].calcHist.join("");
      } else {
        return inputNumber;
      }
    } else if (lastPushedButton == "C") {
      return "0";
    } else {
      assert(false);
      return "";
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

  int _getIndex(String id) {
    return state.map((e) => e.id).toList().indexOf(id);
  }

  int getSelectedIndex() {
    return _getIndex(ref.watch(selectedCalculatorIdProvider.notifier).state);
  }

  void _changeState(int index, CalculatorModel model) {
    state = [...state.sublist(0, index), model, ...state.sublist(index + 1)];
  }

  // 電卓のCボタン
  void clear(String id) {
    final index = _getIndex(id);

    assert(state[index]
            .pushedButtonHist[state[index].pushedButtonHist.length - 1] !=
        "C");
    final pushedButtonHist = [...state[index].pushedButtonHist, "C"];

    CalculatorModel? calc;
    if (_validNumbers.contains(state[index]
        .pushedButtonHist[state[index].pushedButtonHist.length - 1])) {
      // 直前が数字の場合
      calc = state[index]
          .copyWith(number: "0", pushedButtonHist: pushedButtonHist);
    } else if (_validOperators.contains(state[index]
            .pushedButtonHist[state[index].pushedButtonHist.length - 1]) ||
        state[index].operator.isEmpty) {
      calc = state[index].copyWith(pushedButtonHist: pushedButtonHist);
    } else if (state[index]
            .pushedButtonHist[state[index].pushedButtonHist.length - 1] ==
        equal) {
      calc = state[index]
          .copyWith(calcHist: ["0"], pushedButtonHist: pushedButtonHist);
    } else {
      assert(false);
    }
    _changeState(index, calc!);
  }

  CalculatorModel initializeCalc(CalculatorModel calc) {
    return calc.copyWith(
        number: "",
        operator: "",
        pushedButtonHist: [],
        calcHist: ["0"],
        buffer: "");
  }

  //電卓のACボタン
  void allClear(String id) {
    final index = state.map((e) => e.id).toList().indexOf(id);
    final calc = initializeCalc(state[index]);
    _changeState(index, calc);
  }

  // 電卓の小数点 (.) ボタン
  void addPeriod(String id) {
    final index = _getIndex(id);
    final pushedButtonHist = state[index].pushedButtonHist.isEmpty ||
            !_validNumbers.contains(state[index]
                .pushedButtonHist[state[index].pushedButtonHist.length - 1])
        ? [...state[index].pushedButtonHist, "."]
        : state[index].pushedButtonHist;
    CalculatorModel? calc;

    if (state[index].pushedButtonHist.isEmpty ||
        _validOperators.contains(state[index]
            .pushedButtonHist[state[index].pushedButtonHist.length - 1])) {
      calc = state[index]
          .copyWith(number: "0.", pushedButtonHist: pushedButtonHist);
    } else if (_validNumbers.contains(state[index]
        .pushedButtonHist[state[index].pushedButtonHist.length - 1])) {
      final number = state[index].number.contains(".")
          ? state[index].number
          : "${state[index].number}.";
      calc = state[index]
          .copyWith(number: number, pushedButtonHist: pushedButtonHist);
    }

    _changeState(index, calc!);
  }

  //電卓の数字ボタン
  void addInputNumber(String input, String id) {
    final index = _getIndex(id);

    final pushedButtonHist = state[index].pushedButtonHist.isNotEmpty &&
            _validNumbers.contains(state[index]
                .pushedButtonHist[state[index].pushedButtonHist.length - 1])
        ? [...state[index].pushedButtonHist]
        : [...state[index].pushedButtonHist, input];

    CalculatorModel? calc;
    if (state[index].pushedButtonHist.isEmpty ||
        _validOperators.contains(state[index]
            .pushedButtonHist[state[index].pushedButtonHist.length - 1])) {
      calc = state[index]
          .copyWith(number: input, pushedButtonHist: pushedButtonHist);
    } else if (_validNumbers.contains(state[index]
        .pushedButtonHist[state[index].pushedButtonHist.length - 1])) {
      if (3 <= state[index].pushedButtonHist.length &&
          state[index]
                  .pushedButtonHist[state[index].pushedButtonHist.length - 2] ==
              "C" &&
          state[index]
                  .pushedButtonHist[state[index].pushedButtonHist.length - 3] ==
              equal) {
        calc = state[index].copyWith(
            calcHist: [...state[index].calcHist, input],
            pushedButtonHist: pushedButtonHist);
      } else {
        calc = state[index].copyWith(
            number: "${state[index].number}$input",
            pushedButtonHist: pushedButtonHist);
      }
    } else if (state[index]
            .pushedButtonHist[state[index].pushedButtonHist.length - 1] ==
        equal) {
      final operator = state[index].operator;
      final number = state[index].number;
      calc = state[index].copyWith(
          calcHist: [input, operator, number],
          pushedButtonHist: pushedButtonHist,
          number: input);
    } else if (state[index]
            .pushedButtonHist[state[index].pushedButtonHist.length - 1] ==
        "C") {
      if (state[index].pushedButtonHist.length < 2 ||
          _validNumbers.contains(state[index]
              .pushedButtonHist[state[index].pushedButtonHist.length - 2]) ||
          _validOperators.contains(state[index]
              .pushedButtonHist[state[index].pushedButtonHist.length - 2]) ||
          state[index]
                  .pushedButtonHist[state[index].pushedButtonHist.length - 2] ==
              "C") {
        calc = state[index]
            .copyWith(number: input, pushedButtonHist: pushedButtonHist);
      } else if (state[index]
              .pushedButtonHist[state[index].pushedButtonHist.length - 2] ==
          equal) {
        calc = state[index]
            .copyWith(calcHist: [input], pushedButtonHist: pushedButtonHist);
      }
    } else {
      assert(false);
    }
    _changeState(index, calc!);
  }

  // 電卓の演算子ボタン
  void setOperator(String input, String id) {
    final index = _getIndex(id);

    final pushedButtonHist = state[index].pushedButtonHist.isNotEmpty &&
            _validOperators.contains(state[index]
                .pushedButtonHist[state[index].pushedButtonHist.length - 1])
        ? [
            ...state[index]
                .pushedButtonHist
                .sublist(0, state[index].pushedButtonHist.length - 1),
            input
          ]
        : [...state[index].pushedButtonHist, input];

    CalculatorModel? calc;
    final operator = state[index].operator;
    final number = state[index].number;
    final result = doCalc(index);
    if (state[index].pushedButtonHist.isEmpty ||
        _validOperators.contains(state[index]
            .pushedButtonHist[state[index].pushedButtonHist.length - 1])) {
      calc = state[index]
          .copyWith(pushedButtonHist: pushedButtonHist, operator: input);
    } else if (state[index]
            .pushedButtonHist[state[index].pushedButtonHist.length - 1] ==
        equal) {
      calc = state[index].copyWith(
          number: result, operator: input, pushedButtonHist: pushedButtonHist);
    } else if (_validNumbers.contains(state[index]
        .pushedButtonHist[state[index].pushedButtonHist.length - 1])) {
      calc = state[index].copyWith(
          calcHist: [...state[index].calcHist, operator, number],
          operator: input,
          pushedButtonHist: pushedButtonHist);
    } else if (state[index]
            .pushedButtonHist[state[index].pushedButtonHist.length - 1] ==
        "C") {
      if (_validOperators.contains(state[index]
          .pushedButtonHist[state[index].pushedButtonHist.length - 2])) {
        calc = state[index]
            .copyWith(pushedButtonHist: pushedButtonHist, operator: input);
      } else if (_validNumbers.contains(state[index]
          .pushedButtonHist[state[index].pushedButtonHist.length - 2])) {
        calc = state[index].copyWith(
            pushedButtonHist: pushedButtonHist,
            calcHist: [...state[index].calcHist, operator, number],
            operator: input);
      } else if (state[index]
              .pushedButtonHist[state[index].pushedButtonHist.length - 2] ==
          equal) {
        calc = state[index]
            .copyWith(operator: input, pushedButtonHist: pushedButtonHist);
      }
    } else {
      assert(false);
    }
    _changeState(index, calc!);
  }

  void setEqual(String id) {
    final index = _getIndex(id);

    final pushedButtonHist = [...state[index].pushedButtonHist, "="];

    CalculatorModel? calc;
    final operator = state[index].operator;
    final number = state[index].number;
    final result = doCalc(index);

    if (_validNumbers.contains(state[index]
        .pushedButtonHist[state[index].pushedButtonHist.length - 1])) {
      calc = state[index].copyWith(
          calcHist: operator.isNotEmpty
              ? [...state[index].calcHist, operator, number]
              : [number],
          pushedButtonHist: pushedButtonHist,
          buffer: result);
    } else if (_validOperators.contains(state[index]
        .pushedButtonHist[state[index].pushedButtonHist.length - 1])) {
      calc = state[index].copyWith(
          calcHist: [result, operator, number],
          pushedButtonHist: pushedButtonHist,
          number: result,
          buffer: result);
    } else if (state[index]
                .pushedButtonHist[state[index].pushedButtonHist.length - 1] ==
            equal ||
        state[index]
                .pushedButtonHist[state[index].pushedButtonHist.length - 1] ==
            "C") {
      calc = state[index].copyWith(
          calcHist: operator.isNotEmpty ? [result, operator, number] : [number],
          pushedButtonHist: pushedButtonHist,
          buffer: result);
    } else if (state[index]
        .pushedButtonHist[state[index].pushedButtonHist.length - 1]
        .isEmpty) {
      calc = state[index];
    } else {
      assert(false);
    }
    _changeState(index, calc!);
  }

  String doCalc(int index) {
    return _p
        .parse(state[index].calcHist.join(""))
        .evaluate(EvaluationType.REAL, _cm)
        .toString();
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

class WindowHeightSizeNotifier extends StateNotifier<double> {
  WindowHeightSizeNotifier() : super(SizeConfig.minWindowHeight);

  void setState(double state) {
    this.state = state;
  }
}
