import 'package:first_web/locator.dart';
import 'package:first_web/router/my_router.dart';
import 'package:first_web/router/router_generator.dart';
import 'package:first_web/services/navigator_service.dart';
import 'package:first_web/ui/layout/main_layout_page.dart';
import 'package:first_web/ui/pages/counter_page.dart';
import 'package:first_web/ui/pages/counter_provider_page.dart';
import 'package:first_web/ui/pages/error_page.dart';
import 'package:first_web/ui/pages/page_404.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      Provider<MyRouter>(
        lazy: false,
        create: (BuildContext createContext) => MyRouter(),
      )
    ],
    child: Builder(
      builder: (BuildContext context) {
              final router = Provider.of<MyRouter>(context, listen: false).router;
          return  MaterialApp.router(
       routeInformationParser: router.routeInformationParser,
       routerDelegate: router.routerDelegate,
       title: 'RutasApp',
      //  builder: (_,child){
      //   return MainLayoutPage(
      //     child: child!,
      //     context: context,
      //   );
      // },
       );
      })
    );
  }

//  late final router = GoRouter(
//     initialLocation:'/scafold',
//     routes: <GoRoute>[
//       // GoRoute(
//       //   path: '/404',
//       //   builder: (BuildContext context, GoRouterState state) => const Page404(),
//       // ),
//       GoRoute(
//         path: '/scafold',
//         builder: (BuildContext context, GoRouterState state) =>
//           _build(const CounterPage())   ,
//       ),
//       GoRoute(
//         path: '/provider',
//         builder: (BuildContext context, GoRouterState state) =>
//              _build(const CounterProviderPage())   ,
//       ),
//     ],

//     // TODO: Error Handler
//     errorPageBuilder: (context, state) => MaterialPage<void>(
//       key: state.pageKey,
//       child: Page404(error: state.error),
//     ),
//       navigatorBuilder: (context, state, child) => Navigator(
//       onPopPage: (route, dynamic result) {
//         route.didPop(result);
//         return false; // don't pop the single page on the root navigator
//       },
//       pages: [
//         MaterialPage<void>(
//           child: state.error != null
//               ? ErrorPage(body: child)
//               : SharedScaffold(
//                   // selectedIndex: state.subloc == '/' ? 0 : 1,
//                   body: child,
//                 ),
//         ),
//       ],
//     ),
//     // TODO Add Redirect
//   );
  //  Widget _build(Widget child) => Scaffold(body: child);
}

  //    (
    //   title: 'RutasApp',
    //   // initialRoute: '/stateful',
    //   onGenerateRoute: RouterGenerator.generateRoute,
    //   navigatorKey: locator<NavigationService>().navigatorKey,
    //   builder: (_,child){
    //     return MainLayoutPage(
    //       child: child!,
    //     );
    //   },
    // );