import 'package:flutter/material.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/button_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/field_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/text_button_blinking_custom_widget.dart';
import 'package:instagram_app/view/_share/widget/footer_before_sign_in_share_widget.dart';
import 'package:instagram_app/view/reset_password_page/widget/sign_in_button_widget_reset_password_page.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  //widget property
  final _resetCardBorderRadiusValue = 5.0;

  //basic widget
  final _logoButtonWidget = InkWell(
    onTap: () {},
    child: const ImageCustomWidget(image: ImageAsset.logo, imageColor: Colors.white),
  );
  final _lockIconWidget = Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: 5),
    ),
    child: const Icon(Icons.lock_outline_rounded, size: 80),
  );
  final _titleTextWidget = const Text(
    'มีปัญหาในการเข้าสู่ระบบใช่ไหม',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
  );
  final _detailTextWidget = const Text(
    'ป้อนอีเมล หมายเลขโทรศัพท์ หรือชื่อผู้ใช้ของคุณ แล้วเราจะส่งลิงก์ไปให้เพื่อให้คุณกลับเข้าสู่ระบบบัญชีผู้ใช้ของคุณได้',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Color.fromRGBO(149, 149, 132, 1),
      fontSize: 15,
      height: 1.4,
    ),
  );
  final _emailFieldWidget = FieldCustomWidget(
    onChange: (value) {},
    hintText: 'อีเมล หรือชื่อผู้ใช้',
    hintStyle: const TextStyle(color: Color.fromRGBO(199, 199, 199, 1), fontSize: 15),
    borderRadius: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7.5),
      borderSide: const BorderSide(color: Color(0xFF2C2C2C)),
    ),
  );
  final _sendEmailButtonWidget = ButtonCustomWidget(
    onClick: () {},
    text: 'ส่งลิงก์สำหรับการเข้าสู่ระบบ',
  );
  final _canNotResetPasswordTextButtonWidget = TextButtonBlinkingCustomWidget(
    onTap: () {},
    text: 'คุณรีเซ็ตรหัสผ่านไม่ได้ใช่ไหม',
    isBlinkWhenHover: false,
    textColor: const Color.fromRGBO(191, 220, 255, 1),
    fontSize: 12,
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
  final _signUpTextButtonWidget = TextButtonBlinkingCustomWidget(
    onTap: () {},
    text: 'สร้างบัญชีใหม่',
    textColor: Colors.white,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
  final _footerWidget = const FooterBeforeSignInShareWidget();

  //complex widget
  late final _resetPasswordComplexWidget = Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            const SizedBox(height: 25),
            _lockIconWidget,
            const SizedBox(height: 15),
            _titleTextWidget,
            const SizedBox(height: 5),
            _detailTextWidget,
            const SizedBox(height: 15),
            _emailFieldWidget,
            const SizedBox(height: 15),
            _sendEmailButtonWidget,
            const SizedBox(height: 15),
            _canNotResetPasswordTextButtonWidget,
            const SizedBox(height: 25),
            Row(
              children: [
                _dividerWidget,
                Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: _orTextWidget),
                _dividerWidget,
              ],
            ),
            const SizedBox(height: 15),
            _signUpTextButtonWidget,
            const SizedBox(height: 80),
          ],
        ),
      ),
      SignInButtonWidgetResetPasswordPage(borderRadiusValue: _resetCardBorderRadiusValue),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(height: 30, child: _logoButtonWidget),
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        shape: const Border(bottom: BorderSide(color: Color.fromRGBO(51, 51, 51, 1))),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 45),
              Container(
                margin: const EdgeInsets.all(10),
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF282828)),
                  borderRadius: BorderRadius.circular(_resetCardBorderRadiusValue),
                ),
                child: _resetPasswordComplexWidget,
              ),
              const SizedBox(height: 55),
              _footerWidget,
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
