import 'dart:math';
import 'package:calculator/page/calculator_page/molecule/collapsed_bar/view.dart';

import 'provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'organism/calcular_windows/view.dart';
import 'organism/cauculator_buttons/view.dart';
import 'package:calculator/static/size.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:go_router/go_router.dart';

class CalculatorPage extends ConsumerWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeConfig = SizeConfig(context);

    final calculatorList = ref.watch(calculatorListProvider.notifier);
    final calculatorHeightSize =
        ref.watch(calculatorHeightSizeProvider.notifier);
    final windowHeightSize = ref.watch(windowHeightSizeProvider.notifier);
    final isClosedSlidingUpPanel = ref.watch(isClosedSlidingUpPanelProvider);
    final scrollController = ref.watch(scrollControllerProvider);
    final PanelController _pc = ref.watch(panelControllerProvider);

    void onPanelSlideHandler(double sizeRatio) {
      ref.watch(slidingUpPanelRatioProvider.notifier).state = sizeRatio;
      final calculatorHeight = SizeConfig.minCalculatorHeight +
          sizeRatio *
              (sizeConfig.maxCalculatorHeight - SizeConfig.minCalculatorHeight);
      calculatorHeightSize.setState(calculatorHeight);

      final windowHeight = SizeConfig.minWindowHeight +
          max(0, sizeRatio - sizeConfig.minCalculatorSnapPoint) /
              (1 - sizeConfig.minCalculatorSnapPoint) *
              (SizeConfig.maxWindowHeight - SizeConfig.minWindowHeight);
      windowHeightSize.setState(windowHeight);

      const scrollAnimationDuration = Duration(milliseconds: 1);
      scrollController.scrollToIndex(calculatorList.getSelectedIndex(),
          duration: scrollAnimationDuration,
          preferPosition: AutoScrollPosition.begin);
    }

    return Scaffold(
      extendBodyBehindAppBar:
          true, //for sliding_up_panel bug. check https://github.com/akshathjain/sliding_up_panel/pull/303
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.headerHeight),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => GoRouter.of(context).go('/setting'),
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
        controller: _pc,
        maxHeight: sizeConfig.maxCalculatorHeight,
        minHeight: SizeConfig.minCalculatorHeight,
        snapPoint: sizeConfig.minCalculatorSnapPoint,
        panel: const CalculatorButtons(),
        body: const CalculatorWindows(),
        collapsed: isClosedSlidingUpPanel
            ? CollapsedBar(onPressed: _pc.animatePanelToSnapPoint)
            : null,
        onPanelSlide: onPanelSlideHandler,
      ),
    );
  }
}
