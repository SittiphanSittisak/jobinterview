import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future showCreatePostMenuDialogWidgetNavigationBarShareWidget({required BuildContext context, required Size size}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext buildContext, Animation<double> animation1, Animation<double> animation2) {
      //widget property
      final borderRadius = BorderRadius.circular(15);
      const mediaIconSize = 70.0;

      //widget
      const titleWidget = Text(
        'สร้างโพสต์ใหม่',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      );
      const iconMediaWidget = SizedBox(
        width: 110,
        height: 80,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            RotationTransition(
              turns: AlwaysStoppedAnimation(355 / 360),
              child: Icon(Icons.image_outlined, size: mediaIconSize),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(5 / 360),
                child: Icon(FontAwesomeIcons.youtube, size: mediaIconSize),
              ),
            ),
          ],
        ),
      );
      const hintWidget = Text('ลากรูปภาพและวิดีโอมาที่นี่', style: TextStyle(fontSize: 17));
      final pickMediaButtonWidget = ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10, horizontal: 17)),
          backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) return const Color.fromRGBO(24, 119, 242, 1);
            return const Color.fromRGBO(1, 149, 247, 1);
          }),
          overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        onPressed: () {},
        child: const Text(
          'เลือกจากคอมพิวเตอร์',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      return Center(
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Material(
            borderRadius: borderRadius,
            child: Container(
              color: const Color.fromRGBO(38, 38, 38, 1),
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: titleWidget),
                  const Divider(color: Color.fromRGBO(54, 54, 54, 1), thickness: 1, height: 0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconMediaWidget,
                        const SizedBox(height: 20),
                        hintWidget,
                        const SizedBox(height: 20),
                        pickMediaButtonWidget,
                      ],
                    ),
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
