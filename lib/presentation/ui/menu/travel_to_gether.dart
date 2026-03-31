import 'package:flutter/material.dart';
import 'package:yod_nak_ram_app/presentation/ui/menu/menu_item.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';

class TravelToGether extends MenuItem {
  @override
  Widget buildWidget(BuildContext context) {
    return RamCardMenu(
      icon: Icons.travel_explore,
      title: 'Travel To Gether',
      subtitle: 'Explore the world together',
      width: 20,
      height: 20,
      // iconColor: Colors.orange,
      onTapMenu: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                backgroundColor: context.ramTheme.primary,
                title: RamTitleText(
                  text: 'Travel To Gether',
                  colorText: context.ramTheme.onPrimary,
                ),
              ),
              body: Center(child: RamTitleText(text: 'Travel To Gether')),
            ),
          ),
        );
      },
    );
  }
}
