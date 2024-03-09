import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/button_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/field_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';
import 'package:instagram_app/view/_share/widget/footer_before_sign_in_share_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //widget property
  final _fieldTextStyle = const TextStyle(color: Color.fromRGBO(149, 149, 149, 1), fontSize: 13);
  final _fieldTextBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(color: Color.fromRGBO(51, 51, 51, 1)),
  );
  final _infoTextStyle = const TextStyle(color: Color.fromRGBO(149, 149, 149, 1), fontSize: 13);
  final _infoLinkStyle = const TextStyle(color: Color.fromRGBO(191, 220, 255, 1), fontSize: 13);
  final _policyTextStyle = const TextStyle(color: Color.fromRGBO(149, 149, 149, 1), fontSize: 13);
  final _policyLinkStyle = const TextStyle(color: Color.fromRGBO(191, 220, 255, 1), fontSize: 13);

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
      fontSize: 17,
      fontWeight: FontWeight.bold,
    ),
  );
  final _signInByFacebookButtonWidget = ButtonCustomWidget(
    onClick: () {},
    text: 'เข้าสู่ระบบด้วย Facebook',
    prefixIcon: FontAwesomeIcons.squareFacebook,
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
  late final _emailFieldWidget = FieldCustomWidget(
    onChange: (value) {},
    hintText: 'อีเมล',
    hintStyle: _fieldTextStyle,
    borderRadius: _fieldTextBorder,
  );
  late final _fullNameFieldWidget = FieldCustomWidget(
    onChange: (value) {},
    hintText: 'ชื่อและนามสกุล',
    hintStyle: _fieldTextStyle,
    borderRadius: _fieldTextBorder,
  );
  late final _usernameFieldWidget = FieldCustomWidget(
    onChange: (value) {},
    hintText: 'ชื่อผู้ใช้',
    hintStyle: _fieldTextStyle,
    borderRadius: _fieldTextBorder,
  );
  late final _passwordFieldWidget = FieldCustomWidget(
    onChange: (value) {},
    hintText: 'รหัสผ่าน',
    hintStyle: _fieldTextStyle,
    borderRadius: _fieldTextBorder,
  );
  late final _moreInfoWidget = Text.rich(
    TextSpan(
      text: 'คนที่ใช้บริการของเราอาจอัพโหลดข้อมูลติดต่อของคุณไปยัง Instagram ',
      children: [
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap = () {},
          text: 'เรียนรู้เพิ่มเติม',
          style: _infoLinkStyle,
        ),
      ],
    ),
    textAlign: TextAlign.center,
    style: _infoTextStyle,
  );
  late final _policyWidget = Text.rich(
    TextSpan(
      text: 'เมื่อสมัครใช้งาน แสดงว่าคุณยินยอมตาม',
      children: [
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap = () {},
          text: 'ข้อกำหนด นโยบายความเป็นส่วนตัว',
          style: _policyLinkStyle,
        ),
        const TextSpan(text: ' และ'),
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap = () {},
          text: 'นโยบายคุกกี้',
          style: _policyLinkStyle,
        ),
        const TextSpan(text: 'ของเรา'),
      ],
    ),
    textAlign: TextAlign.center,
    style: _policyTextStyle,
  );
  final _signUpButtonWidget = ButtonCustomWidget(
    onClick: () {},
    text: 'สมัครใช้งาน',
  );
  final _signInWidget = Text.rich(
    TextSpan(
      text: 'มีบัญชีผู้ใช้แล้ว? ',
      children: [
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap = () {},
          text: 'เข้าสู่ระบบ',
          style: const TextStyle(
            color: Color.fromRGBO(0, 128, 222, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
      style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 14),
    ),
    textAlign: TextAlign.center,
    style: const TextStyle(color: Color(0xFFE5EDE7), fontSize: 14),
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
  final _footerWidget = const FooterBeforeSignInShareWidget();

  //complex widget
  late final _signUpComplexWidget = Column(
    children: [
      const SizedBox(height: 30),
      SizedBox(width: 180, child: _logoButtonWidget),
      const SizedBox(height: 15),
      _titleTextWidget,
      const SizedBox(height: 15),
      _signInByFacebookButtonWidget,
      const SizedBox(height: 15),
      Row(
        children: [
          _dividerWidget,
          Padding(padding: const EdgeInsets.symmetric(horizontal: 15), child: _orTextWidget),
          _dividerWidget,
        ],
      ),
      const SizedBox(height: 15),
      _emailFieldWidget,
      const SizedBox(height: 5),
      _fullNameFieldWidget,
      const SizedBox(height: 5),
      _usernameFieldWidget,
      const SizedBox(height: 5),
      _passwordFieldWidget,
      const SizedBox(height: 20),
      _moreInfoWidget,
      const SizedBox(height: 15),
      _policyWidget,
      const SizedBox(height: 15),
      _signUpButtonWidget,
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
              _footerWidget,
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
