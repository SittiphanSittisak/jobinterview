import 'package:flutter/material.dart';
import 'package:instagram_app/view/_share/widget/footer_before_sign_in/widget_property_footer_before_sign_in_share_widget.dart';

class LanguageSelectionWidgetFooterBeforeSignInShareWidget extends StatefulWidget {
  const LanguageSelectionWidgetFooterBeforeSignInShareWidget({super.key});

  @override
  State<LanguageSelectionWidgetFooterBeforeSignInShareWidget> createState() => _LanguageSelectionWidgetFooterBeforeSignInShareWidgetState();
}

class _LanguageSelectionWidgetFooterBeforeSignInShareWidgetState extends State<LanguageSelectionWidgetFooterBeforeSignInShareWidget> {
  //data
  final dropdownMenuMap = {
    'thai': 'ภาษาไทย',
    'englist': 'English',
  };

  //controller
  late String selectedLanguageText = 'ภาษาไทย';

  //widget property
  final color = WidgetPropertyFooterBeforeSignInShareWidget.textColor;

  //basic widget
  late final dropdownItemBuilder = dropdownMenuMap.entries.map((e) => PopupMenuItem(value: e.key, child: Text(e.value))).toList();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (String value) {
        setState(() => selectedLanguageText = dropdownMenuMap[value] ?? selectedLanguageText);
      },
      itemBuilder: (BuildContext context) => dropdownItemBuilder,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectedLanguageText,
            style: TextStyle(color: color, fontSize: WidgetPropertyFooterBeforeSignInShareWidget.textFontSize),
          ),
          Icon(Icons.keyboard_arrow_down_rounded, color: color),
        ],
      ),
    );
  }
}
