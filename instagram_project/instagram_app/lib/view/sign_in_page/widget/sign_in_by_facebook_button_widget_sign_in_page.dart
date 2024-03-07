import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInByFacebookButtonWidgetSignInPage extends StatefulWidget {
  const SignInByFacebookButtonWidgetSignInPage({super.key});

  @override
  State<SignInByFacebookButtonWidgetSignInPage> createState() => _SignInByFacebookButtonWidgetSignInPageState();
}

class _SignInByFacebookButtonWidgetSignInPageState extends State<SignInByFacebookButtonWidgetSignInPage> {
  //controller
  bool _isTapping = false;

  //widget property
  final _iconColor = const Color(0xFFB2B6C4);
  final _textColor = const Color(0xFFA3B7E8);

  @override
  Widget build(BuildContext context) {
    final iconColor = _isTapping ? _iconColor.withOpacity(0.5) : _iconColor;
    final textColor = _isTapping ? _textColor.withOpacity(0.5) : _textColor;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTapDown: (tapUpDetails) => setState(() => _isTapping = true),
      onTapUp: (tapUpDetails) => setState(() => _isTapping = false),
      onTapCancel: () => setState(() => _isTapping = false),
      onTap: () {},
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          FaIcon(FontAwesomeIcons.squareFacebook, color: iconColor),
          Text('เข้าสู่ระบบด้วย Facebook', style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
