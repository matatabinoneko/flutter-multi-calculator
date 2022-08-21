import 'package:calculator/static/size.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'model.dart';
import 'notifier.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

final selectedCalculatorIdProvider =
    StateNotifierProvider<SelectedIdNotifier, String>(
        (ref) => SelectedIdNotifier());

final calculatorListProvider =
    StateNotifierProvider<CalculatorListNotifier, List<CalculatorModel>>(
        (ref) => CalculatorListNotifier(ref));

final calculatorHeightSizeProvider =
    StateNotifierProvider<CalculatorHeightSizeNotifier, double>(
        (ref) => CalculatorHeightSizeNotifier());

final windowHeightSizeProvider =
    StateNotifierProvider<WindowHeightSizeNotifier, double>(
        (ref) => WindowHeightSizeNotifier());

final isClosedSlidingUpPanelProvider = Provider<bool>((ref) {
  double minHeight = SizeConfig.minCalculatorHeight;
  final currentHeight = ref.watch(calculatorHeightSizeProvider);
  return minHeight == currentHeight;
});

final slidingUpPanelRatioProvider = StateProvider<double?>((ref) => null);

final isOpenedSlidingUpPanelProvider = Provider<bool>((ref) {
  return ref.watch(slidingUpPanelRatioProvider) == 1.0;
});

final scrollControllerProvider = Provider((_) => AutoScrollController());
