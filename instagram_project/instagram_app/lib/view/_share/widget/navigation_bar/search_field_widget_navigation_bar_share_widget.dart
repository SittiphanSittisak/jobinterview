import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/_lib/custom_widget/profile_image_story_custom_widget.dart';

class SearchFieldWidgetNavigationBarShareWidget extends StatefulWidget {
  final List<({String imageUrl, String username, String displayName, bool hasStory, bool seenStory, bool isOfficial, bool isFollow})>? value;
  final void Function(String)? onChange;
  final Future<List<({String imageUrl, String username, String displayName, bool hasStory, bool seenStory, bool isOfficial, bool isFollow})>> Function(String)? onLoadDropdownItem;
  final Widget? prefixIcon;
  final String? hintText;
  final bool readOnly;
  final bool haveClearButton;
  final bool autoSwitchHintToLabel;
  final bool autoRemovePrefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final InputBorder? borderRadius;

  const SearchFieldWidgetNavigationBarShareWidget({
    super.key,
    this.value,
    required this.onChange,
    this.onLoadDropdownItem,
    this.prefixIcon,
    this.hintText,
    this.readOnly = false,
    this.haveClearButton = false,
    this.autoSwitchHintToLabel = false,
    this.autoRemovePrefixIcon = false,
    this.contentPadding = const EdgeInsets.only(top: 23, left: 15, right: 15),
    this.hintStyle,
    this.borderRadius,
  });

  @override
  State<SearchFieldWidgetNavigationBarShareWidget> createState() => _SearchFieldWidgetNavigationBarShareWidgetState();
}

class _SearchFieldWidgetNavigationBarShareWidgetState extends State<SearchFieldWidgetNavigationBarShareWidget> {
  //data
  DateTime _lastTypeAt = DateTime.now();
  late List<({String imageUrl, String username, String displayName, bool hasStory, bool seenStory, bool isOfficial, bool isFollow})> _lastData = widget.value ?? [];

  //controller
  late NavigatorState _navigatorState;
  late final _controller = TextEditingController();
  late final _focusNode = FocusNode();
  bool _isDispose = false;
  bool _isDropdownItemLoading = false;
  bool _isDropdownItemShow = false;
  bool _isSwitchHintToLabel = false;
  bool _isRemovePrefixIcon = false;

  Future _clearText() async {
    _controller.clear();
    _onChange(_controller.text, isLoadDropdownItem: true);
  }

  bool _switchHintToLabel(String value) {
    if (!widget.autoSwitchHintToLabel) return false;
    if (_isSwitchHintToLabel == value.isNotEmpty) return false;
    _isSwitchHintToLabel = value.isNotEmpty;
    return true;
  }

  bool _removePrefixIcon() {
    if (!widget.autoRemovePrefixIcon) return false;
    if (_isRemovePrefixIcon == _focusNode.hasFocus) return false;
    if (_isRemovePrefixIcon && _controller.text.isNotEmpty) return false;
    if (_isDropdownItemShow) return false;
    _isRemovePrefixIcon = !_isRemovePrefixIcon;
    return true;
  }

