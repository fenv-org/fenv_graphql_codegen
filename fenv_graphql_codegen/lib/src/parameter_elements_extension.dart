import 'package:analyzer/dart/element/element.dart';

extension ParameterElementsExtension on Iterable<ParameterElement> {
  bool get hasRequiredOptions => optionsParameter.isRequired;

  ParameterElement findByName(String name) {
    return firstWhere((element) => element.name == name);
  }

  ParameterElement get optionsParameter => findByName('options');

  String parametersToString() {
    final requiredPositional = where(
      (element) => element.isRequired && element.isPositional,
    ).map((element) => '${element.type} ${element.name}').join(', ');
    final optionalPositional =
        where((element) => element.isOptional && element.isPositional)
            .map(
              (element) =>
                  '${element.type} ${element.name}${element.defaultValueCode != null ? ' = ${element.defaultValueCode}' : ''}',
            )
            .join(', ');
    final named = where((element) => element.isNamed)
        .map(
          (element) =>
              '${element.isRequired ? 'required ' : ''}${element.type} ${element.name}${element.defaultValueCode != null ? ' = ${element.defaultValueCode}' : ''}',
        )
        .join(', ');

    final buffer = StringBuffer();
    if (requiredPositional.isNotEmpty) {
      buffer.writeAll([requiredPositional, ', ']);
    }

    if (optionalPositional.isNotEmpty) {
      buffer.write('[$optionalPositional,]');
    }

    if (named.isNotEmpty) {
      buffer.write('{$named,}');
    }

    return buffer.toString();
  }
}
