import 'package:flutter/material.dart';
import 'package:yod_nak_ram_app/route/main_router.dart';
import 'package:yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_travel_to_gether/route.dart';

class MainRoute {
  Route? _route;

  List<YodRouterGenerator> routeGenerators = [
    // HomeRouteGenerator(),
    YodRoutor(),
    TravelToGetherDomain(),
  ];
  Map<String, YodRouterGenerator> routeTbl = {};

  static final MainRoute _mainRoute = MainRoute._internal();

  factory MainRoute() {
    return _mainRoute;
  }

  MainRoute._internal();

  init() {
    for (YodRouterGenerator routeGenerator in routeGenerators) {
      routeGenerator.init();
      routeGenerator.routes().forEach((element) {
        routeTbl[element] = routeGenerator;
      });
    }
  }

  Route<dynamic>? generateRoute(RouteSettings route) {
    YodRouterGenerator? routeGenerateTbl = routeTbl[route.name];
    _route = routeGenerateTbl?.onGenerateRoute(route);

    return _route;
  }
}
