import '../../molecule/calculator_window/view.dart';
import '../../provider.dart';

import 'package:calculator/static/size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CalculatorWindows extends ConsumerWidget {
  const CalculatorWindows({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeConfig = SizeConfig(context);
    final calculatorList = ref.watch(calculatorListProvider);
    final selectedId = ref.watch(selectedCalculatorIdProvider);
    final scrollController = ref.watch(scrollControllerProvider);
    final isSlidingPanelOpened = ref.watch(isOpenedSlidingUpPanelProvider);
    final calculatorHeight = ref.watch(calculatorHeightSizeProvider);
    final physics = isSlidingPanelOpened
        ? const NeverScrollableScrollPhysics()
        : const AlwaysScrollableScrollPhysics();

    void deleteCalc(int index) {
      final id = calculatorList[index].id;
      ref.watch(calculatorListProvider.notifier).deleteCaluculator(id);
    }

    void onTap(int index) {
      final id = calculatorList[index].id;
      ref.watch(selectedCalculatorIdProvider.notifier).setId(id);

      scrollController.scrollToIndex(index,
          preferPosition: AutoScrollPosition.begin);
    }

    void setName(int index, String name) {
      final id = ref.read(calculatorListProvider)[index].id;
      ref.watch(calculatorListProvider.notifier).setName(id, name);
    }

    String getDisplayResult(int index) {
      return ref.watch(calculatorListProvider.notifier).getDisplayResult(index);
    }

    return Container(
      color: const Color(0xFF33383F),
      padding: EdgeInsets.only(
          top: sizeConfig.statusBarHeight, bottom: calculatorHeight),
      child: ReorderableListView(
        physics: physics,
        scrollController: scrollController,
        onReorder: (int oldIndex, int newIndex) {
          ref
              .watch(calculatorListProvider.notifier)
              .reOrderCaluculator(oldIndex: oldIndex, newIndex: newIndex);
        },
        children: <Widget>[
          for (final index
              in List<int>.generate(calculatorList.length, (i) => i))
            AutoScrollTag(
              key: Key(calculatorList[index].id),
              controller: scrollController,
              index: index,
              child: InkWell(
                child: CalculatorWindow(
                    result: getDisplayResult(index),
                    deleteCalc: () {
                      deleteCalc(index);
                    },
                    name: calculatorList[index].name,
                    setName: (String name) {
                      setName(index, name);
                    },
                    isSelected: calculatorList[index].id == selectedId),
                onTap: () {
                  onTap(index);
                },
              ),
            )
        ],
      ),
    );
  }
}
