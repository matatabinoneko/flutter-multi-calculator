import 'package:calculator/page/calculator_page/view.dart';
import 'package:flutter/material.dart';
import 'static/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Calculator',
      theme: defaultTheme,
      home: const CalculatorPage(),
    );
  }
}
