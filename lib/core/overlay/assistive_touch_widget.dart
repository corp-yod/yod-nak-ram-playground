import 'package:flutter/material.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';

class AssistiveTouchWidget extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const AssistiveTouchWidget({super.key, required this.navigatorKey});

  @override
  State<AssistiveTouchWidget> createState() => _AssistiveTouchWidgetState();
}

class _AssistiveTouchWidgetState extends State<AssistiveTouchWidget>
    with SingleTickerProviderStateMixin {
  Offset position = const Offset(20, 300);
  bool isOpen = false;

  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    scale = CurvedAnimation(parent: controller, curve: Curves.easeOut);
  }

  void toggle() {
    setState(() {
      isOpen = !isOpen;
      isOpen ? controller.forward() : controller.reverse();
    });
  }

  void snap(Size size) {
    final double middle = size.width / 2;
    final double newX = position.dx > middle ? size.width - 80 : 20;

    setState(() {
      position = Offset(newX, position.dy);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Draggable(
            feedback: _button(),
            childWhenDragging: const SizedBox(),
            onDragEnd: (details) {
              position = details.offset;
              snap(size);
            },
            child: GestureDetector(onTap: toggle, child: _button()),
          ),
        ),

        if (isOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: toggle,
              child: Container(
                color: Colors.black26,
                child: Center(
                  child: ScaleTransition(
                    scale: scale,
                    child: Container(
                      width: 250,
                      height: 250,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: RamGridview(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return RamCardMenu(
                            icon: Icons.home,
                            width: 20,
                            height: 20,
                            title: 'Home',
                            onTapMenu: () {
                              // widget.navigatorKey.currentState!
                              //     .pushNamedAndRemoveUntil('/', (r) => false);
                              // toggle();

                              YodNavigator().go(
                                context,
                                '/main',
                              );
                              toggle();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _button() {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.circle, color: Colors.white),
      ),
    );
  }

  // Widget _item(IconData icon, String title, VoidCallback onTap) {
  //   return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  // }
}
