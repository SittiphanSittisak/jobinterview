import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/image_button_blinking_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';

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
      const boxDecoration = BoxDecoration(border: Border(right: BorderSide(width: 1.0, color: Color.fromRGBO(38, 38, 38, 1))));

      if (constraints.maxWidth > 775) {
        //controller
        final showText = constraints.maxWidth > 1270;

        //basic widget
        final instagramMenuWidget = showText ? _logoButtonWidget : _MenuBuilderWidget(menu: _instagramMenu, showText: showText);
        final profileMenuWidget = _MenuBuilderWidget(menu: _profileMenu, showText: showText, child: _profileWidget);
        final homeMenuWidget = _MenuBuilderWidget(menu: _homeMenu, showText: showText);
        final searchMenuWidget = _MenuBuilderWidget(menu: _searchMenu, showText: showText);
        final exploreMenuWidget = _MenuBuilderWidget(menu: _exploreMenu, showText: showText);
        final reelsMenuWidget = _MenuBuilderWidget(menu: _reelsMenu, showText: showText);
        final inboxMenuWidget = _MenuBuilderWidget(menu: _inboxMenu, showText: showText);
        final notificationsMenuWidget = _MenuBuilderWidget(menu: _notificationsMenu, showText: showText);
        final createPostMenuWidget = _MenuBuilderWidget(menu: _createPostMenu, showText: showText);
        final threadsMenuWidget = _MenuBuilderWidget(menu: _threadsMenu, showText: showText);
        final moreMenuWidget = _MenuBuilderWidget(menu: _moreMenu, showText: showText);

        return Row(
          children: [
            Container(
              width: showText ? 250 : 70,
              decoration: boxDecoration,
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
                  ],
                ),
              ),
            ),
            if (widget.child != null) widget.child!,
          ],
        );
      }
      return Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*_instagramMenuWidget,
              _notificationsMenuWidget,*/
            ],
          ),
          if (widget.child != null) widget.child!,
          const Expanded(child: SizedBox(height: 70)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* _homeMenuWidget,
              const SizedBox(width: 10),
              _exploreMenuWidget,
              const SizedBox(width: 10),
              _reelsMenuWidget,
              const SizedBox(width: 10),
              _createPostMenuWidget,
              const SizedBox(width: 10),
              _inboxMenuWidget,
              const SizedBox(width: 10),
              _profileMenuWidget,
              const SizedBox(width: 10),*/
            ],
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
  final bool isHorizontal;

  const _MenuBuilderWidget({required this.menu, this.child, this.isSelected = false, this.showText = false, this.isHorizontal = false});

  @override
  State<_MenuBuilderWidget> createState() => _MenuBuilderWidgetState();
}

class _MenuBuilderWidgetState extends State<_MenuBuilderWidget> {
  //controller
  bool _isLoading = false;
  bool? _isTapping = false;

  //widget property
  Color color = Colors.white;

  Future _setTapping(bool? isTapping) async {
    if (_isTapping == null) return;
    if (isTapping == null) {
      //on click
      if (_isTapping != true) {
        setState(() {
          color = Colors.white.withOpacity(0.5);
          _isTapping = true;
        });
      }
      _isTapping = null;
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        color = Colors.white;
        _isTapping = false;
      });
    } else {
      //on tap up/down/cancel
      if (isTapping == _isTapping) return;
      setState(() {
        color = isTapping ? Colors.white.withOpacity(0.5) : Colors.white;
        _isTapping = isTapping;
      });
    }
  }

  Future _onClick() async {
    if (_isLoading) return;
    _setTapping(null);
    _isLoading = true;

    _isLoading = false;
  }

  //widget
  Widget iconBuilderWidget(Widget child) {
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
    return GestureDetector(
      onTapDown: (tapUpDetails) => _setTapping(true),
      onTapUp: (tapUpDetails) => _setTapping(false),
      onTapCancel: () => _setTapping(false),
      child: IconButton(
        hoverColor: widget.isHorizontal ? Colors.transparent : null,
        highlightColor: widget.isHorizontal ? Colors.transparent : null,
        onPressed: _onClick,
        tooltip: widget.menu.tooltip,
        icon: iconBuilderWidget(
          Transform.scale(
            scale: (_isTapping ?? true) ? 0.9 : 1.0,
            child: widget.child ?? Icon(widget.isSelected ? widget.menu.selectedIcon : widget.menu.unselectedIcon),
          ),
        ),
        color: color,
        iconSize: 25,
        padding: const EdgeInsets.all(10),
        style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
      ),
    );
  }
}
