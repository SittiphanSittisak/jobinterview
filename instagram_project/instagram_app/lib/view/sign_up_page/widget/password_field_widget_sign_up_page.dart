import 'package:flutter/material.dart';

class PasswordFieldWidgetSignUpPage extends StatefulWidget {
  const PasswordFieldWidgetSignUpPage({super.key});

  @override
  State<PasswordFieldWidgetSignUpPage> createState() => _PasswordFieldWidgetSignUpPageState();
}

class _PasswordFieldWidgetSignUpPageState extends State<PasswordFieldWidgetSignUpPage> {
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
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: Color(0xFF2C2C2C))),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color(0xFF2C2C2C)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color(0xFF2C2C2C)),
        ),
      ),
    );
  }
}
