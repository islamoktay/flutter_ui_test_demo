import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:flutter_ui_test_demo/app/router/app_router.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Future<void>.delayed(const Duration(seconds: 2)).whenComplete(() {
          context.router.replace(const BaseRoute());
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Splash View'),
            SizedBox(height: 32),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
