import 'package:flutter/material.dart';

class PasswordFieldWidgetSignInPage extends StatefulWidget {
  const PasswordFieldWidgetSignInPage({super.key});

  @override
  State<PasswordFieldWidgetSignInPage> createState() => _PasswordFieldWidgetSignInPageState();
}

class _PasswordFieldWidgetSignInPageState extends State<PasswordFieldWidgetSignInPage> {
  //controller
  bool _showObscuredIcon = false;
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscured,
      decoration: InputDecoration(
        hintText: 'รหัสผ่าน',
        hintStyle: const TextStyle(color: Color(0xFF949393)),
        filled: true,
        fillColor: const Color(0xFF1F1F1F),
        contentPadding: const EdgeInsets.all(12.0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF2C2C2C), width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF2C2C2C), width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: _showObscuredIcon
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF949393),
                ),
                onPressed: () {
                  setState(() => _isObscured = !_isObscured);
                },
              )
            : null,
      ),
      style: const TextStyle(color: Colors.white),
      onChanged: (value) {
        if ((value.isEmpty && _showObscuredIcon) || (value.isNotEmpty && !_showObscuredIcon)) {
          setState(() => _showObscuredIcon = !_showObscuredIcon);
        }
      },
    );
  }
}
