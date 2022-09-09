import 'package:calculator/page/calclator_loading_page/view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:calculator/page/setting_page/view.dart';

GoRouter getRouter() {
  return GoRouter(
    routes: <GoRoute>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const CalculatorLoadingPage(),
          routes: [
            GoRoute(
              path: 'setting',
              builder: (BuildContext context, GoRouterState state) =>
                  SettingPage(),
            ),
          ]),
    ],
  );
}
