import 'package:flutter/material.dart';

class MenuWidgetNavigationBarShareWidget extends StatefulWidget {
  final bool isSelected;
  final bool showText;
  final bool hasSplash;
  final ({String? tooltip, String? text, IconData unselectedIcon, IconData selectedIcon}) menu;
  final bool protectLoading;
  final Function(bool isLoading)? onClick;
  final Function(BuildContext? context)? showDialog;
  final Function(bool isLoading)? onDispose;
  final Widget? child;

  const MenuWidgetNavigationBarShareWidget({
    super.key,
    this.isSelected = false,
    this.showText = false,
    this.hasSplash = false,
    required this.menu,
    this.protectLoading = true,
    this.onClick,
    this.showDialog,
    this.onDispose,
    this.child,
  });

  @override
  State<MenuWidgetNavigationBarShareWidget> createState() => _MenuWidgetNavigationBarShareWidgetState();
}

class _MenuWidgetNavigationBarShareWidgetState extends State<MenuWidgetNavigationBarShareWidget> {
  //controller
  late NavigatorState _navigatorState;
  late final _hasDialog = widget.showDialog != null;
  bool _isEnter = false;
  bool? _isTapping = false;
  bool _isLoading = false;

  Future _setTapping(bool? isTapping) async {
    if (_isTapping == null) return;
    if (isTapping == null) {
      //on click
      if (_isTapping != true) {
        setState(() => _isTapping = true);
      }
      _isTapping = null;
      await Future.delayed(const Duration(milliseconds: 100)); //for smooth animation
      setState(() => _isTapping = false);
    } else {
      //on tap up/down/cancel
      if (isTapping == _isTapping) return;
      setState(() => _isTapping = isTapping);
    }
  }

  Future _onClick() async {
    if (widget.protectLoading && _isLoading) return;
    _setTapping(null);
    _isLoading = true;
    await widget.onClick?.call(_isLoading);
    if (_hasDialog) await widget.showDialog!.call(context.mounted ? context : null);
    _isLoading = false;
  }

  //widget
  Widget iconBuilderWidget({required Widget child, required Color color}) {
    if (!widget.showText || widget.menu.text == null) return child;
    return SizedBox(
      width: 200,
      child: Row(
        children: [
          child,
          const SizedBox(width: 15),
          Text(
            widget.menu.text!,
            style: TextStyle(
              color: color,
              fontSize: 17,
              fontWeight: widget.isSelected ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    if (_hasDialog) _navigatorState = Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (_hasDialog && _isLoading && _navigatorState.mounted) _navigatorState.maybePop();
    widget.onDispose?.call(_isLoading);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //widget property
    final color = (_isTapping ?? true) ? Colors.white.withOpacity(0.5) : Colors.white;
    final scale = (_isTapping ?? true) ? 0.9 : (_isEnter ? 1.1 : 1.0);

    return MouseRegion(
      onEnter: (_) => setState(() => _isEnter = true),
      onExit: (_) => setState(() => _isEnter = false),
      child: GestureDetector(
        onTapDown: (tapUpDetails) => _setTapping(true),
        onTapUp: (tapUpDetails) => _setTapping(false),
        onTapCancel: () => _setTapping(false),
        child: IconButton(
          hoverColor: widget.hasSplash ? null : Colors.transparent,
          highlightColor: widget.hasSplash ? null : Colors.transparent,
          onPressed: _onClick,
          tooltip: widget.menu.tooltip,
          icon: iconBuilderWidget(
            child: Transform.scale(
              scale: scale,
              child: widget.child ?? Icon(widget.isSelected ? widget.menu.selectedIcon : widget.menu.unselectedIcon),
            ),
            color: color,
          ),
          color: color,
          iconSize: 25,
          padding: const EdgeInsets.all(10),
          style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
        ),
      ),
    );
  }
}
