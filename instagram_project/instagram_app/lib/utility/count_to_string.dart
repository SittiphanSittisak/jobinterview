class CountToString {
  static const _trillion = 1000000000000;
  static const _billion = 1000000000;
  static const _million = 1000000;
  static const _thousand = 1000;

  static String _getDecimalWithLength({required int value, required int digit, required int maximumDecimal}) {
    final result = value / digit;
    int decimalLength = maximumDecimal - (value ~/ digit).toString().length + 1;
    if (decimalLength.isNegative) decimalLength = 0;
    return result.toStringAsFixed(decimalLength);
  }

  static String followCount(int value, {int maximumDecimal = 2}) {
    if (value >= _trillion) return '${_getDecimalWithLength(value: value, digit: _trillion, maximumDecimal: maximumDecimal)} ล้านล้าน';
    if (value >= _billion) return '${_getDecimalWithLength(value: value, digit: _billion, maximumDecimal: maximumDecimal)} พันล้าน';
    if (value >= _million) return '${_getDecimalWithLength(value: value, digit: _million, maximumDecimal: maximumDecimal)} ล้าน';
    if (value >= _thousand) return '${_getDecimalWithLength(value: value, digit: _thousand, maximumDecimal: maximumDecimal)}K';
    return value.toString();
  }
}
