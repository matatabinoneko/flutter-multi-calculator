import 'package:calculator/page/calculator_page/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Header extends ConsumerWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void addCalculator() {
      ref.read(calculatorListProvider.notifier).addCalculator();
    }

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Icon(
        Icons.settings,
      ),
      Material(
        child: IconButton(
          icon: const Icon(
            Icons.add_circle,
          ),
          onPressed: addCalculator,
        ),
      )
    ]);
  }
}
