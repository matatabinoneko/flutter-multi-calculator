import 'package:calculator/page/calculator_page/provider.dart';
import 'package:calculator/page/calculator_page/view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'global/provider/shared_preference_provider.dart';
import 'static/theme.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<SharedPreferences> sharedPrefData =
        ref.watch(sharedPrefProvider);
    final calculatorList = ref.watch(calculatorListProvider.notifier);

    return MaterialApp(
      title: 'Multi Calculator',
      theme: defaultTheme,
      home: () {
        return sharedPrefData.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error: $err'),
            data: (data) {
              calculatorList.loadData(data);
              return CalculatorPage();
            });
      }(),
    );
  }
}
