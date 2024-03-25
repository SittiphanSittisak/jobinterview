import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/custom_single_child_scroll_view_widget.dart';
import 'package:instagram_app/_lib/custom_widget/image_button_blinking_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/text_button_blinking_custom_widget.dart';
import 'package:instagram_app/view/_share/utility/widget_converter.dart';
import 'package:instagram_app/view/_share/widget/navigation_bar/menu_widget_navigation_bar_share_widget.dart';
import 'package:instagram_app/view/_share/widget/navigation_bar/dropdown_menu_button_widget_navigation_bar_share_widget.dart';
import 'package:instagram_app/view/_share/widget/navigation_bar/search_field_widget_navigation_bar_share_widget.dart';

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
        final isBigScreen = constraints.maxWidth > 1270;

        //basic widget
        final instagramMenuWidget = isBigScreen ? _logoButtonWidget : MenuWidgetNavigationBarShareWidget(hasSplash: true, showText: isBigScreen, onClick: () {}, menu: _instagramMenu);
        final homeMenuWidget = MenuWidgetNavigationBarShareWidget(hasSplash: true, showText: isBigScreen, onClick: () {}, menu: _homeMenu);
        final searchMenuWidget = MenuWidgetNavigationBarShareWidget(hasSplash: true, showText: isBigScreen, onClick: () {}, menu: _searchMenu);
        final exploreMenuWidget = MenuWidgetNavigationBarShareWidget(hasSplash: true, showText: isBigScreen, onClick: () {}, menu: _exploreMenu);
        final reelsMenuWidget = MenuWidgetNavigationBarShareWidget(hasSplash: true, showText: isBigScreen, onClick: () {}, menu: _reelsMenu);
        final inboxMenuWidget = MenuWidgetNavigationBarShareWidget(hasSplash: true, showText: isBigScreen, onClick: () {}, menu: _inboxMenu);
        final notificationsMenuWidget = MenuWidgetNavigationBarShareWidget(hasSplash: true, showText: isBigScreen, onClick: () {}, menu: _notificationsMenu);
        final createPostMenuWidget = MenuWidgetNavigationBarShareWidget(hasSplash: true, showText: isBigScreen, onClick: () {}, menu: _createPostMenu);
        final profileMenuWidget = MenuWidgetNavigationBarShareWidget(hasSplash: true, showText: isBigScreen, onClick: () {}, menu: _profileMenu, child: _profileWidget);
        final threadsMenuWidget = MenuWidgetNavigationBarShareWidget(hasSplash: true, showText: isBigScreen, onClick: () {}, menu: _threadsMenu);
        final moreMenuWidget = MenuWidgetNavigationBarShareWidget(
          hasSplash: true,
          showText: isBigScreen,
          hasDialog: true,
          onClick: () => showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel: '',
            barrierColor: Colors.transparent,
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (BuildContext buildContext, Animation<double> animation1, Animation<double> animation2) {
              //data
              final textFieldRenderBox = context.findRenderObject() as RenderBox;
              final textFieldOffset = textFieldRenderBox.localToGlobal(Offset.zero);

              //widget property
              const paddingSize = 7.0;
              final borderRadius = BorderRadius.circular(15);
              const dialogWidth = 250.0;
              const menuBgColor = Color.fromRGBO(38, 38, 38, 1);
              const textIconColor = Color.fromRGBO(246, 246, 246, 1);

              //basic widget
              Widget menuBuilderWidget({required String text, IconData? icon, required Function() onTap}) {
                return Ink(
                  padding: const EdgeInsets.symmetric(horizontal: paddingSize),
                  width: dialogWidth,
                  height: 50,
                  color: menuBgColor,
                  child: TextButtonBlinkingCustomWidget(
                    isBlinkTextWhenHover: false,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(15),
                    borderRadius: BorderRadius.circular(8),
                    hoverColor: const Color.fromRGBO(60, 60, 60, 1),
                    text: text,
                    prefixIcon: icon,
                    textColor: textIconColor,
                    iconColor: textIconColor,
                    fontSize: 15,
                    iconSize: 20,
                    onTap: onTap,
                  ),
                );
              }

              Widget dividerBuilderWidget({required double height, required double thickness}) {
                return SizedBox(
                  width: dialogWidth,
                  child: Divider(
                    height: height,
                    thickness: thickness,
                    color: const Color.fromRGBO(53, 53, 53, 1),
                  ),
                );
              }

              return Align(
                alignment: WidgetConverter.positionToAlignment(
                  context: context,
                  left: textFieldOffset.dx + (isBigScreen ? 17 : 80),
                  top: textFieldOffset.dy + textFieldRenderBox.size.height - (isBigScreen ? 160 : 50),
                ),
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: Material(
                    borderRadius: borderRadius,
                    child: Ink(
                      padding: const EdgeInsets.symmetric(vertical: paddingSize),
                      color: menuBgColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          menuBuilderWidget(
                            text: 'การตั้งค่า',
                            icon: Icons.settings,
                            onTap: () => print('การตั้งค่า'),
                          ),
                          menuBuilderWidget(
                            text: 'กิจกรรมของคุณ',
                            icon: Icons.broken_image_outlined,
                            onTap: () => print('กิจกรรมของคุณ'),
                          ),
                          menuBuilderWidget(
                            text: 'บันทึกไว้',
                            icon: Icons.bookmark_border,
                            onTap: () => print('บันทึกไว้'),
                          ),
                          menuBuilderWidget(
                            text: 'สลับโหมด',
                            icon: FontAwesomeIcons.moon,
                            onTap: () => print('สลับโหมด'),
                          ),
                          menuBuilderWidget(
                            text: 'รายงานบัญชี',
                            icon: Icons.report_gmailerrorred,
                            onTap: () => print('รายงานบัญชี'),
                          ),
                          dividerBuilderWidget(height: 20, thickness: 5),
                          menuBuilderWidget(
                            text: 'สลับบัญชี',
                            onTap: () => print('สลับบัญชี'),
                          ),
                          dividerBuilderWidget(height: 17, thickness: 2),
                          menuBuilderWidget(
                            text: 'ออกจากระบบ',
                            onTap: () => print('ออกจากระบบ'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          menu: _moreMenu,
        );

        return Row(
          children: [
            Container(
              width: isBigScreen ? 250 : 70,
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
                          if (isBigScreen) const SizedBox(height: 5),
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
      } else {
        //basic widget
        const moreMenuButtonWidget = DropdownMenuButtonWidgetNavigationBarShareWidget();
        final searchFieldWidget = Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 270,
          height: 38,
          child: SearchFieldWidgetNavigationBarShareWidget(
            value: const [
              (imageUrl: ImageAsset.defaultProfile, username: 'sittiphansittisak.jobinterview', displayName: 'sittiphan sittisak', hasStory: false, seenStory: false, isOfficial: true, isFollow: true),
            ],
            onLoadDropdownItem: (value) async {
              print('search value: $value');
              await Future.delayed(const Duration(seconds: 2));
              return [
                (imageUrl: ImageAsset.defaultProfile, username: 'sittiphansittisak.jobinterview', displayName: 'sittiphan sittisak', hasStory: false, seenStory: false, isOfficial: true, isFollow: true),
                (imageUrl: ImageAsset.defaultProfile, username: 'sittiphansittisak.jobinterview', displayName: 'sittiphan sittisak', hasStory: true, seenStory: false, isOfficial: false, isFollow: false),
                (imageUrl: ImageAsset.defaultProfile, username: 'sittiphansittisak.jobinterview', displayName: 'sittiphan sittisak', hasStory: true, seenStory: true, isOfficial: false, isFollow: false),
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
        final notificationsMenuWidget = MenuWidgetNavigationBarShareWidget(isSelected: false, onClick: () {}, menu: _notificationsMenu);
        final homeMenuWidget = MenuWidgetNavigationBarShareWidget(isSelected: true, onClick: () {}, menu: _homeMenu);
        final exploreMenuWidget = MenuWidgetNavigationBarShareWidget(isSelected: false, onClick: () {}, menu: _exploreMenu);
        final reelsMenuWidget = MenuWidgetNavigationBarShareWidget(isSelected: false, onClick: () {}, menu: _reelsMenu);
        final createPostMenuWidget = MenuWidgetNavigationBarShareWidget(isSelected: false, onClick: () {}, menu: _createPostMenu);
        final inboxMenuWidget = MenuWidgetNavigationBarShareWidget(isSelected: false, onClick: () {}, menu: _inboxMenu);
        final profileMenuWidget = MenuWidgetNavigationBarShareWidget(isSelected: false, onClick: () {}, menu: _profileMenu, child: _profileWidget);

        return Column(
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(border: Border(bottom: borderSide)),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  moreMenuButtonWidget,
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
      }
    });
  }
}
