import 'package:flutter/material.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/text_button_blinking_custom_widget.dart';
import 'package:instagram_app/view/sign_in_page/builder_widget/footer_menu_builder_widget_sign_in_page.dart';
import 'package:instagram_app/view/sign_in_page/widget/example_app_image_widget_sign_in_page.dart';
import 'package:instagram_app/view/sign_in_page/widget/language_selection_widget_sign_in_page.dart';
import 'package:instagram_app/view/sign_in_page/widget/password_field_widget_sign_in_page.dart';
import 'package:instagram_app/view/sign_in_page/widget/sign_in_button_widget_sign_in_page.dart';
import 'package:instagram_app/view/sign_in_page/widget/sign_in_by_facebook_button_widget_sign_in_page.dart';
import 'package:instagram_app/view/sign_in_page/widget/username_field_widget_sign_in_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //basic widget
  final _logoButtonWidget = InkWell(
    onTap: () {},
    child: const ImageCustomWidget(image: ImageAsset.logo, imageColor: Colors.white),
  );
  final _dividerWidget = const Expanded(child: Divider(color: Color(0xFF323232)));
  final _signInChoiceWidget = const Text('หรือ', style: TextStyle(color: Color(0xFF8B929B)));
  final _forgotPasswordWidget = TextButtonBlinkingCustomWidget(
    onTap: () {},
    text: 'ลืมรหัสผ่านใช่ไหม',
    color: const Color(0xFF99C6EC),
  );
  final _registerTextWidget = const Text(
    'หากยังไม่มีบัญชี',
    style: TextStyle(color: Color(0xFFE5EDE7), fontSize: 15),
  );
  final _registerButtonWidget = TextButtonBlinkingCustomWidget(
    onTap: () {},
    text: 'สมัครใช้งาน',
    color: const Color(0xFF0080DE),
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
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
  final _exampleAppImageWidget = const ExampleAppImageWidgetSignInPage();
  final _footerMenuButtonWidgetList = [
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'Meta'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'เกี่ยวกับ'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'บล็อก'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'งาน'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'ความช่วยเหลือ'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'API'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'ความเป็นส่วนตัว'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'ข้อกำหนด'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'ตำแหน่ง'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'Instagram Lite'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'Threads'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'การอัพโหลดผู้ติดต่อและผู้ที่ไม่ได้ใช้บริการ'),
    FooterMenuBuilderWidgetSignInPage(onTap: () {}, text: 'Meta Verified'),
  ];
  final languageSelectionWidget = const LanguageSelectionWidgetSignInPage();
  final _creditWidget = const Text(
    '© 2024 Instagram from Meta',
    style: TextStyle(color: Color(0xFF959584), fontSize: 13),
  );

  //complex widget
  late final _signInWidget = Column(
    children: [
      const SizedBox(height: 30),
      SizedBox(width: 200, child: _logoButtonWidget),
      const SizedBox(height: 40),
      const UsernameFieldWidgetSignInPage(),
      const SizedBox(height: 5),
      const PasswordFieldWidgetSignInPage(),
      const SizedBox(height: 20),
      const SignInButtonWidgetSignInPage(),
      const SizedBox(height: 25),
      Row(
        children: [
          _dividerWidget,
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: _signInChoiceWidget),
          _dividerWidget,
        ],
      ),
      const SizedBox(height: 30),
      const SignInByFacebookButtonWidgetSignInPage(),
      const SizedBox(height: 20),
      _forgotPasswordWidget,
    ],
  );
  late final _registerWidget = Column(
    children: [
      Wrap(
        spacing: 2.5,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _registerTextWidget,
          _registerButtonWidget,
        ],
      )
    ],
  );

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
                  final mediumWidget = Column(
                    children: [
                      const SizedBox(height: 50),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        width: 350,
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF282828))),
                        child: _signInWidget,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        width: 350,
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF282828))),
                        child: _registerWidget,
                      ),
                      const SizedBox(height: 20),
                      _installAppTextWidget,
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: [
                          SizedBox(height: 40, child: _downloadFromGooglePlayButtonWidget),
                          SizedBox(height: 40, child: _downloadFromMicrosoftButtonWidget),
                        ],
                      ),
                      const SizedBox(height: 80),
                    ],
                  );

                  if (constraints.maxWidth > 800) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: const EdgeInsets.only(top: 50), child: _exampleAppImageWidget),
                        const SizedBox(width: 40),
                        mediumWidget,
                      ],
                    );
                  } else if (constraints.maxWidth > 400) {
                    return mediumWidget;
                  } else {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                          width: 350,
                          child: _signInWidget,
                        ),
                        const SizedBox(height: 40),
                        SizedBox(width: 350, child: _registerWidget),
                        const SizedBox(height: 40),
                        _installAppTextWidget,
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          children: [
                            SizedBox(height: 40, child: _downloadFromGooglePlayButtonWidget),
                            SizedBox(height: 40, child: _downloadFromMicrosoftButtonWidget),
                          ],
                        ),
                        const SizedBox(height: 80),
                      ],
                    );
                  }
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
              const SizedBox(height: 20),
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
