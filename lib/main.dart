import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'broken_home_page.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
  ],
);

final appTheme = ThemeData(
  colorSchemeSeed: const Color(0xFF020695),
  snackBarTheme: SnackBarThemeData(
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    ),
    behavior: SnackBarBehavior.floating,
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Accessibility Keynote',
      theme: appTheme,
      routerConfig: _router,
    );
  }
}
