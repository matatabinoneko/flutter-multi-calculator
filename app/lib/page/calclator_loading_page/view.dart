import 'package:calculator/global/provider/shared_preference_provider.dart';
import 'package:calculator/page/calculator_page/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:calculator/page/calculator_page/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorLoadingPage extends ConsumerWidget {
  const CalculatorLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<SharedPreferences> sharedPrefData =
        ref.watch(sharedPrefProvider);
    final loadData = ref.read(calculatorListProvider.notifier).loadData;
    return sharedPrefData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('Error: $err'),
        data: (data) {
          loadData(data);
          return CalculatorPage();
        });
  }
}
