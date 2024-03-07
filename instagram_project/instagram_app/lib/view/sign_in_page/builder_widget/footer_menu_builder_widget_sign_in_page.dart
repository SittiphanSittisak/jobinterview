import 'package:flutter/material.dart';
import 'package:instagram_app/_lib/custom_widget/text_button_blinking_custom_widget.dart';

class FooterMenuBuilderWidgetSignInPage extends StatelessWidget {
  final String text;
  final Function() onTap;

  const FooterMenuBuilderWidgetSignInPage({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButtonBlinkingCustomWidget(
      onTap: onTap,
      text: text,
      color: const Color(0xFF959584),
      fontSize: 13,
    );
  }
}
