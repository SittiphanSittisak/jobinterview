import 'package:flutter/material.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';
import 'package:instagram_app/view/sign_up_page/builder_widget/footer_menu_builder_widget_sign_up_page.dart';
import 'package:instagram_app/view/sign_up_page/widget/email_field_widget_sign_up_page.dart';
import 'package:instagram_app/view/sign_up_page/widget/language_selection_widget_sign_up_page.dart';
import 'package:instagram_app/view/sign_up_page/widget/more_info_widget_sign_up_page.dart';
import 'package:instagram_app/view/sign_up_page/widget/name_field_widget_sign_up_page.dart';
import 'package:instagram_app/view/sign_up_page/widget/password_field_widget_sign_up_page.dart';
import 'package:instagram_app/view/sign_up_page/widget/policy_widget_sign_up_page.dart';
import 'package:instagram_app/view/sign_up_page/widget/sign_in_by_facebook_button_widget_sign_up_page.dart';
import 'package:instagram_app/view/sign_up_page/widget/sign_in_widget_sign_up_page.dart';
import 'package:instagram_app/view/sign_up_page/widget/sign_up_button_widget_sign_up_page.dart';
import 'package:instagram_app/view/sign_up_page/widget/username_field_widget_sign_up_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //basic widget
  final _logoButtonWidget = InkWell(
    onTap: () {},
    child: const ImageCustomWidget(image: ImageAsset.logo, imageColor: Colors.white),
  );
  final _titleTextWidget = const Text(
    'สมัครใช้งานเพื่อดูรูปภาพและวิดีโอจากเพื่อนของคุณ',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Color.fromRGBO(149, 149, 149, 1),
      fontSize: 21,
      fontWeight: FontWeight.bold,
    ),
  );
  final _dividerWidget = const Expanded(child: Divider(color: Color(0xFF323232)));
  final _signInChoiceWidget = const Text(
    'หรือ',
    style: TextStyle(color: Color(0xFF8B929B), fontWeight: FontWeight.bold),
  );
  final _signInWidget = const SignInWidgetSignUpPage();
  final _installAppTextWidget = const Text(
    'ติดตั้งแอพ',
    style: TextStyle(color: Color(0xFFE5EDE7), fontSize: 16),
  );
  final _downloadFromGooglePlayButtonWidget = InkWell(
    onTap: () {},
    child: const ImageCustomWidget(image: ImageAsset.downloadFromGooglePlay),
  );
  final _downloadFromMicrosoftButtonWidget = InkWell(
    onTap: () {},
    child: const ImageCustomWidget(image: ImageAsset.downloadFromMicrosoft),
  );
  final _footerMenuButtonWidgetList = [
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'Meta'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'เกี่ยวกับ'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'บล็อก'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'งาน'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'ความช่วยเหลือ'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'API'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'ความเป็นส่วนตัว'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'ข้อกำหนด'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'ตำแหน่ง'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'Instagram Lite'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'Threads'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'การอัพโหลดผู้ติดต่อและผู้ที่ไม่ได้ใช้บริการ'),
    FooterMenuBuilderWidgetSignUpPage(onTap: () {}, text: 'Meta Verified'),
  ];
  final languageSelectionWidget = const LanguageSelectionWidgetSignUpPage();
  final _creditWidget = const Text(
    '© 2024 Instagram from Meta',
    style: TextStyle(color: Color(0xFF959584), fontSize: 13),
  );

  //complex widget
  late final _signUpComplexWidget = Column(
    children: [
      const SizedBox(height: 30),
      SizedBox(width: 200, child: _logoButtonWidget),
      const SizedBox(height: 15),
      _titleTextWidget,
      const SizedBox(height: 15),
      const SignInByFacebookButtonWidgetSignUpPage(),
      const SizedBox(height: 15),
      Row(
        children: [
          _dividerWidget,
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: _signInChoiceWidget),
          _dividerWidget,
        ],
      ),
      const SizedBox(height: 15),
      const EmailFieldWidgetSignUpPage(),
      const SizedBox(height: 5),
      const NameFieldWidgetSignUpPage(),
      const SizedBox(height: 5),
      const UsernameFieldWidgetSignUpPage(),
      const SizedBox(height: 5),
      const PasswordFieldWidgetSignUpPage(),
      const SizedBox(height: 20),
      const MoreInfoWidgetSignUpPage(),
      const SizedBox(height: 15),
      const PolicyWidgetSignUpPage(),
      const SizedBox(height: 10),
      const SignUpButtonWidgetSignUpPage(),
      const SizedBox(height: 20),
    ],
  );
  late final _downLoadAppComplexWidget = [
    _installAppTextWidget,
    const SizedBox(height: 10),
    Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        SizedBox(height: 40, child: _downloadFromGooglePlayButtonWidget),
        SizedBox(height: 40, child: _downloadFromMicrosoftButtonWidget),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardDecoration = constraints.maxWidth > 400 ? BoxDecoration(border: Border.all(color: const Color(0xFF282828))) : null;

                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        width: 350,
                        decoration: cardDecoration,
                        child: _signUpComplexWidget,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        width: 350,
                        decoration: cardDecoration,
                        child: _signInWidget,
                      ),
                      const SizedBox(height: 20),
                      ..._downLoadAppComplexWidget,
                      const SizedBox(height: 80),
                    ],
                  );
                },
              ),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 4,
                  children: _footerMenuButtonWidgetList,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  spacing: 20,
                  runSpacing: 4,
                  children: [
                    languageSelectionWidget,
                    _creditWidget,
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
