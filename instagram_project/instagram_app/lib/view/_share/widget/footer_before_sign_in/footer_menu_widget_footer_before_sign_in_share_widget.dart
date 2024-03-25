import 'package:flutter/material.dart';
import 'package:instagram_app/_lib/custom_widget/text_button_blinking_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/text_link_button_blinking_custom_widget.dart';
import 'package:instagram_app/view/_share/widget/footer_before_sign_in/widget_property_footer_before_sign_in_share_widget.dart';

class FooterMenuWidgetFooterBeforeSignInShareWidget extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool isLink;

  const FooterMenuWidgetFooterBeforeSignInShareWidget({super.key, required this.onTap, required this.text, this.isLink = false});

  @override
  Widget build(BuildContext context) {
    return isLink
        ? TextLinkButtonBlinkingCustomWidget(
            onTap: onTap,
            text: text,
            color: WidgetPropertyFooterBeforeSignInShareWidget.textColor,
            fontSize: WidgetPropertyFooterBeforeSignInShareWidget.textFontSize,
            lineColor: const Color.fromRGBO(191, 220, 255, 1),
          )
        : TextButtonBlinkingCustomWidget(
            onTap: onTap,
            text: text,
            textColor: WidgetPropertyFooterBeforeSignInShareWidget.textColor,
            fontSize: WidgetPropertyFooterBeforeSignInShareWidget.textFontSize,
            isBlinkTextWhenHover: false,
          );
  }
}
