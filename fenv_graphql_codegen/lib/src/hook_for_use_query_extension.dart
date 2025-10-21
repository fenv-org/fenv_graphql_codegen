import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fenv_graphql_codegen/src/builder_options_extension.dart';
import 'package:fenv_graphql_codegen/src/casing_extension.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/hook_function_extension.dart';
import 'package:fenv_graphql_codegen/src/parameter_elements_extension.dart';

extension HookForUseQueryExtension on FunctionElement {
  /// "useQuery$HelloWorld" -> "Fenv$Query$HelloWorld$HookResult"
  String hookResultTypedef(BuilderOptions options) =>
      '${options.symbolNamePrefix.pascalCased}\$$queryName\$HookResult';

  /// "useQuery$HelloWorld" -> "FetchMore$Query$HelloWorld"
  String fetchMoreTypedef(BuilderOptions options) =>
      '${options.symbolNamePrefix.pascalCased}\$FetchMore\$$queryName';

  /// "useQuery$HelloWorld" -> "FetchMoreOptions$Query$HelloWorld"
  String fetchMoreOptionsTypedef(BuilderOptions options) =>
      '${options.symbolNamePrefix.pascalCased}\$FetchMoreOptions\$$queryName';

  /// "useQuery$HelloWorld" -> "useFenv$Query$HelloWorld"
  String useFenvQueryHookName(BuilderOptions options) =>
      'use${options.symbolNamePrefix.pascalCased}\$$queryName';

  /// "useQuery$HelloWorld" -> "UseFenv$Query$HelloWorld"
  String useFenvQueryHookWrapperInterfaceName(BuilderOptions options) =>
      'Use${options.symbolNamePrefix.pascalCased}\$$queryName';

  /// "useQuery$HelloWorld" -> "_useFenv$Query$HelloWorldImpl"
  String useFenvQueryHookWrapperImplName(BuilderOptions options) =>
      '_${useFenvQueryHookWrapperInterfaceName(options).camelCased}Impl';

  /// "useQuery$HelloWorld" -> "debugOverride$UseFenv$Query$HelloWorld"
  String useFenvQueryHookDebugOverrideName(BuilderOptions options) =>
      'debugOverride\$${useFenvQueryHookWrapperInterfaceName(options)}';

  List<String> generateHookForUseQuery(
    BuilderOptions options,
    Contents reference,
  ) {
    return [
      ..._typeDefinitions(options, reference),
      '',
      ..._useFenvQueryHookDefinition(options),
      '',
      ..._useFenvQueryHookWrapperInterfaceDeclaration(options),
      '',
      ..._useFenvQueryHookWrapperDebugOverrideDeclaration(options),
      '',
      ..._useFenvQueryHookWrapperImplDefinition(options, reference),
    ];
  }

  List<String> _typeDefinitions(BuilderOptions options, Contents reference) => [
    'typedef ${hookResultTypedef(options)} =',
    '  StrictQueryHookResult<$queryName, ${variablesTypeName(reference)}>;',
    '',
    'typedef ${fetchMoreTypedef(options)} =',
    '  StrictFetchMore<$queryName, ${variablesTypeName(reference)}>;',
    '',
    'typedef ${fetchMoreOptionsTypedef(options)} =',
    '  StrictFetchMoreOptions<$queryName, ${variablesTypeName(reference)}>;',
  ];

  List<String> _useFenvQueryHookDefinition(BuilderOptions options) {
    return [
      '${hookResultTypedef(options)} ${useFenvQueryHookName(options)}(',
      '  ${parameters.parametersToString()}',
      ') {',
      '  ${useFenvQueryHookWrapperInterfaceName(options)} impl = ${useFenvQueryHookWrapperImplName(options)};',
      '  assert(() {',
      '    if (${useFenvQueryHookDebugOverrideName(options)} != null) {',
      '      impl = ${useFenvQueryHookDebugOverrideName(options)}!;',
      '    }',
      '    return true;',
      '  }());',
      '  return impl($optionsArgument);',
      '}',
      '',
    ];
  }

  List<String> _useFenvQueryHookWrapperInterfaceDeclaration(
    BuilderOptions options,
  ) {
    return [
      '@visibleForTesting',
      'typedef ${useFenvQueryHookWrapperInterfaceName(options)} =',
      '  ${hookResultTypedef(options)} Function(',
      '    ${parameters.parametersToString()}',
      '  );',
      '',
    ];
  }

  List<String> _useFenvQueryHookWrapperDebugOverrideDeclaration(
    BuilderOptions options,
  ) => [
    '@visibleForTesting',
    '${useFenvQueryHookWrapperInterfaceName(options)}? ${useFenvQueryHookDebugOverrideName(options)};',
  ];

  List<String> _useFenvQueryHookWrapperImplDefinition(
    BuilderOptions options,
    Contents reference,
  ) {
    return [
      '${hookResultTypedef(options)} ${useFenvQueryHookWrapperImplName(options)}(',
      '  ${parameters.parametersToString()}',
      ') {',
      '  final client = useGraphQLClient();',
      '  final (query, asyncSnapshot) =',
      '      QueryHooksImplementationHelpers.useQueryOnClient<$queryName>(',
      '    client,',
      '    $optionsArgument,',
      '  );',
      '',
      '  final refetch = useCallback(',
      '    () async => query.isRefetchSafe ? query.refetch() : null,',
      '    [query],',
      '  );',
      '',
      '  final fetchMore = useCallback<${fetchMoreTypedef(options)}>(',
      '    (options) => query.fetchMore(',
      '      FetchMoreOptions(',
      '        document: options.document,',
      if (variablesTypeName(reference) != 'Never')
        '        variables: options.variables?.toJson() ?? const {},',
      '        updateQuery: options.updateQuery.toUpdateQuery(',
      '          fromJson: $queryName.fromJson,',
      '          toJson: (data) => data.toJson(),',
      '        ),',
      '      ),',
      '    ),',
      '    [query],',
      '  );',
      '',
      '  return StrictQueryHookResult(',
      '    result: asyncSnapshot.data!,',
      '    refetch: refetch,',
      '    fetchMore: fetchMore,',
      '  );',
      '}',
      '',
    ];
  }
}
