import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/hook_for_use_query_extension.dart';
import 'package:fenv_graphql_codegen/src/hook_function_extension.dart';
import 'package:fenv_graphql_codegen/src/parameter_elements_extension.dart';

extension MockForUseQueryExtension on TopLevelFunctionElement {
  List<String> generateMockForUseQuery(
    BuilderOptions options,
    Contents reference,
  ) {
    return [
      'class Mock${useFenvQueryHookWrapperInterfaceName(options)}',
      '    with MockUseFenvQueryWrapperMixin<$queryName, ${variablesTypeName(reference)}> {',
      '  @override',
      '  ${nullableVariablesTypeName(reference)} Function(Map<String, dynamic>) get jsonToVariables => ',
      if (variablesTypeName(reference) == 'Never')
        '      (_) => null;'
      else
        '      ${variablesTypeName(reference)}.fromJson;',
      '',
      '  @override',
      '  Map<String, dynamic> Function(${variablesTypeName(reference)}) get variablesToJson => ',
      if (variablesTypeName(reference) == 'Never')
        '      (_) => const <String, dynamic>{};'
      else
        '      (variables) => variables.toJson();',
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
      '    ${useFenvQueryHookDebugOverrideName(options)} = this;',
      '  }',
      '',
      '  void uninstall() {',
      '    ${useFenvQueryHookDebugOverrideName(options)} = null;',
      '  }',
      '',
      '  ${hookResultTypedef(options)} call(${formalParameters.parametersToString()}) {',
      '    dirty = useState(0);',
      '',
      '    useEffect(',
      '      () {',
      '        latest = QueryResult(',
      '          options: $optionsArgument,',
      '          source: QueryResultSource.loading,',
      '        );',
      '        return null;',
      '      },',
      '      const [],',
      '    );',
      '',
      '    useEffect(',
      '      () {',
      '        latestOptions = $optionsArgument;',
      '        fetch();',
      '        return null;',
      '      },',
      '      [options, dataBuilder],',
      '    );',
      '',
      '    return StrictQueryHookResult.fromResultSupplier(',
      '      resultSupplier: () => latest,',
      '      refetch: refetch,',
      '      fetchMore: fetchMore,',
      '    );',
      '  }',
      '}',
      '',
    ];
  }
}
