import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/custom_single_child_scroll_view_widget.dart';
import 'package:instagram_app/_lib/custom_widget/image_button_blinking_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/search_picker_field_custom_widget.dart';

class NavigationBarShareWidget extends StatefulWidget {
  final Widget? child;

  const NavigationBarShareWidget({super.key, this.child});

  @override
  State<NavigationBarShareWidget> createState() => _NavigationBarShareWidgetState();
}

class _NavigationBarShareWidgetState extends State<NavigationBarShareWidget> {
  //data
  ({String? tooltip, String? text, IconData unselectedIcon, IconData selectedIcon}) menuBuilderData({required String? tooltip, required String? text, required IconData unselectedIcon, required IconData selectedIcon}) => (tooltip: tooltip, text: text, unselectedIcon: unselectedIcon, selectedIcon: selectedIcon);

  late final _instagramMenu = menuBuilderData(tooltip: 'Instagram', text: null, unselectedIcon: FontAwesomeIcons.instagram, selectedIcon: FontAwesomeIcons.instagram);
  late final _homeMenu = menuBuilderData(tooltip: 'หน้าหลัก', text: 'หน้าหลัก', unselectedIcon: Icons.home_outlined, selectedIcon: Icons.home_sharp);
  late final _searchMenu = menuBuilderData(tooltip: 'ค้นหา', text: 'ค้นหา', unselectedIcon: Icons.search_outlined, selectedIcon: Icons.search_sharp);
  late final _exploreMenu = menuBuilderData(tooltip: 'สำรวจ', text: 'สำรวจ', unselectedIcon: FontAwesomeIcons.compass, selectedIcon: FontAwesomeIcons.solidCompass);
  late final _reelsMenu = menuBuilderData(tooltip: 'Reels', text: 'Reels', unselectedIcon: FontAwesomeIcons.circlePlay, selectedIcon: FontAwesomeIcons.solidCirclePlay);
  late final _inboxMenu = menuBuilderData(tooltip: 'Messenger', text: 'ข้อความ', unselectedIcon: FontAwesomeIcons.signalMessenger, selectedIcon: FontAwesomeIcons.facebookMessenger);
  late final _notificationsMenu = menuBuilderData(tooltip: 'การแจ้งเตือน', text: 'การแจ้งเตือน', unselectedIcon: FontAwesomeIcons.heart, selectedIcon: FontAwesomeIcons.solidHeart);
  late final _createPostMenu = menuBuilderData(tooltip: 'โพสต์ใหม่', text: 'สร้าง', unselectedIcon: Icons.add_box_outlined, selectedIcon: Icons.add_box_sharp);
  late final _profileMenu = menuBuilderData(tooltip: 'โปรไฟล์', text: 'โปรไฟล์', unselectedIcon: Icons.account_circle, selectedIcon: Icons.account_circle);
  late final _threadsMenu = menuBuilderData(tooltip: '', text: 'Threads', unselectedIcon: FontAwesomeIcons.threads, selectedIcon: FontAwesomeIcons.threads);
  late final _moreMenu = menuBuilderData(tooltip: 'การตั้งค่า', text: 'เพิ่มเติม', unselectedIcon: Icons.menu_outlined, selectedIcon: Icons.menu);

  //basic widget
  final _logoButtonWidget = Container(
    padding: const EdgeInsets.all(10),
    width: 125,
    child: Tooltip(message: 'Instagram', child: ImageButtonBlinkingCustomWidget(image: ImageAsset.logo, onTap: () {}, color: Colors.white)),
  );
  final _profileWidget = const ClipOval(child: SizedBox(width: 25, child: ImageCustomWidget(image: ImageAsset.defaultProfile)));

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      //widget property
      const borderSide = BorderSide(width: 1.0, color: Color.fromRGBO(38, 38, 38, 1));

