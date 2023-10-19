import 'dart:developer';
import 'package:first_web/ui/layout/main_layout_page.dart';
import 'package:first_web/ui/pages/error_page.dart';
import 'package:first_web/ui/shared/custom_app_menu.dart';
import 'package:first_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:first_web/ui/pages/counter_page.dart';
import 'package:first_web/ui/pages/counter_provider_page.dart';
import 'package:first_web/ui/pages/page_404.dart';

class MyRouter {
  late final router = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    initialLocation: '/stateful',
    routes: <GoRoute>[
      GoRoute(
        path: '/stateful',
        // builder: (BuildContext context, GoRouterState state) =>
        //     _build(const CounterPage()),
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: _build( CounterPage(base: state.params['base']??'3',)),
        ),
      ),
   

      GoRoute(
        path: '/stateful/:base',
        // builder: (BuildContext context, GoRouterState state) =>
        //     _build(const CounterPage()),
        pageBuilder: (context, state) {
          print(state.params['base']);
          return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: _build( CounterPage(base: state.params['base']??'5',)),
        );
        },
      ),

      GoRoute(
        path: '/provider',
        // builder: (BuildContext context, GoRouterState state) =>
        //     _build(const CounterProviderPage(sta)),
          pageBuilder: (context, state) {
             print(state.queryParams['q']);
            return buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: _build( CounterProviderPage(q: state.queryParams['q']??'5',)),
        );
          },   
      ),
    ],

    //TODO: Error Handler
    errorPageBuilder: (context, state) => 
    // MaterialPage<void>(
    //   key: state.pageKey,
    //   child: Page404(error: state.error),
    // ),
buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: _build( Page404(error: state.error)),
        ),
    //TODO: Check how i can create a layout and use it with gorouter
    navigatorBuilder: (context, state, child) {
      print('navigatorBuilder');
      return Material(
        child: Column(
          children: [
            CustomAppMenu(
              context: context,
            ),
            Spacer(),
            Expanded(child: child),
            Spacer(),
          ],
        ),
      );
    },

    // TODO Add Redirect
  );
  Widget _build(Widget child) => Scaffold(body: child);
}

CustomTransitionPage<void> buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
    transitionDuration: Duration(milliseconds: 100),   
  );
}
