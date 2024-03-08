import 'package:flutter/material.dart';

class SignUpButtonWidgetSignUpPage extends StatefulWidget {
  const SignUpButtonWidgetSignUpPage({super.key});

  @override
  State<SignUpButtonWidgetSignUpPage> createState() => _SignUpButtonWidgetSignUpPageState();
}

class _SignUpButtonWidgetSignUpPageState extends State<SignUpButtonWidgetSignUpPage> {
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
      onPressed: _isLoading ? null : _onClick,
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
                'สมัครใช้งาน',
                style: TextStyle(color: Color(0xFFAFBAC2), fontSize: 16, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
