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
  //basic widget
  final _instagramMenuWidget = const _MenuBuilderWidget(name: 'Instagram', child: Icon(FontAwesomeIcons.instagram));
  final _profileMenuWidget = const _MenuBuilderWidget(
    name: 'โปรไฟล์',
    child: ClipOval(child: SizedBox(width: 25, child: ImageCustomWidget(image: ImageAsset.defaultProfile))),
  );
  late final _menuWidgetList = [
    (name: 'หน้าหลัก', unselectedIcon: Icons.home_outlined, selectedIcon: Icons.home_sharp),
    (name: 'ค้นหา', unselectedIcon: Icons.search_outlined, selectedIcon: Icons.search_sharp),
    (name: 'สำรวจ', unselectedIcon: FontAwesomeIcons.compass, selectedIcon: FontAwesomeIcons.solidCompass),
    (name: 'Reels', unselectedIcon: Icons.play_arrow_outlined, selectedIcon: Icons.play_arrow_sharp),
    (name: 'ข้อความ', unselectedIcon: FontAwesomeIcons.message, selectedIcon: FontAwesomeIcons.solidMessage),
    (name: 'การแจ้งเตือน', unselectedIcon: Icons.notifications_outlined, selectedIcon: Icons.notifications_sharp),
    (name: 'สร้าง', unselectedIcon: Icons.add_box_outlined, selectedIcon: Icons.add_box_sharp),
  ].map((e) => _MenuBuilderWidget(name: e.name, child: Icon(e.unselectedIcon))).toList();
  final _threadsMenuWidget = const _MenuBuilderWidget(name: 'Threads', child: Icon(FontAwesomeIcons.threads));
  final _moreMenuWidget = const _MenuBuilderWidget(name: 'เพิ่มเติม', child: Icon(Icons.menu_outlined));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      decoration: const BoxDecoration(border: Border(right: BorderSide(width: 1.0, color: Color.fromRGBO(38, 38, 38, 1)))),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        _instagramMenuWidget,
                        const SizedBox(height: 20),
                        ..._menuWidgetList,
                        _profileMenuWidget,
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        _threadsMenuWidget,
                        _moreMenuWidget,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuBuilderWidget extends StatefulWidget {
  final String name;
  final Widget child;

  const _MenuBuilderWidget({required this.name, required this.child});

  @override
  State<_MenuBuilderWidget> createState() => _MenuBuilderWidgetState();
}

class _MenuBuilderWidgetState extends State<_MenuBuilderWidget> {
  //controller
  bool _isLoading = false;
  bool? _isTapping = false;

  Future _setTapping(bool? isTapping) async {
    if (_isTapping == null) return;
    if (isTapping == null) {
      //on click
      if (_isTapping != true) setState(() => _isTapping = true);
      _isTapping = null;
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() => _isTapping = false);
    } else {
      //on tap up/down/cancel
      if (isTapping == _isTapping) return;
      setState(() => _isTapping = isTapping);
    }
  }

  Future _onClick() async {
    if (_isLoading) return;
    _setTapping(null);
    _isLoading = true;

    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTapDown: (tapUpDetails) => _setTapping(true),
        onTapUp: (tapUpDetails) => _setTapping(false),
        onTapCancel: () => _setTapping(false),
        child: IconButton(
          onPressed: _onClick,
          tooltip: widget.name,
          icon: Transform.scale(scale: (_isTapping ?? true) ? 0.9 : 1.0, child: widget.child),
          iconSize: 25,
          padding: const EdgeInsets.all(10),
          style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
        ),
      ),
    );
  }
}