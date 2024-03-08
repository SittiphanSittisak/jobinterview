import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MoreInfoWidgetSignUpPage extends StatelessWidget {
  const MoreInfoWidgetSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: 'คนที่ใช้บริการของเราอาจอัพโหลดข้อมูลติดต่อของคุณไปยัง Instagram ',
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text: 'เรียนรู้เพิ่มเติม',
            style: const TextStyle(color: Colors.lightBlue),
          ),
        ],
      ),
    );
  }
}