  Future _showPopupMenu() async {
    if (_isDropdownItemShow || _lastData.isEmpty) return;
    _isDropdownItemShow = true;

    //widget property
    final textFieldRenderBox = context.findRenderObject() as RenderBox;
    final textFieldOffset = textFieldRenderBox.localToGlobal(Offset.zero);
    const cardWidth = 375.0;
    const cardColor = Color.fromRGBO(38, 38, 38, 1);
    const cardEnterColor = Color.fromRGBO(60, 60, 60, 1);
    const cardClickColor = Color.fromRGBO(210, 210, 210, 1);

    //basic widget
    final popupMenuItemWidgetList = _lastData.map((e) {
      //controller
      bool isEnter = false;
      bool? isTapping = false;
      bool isLoading = false;

      //basic widget
      late final profileWidget = ProfileImageStoryCustomWidget(
        image: e.imageUrl,
        size: 45,
        hasStory: e.hasStory,
        seenStory: e.seenStory,
      );
      late final usernameWidget = Text(
        e.username,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(246, 246, 246, 1),
        ),
      );
      late final displayNameWidget = e.isFollow
          ? Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: e.displayName, style: const TextStyle(fontSize: 16)),
                  const TextSpan(text: ' • กำลังติดตาม', style: TextStyle(fontSize: 14)),
                ],
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color.fromRGBO(177, 177, 177, 1)),
            )
          : Text(
              e.displayName,
              style: const TextStyle(fontSize: 16, color: Color.fromRGBO(177, 177, 177, 1)),
            );
      const officialIconWidget = Icon(
        Icons.check_circle,
        size: 12,
        color: Color.fromRGBO(26, 160, 247, 1),
      );

      return PopupMenuItem(
        value: e.username,
        padding: EdgeInsets.zero,
        height: 0,
        child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          Future setTapping(bool? isTap) async {
            if (isTapping == null) return;
            if (isTap == null) {
              //on click
              if (isTapping != true) {
                setState(() => isTapping = true);
              }
              isTapping = null;
              await Future.delayed(const Duration(milliseconds: 100)); //for smooth animation
              setState(() => isTapping = false);
            } else {
              //on tap up/down/cancel
              if (isTap == isTapping) return;
              setState(() => isTapping = isTap);
            }
          }

          Future onClick({bool isClickImageProfileButton = false}) async {
            if (isLoading) return;
            isLoading = true;
            setTapping(null);
            if (isClickImageProfileButton && e.hasStory) {
              print('open story');
            } else {
              print('open profile');
            }

            isLoading = false;
          }

          //widget property
          final color = isEnter ? cardEnterColor : cardColor;
          final filterColor = (isTapping ?? true) ? cardClickColor : Colors.transparent;

          //basic widget
          final imageProfileButtonWidget = InkWell(
            onTap: () => onClick(isClickImageProfileButton: true),
            child: profileWidget,
          );

          return ColorFiltered(
            colorFilter: ColorFilter.mode(filterColor, BlendMode.modulate),
            child: GestureDetector(
              onTap: onClick,
              onTapDown: (tapUpDetails) => setTapping(true),
              onTapUp: (tapUpDetails) => setTapping(false),
              onTapCancel: () => setTapping(false),
              child: MouseRegion(
                onEnter: (_) => setState(() => isEnter = true),
                onExit: (_) => setState(() => isEnter = false),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  width: cardWidth,
                  height: 65,
                  color: color,
                  child: Row(
                    children: [
                      imageProfileButtonWidget,
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          e.isOfficial
                              ? Row(
                                  children: [
                                    usernameWidget,
                                    const SizedBox(width: 5),
                                    officialIconWidget,
                                  ],
                                )
                              : usernameWidget,
                          displayNameWidget,
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      );
    }).toList();

    //make user can type after display the dialog
    Future.delayed(Duration.zero, () async {
      for (int i = 0; i < 10; i++) {
        if (_focusNode.hasFocus) await Future.delayed(Duration.zero);
        if (_focusNode.hasFocus) continue; //make sure that the showMenu UI building is already finished. if this is finished, the _focusNode.hasFocus will be false by this dialog effect.
        final selection = _controller.selection;
        _focusNode.requestFocus();
        Future.delayed(Duration.zero, () => _controller.selection = selection);
        break;
      }
    });
    await showMenu(
      items: popupMenuItemWidgetList,
      context: context,
      position: RelativeRect.fromLTRB(
        textFieldOffset.dx,
        textFieldOffset.dy + textFieldRenderBox.size.height + 10,
        textFieldOffset.dx + textFieldRenderBox.size.width,
        textFieldOffset.dy + textFieldRenderBox.size.height + 10,
      ),
      constraints: const BoxConstraints(maxWidth: cardWidth),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: cardColor,
      surfaceTintColor: cardColor,
    );
    if (!_isDropdownItemShow || _isDispose) return;
    await Future.delayed(Duration.zero, () => _isDropdownItemShow = false); //protect auto open dialog from listener.
    if (_removePrefixIcon()) setState(() {});
  }

  Future _onLoadDropdownItem(String value) async {
    if (widget.onLoadDropdownItem == null) return;
    if (_isDropdownItemShow) {
      _isDropdownItemShow = false;
      Navigator.of(context).pop();
    }
    final now = _lastTypeAt;
    await Future.delayed(const Duration(milliseconds: 500));
    if (!now.isAtSameMomentAs(_lastTypeAt)) return;

    if (_isDropdownItemLoading) return;
    setState(() => _isDropdownItemLoading = true);
    _lastData = await widget.onLoadDropdownItem!(value);
    _showPopupMenu();
    setState(() => _isDropdownItemLoading = false);
  }

  Future _onChange(String value, {bool isLoadDropdownItem = false}) async {
    _lastTypeAt = DateTime.now();
    widget.onChange?.call(value);
    if (!isLoadDropdownItem) _onLoadDropdownItem(value);
    if (_switchHintToLabel(value)) setState(() {});
    if (_removePrefixIcon()) setState(() {});
  }

  //widget property
  final suffixSize = 14.0;
  final suffixColor = const Color.fromRGBO(199, 199, 199, 1);

  //basic widget
  late final _clearButtonWidget = InkWell(
    onTap: _clearText,
    child: Icon(FontAwesomeIcons.solidCircleXmark, size: suffixSize, color: suffixColor),
  );

  late final _dropdownItemLoadingWidget = SizedBox(width: suffixSize, height: suffixSize, child: CircularProgressIndicator(strokeWidth: 1, color: suffixColor));

  @override
  void didChangeDependencies() {
    _navigatorState = Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_removePrefixIcon()) setState(() {});
      if (_focusNode.hasFocus) _showPopupMenu();
    });
  }

  @override
  void dispose() {
    _isDispose = true;
    if (_isDropdownItemShow && _navigatorState.mounted) _navigatorState.maybePop();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //widget property
    final floatingLabelBehavior = _isSwitchHintToLabel ? FloatingLabelBehavior.always : FloatingLabelBehavior.never;

    //basic widget
    final suffixWidget = _isDropdownItemLoading && widget.onLoadDropdownItem != null ? _dropdownItemLoadingWidget : (widget.haveClearButton ? _clearButtonWidget : null);

    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: _onChange,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color(0xFF1F1F1F),
        suffix: suffixWidget,
        prefixIcon: _isRemovePrefixIcon ? null : widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        labelText: _isSwitchHintToLabel ? widget.hintText : null,
        labelStyle: _isSwitchHintToLabel ? widget.hintStyle : null,
        floatingLabelBehavior: floatingLabelBehavior,
        contentPadding: widget.contentPadding,
        border: widget.borderRadius,
        enabledBorder: widget.borderRadius,
        focusedBorder: widget.borderRadius,
      ),
    );
  }
}
