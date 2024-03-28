import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/_lib/asset/image_asset.dart';
import 'package:instagram_app/_lib/custom_widget/profile_image_story_custom_widget.dart';
import 'package:instagram_app/_lib/custom_widget/text_button_blinking_custom_widget.dart';
import 'package:instagram_app/utility/count_to_string.dart';

class ShowSearchMenuOverlayEntryWidgetNavigationBarShareWidget extends StatefulWidget {
  final AnimationController animationController;
  final double leftSpace;

  const ShowSearchMenuOverlayEntryWidgetNavigationBarShareWidget({super.key, required this.animationController, required this.leftSpace});

  @override
  State<ShowSearchMenuOverlayEntryWidgetNavigationBarShareWidget> createState() => _ShowSearchMenuOverlayEntryWidgetNavigationBarShareWidgetState();
}

class _ShowSearchMenuOverlayEntryWidgetNavigationBarShareWidgetState extends State<ShowSearchMenuOverlayEntryWidgetNavigationBarShareWidget> {
  //data
  final List<({String type, ({String url, bool hasStory, bool seenStory})? image, String username, String displayName, bool isFollow, ({bool isOfficial, int followCount})? official})> _lastDataList = [
    (type: '', image: (url: ImageAsset.defaultProfile, hasStory: false, seenStory: false), username: 'username', displayName: 'displayName', isFollow: true, official: (isOfficial: true, followCount: 12345678)),
  ];
  List<({String type, ({String url, bool hasStory, bool seenStory})? image, String username, String displayName, bool isFollow, ({bool isOfficial, int followCount})? official})> _dataList = [];

  //controller
  late NavigatorState _navigatorState;
  final _searchController = TextEditingController();
  bool _isLoading = false;
  bool _showClearAllDialog = false;

  //widget property
  final _cardWidth = 400.0;
  final _borderColor = const Color.fromRGBO(38, 38, 38, 1);

