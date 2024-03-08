import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PolicyWidgetSignUpPage extends StatelessWidget {
  const PolicyWidgetSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: 'เมื่อสมัครใช้งาน แสดงว่าคุณยินยอมตาม',
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text: 'ข้อกำหนด นโยบายความเป็นส่วนตัว',
            style: const TextStyle(color: Colors.lightBlue),
          ),
          const TextSpan(text: ' และ'),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text: 'นโยบายคุกกี้',
            style: const TextStyle(color: Colors.lightBlue),
          ),
          const TextSpan(text: 'ของเรา'),
        ],
      ),
    );
  }
}
