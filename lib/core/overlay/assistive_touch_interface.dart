import 'package:flutter/material.dart';

abstract class AssistiveTouchInterface {
  void init(GlobalKey<NavigatorState> navigatorKey) {
    throw UnimplementedError('init() has not been implemented');
  }

  void dispose() {
    throw UnimplementedError('dispose() has not been implemented');
  }
}
