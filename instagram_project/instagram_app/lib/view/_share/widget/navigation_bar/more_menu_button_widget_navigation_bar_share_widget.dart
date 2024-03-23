import 'package:flutter/material.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/position_dialog_custom_widget.dart';

class MoreMenuButtonWidgetNavigationBarShareWidget extends StatelessWidget {
  const MoreMenuButtonWidgetNavigationBarShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //widget property
    final textFieldRenderBox = context.findRenderObject() as RenderBox?;
    if (textFieldRenderBox == null) return const SizedBox();
    final textFieldOffset = textFieldRenderBox.localToGlobal(Offset.zero);
    const menuWidth = 170.0;
    const menuHeight = 40.0;
    const bgColor = Color.fromRGBO(38, 38, 38, 1);

    //basic widget
    const logoWidget = SizedBox(
      width: 110,
      child: Tooltip(
        message: 'Instagram',
        child: ImageCustomWidget(image: ImageAsset.logo, imageColor: Colors.white),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: PositionDialogCustomWidget(
        left: textFieldOffset.dx + 15,
        top: textFieldOffset.dy + textFieldRenderBox.size.height + 25,
        dialog: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Column(
            children: [
              (text: 'กำลังติดตาม', icon: Icons.supervised_user_circle_outlined, onClick: () => print('go to กำลังติดตาม')),
              (text: 'รายการโปรด', icon: Icons.star_border, onClick: () => print('go to รายการโปรด')),
            ].map((e) {
              //controller
              bool? isTapping = false;
              bool isLoading = false;

              return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                Future setTapping(bool? isTap) async {
                  if (isTapping == null) return;
                  if (isTap == null) {
                    //on click
                    if (isTapping != true) {
                      setState(() => isTapping = true);
                    }
                    isTapping = null;
                    await Future.delayed(const Duration(milliseconds: 100)); //for smooth animation
                    setState(() => isTapping = false);
                  } else {
                    //on tap up/down/cancel
                    if (isTap == isTapping) return;
                    setState(() => isTapping = isTap);
                  }
                }

                Future onClick({bool isClickImageProfileButton = false}) async {
                  if (isLoading) return;
                  isLoading = true;
                  setTapping(null);
                  e.onClick();
                  isLoading = false;
                }

                //widget property
                final textColor = (isTapping ?? true) ? const Color.fromRGBO(142, 142, 142, 1) : const Color.fromRGBO(245, 245, 245, 1);
                const bgColor = Color.fromRGBO(38, 38, 38, 1);

                //basic widget
                final textWidget = Text(
                  e.text,
                  style: TextStyle(fontSize: 18, color: textColor),
                );
                final iconWidget = Tooltip(
                  message: e.text,
                  child: Icon(e.icon, size: 25, color: textColor),
                );

                return InkWell(
                  onTap: onClick,
                  onTapDown: (tapUpDetails) => setTapping(true),
                  onTapUp: (tapUpDetails) => setTapping(false),
                  onTapCancel: () => setTapping(false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    width: menuWidth,
                    height: menuHeight,
                    color: bgColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        textWidget,
                        iconWidget,
                      ],
                    ),
                  ),
                );
              });
            }).toList(),
          ),
        ),
        child: const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            logoWidget,
            SizedBox(width: 4),
            Tooltip(message: 'ไอคอนบั้งชี้ลง', child: Icon(Icons.keyboard_arrow_down, size: 20)),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/position_dialog_custom_widget.dart';

class MoreMenuButtonWidgetNavigationBarShareWidget extends StatelessWidget {
  const MoreMenuButtonWidgetNavigationBarShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //basic widget
    Future showMenuPopup() async {
      final textFieldRenderBox = context.findRenderObject() as RenderBox;
      final textFieldOffset = textFieldRenderBox.localToGlobal(Offset.zero);
      const menuWidth = 170.0;
      const menuHeight = 40.0;
      const bgColor = Color.fromRGBO(38, 38, 38, 1);

      //basic widget
      final menuWidgetList = [
        (text: 'กำลังติดตาม', icon: Icons.supervised_user_circle_outlined, onClick: () => print('go to กำลังติดตาม')),
        (text: 'รายการโปรด', icon: Icons.star_border, onClick: () => print('go to รายการโปรด')),
      ].map((e) {
        //controller
        bool? isTapping = false;
        bool isLoading = false;

        return PopupMenuItem(
          value: e.text,
          padding: EdgeInsets.zero,
          child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
            Future setTapping(bool? isTap) async {
              if (isTapping == null) return;
              if (isTap == null) {
                //on click
                if (isTapping != true) {
                  setState(() => isTapping = true);
                }
                isTapping = null;
                await Future.delayed(const Duration(milliseconds: 100)); //for smooth animation
                setState(() => isTapping = false);
              } else {
                //on tap up/down/cancel
                if (isTap == isTapping) return;
                setState(() => isTapping = isTap);
              }
            }

            Future onClick({bool isClickImageProfileButton = false}) async {
              if (isLoading) return;
              isLoading = true;
              setTapping(null);
              e.onClick();
              isLoading = false;
            }

            //widget property
            final textColor = (isTapping ?? true) ? const Color.fromRGBO(142, 142, 142, 1) : const Color.fromRGBO(245, 245, 245, 1);
            const bgColor = Color.fromRGBO(38, 38, 38, 1);

            //basic widget
            final textWidget = Text(
              e.text,
              style: TextStyle(fontSize: 18, color: textColor),
            );
            final iconWidget = Tooltip(
              message: e.text,
              child: Icon(e.icon, size: 25, color: textColor),
            );

            return GestureDetector(
              onTap: onClick,
              onTapDown: (tapUpDetails) => setTapping(true),
              onTapUp: (tapUpDetails) => setTapping(false),
              onTapCancel: () => setTapping(false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: menuWidth,
                height: menuHeight,
                color: bgColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    textWidget,
                    iconWidget,
                  ],
                ),
              ),
            );
          }),
        );
      }).toList();

      await showMenu(
        items: menuWidgetList,
        context: context,
        position: RelativeRect.fromLTRB(
          textFieldOffset.dx,
          textFieldOffset.dy + textFieldRenderBox.size.height + 10,
          textFieldOffset.dx + textFieldRenderBox.size.width,
          textFieldOffset.dy + textFieldRenderBox.size.height + 10,
        ),
        constraints: const BoxConstraints(maxWidth: menuWidth),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: bgColor,
        surfaceTintColor: bgColor,
      );
    }

    //widget property


    //basic widget
    const logoWidget = SizedBox(
      width: 110,
      child: Tooltip(
        message: 'Instagram',
        child: ImageCustomWidget(image: ImageAsset.logo, imageColor: Colors.white),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: PositionDialogCustomWidget(
        left: textFieldOffset.dx,
        top: textFieldOffset.dy + textFieldRenderBox.size.height + 10,
        right: textFieldOffset.dx + textFieldRenderBox.size.width,
        bottom: textFieldOffset.dy + textFieldRenderBox.size.height + 10,
        dialog: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: bgColor),
        ),
        child: const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            logoWidget,
            SizedBox(width: 4),
            Tooltip(message: 'ไอคอนบั้งชี้ลง', child: Icon(Icons.keyboard_arrow_down, size: 20)),
          ],
        ),
      ),
    );
  }
}
 */
