import 'package:analyzer/dart/element/element2.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/parameter_elements_extension.dart';

extension HookFunctionExtension on ExecutableElement2 {
  bool get isUseQueryHook => name3?.startsWith('useQuery\$') ?? false;
  bool get isUseMutationHook => name3?.startsWith('useMutation\$') ?? false;

  /// "useQuery$HelloWorld" -> "Query$HelloWorld"
  String get queryName => name3?.replaceFirst('use', '') ?? '';

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

  String get optionsArgument => formalParameters.hasRequiredOptions
      ? 'options'
      : 'options ?? ${formalParameters.findByName('options').type.getDisplayString().replaceFirst('?', '')}()';

  List<MethodElement2> extensionMethods(Contents reference) =>
      reference.findExtensionByName(queryName)?.methods2 ?? const [];
}
