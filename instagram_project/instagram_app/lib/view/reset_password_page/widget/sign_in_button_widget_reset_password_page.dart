import 'package:flutter/material.dart';

class SignInButtonWidgetResetPasswordPage extends StatefulWidget {
  final double borderRadiusValue;

  const SignInButtonWidgetResetPasswordPage({super.key, required this.borderRadiusValue});

  @override
  State<SignInButtonWidgetResetPasswordPage> createState() => _SignInButtonWidgetResetPasswordPageState();
}

class _SignInButtonWidgetResetPasswordPageState extends State<SignInButtonWidgetResetPasswordPage> {
  //controller
  bool _isHover = false;

  //widget property
  final textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => setState(() => _isHover = value),
      onTap: () {},
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(31, 31, 31, 1),
          border: Border.all(color: const Color.fromRGBO(51, 51, 51, 1)),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(widget.borderRadiusValue),
            bottomRight: Radius.circular(widget.borderRadiusValue),
          ),
        ),
        child: Text(
          'กลับไปยังการเข้าสู่ระบบ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _isHover ? textColor.withOpacity(0.5) : textColor,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
