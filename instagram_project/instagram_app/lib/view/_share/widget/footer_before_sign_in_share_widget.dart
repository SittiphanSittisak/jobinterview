import 'package:flutter/material.dart';
import 'package:instagram_app/_lib/custom_widget/text_button_blinking_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/text_link_button_blinking_custom_widget.dart';

class FooterBeforeSignInShareWidget extends StatelessWidget {
  const FooterBeforeSignInShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final footerMenuButtonWidgetList = [
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'Meta',
        isLink: true,
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'เกี่ยวกับ',
        isLink: true,
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'บล็อก',
        isLink: true,
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'งาน',
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'ความช่วยเหลือ',
        isLink: true,
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'API',
        isLink: true,
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'ความเป็นส่วนตัว',
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'ข้อกำหนด',
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'ตำแหน่ง',
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'Instagram Lite',
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'Threads',
        isLink: true,
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'การอัพโหลดผู้ติดต่อและผู้ที่ไม่ได้ใช้บริการ',
      ),
      _FooterMenuBuilderWidget(
        onTap: () {},
        text: 'Meta Verified',
        isLink: true,
      ),
    ];
    const languageSelectionWidget = _LanguageSelectionWidget();
    const creditWidget = Text(
      '© 2024 Instagram from Meta',
      style: TextStyle(color: _WidgetProperty.textColor, fontSize: _WidgetProperty.textFontSize),
    );

    return Column(
      children: [
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 4,
            children: footerMenuButtonWidgetList,
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.end,
            spacing: 20,
            runSpacing: 4,
            children: [
              languageSelectionWidget,
              creditWidget,
            ],
          ),
        ),
      ],
    );
  }
}

class _WidgetProperty {
  static const textColor = Color.fromRGBO(149, 149, 149, 1);
  static const textFontSize = 13.0;
}

class _FooterMenuBuilderWidget extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool isLink;

  const _FooterMenuBuilderWidget({
    required this.onTap,
    required this.text,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLink
        ? TextLinkButtonBlinkingCustomWidget(
            onTap: onTap,
            text: text,
            color: _WidgetProperty.textColor,
            fontSize: _WidgetProperty.textFontSize,
            lineColor: const Color.fromRGBO(191, 220, 255, 1),
          )
        : TextButtonBlinkingCustomWidget(
            onTap: onTap,
            text: text,
            textColor: _WidgetProperty.textColor,
            fontSize: _WidgetProperty.textFontSize,
            isBlinkWhenHover: false,
          );
  }
}

class _LanguageSelectionWidget extends StatefulWidget {
  const _LanguageSelectionWidget();

  @override
  State<_LanguageSelectionWidget> createState() => _LanguageSelectionWidgetState();
}

class _LanguageSelectionWidgetState extends State<_LanguageSelectionWidget> {
  //data
  final dropdownMenuMap = {
    'thai': 'ภาษาไทย',
    'englist': 'English',
  };

  //controller
  late String selectedLanguageText = 'ภาษาไทย';

  //widget property
  final color = _WidgetProperty.textColor;

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
            style: TextStyle(color: color, fontSize: _WidgetProperty.textFontSize),
          ),
          Icon(Icons.keyboard_arrow_down_rounded, color: color),
        ],
      ),
    );
  }
}
