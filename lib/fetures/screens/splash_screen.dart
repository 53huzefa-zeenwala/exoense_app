import 'package:expense_app/utils/build_context_ext.dart';
import 'package:flutter/material.dart';

import '../../core/app/styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text("MONO", style: context.textTheme.headlineLarge?.apply(color: Colors.white, letterSpacingDelta: 1.5)),
        ),
      ),
    );
  }
}
