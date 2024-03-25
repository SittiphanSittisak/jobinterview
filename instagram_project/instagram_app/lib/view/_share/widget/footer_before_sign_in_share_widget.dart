import 'package:flutter/material.dart';
import 'package:instagram_app/view/_share/widget/footer_before_sign_in/footer_menu_widget_footer_before_sign_in_share_widget.dart';
import 'package:instagram_app/view/_share/widget/footer_before_sign_in/language_selection_widget_widget_property_footer_before_sign_in_share_widget.dart';
import 'package:instagram_app/view/_share/widget/footer_before_sign_in/widget_property_footer_before_sign_in_share_widget.dart';

class FooterBeforeSignInShareWidget extends StatelessWidget {
  const FooterBeforeSignInShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final footerMenuButtonWidgetList = [
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'Meta',
        isLink: true,
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'เกี่ยวกับ',
        isLink: true,
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'บล็อก',
        isLink: true,
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'งาน',
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'ความช่วยเหลือ',
        isLink: true,
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'API',
        isLink: true,
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'ความเป็นส่วนตัว',
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'ข้อกำหนด',
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'ตำแหน่ง',
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'Instagram Lite',
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'Threads',
        isLink: true,
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'การอัพโหลดผู้ติดต่อและผู้ที่ไม่ได้ใช้บริการ',
      ),
      FooterMenuWidgetFooterBeforeSignInShareWidget(
        onTap: () {},
        text: 'Meta Verified',
        isLink: true,
      ),
    ];
    const languageSelectionWidget = LanguageSelectionWidgetFooterBeforeSignInShareWidget();
    const creditWidget = Text(
      '© 2024 Instagram from Meta',
      style: TextStyle(color: WidgetPropertyFooterBeforeSignInShareWidget.textColor, fontSize: WidgetPropertyFooterBeforeSignInShareWidget.textFontSize),
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
