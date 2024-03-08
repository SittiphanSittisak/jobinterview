import 'package:flutter/material.dart';

class UsernameFieldWidgetSignUpPage extends StatefulWidget {
  const UsernameFieldWidgetSignUpPage({super.key});

  @override
  State<UsernameFieldWidgetSignUpPage> createState() => _UsernameFieldWidgetSignUpPageState();
}

class _UsernameFieldWidgetSignUpPageState extends State<UsernameFieldWidgetSignUpPage> {
  //data
  final _hintText = 'ชื่อผู้ใช้';
  final _hintStyle = const TextStyle(color: Color(0xFF949393));

  //controller
  bool _isHintToLabel = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        setState(() => _isHintToLabel = value.isNotEmpty);
      },
      decoration: InputDecoration(
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
