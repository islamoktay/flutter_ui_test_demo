import 'package:flutter/material.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: 'loading',
      child: const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
