import 'package:flutter/material.dart';

import 'package:flutter_ui_test_demo/app/router/app_router.dart';

void main() {
  runApp(UITestDemo());
}

class UITestDemo extends StatelessWidget {
  UITestDemo({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.redAccent,
      ),
    );
  }
}
