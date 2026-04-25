import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CommonTabcontroller implements TickerProvider {
  static final CommonTabcontroller _instance = CommonTabcontroller._internal();
  CommonTabcontroller._internal();
  factory CommonTabcontroller() {
    return _instance;
  }
  TabController? _tabController;
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }

  void initTabController() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      animationDuration: const Duration(milliseconds: 0),
    );
  }

  TabController get getTabcontroller {
    if (_tabController == null) {
      throw Exception("CommonTabcontroller : TabController is null");
    }
    return _tabController!;
  }

  void dispose() {
    _tabController?.dispose();
    _tabController = null;
  }
}
