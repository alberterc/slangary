import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:slangary/routes/slangary_transition_page.dart';
import 'package:slangary/views/home/home.dart';
import 'package:slangary/views/home/home_card.dart';
import 'package:slangary/views/result/result.dart';
import 'package:slangary/views/saved/saved.dart';
import 'package:slangary/widgets/title_card.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final router =
    GoRouter(initialLocation: '/', navigatorKey: _rootNavigatorKey, routes: [
  GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return SlangaryTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 800),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Card animation
              Animation<Offset> cardAnimation;
              if (animation.status == AnimationStatus.reverse) {
                cardAnimation = Tween(
                  begin: const Offset(0.0, 1.0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                    parent: animation,
                    curve: const Interval(0.0, 0.6, curve: Curves.easeInOut)));
              } else {
                cardAnimation = Tween(
                        begin: Offset.zero, end: const Offset(0.0, 1.0))
                    .animate(CurvedAnimation(
                        parent: secondaryAnimation,
                        curve:
                            const Interval(0.0, 0.6, curve: Curves.easeInOut)));
              }
              return Stack(children: [
                child,
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: SlideTransition(
                      position: cardAnimation, child: const HomeCard()),
                ),
              ]);
            },
            child: const HomePage());
      }),
  GoRoute(
      path: '/saved',
      pageBuilder: (context, state) => SlangaryTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 800),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Card animation
            Animation<Offset> cardAnimation;
            cardAnimation = Tween(
                    begin: const Offset(0.0, -1.0), end: Offset.zero)
                .animate(CurvedAnimation(
                    parent: animation,
                    curve: const Interval(0.4, 0.7, curve: Curves.easeInOut)));
            // List animation
            final listAnimation = Tween(
                    begin: const Offset(0.0, -1.0), end: Offset.zero)
                .animate(CurvedAnimation(
                    parent: animation,
                    curve: const Interval(0.6, 1.0, curve: Curves.easeInOut)));
            return Stack(
              children: [
                SlideTransition(position: listAnimation, child: child),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: SlideTransition(
                      position: cardAnimation,
                      child: const TitleCard(title: 'Saved')),
                )
              ],
            );
          },
          child: const SavedPage())),
  GoRoute(
      path: '/result',
      pageBuilder: (context, state) {
        final term = state.uri.queryParameters['term'] ?? '';
        final random =
            state.uri.queryParameters['random'] == 'true' ? true : false;
        return SlangaryTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 800),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // Card animation
              Animation<Offset> cardAnimation;
              cardAnimation = Tween(
                      begin: const Offset(0.0, -1.0), end: Offset.zero)
                  .animate(CurvedAnimation(
                      parent: animation,
                      curve:
                          const Interval(0.4, 0.7, curve: Curves.easeInOut)));
              // List animation
              final listAnimation = Tween(
                      begin: const Offset(0.0, -1.0), end: Offset.zero)
                  .animate(CurvedAnimation(
                      parent: animation,
                      curve:
                          const Interval(0.6, 1.0, curve: Curves.easeInOut)));
              return Stack(
                children: [
                  SlideTransition(position: listAnimation, child: child),
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: SlideTransition(
                        position: cardAnimation,
                        child: const TitleCard(title: 'Result')),
                  )
                ],
              );
            },
            child: ResultPage(
              term: term,
              random: random,
            ));
      })
]);
