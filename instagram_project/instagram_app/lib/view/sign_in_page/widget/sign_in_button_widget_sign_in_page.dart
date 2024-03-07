import 'package:flutter/material.dart';

class SignInButtonWidgetSignInPage extends StatefulWidget {
  const SignInButtonWidgetSignInPage({super.key});

  @override
  State<SignInButtonWidgetSignInPage> createState() => _SignInButtonWidgetSignInPageState();
}

class _SignInButtonWidgetSignInPageState extends State<SignInButtonWidgetSignInPage> {
  //controller
  bool _isLoading = false;

  void _handleSignIn() {
    setState(() {
      _isLoading = true;
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _handleSignIn,
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
            : const Text(
                'เข้าสู่ระบบ',
                style: TextStyle(color: Color(0xFFAFBAC2), fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
