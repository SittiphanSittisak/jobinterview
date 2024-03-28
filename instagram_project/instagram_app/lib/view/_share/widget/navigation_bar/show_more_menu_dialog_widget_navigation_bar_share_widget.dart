import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/_lib/custom_widget/text_button_blinking_custom_widget.dart';
import 'package:instagram_app/view/_share/utility/widget_converter.dart';

Future showMoreMenuDialogWidgetNavigationBarShareWidget({required BuildContext context, required bool isBigScreen}) {
  return showGeneralDialog(
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
          left: textFieldOffset.dx + (isBigScreen ? 0 : 70),
          top: textFieldOffset.dy + textFieldRenderBox.size.height - (isBigScreen ? 125 : 20),
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
  );
}
