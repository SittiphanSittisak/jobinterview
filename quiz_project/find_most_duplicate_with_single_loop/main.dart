void main() {
  final input = [1, 2, 'a', 3, 'b', null, null, null, 4, 'a', 5, 1, 'b', 2, 'a', 3, 4, 2, 1, 5]; //You can change this!
  if (input.isEmpty) return print('Warning: Invalid input!');

  final mostDuplicate = getMostDuplicate(input);

  showResult(input: input, mostDuplicate: mostDuplicate);
}

({int mostDuplicateCount, List mostDuplicateList}) getMostDuplicate(List input) {
  final duplicateCountMap = <dynamic, int>{};
  int mostDuplicateCount = 0;
  final mostDuplicateList = [];

  for (final item in input) {
    final duplicateCount = (duplicateCountMap[item] ?? 0) + 1;
    duplicateCountMap[item] = duplicateCount;

    if (mostDuplicateCount > duplicateCount) continue;
    if (mostDuplicateCount < duplicateCount) mostDuplicateList.clear();
    mostDuplicateCount = duplicateCount;
    mostDuplicateList.add(item);
  }

  return (mostDuplicateCount: mostDuplicateCount, mostDuplicateList: mostDuplicateList);
}

void showResult({required input, required ({int mostDuplicateCount, List mostDuplicateList}) mostDuplicate}) {
  print('input: $input');
  print('output:');
  print('Duplicate count: ${mostDuplicate.mostDuplicateCount}');
  print('Duplicate values: ${mostDuplicate.mostDuplicateList.join(', ')}');
}
