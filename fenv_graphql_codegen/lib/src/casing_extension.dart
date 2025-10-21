extension CasingExtension on String {
  String get camelCased => _toCamelCase(this);
  String get pascalCased => _toPascalCase(this);
}

String _toCamelCase(String input) {
  if (input.isEmpty) return input;

  // Handle already camelCase or PascalCase strings
  if (!input.contains(RegExp(r'[_\s-]'))) {
    return input[0].toLowerCase() + input.substring(1);
  }

  final words = input.split(RegExp(r'[_\s-]+'));
  if (words.isEmpty) return input;

  final first = words.first.toLowerCase();
  final rest = words.skip(1).map((word) {
    if (word.isEmpty) return '';
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  });

  return first + rest.join();
}

String _toPascalCase(String input) {
  if (input.isEmpty) return input;

  // Handle already camelCase or PascalCase strings
  if (!input.contains(RegExp(r'[_\s-]'))) {
    return input[0].toUpperCase() + input.substring(1);
  }

  final words = input.split(RegExp(r'[_\s-]+'));
  return words.map((word) {
    if (word.isEmpty) return '';
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join();
}
