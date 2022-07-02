import 'package:calculator/static/size.dart';

import 'model.dart';
import 'notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final selectedCalculatorIdProvider = StateProvider<String>((ref) => "");
final calculatorListProvider =
    StateNotifierProvider<CalculatorList, List<CalculatorModel>>(
        (ref) => CalculatorList());

final calculatorHeightSizeProvider =
    StateProvider<double>((ref) => SizeConfig.minCalculatorHeight);

final calculatorButtonWidthProvider = StateProvider<double>((ref) => 30);
final calculatorButtonHeightProvider = StateProvider<double>((ref) => 30);
