import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpWidgetSignInPage extends StatelessWidget {
  const SignUpWidgetSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: 'หากยังไม่มีบัญชี ',
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text: 'สมัครใช้งาน',
            style: const TextStyle(
              color: Color(0xFF0080DE),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: const TextStyle(color: Color(0xFFE5EDE7), fontSize: 15),
    );
  }
}