      if (constraints.maxWidth > 775) {
        //controller
        final showText = constraints.maxWidth > 1270;

        //basic widget
        final instagramMenuWidget = showText ? _logoButtonWidget : _MenuBuilderWidget(menu: _instagramMenu, showText: showText, hasSplash: true);
        final homeMenuWidget = _MenuBuilderWidget(menu: _homeMenu, showText: showText, hasSplash: true);
        final searchMenuWidget = _MenuBuilderWidget(menu: _searchMenu, showText: showText, hasSplash: true);
        final exploreMenuWidget = _MenuBuilderWidget(menu: _exploreMenu, showText: showText, hasSplash: true);
        final reelsMenuWidget = _MenuBuilderWidget(menu: _reelsMenu, showText: showText, hasSplash: true);
        final inboxMenuWidget = _MenuBuilderWidget(menu: _inboxMenu, showText: showText, hasSplash: true);
        final notificationsMenuWidget = _MenuBuilderWidget(menu: _notificationsMenu, showText: showText, hasSplash: true);
        final createPostMenuWidget = _MenuBuilderWidget(menu: _createPostMenu, showText: showText, hasSplash: true);
        final profileMenuWidget = _MenuBuilderWidget(menu: _profileMenu, showText: showText, hasSplash: true, child: _profileWidget);
        final threadsMenuWidget = _MenuBuilderWidget(menu: _threadsMenu, showText: showText, hasSplash: true);
        final moreMenuWidget = _MenuBuilderWidget(menu: _moreMenu, showText: showText, hasSplash: true);

        return Row(
          children: [
            Container(
              width: showText ? 250 : 70,
              decoration: const BoxDecoration(border: Border(right: borderSide)),
              child: CustomSingleChildScrollViewWidget(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (showText) const SizedBox(height: 5),
                          instagramMenuWidget,
                          const SizedBox(height: 30),
                          homeMenuWidget,
                          const SizedBox(height: 10),
                          searchMenuWidget,
                          const SizedBox(height: 10),
                          exploreMenuWidget,
                          const SizedBox(height: 10),
                          reelsMenuWidget,
                          const SizedBox(height: 10),
                          inboxMenuWidget,
                          const SizedBox(height: 10),
                          notificationsMenuWidget,
                          const SizedBox(height: 10),
                          createPostMenuWidget,
                          const SizedBox(height: 10),
                          profileMenuWidget,
                          const SizedBox(height: 10),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          threadsMenuWidget,
                          const SizedBox(height: 10),
                          moreMenuWidget,
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (widget.child != null) widget.child!,
          ],
        );
      }
      //basic widget
      final instagramMenuWidget = _logoButtonWidget;
      final searchFieldWidget = Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 270,
        height: 38,
        child: SearchPickerFieldCustomWidget(
          onLoadDropdownItem: (value) async {
            print('search value: ${value}');
            await Future.delayed(const Duration(seconds: 2));
            return [
              (imageUrl: ImageAsset.defaultProfile, username: 'sittiphansittisak.jobinterview', displayName: 'sittiphan sittisak', isOfficial: true, isFollow: true),
              (imageUrl: ImageAsset.defaultProfile, username: 'sittiphansittisak.jobinterview', displayName: 'sittiphan sittisak', isOfficial: false, isFollow: false),
            ];
          },
          onChange: (value) {},
          prefixIcon: Icon(_searchMenu.unselectedIcon, color: const Color.fromRGBO(142, 142, 142, 1)),
          hintText: _searchMenu.text!,
          haveClearButton: true,
          autoRemovePrefixIcon: true,
          hintStyle: const TextStyle(color: Color.fromRGBO(168, 168, 168, 1), fontSize: 16),
          borderRadius: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
      final notificationsMenuWidget = _MenuBuilderWidget(menu: _notificationsMenu, isSelected: false);
      final homeMenuWidget = _MenuBuilderWidget(menu: _homeMenu, isSelected: true);
      final exploreMenuWidget = _MenuBuilderWidget(menu: _exploreMenu, isSelected: false);
      final reelsMenuWidget = _MenuBuilderWidget(menu: _reelsMenu, isSelected: false);
      final createPostMenuWidget = _MenuBuilderWidget(menu: _createPostMenu, isSelected: false);
      final inboxMenuWidget = _MenuBuilderWidget(menu: _inboxMenu, isSelected: false);
      final profileMenuWidget = _MenuBuilderWidget(menu: _profileMenu, isSelected: false, child: _profileWidget);

      return Column(
        children: [
          Container(
            height: 60,
            decoration: const BoxDecoration(border: Border(bottom: borderSide)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    instagramMenuWidget,
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    searchFieldWidget,
                    notificationsMenuWidget,
                  ],
                ),
              ],
            ),
          ),
          if (widget.child != null) widget.child!,
          const Expanded(child: SizedBox(height: 70)),
          Container(
            height: 50,
            decoration: const BoxDecoration(border: Border(top: borderSide)),
            child: CustomSingleChildScrollViewWidget(
              isHorizontal: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  homeMenuWidget,
                  exploreMenuWidget,
                  reelsMenuWidget,
                  createPostMenuWidget,
                  inboxMenuWidget,
                  profileMenuWidget,
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

class _MenuBuilderWidget extends StatefulWidget {
  final ({String? tooltip, String? text, IconData unselectedIcon, IconData selectedIcon}) menu;
  final Widget? child;
  final bool isSelected;
  final bool showText;
  final bool hasSplash;

  const _MenuBuilderWidget({required this.menu, this.child, this.isSelected = false, this.showText = false, this.hasSplash = false});

  @override
  State<_MenuBuilderWidget> createState() => _MenuBuilderWidgetState();
}

class _MenuBuilderWidgetState extends State<_MenuBuilderWidget> {
  //controller
  bool _isEnter = false;
  bool? _isTapping = false;
  bool _isLoading = false;

  Future _setTapping(bool? isTapping) async {
    if (_isTapping == null) return;
    if (isTapping == null) {
      //on click
      if (_isTapping != true) {
        setState(() => _isTapping = true);
      }
      _isTapping = null;
      await Future.delayed(const Duration(milliseconds: 100)); //for smooth animation
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

  //widget
  Widget iconBuilderWidget({required Widget child, required Color color}) {
    if (!widget.showText || widget.menu.text == null) return child;
    return SizedBox(
      width: 200,
      child: Row(
        children: [
          child,
          const SizedBox(width: 15),
          Text(
            widget.menu.text!,
            style: TextStyle(
              color: color,
              fontSize: 17,
              fontWeight: widget.isSelected ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //widget property
    final color = (_isTapping ?? true) ? Colors.white.withOpacity(0.5) : Colors.white;
    final scale = (_isTapping ?? true) ? 0.9 : (_isEnter ? 1.1 : 1.0);

    return MouseRegion(
      onEnter: (_) => setState(() => _isEnter = true),
      onExit: (_) => setState(() => _isEnter = false),
      child: GestureDetector(
        onTapDown: (tapUpDetails) => _setTapping(true),
        onTapUp: (tapUpDetails) => _setTapping(false),
        onTapCancel: () => _setTapping(false),
        child: IconButton(
          hoverColor: widget.hasSplash ? null : Colors.transparent,
          highlightColor: widget.hasSplash ? null : Colors.transparent,
          onPressed: _onClick,
          tooltip: widget.menu.tooltip,
          icon: iconBuilderWidget(
            child: Transform.scale(
              scale: scale,
              child: widget.child ?? Icon(widget.isSelected ? widget.menu.selectedIcon : widget.menu.unselectedIcon),
            ),
            color: color,
          ),
          color: color,
          iconSize: 25,
          padding: const EdgeInsets.all(10),
          style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
        ),
      ),
    );
  }
}
