import 'package:analyzer/dart/element/element2.dart';
import 'package:build/build.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/hook_for_query_extension.dart';
import 'package:fenv_graphql_codegen/src/hook_function_extension.dart';
import 'package:fenv_graphql_codegen/src/parameter_elements_extension.dart';

extension MockForQueryExtension on TopLevelFunctionElement {
  List<String> generateMockForQuery(
    BuilderOptions options,
    Contents reference,
  ) {
    final queryMethod = findQueryMethod(reference);
    return [
      'class Mock${fenvQueryWrapperInterfaceName(options)}',
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
      '    ${fenvQueryDebugOverrideName(options)} = this;',
      '  }',
      '',
      '  void uninstall() {',
      '    ${fenvQueryDebugOverrideName(options)} = null;',
      '  }',
      '',
      '  ${queryMethod.returnType} call(',
      '    GraphQLClient client, ',
      '    ${queryMethod.formalParameters.parametersToString()}',
      '  ) {',
      '    return fetch($optionsArgument);',
      '  }',
      '}',
    ];
  }
}
