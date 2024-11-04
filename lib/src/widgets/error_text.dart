import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: 'error',
      child: const Center(
        child: Text('Something went wrong'),
      ),
    );
  }
}
