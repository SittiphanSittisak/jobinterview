import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInByFacebookButtonWidgetSignUpPage extends StatefulWidget {
  const SignInByFacebookButtonWidgetSignUpPage({super.key});

  @override
  State<SignInByFacebookButtonWidgetSignUpPage> createState() => _SignInByFacebookButtonWidgetSignUpPageState();
}

class _SignInByFacebookButtonWidgetSignUpPageState extends State<SignInByFacebookButtonWidgetSignUpPage> {
  //controller
  bool _isLoading = false;

  Future _onClick() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF056EB2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: _isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Color(0xFFAFBAC2), strokeWidth: 1),
              )
            : const Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    WidgetSpan(child: FaIcon(FontAwesomeIcons.squareFacebook, color: Colors.white), alignment: PlaceholderAlignment.middle),
                    WidgetSpan(child: SizedBox(width: 10)),
                    TextSpan(
                      text: "เข้าสู่ระบบด้วย Facebook",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
