import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fenv_graphql_codegen/src/builder_options_extension.dart';
import 'package:fenv_graphql_codegen/src/casing_extension.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/hook_function_extension.dart';
import 'package:fenv_graphql_codegen/src/parameter_elements_extension.dart';

extension HookForUseMutationExtension on FunctionElement {
  /// "useMutation$HelloWorld" -> "Mutation$HelloWorld$HookResult"
  String get hookResultTypeName => '$mutationName\$HookResult';

  /// "useMutation$HelloWorld" -> "Fenv$Mutation$HelloWorld$HookResult"
  String fenvHookResultTypeName(BuilderOptions options) =>
      '${options.symbolNamePrefix.pascalCased}\$$hookResultTypeName';

  /// "useMutation$HelloWorld" -> "useFenv$Mutation$HelloWorld"
  String useFenvMutationHookName(BuilderOptions options) =>
      'use${options.symbolNamePrefix.pascalCased}\$$mutationName';

  /// "useMutation$HelloWorld" -> "UseFenv$Mutation$HelloWorld"
  String useFenvMutationHookWrapperInterfaceName(BuilderOptions options) =>
      'Use${options.symbolNamePrefix.pascalCased}\$$mutationName';

  /// "useMutation$HelloWorld" -> "_useFenv$Mutation$HelloWorldImpl"
  String useFenvMutationHookWrapperImplName(BuilderOptions options) =>
      '_${useFenvMutationHookWrapperInterfaceName(options).camelCased}Impl';

  /// "useMutation$HelloWorld" -> "debugOverride$UseFenv$Mutation$HelloWorld"
  String useFenvMutationHookDebugOverrideName(BuilderOptions options) =>
      'debugOverride\$${useFenvMutationHookWrapperInterfaceName(options)}';

  List<String> generateHookForUseMutation(
    BuilderOptions options,
    Contents reference,
  ) {
    return [
      ..._fenvTypedef(options),
      '',
      ..._useFenvMutationHookDefinition(options),
      '',
      ..._useFenvMutationHookWrapperInterfaceDeclaration(options),
      '',
      ..._useFenvMutationHookWrapperDebugOverrideDeclaration(options),
      '',
      ..._useFenvMutationHookWrapperImplDefinition(options),
    ];
  }

  List<String> _fenvTypedef(BuilderOptions options) {
    return [
      'typedef ${fenvHookResultTypeName(options)} =',
      '  $hookResultTypeName;',
    ];
  }

  List<String> _useFenvMutationHookDefinition(BuilderOptions options) {
    return [
      '${fenvHookResultTypeName(options)} ${useFenvMutationHookName(options)}(',
      '  ${parameters.parametersToString()}',
      ') {',
      '  ${useFenvMutationHookWrapperInterfaceName(options)} impl = ${useFenvMutationHookWrapperImplName(options)};',
      '  assert(() {',
      '    if (${useFenvMutationHookDebugOverrideName(options)} != null) {',
      '      impl = ${useFenvMutationHookDebugOverrideName(options)}!;',
      '    }',
      '    return true;',
      '  }());',
      '  return impl(options);',
      '}',
    ];
  }

  List<String> _useFenvMutationHookWrapperInterfaceDeclaration(
    BuilderOptions options,
  ) {
    return [
      '@visibleForTesting',
      'typedef ${useFenvMutationHookWrapperInterfaceName(options)} =',
      '  ${fenvHookResultTypeName(options)} Function(',
      '    ${parameters.parametersToString()}',
      '  );',
    ];
  }

  List<String> _useFenvMutationHookWrapperDebugOverrideDeclaration(
    BuilderOptions options,
  ) {
    return [
      '@visibleForTesting',
      '${useFenvMutationHookWrapperInterfaceName(options)}? ${useFenvMutationHookDebugOverrideName(options)};',
    ];
  }

  List<String> _useFenvMutationHookWrapperImplDefinition(
    BuilderOptions options,
  ) {
    return [
      '${fenvHookResultTypeName(options)} ${useFenvMutationHookWrapperImplName(options)}(',
      '  ${parameters.parametersToString()}',
      ') {',
      '  return $name(options);',
      '}',
    ];
  }
}
