import 'package:analyzer/dart/element/element.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/parameter_elements_extension.dart';

extension HookFunctionExtension on ExecutableElement {
  bool get isUseQueryHook => name.startsWith('useQuery\$');
  bool get isUseMutationHook => name.startsWith('useMutation\$');

  /// "useQuery$HelloWorld" -> "Query$HelloWorld"
  String get queryName => name.replaceFirst('use', '');

  /// "useMutation$HelloWorld" -> "Mutation$HelloWorld"
  String get mutationName => queryName;

  /// "useQuery$HelloWorld" -> "Options$HelloWorld"
  String get optionsTypeName => 'Options\$$queryName';

  /// "useQuery$HelloWorld" -> "Variables$Query$HelloWorld" or "Never"
  String variablesTypeName(Contents reference) =>
      reference.classes.containsKey('Variables\$$queryName')
      ? 'Variables\$$queryName'
      : 'Never';

  /// "useQuery$HelloWorld" -> "Variables$Query$HelloWorld?" or "Never"
  String nullableVariablesTypeName(Contents reference) =>
      reference.classes.containsKey('Variables\$$queryName')
      ? 'Variables\$$queryName?'
      : 'Null';

  String get optionsArgument => parameters.hasRequiredOptions
      ? 'options'
      : 'options ?? ${parameters.findByName('options').type.getDisplayString().replaceFirst('?', '')}()';

  List<MethodElement> extensionMethods(Contents reference) =>
      reference.findExtensionByName(queryName)?.methods ?? const [];
}
