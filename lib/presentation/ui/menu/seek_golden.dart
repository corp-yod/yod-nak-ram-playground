import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yod_nak_ram_app/presentation/ui/menu/menu_item.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';

class SeekGolden extends MenuItem {
  @override
  Widget buildWidget(BuildContext context) {
    return RamCardMenu(
      icon: Icons.money,
      title: 'Seek Golden',
      subtitle: 'Monitor golden price',
      width: 20,
      height: 20,
      onTapMenu: () {},
    );
  }
}
