import 'provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'organism/calcular_windows/view.dart';
import 'organism/cauculator_buttons/view.dart';
import 'package:calculator/static/size.dart';

class CalculatorPage extends ConsumerWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeConfig = SizeConfig(context);

    final calculatorList = ref.watch(calculatorListProvider.notifier);
    final calculatorHeightSize =
        ref.watch(calculatorHeightSizeProvider.notifier);
    final calculatorButtonHeight =
        ref.watch(calculatorButtonHeightProvider.notifier);

    void onPanelSlideHandler(double sizeRatio) {
      final height = SizeConfig.minCalculatorHeight +
          sizeRatio *
              (sizeConfig.maxCalculatorHeight - SizeConfig.minCalculatorHeight);
      calculatorHeightSize.setState(height);
      calculatorButtonHeight.setState(height * 0.2);
    }

    return Scaffold(
      extendBodyBehindAppBar:
          true, //for sliding_up_panel bug. check https://github.com/akshathjain/sliding_up_panel/pull/303
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.headerHeight),
        child: AppBar(
          leading: const Icon(
            Icons.settings,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add_circle,
              ),
              onPressed: calculatorList.addCalculator,
            ),
          ],
        ),
      ),
      body: SlidingUpPanel(
        maxHeight: sizeConfig.maxCalculatorHeight,
        minHeight: SizeConfig.minCalculatorHeight,
        snapPoint: SizeConfig.minCalculatorSnapPoint,
        panel: const CalculatorButtons(),
        body: const CalculatorWindows(),
        onPanelSlide: onPanelSlideHandler,
      ),
    );
  }
}
