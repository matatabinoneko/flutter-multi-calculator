import 'model.dart';
import 'notifier.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final selectedCalculatorIdProvider =
    StateNotifierProvider<SelectedIdNotifier, String>(
        (ref) => SelectedIdNotifier());

final calculatorListProvider =
    StateNotifierProvider<CalculatorListNotifier, List<CalculatorModel>>(
        (ref) => CalculatorListNotifier(ref));

final calculatorHeightSizeProvider =
    StateNotifierProvider<CalculatorHeightSizeNotifier, double>(
        (ref) => CalculatorHeightSizeNotifier());
