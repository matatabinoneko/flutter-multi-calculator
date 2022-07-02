import 'package:calculator/page/calculator_page/view.dart';
import 'package:flutter/material.dart';
import 'static/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: defaultTheme,
      home: const CalculatorPage(),
    );
  }
}
