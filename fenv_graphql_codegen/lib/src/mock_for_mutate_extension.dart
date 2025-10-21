import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/hook_for_mutate_extension.dart';
import 'package:fenv_graphql_codegen/src/hook_function_extension.dart';
import 'package:fenv_graphql_codegen/src/parameter_elements_extension.dart';

extension MockForMutateExtension on FunctionElement {
  List<String> generateMockForMutate(
    BuilderOptions options,
    Contents reference,
  ) {
    final mutateMethod = findMutateMethod(reference);
    return [
      'class Mock${fenvMutationWrapperInterfaceName(options)}',
      '    with MockFenvQueryMutateWrapperMixin<$queryName, ${variablesTypeName(reference)}> {',
      '  @override',
      '  ${nullableVariablesTypeName(reference)} Function(Map<String, dynamic>) get jsonToVariables => ',
      if (variablesTypeName(reference) == 'Never')
        '      (_) => null;'
      else
        '      ${variablesTypeName(reference)}.fromJson;',
      '',
      '  @override',
      '  $queryName? Function(Map<String, dynamic>) get jsonToParsed => ',
      '      $queryName.fromJson;',
      '',
      '  @override',
      '  Map<String, dynamic> Function($queryName) get parsedToJson => ',
      '      (parsed) => parsed.toJson();',
      '',
      '  void install() {',
      '    ${fenvMutationDebugOverrideName(options)} = this;',
      '  }',
      '',
      '  void uninstall() {',
      '    ${fenvMutationDebugOverrideName(options)} = null;',
      '  }',
      '',
      '  ${mutateMethod.returnType} call(',
      '    GraphQLClient client, ',
      '    ${mutateMethod.parameters.parametersToString()}',
      '  ) {',
      '    return mutate(${mutateMethod.optionsArgument});',
      '  }',
      '}',
    ];
  }
}
