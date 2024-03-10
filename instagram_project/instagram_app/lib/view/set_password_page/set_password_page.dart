import 'package:flutter/material.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/button_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/field_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({super.key});

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  //basic widget
  final _logoButtonWidget = InkWell(
    onTap: () {},
    child: const ImageCustomWidget(image: ImageAsset.logo, imageColor: Colors.white),
  );
  final _titleTextWidget = const Text(
    'สร้างรหัสผ่านที่คาดเดายาก',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  );
  final _detailTextWidget = const Text(
    'รหัสผ่านของคุณต้องมีความยาวอย่างน้อย 6 อักขระและควรมีทั้งตัวเลข ตัวอักษร และอักขระพิเศษ (!\$@%)',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Color.fromRGBO(121, 121, 121, 1),
      fontSize: 13,
      height: 1.4,
    ),
  );
  final _passwordFieldWidget = FieldCustomWidget(
    onChange: (value) {},
    hintText: 'รหัสผ่านใหม่',
    useObscured: true,
    hintStyle: const TextStyle(color: Color.fromRGBO(151, 158, 167, 1), fontSize: 12),
    borderRadius: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2.5),
      borderSide: const BorderSide(color: Color.fromRGBO(51, 51, 51, 1)),
    ),
  );
  final _confirmPasswordFieldWidget = FieldCustomWidget(
    onChange: (value) {},
    hintText: 'ป้อนรหัสผ่านใหม่อีกครั้ง',
    useObscured: true,
    hintStyle: const TextStyle(color: Color.fromRGBO(151, 158, 167, 1), fontSize: 12),
    borderRadius: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2.5),
      borderSide: const BorderSide(color: Color.fromRGBO(51, 51, 51, 1)),
    ),
  );
  final _resetPasswordButtonWidget = ButtonCustomWidget(
    onClick: () {},
    text: 'รีเซ็ตรหัสผ่าน',
    padding: const EdgeInsets.symmetric(vertical: 20),
  );

  //complex widget
  late final _setPasswordComplexWidget = Column(
    children: [
      Column(
        children: [
          const SizedBox(height: 80),
          _titleTextWidget,
          const SizedBox(height: 10),
          _detailTextWidget,
          const SizedBox(height: 40),
          _passwordFieldWidget,
          const SizedBox(height: 25),
          _confirmPasswordFieldWidget,
          const SizedBox(height: 50),
          _resetPasswordButtonWidget,
          const SizedBox(height: 60),
        ],
      ),
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  width: 370,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF282828)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: _setPasswordComplexWidget,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
