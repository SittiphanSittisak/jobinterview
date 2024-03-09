import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/button_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/field_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/text_button_blinking_custom_widget.dart';
import 'package:instagram_app/view/_share/widget/footer_before_sign_in_share_widget.dart';
import 'package:instagram_app/view/sign_in_page/widget/example_app_image_widget_sign_in_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //widget property
  final _fieldTextStyle = const TextStyle(color: Color.fromRGBO(149, 149, 149, 1), fontSize: 12.5);
  final _fieldTextBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(color: Color.fromRGBO(51, 51, 51, 1)),
  );

  //basic widget
  final _logoButtonWidget = InkWell(
    onTap: () {},
    child: const ImageCustomWidget(image: ImageAsset.logo, imageColor: Colors.white),
  );
  late final _usernameFieldWidget = FieldCustomWidget(
    onChange: (value) {},
    hintText: 'ชื่อผู้ใช้ หรืออีเมล',
    hintStyle: _fieldTextStyle,
    borderRadius: _fieldTextBorder,
  );
  late final _passwordFieldWidget = FieldCustomWidget(
    onChange: (value) {},
    hintText: 'รหัสผ่าน',
    useObscured: true,
    hintStyle: _fieldTextStyle,
    borderRadius: _fieldTextBorder,
  );
  final _signInButtonWidget = ButtonCustomWidget(
    onClick: () {},
    text: 'เข้าสู่ระบบ',
  );
  final _dividerWidget = const Expanded(child: Divider(color: Color(0xFF323232)));
  final _orTextWidget = const Text(
    'หรือ',
    style: TextStyle(
      color: Color.fromRGBO(149, 149, 149, 1),
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
  );
  final _signInByFacebookButtonWidget = TextButtonBlinkingCustomWidget(
    onTap: () {},
    text: 'เข้าสู่ระบบด้วย Facebook',
    prefixIcon: FontAwesomeIcons.squareFacebook,
    isBlinkWhenHover: false,
    textColor: const Color.fromRGBO(165, 186, 246, 1),
    iconColor: const Color.fromRGBO(227, 232, 251, 1),
    fontSize: 15,
    iconSize: 20,
    fontWeight: FontWeight.bold,
  );
  final _forgotPasswordWidget = TextButtonBlinkingCustomWidget(
    onTap: () {},
    text: 'ลืมรหัสผ่านใช่ไหม',
    isBlinkWhenHover: false,
    textColor: const Color.fromRGBO(191, 220, 255, 1),
    fontSize: 13,
  );
  final _signUpWidget = Text.rich(
    TextSpan(
      text: 'หากยังไม่มีบัญชี ',
      children: [
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap = () {},
          text: 'สมัครใช้งาน',
          style: const TextStyle(
            color: Color.fromRGBO(0, 128, 222, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    textAlign: TextAlign.center,
    style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 15),
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
  final _footerWidget = const FooterBeforeSignInShareWidget();

  //complex widget
  late final _signInComplexWidget = Column(
    children: [
      const SizedBox(height: 30),
      SizedBox(width: 180, child: _logoButtonWidget),
      const SizedBox(height: 35),
      _usernameFieldWidget,
      const SizedBox(height: 5),
      _passwordFieldWidget,
      const SizedBox(height: 20),
      _signInButtonWidget,
      const SizedBox(height: 25),
      Row(
        children: [
          _dividerWidget,
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: _orTextWidget),
          _dividerWidget,
        ],
      ),
      const SizedBox(height: 30),
      _signInByFacebookButtonWidget,
      const SizedBox(height: 20),
      _forgotPasswordWidget,
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
                  final mediumWidget = Column(
                    children: [
                      const SizedBox(height: 50),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        width: 350,
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF282828))),
                        child: _signInComplexWidget,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        width: 350,
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF282828))),
                        child: _signUpWidget,
                      ),
                      const SizedBox(height: 20),
                      ..._downLoadAppComplexWidget,
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
                          child: _signInComplexWidget,
                        ),
                        const SizedBox(height: 40),
                        SizedBox(width: 350, child: _signUpWidget),
                        const SizedBox(height: 40),
                        ..._downLoadAppComplexWidget,
                        const SizedBox(height: 80),
                      ],
                    );
                  }
                },
              ),
              _footerWidget,
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
