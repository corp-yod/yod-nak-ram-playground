import 'package:flutter/material.dart';
import 'package:yod_nak_ram_app/presentation/ui/home.dart';
import 'package:yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_fake_store/yod_presentation_fake_store.dart';

class YodRoutor extends YodRouterGenerator {
  @override
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return const HomeScreen();
          },
        );
      case '/home':
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return const HomeScreen();
          },
        );
      case '/fake-store':
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return MainAppFakeStore();
          },
        );
    }
    return null;
  }

  @override
  Set<String> routes() {
    return {'/', '/home', '/fake-store'};
  }
}
