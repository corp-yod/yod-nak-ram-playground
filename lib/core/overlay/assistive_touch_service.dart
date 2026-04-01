import 'package:flutter/material.dart';
import 'package:yod_nak_ram_app/core/overlay/assistive_touch_interface.dart';
import 'assistive_touch_widget.dart';

class AssistiveTouchService extends AssistiveTouchInterface {
  static final AssistiveTouchService _instance =
      AssistiveTouchService._internal();

  AssistiveTouchService._internal();

  factory AssistiveTouchService() {
    return _instance;
  }

  OverlayEntry? _overlayEntry;

  void init(GlobalKey<NavigatorState> navigatorKey) {
    print(
      '#->>> AssistiveTouchService init overlayEntry: ${_overlayEntry != null}',
    );

    if (_overlayEntry != null) {
      return;
    }

    _overlayEntry = OverlayEntry(
      builder: (_) => AssistiveTouchWidget(navigatorKey: navigatorKey),
    );

    navigatorKey.currentState!.overlay!.insert(_overlayEntry!);
  }

  void dispose() {
    _overlayEntry?.remove();
  }
}

// mixin AssistiveTouchMixin implements AssistiveTouchService {
//   late final AssistiveTouchService assistiveTouchService;

//   @override
//   void init(GlobalKey<NavigatorState> navigatorKey) {
//     assistiveTouchService = AssistiveTouchService();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       assistiveTouchService.init(navigatorKey);
//     });
//   }

//   @override
//   void dispose() {
//     assistiveTouchService.dispose();
//   }
// }
