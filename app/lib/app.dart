import 'package:go_router/go_router.dart';
import 'route/router.dart';
import 'package:flutter/material.dart';
import 'static/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = getRouter();
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Multi Calculator',
      theme: defaultTheme,
    );
  }
}
