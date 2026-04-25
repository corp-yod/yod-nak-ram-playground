import 'package:flutter/material.dart';
import 'package:yod_nak_ram_app/presentation/ui/menu/menu_item.dart';
import 'package:yod_nak_ram_app/route/main_route_name.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_travel_to_gether/route_name.dart';

class TravelToGether extends MenuItem {
  @override
  Widget buildWidget(BuildContext context) {
    return RamCardMenu(
      icon: Icons.travel_explore,
      title: 'Travel To Gether',
      subtitle: 'Explore the world together',
      width: 20,
      height: 20,
      iconColor: Colors.orange,
      onTapMenu: () {
        YodNavigator().pushNamed(context, RouteNameTravel.mainAppTravelToGether);
      },
    );
  }
}
