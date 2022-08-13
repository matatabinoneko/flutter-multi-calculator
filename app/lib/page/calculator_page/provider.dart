import 'package:calculator/static/size.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

final isClosedSlidingUpPanelProvider = Provider<bool>((ref) {
  double minHeight = SizeConfig.minCalculatorHeight;
  final currentHeight = ref.watch(calculatorHeightSizeProvider);
  return minHeight == currentHeight;
});

final pushedButtonProvider =
    StateNotifierProvider<PushedButtonNotifier, String>(
        (ref) => PushedButtonNotifier());
