import 'package:flutter/material.dart';
import 'package:instagram_app/view/_share/widget/navigation_bar_share_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: NavigationBarShareWidget(),
      ),
    );
  }
}
