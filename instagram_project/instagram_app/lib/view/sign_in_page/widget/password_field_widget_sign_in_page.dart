import 'package:flutter/material.dart';

class PasswordFieldWidgetSignInPage extends StatefulWidget {
  const PasswordFieldWidgetSignInPage({super.key});

  @override
  State<PasswordFieldWidgetSignInPage> createState() => _PasswordFieldWidgetSignInPageState();
}

class _PasswordFieldWidgetSignInPageState extends State<PasswordFieldWidgetSignInPage> {
  //data
  final _hintText = 'รหัสผ่าน';
  final _hintStyle = const TextStyle(color: Color(0xFF949393));

  //controller
  bool _showObscuredIcon = false;
  bool _isObscured = true;
  bool _isHintToLabel = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        bool isSetState = false;
        if ((value.isEmpty && _showObscuredIcon) || (value.isNotEmpty && !_showObscuredIcon)) {
          isSetState = true;
          _showObscuredIcon = !_showObscuredIcon;
        }
        if (_isHintToLabel != value.isNotEmpty) {
          isSetState = true;
          _isHintToLabel = value.isNotEmpty;
        }
        if (isSetState) setState(() {});
      },
      obscureText: _isObscured,
      decoration: InputDecoration(
        suffixIcon: _showObscuredIcon
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF949393),
                ),
                onPressed: () => setState(() => _isObscured = !_isObscured),
              )
            : null,
        hintText: _hintText,
        hintStyle: _hintStyle,
        labelText: _isHintToLabel ? _hintText : null,
        labelStyle: _isHintToLabel ? _hintStyle : null,
        floatingLabelBehavior: _isHintToLabel ? FloatingLabelBehavior.always : FloatingLabelBehavior.never,
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
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
