import 'package:flutter/material.dart';
import 'assistive_touch_widget.dart';

class AssistiveTouchService {
  OverlayEntry? _overlayEntry;

  void init(GlobalKey<NavigatorState> navigatorKey) {
    _overlayEntry = OverlayEntry(
      builder: (_) => AssistiveTouchWidget(
        navigatorKey: navigatorKey,
      ),
    );

    navigatorKey.currentState!.overlay!.insert(_overlayEntry!);
  }

  void dispose() {
    _overlayEntry?.remove();
  }
}