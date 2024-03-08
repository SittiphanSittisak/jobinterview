import 'package:flutter/material.dart';

class LanguageSelectionWidgetSignUpPage extends StatefulWidget {
  const LanguageSelectionWidgetSignUpPage({super.key});

  @override
  State<LanguageSelectionWidgetSignUpPage> createState() => _LanguageSelectionWidgetSignUpPageState();
}

class _LanguageSelectionWidgetSignUpPageState extends State<LanguageSelectionWidgetSignUpPage> {
  //data
  final dropdownMenuMap = {
    'thai': 'ภาษาไทย',
    'englist': 'English',
  };

  //controller
  late String selectedLanguageText = 'ภาษาไทย';

  //widget property
  final color = const Color(0xFF959584);

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
            style: TextStyle(color: color, fontSize: 13),
          ),
          Icon(Icons.keyboard_arrow_down_rounded, color: color),
        ],
      ),
    );
  }
}
