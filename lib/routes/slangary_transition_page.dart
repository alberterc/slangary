import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlangaryTransitionPage extends CustomTransitionPage {
  const SlangaryTransitionPage(
      {super.key,
      required super.child,
      required super.transitionDuration,
      required super.transitionsBuilder});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: child,
            )),
          );
        },
        transitionsBuilder: transitionsBuilder,
        transitionDuration: transitionDuration,
        settings: this);
  }
}
