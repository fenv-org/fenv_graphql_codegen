import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fenv_graphql_codegen/src/builder_options_extension.dart';
import 'package:fenv_graphql_codegen/src/casing_extension.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/generated_code.dart';
import 'package:fenv_graphql_codegen/src/hook_function_extension.dart';
import 'package:fenv_graphql_codegen/src/parameter_elements_extension.dart';

extension HookForMutateExtension on TopLevelFunctionElement {
  /// "useMutation$HelloWorld" -> "mutate$HelloWorld"
  String get mutateMethodName =>
      mutationName.replaceFirst('Mutation\$', 'mutate\$');

  /// "useMutation$HelloWorld" -> "Fenv$Mutation$HelloWorld$Extension"
  String fenvMutationExtensionName(BuilderOptions options) =>
      '${options.symbolNamePrefix.pascalCased}\$$mutationName\$Extension';

  /// "useMutation$HelloWorld" -> "fenv$Mutate$HelloWorld"
  String fenvMutateMethodName(BuilderOptions options) =>
      mutationName.replaceFirst(
        'Mutation\$',
        '${options.symbolNamePrefix.camelCased}\$Mutate\$',
      );

  /// "useMutation$HelloWorld" -> "Fenv$Mutation$HelloWorld"
  String fenvMutationWrapperInterfaceName(BuilderOptions options) =>
      '${options.symbolNamePrefix.pascalCased}\$$mutationName';

  /// "useMutation$HelloWorld" -> "_fenv$Mutation$HelloWorldImpl"
  String fenvMutationWrapperImplName(BuilderOptions options) =>
      '_${fenvMutationWrapperInterfaceName(options).camelCased}Impl';

  /// "useMutation$HelloWorld" -> "debugOverride$Fenv$Mutation$HelloWorld"
  String fenvMutationDebugOverrideName(BuilderOptions options) =>
      'debugOverride\$${fenvMutationWrapperInterfaceName(options)}';

  MethodElement findMutateMethod(Contents reference) => extensionMethods(
    reference,
  ).firstWhere((element) => element.name == mutateMethodName);

  GeneratedCode generateHookForMutate(
    BuilderOptions options,
    Contents reference,
  ) {
    return (
      definitions: [
        ..._fenvExtension(options, reference),
        '',
        ..._fenvMutationWrapperInterfaceDeclaration(options, reference),
        '',
        ..._fenvMutationWrapperDebugOverrideDeclaration(options),
        '',
        ..._fenvMutationWrapperImplDefinition(options, reference),
      ],
      additionalImports: <String>{}, // No additional imports for mutation yet
    );
  }

  List<String> _fenvExtension(BuilderOptions options, Contents reference) {
    final mutateMethod = findMutateMethod(reference);
    return [
      'extension ${fenvMutationExtensionName(options)} on GraphQLClient {',
      '  ${mutateMethod.returnType} ${fenvMutateMethodName(options)}(',
      '    ${mutateMethod.formalParameters.parametersToString()}',
      '  ) {',
      '    ${fenvMutationWrapperInterfaceName(options)} impl = ${fenvMutationWrapperImplName(options)};',
      '    assert(() {',
      '      if (${fenvMutationDebugOverrideName(options)} != null) {',
      '        impl = ${fenvMutationDebugOverrideName(options)}!;',
      '      }',
      '      return true;',
      '    }());',
      '    return impl(this, options);',
      '  }',
      '}',
      '',
    ];
  }

  List<String> _fenvMutationWrapperInterfaceDeclaration(
    BuilderOptions options,
    Contents reference,
  ) {
    final mutateMethod = findMutateMethod(reference);
    return [
      'typedef ${fenvMutationWrapperInterfaceName(options)} =',
      '  ${mutateMethod.returnType} Function(',
      '    GraphQLClient client, ',
      '    ${mutateMethod.formalParameters.parametersToString()}',
      '  );',
    ];
  }

  List<String> _fenvMutationWrapperDebugOverrideDeclaration(
    BuilderOptions options,
  ) {
    return [
      '@visibleForTesting',
      '${fenvMutationWrapperInterfaceName(options)}? ${fenvMutationDebugOverrideName(options)};',
    ];
  }

  List<String> _fenvMutationWrapperImplDefinition(
    BuilderOptions options,
    Contents reference,
  ) {
    final mutateMethod = findMutateMethod(reference);
    return [
      '${mutateMethod.returnType} ${fenvMutationWrapperImplName(options)}(',
      '  GraphQLClient client, ',
      '  ${mutateMethod.formalParameters.parametersToString()}',
      ') {',
      '  return client.${mutateMethod.name}(',
      '    options,',
      '  );',
      '}',
    ];
  }
}
