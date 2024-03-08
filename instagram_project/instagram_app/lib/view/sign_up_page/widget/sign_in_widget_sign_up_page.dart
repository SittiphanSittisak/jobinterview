import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInWidgetSignUpPage extends StatelessWidget {
  const SignInWidgetSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: 'มีบัญชีผู้ใช้แล้ว? ',
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text: 'เข้าสู่ระบบ',
            style: const TextStyle(color: Colors.lightBlue),
          ),
        ],
      ),
      style: const TextStyle(fontSize: 16),
    );
  }
}
