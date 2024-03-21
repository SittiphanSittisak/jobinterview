import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';

class NavigationBarShareWidget extends StatefulWidget {
  const NavigationBarShareWidget({super.key});

  @override
  State<NavigationBarShareWidget> createState() => _NavigationBarShareWidgetState();
}

class _NavigationBarShareWidgetState extends State<NavigationBarShareWidget> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.none;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;

  final _profileMenuWidget = const ClipOval(child: SizedBox(width: 25, child: ImageCustomWidget(image: ImageAsset.defaultProfile)));
  late final _menuWidgetList = [
    (name: 'หน้าหลัก', unselectedIcon: Icons.home_outlined, selectedIcon: Icons.home_sharp),
    (name: 'ค้นหา', unselectedIcon: Icons.search_outlined, selectedIcon: Icons.search_sharp),
    (name: 'สำรวจ', unselectedIcon: FontAwesomeIcons.compass, selectedIcon: FontAwesomeIcons.solidCompass),
    (name: 'Reels', unselectedIcon: Icons.play_arrow_outlined, selectedIcon: Icons.play_arrow_sharp),
    (name: 'ข้อความ', unselectedIcon: FontAwesomeIcons.message, selectedIcon: FontAwesomeIcons.solidMessage),
    (name: 'การแจ้งเตือน', unselectedIcon: Icons.notifications_outlined, selectedIcon: Icons.notifications_sharp),
    (name: 'สร้าง', unselectedIcon: Icons.add_box_outlined, selectedIcon: Icons.add_box_sharp),
  ].map((e) {
    const iconHeight = 70.0;

    return NavigationRailDestination(
      icon: Tooltip(
        message: e.name,
        child: Container(alignment: Alignment.center, height: iconHeight, child: Icon(e.unselectedIcon)),
      ),
      selectedIcon: Tooltip(
        message: e.name,
        child: Container(alignment: Alignment.center, height: iconHeight, child: Icon(e.selectedIcon)),
      ),
      label: Text(e.name),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
    );
  }).toList()
    ..add(NavigationRailDestination(
      icon: _profileMenuWidget,
      selectedIcon: _profileMenuWidget,
      label: const Text('โปรไฟล์'),
    ));

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: NavigationRail(
        selectedIndex: _selectedIndex,
        labelType: labelType,
        groupAlignment: groupAlignment,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        leading: showLeading
            ? FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: const Icon(Icons.add),
              )
            : const SizedBox(),
        trailing: showTrailing
            ? IconButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                icon: const Icon(Icons.more_horiz_rounded),
              )
            : const SizedBox(),
        destinations: _menuWidgetList,
        minWidth: 70,
        indicatorShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
    );
  }
}
