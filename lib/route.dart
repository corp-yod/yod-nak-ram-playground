import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yod_nak_ram_app/route/main_route.dart';
import 'package:yod_nak_ram_app/route/main_route_name.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';
import 'package:yod_navigator/yod_navigator.dart';
// import 'package:yod_presentation_fake_store/yod_presentation_fake_store.dart';
import 'package:yod_presentation_travel_to_gether/route.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class MainRoute {
  static final MainRoute _instance = MainRoute._internal();

  factory MainRoute() => _instance;

  MainRoute._internal();

  static MainRoute get instance => _instance;

  late GoRouter _router;

  static GoRouter get goRouterConfig => _instance._router;

  init() {
    final List<YodRouterModule> _modules = [
      YodRoutor(),
      // FakeStoreRoutor(),
      TravelToGetherDomain(),
    ];

    _router = GoRouter(
      navigatorKey: rootNavigatorKey,
      observers: [YodNavigator()],
      initialLocation: RouteNameYod.splash,
      debugLogDiagnostics: true,
      routes: _modules
          .expand((m) => m.routes()) // Iterable<YodRouteBase>
          .map((r) => r.toRouteBase()) // Iterable<RouteBase>
          .toList(),
      errorBuilder: (context, state) =>
          const Scaffold(body: Center(child: Text('Page Not Found'))),
    );
  }

  // init() {
  //   for (YodRouterGenerator routeGenerator in routeGenerators) {
  //     routeGenerator.init();
  //     routeGenerator.routes().forEach((element) {
  //       routeTbl[element] = routeGenerator;
  //     });
  //   }
  // }

  // Route<dynamic>? generateRoute(RouteSettings route) {
  //   YodRouterGenerator? routeGenerateTbl = routeTbl[route.name];
  //   _route = routeGenerateTbl?.onGenerateRoute(route);

  //   return _route;
  // }
}