  //basic widget
  Future<bool> showClearAllDialog() async {
    if(_showClearAllDialog) return false;
    _showClearAllDialog = true;
    bool isClear = false;
    await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black54,
      pageBuilder: (BuildContext buildContext, Animation<double> animation1, Animation<double> animation2) {
        //widget property
        const bgColor = Color.fromRGBO(38, 38, 38, 1);
        const borderRadius = BorderRadius.all(Radius.circular(15));
        const textColor = Color.fromRGBO(245, 245, 245, 1);
        const buttonWidth = 55.0;
        final buttonStyle = ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) => Colors.transparent),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) => states.contains(MaterialState.pressed) ? const Color.fromRGBO(34, 34, 34, 1) : bgColor),
          minimumSize: MaterialStateProperty.resolveWith<Size>((Set<MaterialState> states) => const Size(double.infinity, buttonWidth)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        );

        //basic widget
        const titleWidget = Text(
          'ต้องการล้างประวัติการค้นหาใช่ไหม',
          style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
        );
        const detailWidget = Text(
          'คุณจะไม่สามารถยกเลิกการดำเนินการนี้ได้ หากคุณล้างประวัติการค้นหาของคุณ บัญชีที่คุณเคยค้นหาแล้วอาจจะยังแสดงให้คุณเห็นเป็นผลลัพธ์ที่แนะนำ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(168, 168, 168, 1),
            fontSize: 12,
          ),
        );
        const dividerWidget = Divider(
          height: 0,
          thickness: 1,
          color: Color.fromRGBO(54, 54, 54, 1),
        );
        final clearButtonWidget = TextButton(
          style: buttonStyle,
          onPressed: () {
            isClear = true;
            _navigatorState.maybePop();
          },
          child: const Text(
            'Clear all',
            style: TextStyle(
              color: Color.fromRGBO(237, 73, 86, 1),
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
        final cancelButtonWidget = TextButton(
          style: buttonStyle,
          onPressed: () => _navigatorState.maybePop(),
          child: const Text('ไม่ใช่ตอนนี้', style: TextStyle(color: textColor, fontSize: 17)),
        );

        return Center(
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Material(
              borderRadius: borderRadius,
              child: Container(
                width: 400,
                color: bgColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    titleWidget,
                    const SizedBox(height: 8),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 40), child: detailWidget),
                    const SizedBox(height: 20),
                    dividerWidget,
                    clearButtonWidget,
                    dividerWidget,
                    cancelButtonWidget,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    _showClearAllDialog = false;
    return isClear;
  }

  final _titleWidget = const Text('ค้นหา', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
  final _noSearchDataWidget = const Text(
    'ไม่มีการค้นหาล่าสุด',
    style: TextStyle(color: Color.fromRGBO(168, 168, 168, 1), fontSize: 15, fontWeight: FontWeight.bold),
  );
  final _lastDataTitleWidget = const Text('ล่าสุด', style: TextStyle(fontSize: 16, color: Color.fromRGBO(245, 245, 245, 1), fontWeight: FontWeight.bold));
  late final _clearLastDataButtonWidget = TextButtonBlinkingCustomWidget(
    text: 'ล้างทั้งหมด',
    textColor: const Color.fromRGBO(0, 149, 246, 1),
    textHoverColor: const Color.fromRGBO(224, 241, 255, 1),
    textClickColor: const Color.fromRGBO(112, 121, 128, 1),
    onTap: () async {
      if (!await showClearAllDialog()) return;
      _lastDataList.clear();
      setState(() {});
    },
  );
  late final _loadingWidget = Center(
    child: SizedBox(
      width: _cardWidth / 4,
      height: _cardWidth / 4,
      child: const CircularProgressIndicator(strokeWidth: 1, color: Colors.white),
    ),
  );
  final _notFoundDataWidget = const Text(
    'ไม่พบผลลัพธ์ใดเลย',
    style: TextStyle(color: Color.fromRGBO(168, 168, 168, 1), fontSize: 12, fontWeight: FontWeight.bold),
  );
  late final _spaceWidget = Expanded(child: GestureDetector(onTap: widget.animationController.reverse));
  late final searchFieldWidget = _SearchFieldWidget(
    controller: _searchController,
    onChange: (value) async {
      if (_isLoading) return;
      if (context.mounted) setState(() => _isLoading = true);
      List<({String displayName, ({bool hasStory, bool seenStory, String url})? image, bool isFollow, ({int followCount, bool isOfficial})? official, String type, String username})> newData = [];
      await Future.delayed(const Duration(seconds: 1), () {
        print(value);
        newData = [
          (type: '', image: (url: ImageAsset.defaultProfile, hasStory: false, seenStory: false), username: 'username1', displayName: 'displayName', isFollow: true, official: (isOfficial: true, followCount: 12345678)),
          (type: '', image: (url: ImageAsset.defaultProfile, hasStory: false, seenStory: false), username: 'username2', displayName: 'displayName', isFollow: false, official: (isOfficial: true, followCount: 123456)),
          (type: '', image: (url: ImageAsset.defaultProfile, hasStory: true, seenStory: false), username: 'username3', displayName: 'displayName', isFollow: false, official: (isOfficial: true, followCount: 12345)),
          (type: '', image: (url: ImageAsset.defaultProfile, hasStory: true, seenStory: true), username: 'username4', displayName: 'displayName', isFollow: false, official: (isOfficial: true, followCount: 1234567)),
          (type: '', image: (url: ImageAsset.defaultProfile, hasStory: true, seenStory: true), username: 'username5', displayName: 'displayName', isFollow: false, official: (isOfficial: true, followCount: 12345678)),
          (type: '', image: (url: ImageAsset.defaultProfile, hasStory: true, seenStory: true), username: 'username6', displayName: 'displayName', isFollow: false, official: (isOfficial: true, followCount: 123456789)),
          (type: '', image: (url: ImageAsset.defaultProfile, hasStory: true, seenStory: true), username: 'username7', displayName: 'displayName', isFollow: false, official: (isOfficial: true, followCount: 1234567890)),
          (type: '', image: (url: ImageAsset.defaultProfile, hasStory: true, seenStory: true), username: 'username8', displayName: 'displayName', isFollow: false, official: (isOfficial: true, followCount: 12345678900000)),
        ];
      });
      if (_searchController.text.isNotEmpty) _dataList = newData;
      if (_isLoading && context.mounted) setState(() => _isLoading = false);
    },
    onClear: () {
      _dataList = [];
      setState(() {});
    },
  );

  @override
  void initState() {
    super.initState();
    widget.animationController.addStatusListener((status) {
      if (widget.animationController.isDismissed) {
        if (_searchController.text.isNotEmpty || _dataList.isNotEmpty || _isLoading) {
          setState(() {
            _searchController.clear();
            _dataList = [];
            _isLoading = false;
          });
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    _navigatorState = Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (_showClearAllDialog) _navigatorState.maybePop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        final animationValue = Curves.easeOut.transform(widget.animationController.value);
        return FractionalTranslation(
          translation: Offset(2 * (animationValue * widget.leftSpace - widget.leftSpace) / widget.leftSpace, 0),
          child: child != null && widget.animationController.isCompleted ? Row(children: [child, _spaceWidget]) : child,
        );
      },
      animation: widget.animationController,
      child: Container(
        width: _cardWidth,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 1),
          border: Border(right: BorderSide(color: _borderColor, width: 1)),
          borderRadius: const BorderRadius.horizontal(right: Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Padding(padding: const EdgeInsets.only(left: 25.0), child: _titleWidget),
            const SizedBox(height: 35),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 17), child: searchFieldWidget),
            if (_searchController.text.isEmpty || _isLoading || _dataList.isEmpty) ...[const SizedBox(height: 25), Divider(color: _borderColor, thickness: 1, height: 0)],
            Expanded(
              //_clearLastDataButtonWidget
              child: _searchController.text.isEmpty
                  ? _lastDataList.isEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            Padding(padding: const EdgeInsets.only(left: 20), child: _lastDataTitleWidget),
                            const SizedBox(height: 15),
                            Expanded(child: Center(child: _noSearchDataWidget)),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _lastDataTitleWidget,
                                  _clearLastDataButtonWidget,
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Expanded(
                              child: ListView.builder(
                                itemCount: _lastDataList.length,
                                itemBuilder: (context, index) => _UserCard(
                                  key: ObjectKey(_lastDataList[index]),
                                  data: _lastDataList[index],
                                  onRemove: () {
                                    _lastDataList.removeAt(index);
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
                  : _isLoading
                      ? Padding(padding: const EdgeInsets.only(top: 30), child: _loadingWidget)
                      : _dataList.isEmpty
                          ? Center(child: _notFoundDataWidget)
                          : ListView.builder(
                              padding: const EdgeInsets.only(top: 10),
                              itemCount: _dataList.length,
                              itemBuilder: (context, index) => _UserCard(
                                data: _dataList[index],
                                onClick: () {
                                  final targetData = _dataList[index];
                                  bool isContain = false;
                                  for (final data in _lastDataList) {
                                    if (targetData.username != data.username) continue;
                                    isContain = true;
                                    break;
                                  }
                                  if (!isContain) _lastDataList.add(targetData);
                                },
                              ),
                            ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(String value) onChange;
  final Function() onClear;

  const _SearchFieldWidget({required this.controller, required this.onChange, required this.onClear});

  @override
  State<_SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<_SearchFieldWidget> {
  //controller
  final _focusNode = FocusNode();
  DateTime _lastTypeAt = DateTime.now();
  bool _isLoading = false;
  bool _isRemovePrefixIcon = false;

  Future<bool> _isTyping() async {
    final now = _lastTypeAt;
    await Future.delayed(const Duration(milliseconds: 500)); //delay to check typing
    return !now.isAtSameMomentAs(_lastTypeAt);
  }

  bool _removePrefixIcon() {
    if (_isLoading) return false;
    if (_isRemovePrefixIcon && _focusNode.hasFocus) return false;
    _isRemovePrefixIcon = !_isRemovePrefixIcon;
    return true;
  }

  Future _onChange(String value) async {
    if (value.isEmpty) return widget.onClear();
    if (_isLoading || await _isTyping()) return;
    if (mounted) setState(() => _isLoading = true);
    await widget.onChange(value);
    if (mounted) setState(() => _isLoading = false);
  }

  Future _clearText() async {
    widget.controller.clear();
    _onChange(widget.controller.text);
  }

  //widget property
  final _suffixSize = 14.0;
  final _suffixColor = const Color.fromRGBO(199, 199, 199, 1);
  final _borderRadius = OutlineInputBorder(borderRadius: BorderRadius.circular(8));

  //basic widget
  final _prefixIconWidget = const Icon(
    Icons.search_outlined,
    color: Color.fromRGBO(142, 142, 142, 1),
    size: 20,
  );
  late final _searchLoadingWidget = SizedBox(
    width: _suffixSize,
    height: _suffixSize,
    child: CircularProgressIndicator(strokeWidth: 1, color: _suffixColor),
  );
  late final _clearButtonWidget = InkWell(
    onTap: _clearText,
    child: Icon(FontAwesomeIcons.solidCircleXmark, size: _suffixSize, color: _suffixColor),
  );

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      _lastTypeAt = DateTime.now();
      if (_removePrefixIcon() && mounted) setState(() {});
    });
    _focusNode.requestFocus();
    _focusNode.addListener(() {
      if (_removePrefixIcon()) setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //basic widget
    final suffixWidget = _isLoading ? _searchLoadingWidget : _clearButtonWidget;

    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      onChanged: _onChange,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color.fromRGBO(38, 38, 38, 1),
        suffix: suffixWidget,
        prefixIcon: _isRemovePrefixIcon ? null : _prefixIconWidget,
        hintText: 'ค้นหา',
        hintStyle: const TextStyle(color: Color.fromRGBO(168, 168, 168, 1), fontSize: 17),
        contentPadding: const EdgeInsets.only(top: 23, left: 15, right: 15),
        border: _borderRadius,
        enabledBorder: _borderRadius,
        focusedBorder: _borderRadius,
      ),
    );
  }
}

class _UserCard extends StatefulWidget {
  final ({String type, ({String url, bool hasStory, bool seenStory})? image, String username, String displayName, bool isFollow, ({bool isOfficial, int followCount})? official}) data;
  final Function()? onClick;
  final Function()? onRemove;

  const _UserCard({super.key, required this.data, this.onClick, this.onRemove});

  @override
  State<_UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<_UserCard> {
  //controller
  late final _hasImage = widget.data.image != null;
  late final _hasOfficial = widget.data.official != null;
  bool _isEnter = false;
  bool? _isTapping = false;
  bool _isLoading = false;

  Future _setTapping(bool? isTap) async {
    if (_isTapping == null) return;
    if (isTap == null) {
      //on click
      if (_isTapping != true) {
        setState(() => _isTapping = true);
      }
      _isTapping = null;
      await Future.delayed(const Duration(milliseconds: 100)); //for smooth animation
      setState(() => _isTapping = false);
    } else {
      //on tap up/down/cancel
      if (isTap == _isTapping) return;
      setState(() => _isTapping = isTap);
    }
  }

  Future _onClick({bool isClickImageProfileButton = false}) async {
    if (_isLoading) return;
    _isLoading = true;
    _setTapping(null);
    await widget.onClick?.call();
    if (_hasImage) {
      if (isClickImageProfileButton && widget.data.image!.hasStory) {
        print('open story');
      } else {
        print('open profile');
      }
    }

    _isLoading = false;
  }

  //widget property
  final _cardColor = const Color.fromRGBO(0, 0, 0, 1);
  final _cardEnterColor = const Color.fromRGBO(26, 26, 26, 1);
  final _cardClickColor = const Color.fromRGBO(210, 210, 210, 1);

  //basic widget
  late final _profileWidget = ProfileImageStoryCustomWidget(
    size: 45,
    hasStory: widget.data.image!.hasStory,
    seenStory: widget.data.image!.seenStory,
    image: widget.data.image!.url,
  );
  late final _usernameWidget = Text(
    widget.data.username,
    style: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color.fromRGBO(246, 246, 246, 1),
    ),
  );
  late final _displayNameWidget = widget.data.isFollow || (widget.data.official != null && widget.data.official!.isOfficial)
      ? Text.rich(
          TextSpan(
            children: [
              TextSpan(text: widget.data.displayName, style: const TextStyle(fontSize: 16)),
              TextSpan(text: ' • ${widget.data.isFollow ? 'กำลังติดตาม' : '${CountToString.followCount(widget.data.official!.followCount)} คน'}', style: const TextStyle(fontSize: 14)),
            ],
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color.fromRGBO(177, 177, 177, 1)),
        )
      : Text(
          widget.data.displayName,
          style: const TextStyle(fontSize: 16, color: Color.fromRGBO(177, 177, 177, 1)),
        );
  final _officialIconWidget = const Icon(
    Icons.check_circle,
    size: 12,
    color: Color.fromRGBO(26, 160, 247, 1),
  );
  late final _imageProfileButtonWidget = InkWell(
    onTap: () => _onClick(isClickImageProfileButton: true),
    child: _profileWidget,
  );
  late final _removeIconButtonWidget = GestureDetector(
    onTap: widget.onRemove,
    child: const Icon(
      FontAwesomeIcons.xmark,
      color: Color.fromRGBO(168, 168, 168, 1),
      size: 21,
    ),
  );

  @override
  Widget build(BuildContext context) {
    //widget property
    final color = _isEnter ? _cardEnterColor : _cardColor;
    final filterColor = (_isTapping ?? true) ? _cardClickColor : Colors.transparent;

    return PopupMenuItem(
      value: widget.data.username,
      padding: EdgeInsets.zero,
      height: 0,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(filterColor, BlendMode.modulate),
        child: GestureDetector(
          onTap: _onClick,
          onTapDown: (tapUpDetails) => _setTapping(true),
          onTapUp: (tapUpDetails) => _setTapping(false),
          onTapCancel: () => _setTapping(false),
          child: MouseRegion(
            onEnter: (_) => setState(() => _isEnter = true),
            onExit: (_) => setState(() => _isEnter = false),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 65,
              color: color,
              child: Stack(
                children: [
                  if (widget.onRemove != null) Align(alignment: Alignment.centerRight, child: _removeIconButtonWidget),
                  Row(
                    children: [
                      _imageProfileButtonWidget,
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _hasOfficial && widget.data.official!.isOfficial
                              ? Row(
                                  children: [
                                    _usernameWidget,
                                    const SizedBox(width: 5),
                                    _officialIconWidget,
                                  ],
                                )
                              : _usernameWidget,
                          _displayNameWidget,
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
