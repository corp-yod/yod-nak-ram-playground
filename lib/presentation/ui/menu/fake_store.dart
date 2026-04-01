import 'package:flutter/material.dart';
import 'package:yod_nak_ram_app/presentation/ui/menu/menu_item.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';

class FakeStore extends MenuItem {
  @override
  Widget buildWidget(BuildContext context) {
    return RamCardMenu(
      icon: Icons.shopping_cart,
      title: 'Fake Store',
      subtitle: 'Fake Store for shopping',
      width: 20,
      height: 20,
      // iconColor: Colors.orange,
      onTapMenu: () {
        Navigator.pushNamed(context, '/fake-store');
        // YodNavigator().pushNamed(context, '/fake-store');
      },
    );
  }
}
