import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/image_custom_widget.dart';

class ExampleAppImageWidgetSignInPage extends StatefulWidget {
  const ExampleAppImageWidgetSignInPage({super.key});

  @override
  State<ExampleAppImageWidgetSignInPage> createState() => _ExampleAppImageWidgetSignInPageState();
}

class _ExampleAppImageWidgetSignInPageState extends State<ExampleAppImageWidgetSignInPage> {
  //data
  final _phoneScreenList = [
    ImageAsset.signInPage.screenshot1,
    ImageAsset.signInPage.screenshot2,
    ImageAsset.signInPage.screenshot3,
    ImageAsset.signInPage.screenshot4,
  ];

  //controller
  late final Timer _timer;
  int _currentPhoneScreenIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
        const Duration(seconds: 5), (timer) => setState(() => _currentPhoneScreenIndex = (_currentPhoneScreenIndex + 1) % _phoneScreenList.length));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(width: 395, child: ImageCustomWidget(image: ImageAsset.signInPage.phone)),
        Positioned(
          top: 27.5,
          right: 16.5,
          child: SizedBox(
            width: 263,
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: ImageCustomWidget(
                key: ValueKey(_currentPhoneScreenIndex),
                image: _phoneScreenList[_currentPhoneScreenIndex],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
