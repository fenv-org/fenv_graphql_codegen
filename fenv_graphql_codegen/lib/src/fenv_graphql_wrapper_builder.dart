// ignore_for_file: avoid_print

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:fenv_graphql_codegen/src/builder_options_extension.dart';
import 'package:fenv_graphql_codegen/src/client_extension.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/generated_code.dart';
import 'package:fenv_graphql_codegen/src/hook_for_mutate_extension.dart';
import 'package:fenv_graphql_codegen/src/hook_for_query_extension.dart';
import 'package:fenv_graphql_codegen/src/hook_for_use_mutation_extension.dart';
import 'package:fenv_graphql_codegen/src/hook_for_use_query_extension.dart';
import 'package:fenv_graphql_codegen/src/hook_function_extension.dart';

Builder fenvGraphqlWrapperBuilderFactory(BuilderOptions options) {
  print('fenv_graphql_wrapper_builder:');
  final builder = FenvGraphqlWrapperBuilder(options: options);
  print('  options: ${options.config}');
  print('  buildExtensions: ${builder.buildExtensions}');
  return builder;
}

final _dartVersion = DartFormatter.latestLanguageVersion;

class FenvGraphqlWrapperBuilder extends Builder {
  FenvGraphqlWrapperBuilder({required this.options});

  final BuilderOptions options;

  @override
  Map<String, List<String>> get buildExtensions => {
    '^lib/{{}}${options.targetFileExtension}': [
      'lib/{{}}.${options.filenameSuffix}.dart',
    ],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) return;

    final inputLibrary = await buildStep.inputLibrary;
    if (!options.shouldAccept(buildStep.inputId.path)) return;

    final library = await buildStep.resolver.libraryFor(buildStep.inputId);
    final hookFunctionElements = library.topLevelFunctions.where(
      (element) => element.isUseQueryHook || element.isUseMutationHook,
    );
    if (hookFunctionElements.isEmpty) return;

    final publicClassElements = library.classes.where(
      (element) => element.name?.startsWith('_') != true && !element.isAbstract,
    );

    final clientExtensionElements = library.extensions.where(
      (element) =>
          element.isQueryClientExtension || element.isMutationClientExtension,
    );

    final contents = Contents(
      inputLibrary: inputLibrary,
      extensions: {
        for (final extensionElement in clientExtensionElements)
          extensionElement.name!: extensionElement,
      },
      functions: {
        for (final functionElement in hookFunctionElements)
          if (functionElement.name != null)
            functionElement.name!: functionElement,
      },
      classes: {
        for (final classElement in publicClassElements)
          if (classElement.name != null) classElement.name!: classElement,
      },
      importedLibraries: library.fragments
          .expand((f) => f.importedLibraries)
          .toSet()
          .toList(),
    );

    await buildProductionHooks(buildStep, options, contents);
  }
}

Future<void> buildProductionHooks(
  BuildStep buildStep,
  BuilderOptions options,
  Contents contents,
) async {
  final outputId = AssetId(
    buildStep.inputId.package,
    options.generateHookOutputPath(buildStep.inputId.path),
  );

  final additionalImports = <String>{};
  final hookCodes = <String>[];

  // Collect code and additional imports from each hook
  for (final hook in contents.functions.values) {
    final result = _generateWrapper(options, hook, contents);
    hookCodes.addAll(result.definitions);
    additionalImports.addAll(result.additionalImports);
  }

  final outputs = <String>[
    '// dart format width=80',
    '// GENERATED CODE - DO NOT MODIFY BY HAND',
    '// ignore_for_file: directives_ordering, unused_import, require_trailing_commas',
    '// ignore_for_file: use_test_friendly_graphql_operation',
    '// ignore_for_file: always_put_required_named_parameters_first',
    '// ignore_for_file: invalid_null_aware_operator',
    '',
    "import 'package:flutter_hooks/flutter_hooks.dart';",
    "import 'package:graphql_flutter/graphql_flutter.dart';",
    "import 'package:fenv_graphql_core/fenv_graphql_core.dart';",
    "import 'package:hooks_riverpod/hooks_riverpod.dart';",
    "import 'package:meta/meta.dart';",
    "import '${contents.uri}';",
    // Insert additional imports (sorted)
    for (final importUri in additionalImports.toList()..sort())
      "import '$importUri';",
    '',
    ...hookCodes,
  ];

  await buildStep.writeAsString(
    outputId,
    options.shouldFormat
        ? DartFormatter(
            languageVersion: _dartVersion,
          ).format(outputs.join('\n'))
        : outputs.join('\n'),
  );
}

GeneratedCode _generateWrapper(
  BuilderOptions options,
  TopLevelFunctionElement hook,
  Contents reference,
) {
  if (hook.isUseQueryHook) {
    final queryResult = hook.generateHookForQuery(options, reference);
    final useQueryCode = hook.generateHookForUseQuery(options, reference);

    return (
      definitions: [...queryResult.definitions, '', ...useQueryCode],
      additionalImports: queryResult.additionalImports,
    );
  } else if (hook.isUseMutationHook) {
    final mutateResult = hook.generateHookForMutate(options, reference);
    final useMutationCode = hook.generateHookForUseMutation(options, reference);

    return (
      definitions: [...mutateResult.definitions, '', ...useMutationCode],
      additionalImports: mutateResult.additionalImports,
    );
  } else {
    return (definitions: const [], additionalImports: <String>{});
  }
}
