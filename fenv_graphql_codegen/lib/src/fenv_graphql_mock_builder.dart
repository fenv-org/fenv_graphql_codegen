// ignore_for_file: avoid_print

import 'package:analyzer/dart/element/element2.dart';
import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:fenv_graphql_codegen/src/builder_options_extension.dart';
import 'package:fenv_graphql_codegen/src/client_extension.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/hook_function_extension.dart';
import 'package:fenv_graphql_codegen/src/mock_for_mutate_extension.dart';
import 'package:fenv_graphql_codegen/src/mock_for_query_extension.dart';
import 'package:fenv_graphql_codegen/src/mock_for_use_mutation_extension.dart';
import 'package:fenv_graphql_codegen/src/mock_for_use_query_extension.dart';

Builder fenvGraphqlMockBuilderFactory(BuilderOptions options) {
  print('fenv_graphql_mock_builder:');
  final builder = FenvGraphqlMockBuilder(options: options);
  print('  options: ${options.config}');
  print('  buildExtensions: ${builder.buildExtensions}');
  return builder;
}

final _dartVersion = DartFormatter.latestLanguageVersion;

class FenvGraphqlMockBuilder extends Builder {
  FenvGraphqlMockBuilder({required this.options});

  final BuilderOptions options;

  @override
  Map<String, List<String>> get buildExtensions => {
    '^lib/{{}}${options.targetFileExtension}': [
      'test/{{}}.${options.filenameSuffix}.mocks.dart',
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

    final publicClassElements = library.classes
        .whereType<ClassElement2>()
        .where(
          (element) =>
              element.name3?.startsWith('_') != true && !element.isAbstract,
        );

    final clientExtensionElements = library.extensions.where(
      (element) =>
          element.isQueryClientExtension || element.isMutationClientExtension,
    );

    final contents = Contents(
      inputLibrary: inputLibrary,
      extensions: {
        for (final extensionElement in clientExtensionElements)
          if (extensionElement.name3 != null)
            extensionElement.name3!: extensionElement,
      },
      functions: {
        for (final functionElement in hookFunctionElements)
          if (functionElement.name3 != null)
            functionElement.name3!: functionElement,
      },
      classes: {
        for (final classElement in publicClassElements)
          if (classElement.name3 != null) classElement.name3!: classElement,
      },
      importedLibraries: library.fragments
          .expand((f) => f.importedLibraries2)
          .toSet()
          .toList(),
    );

    await buildMockHooks(buildStep, options, contents);
  }
}

Future<void> buildMockHooks(
  BuildStep buildStep,
  BuilderOptions options,
  Contents contents,
) async {
  final outputId = AssetId(
    buildStep.inputId.package,
    options.generateMockOutputPath(buildStep.inputId.path),
  );

  final imports = [
    "import 'package:flutter/foundation.dart';",
    "import 'package:flutter_hooks/flutter_hooks.dart';",
    "import 'package:graphql_flutter/graphql_flutter.dart';",
    "import 'package:fenv_graphql_core/fenv_graphql_core.dart';",
    "import 'package:fenv_graphql_test/fenv_graphql_test.dart';",
    "import '${contents.uri}';",
    "import '${options.generateHookOutputPath(contents.uri.toString())}';",
  ];

  final declaration = [];

  // Generate the mock wrappers for Query and Mutation
  for (final hook in contents.functions.values) {
    declaration.addAll(_generateWrapper(options, hook, contents));
  }

  // Note: We skip generateMockDataFunc() as per requirements

  // cSpell:ignore implicit_call_tearoffs
  final outputs = <String>[
    '// dart format width=80',
    '// GENERATED CODE - DO NOT MODIFY BY HAND',
    '// ignore_for_file: directives_ordering, unused_import, require_trailing_commas',
    '// ignore_for_file: unnecessary_null_comparison, implicit_call_tearoffs',
    '// ignore_for_file: use_test_friendly_graphql_operation',
    '',
    ...imports.toSet(),
    '',
    ...declaration,
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

List<String> _generateWrapper(
  BuilderOptions options,
  TopLevelFunctionElement hook,
  Contents reference,
) {
  if (hook.isUseQueryHook) {
    return [
      ...hook.generateMockForQuery(options, reference),
      ...hook.generateMockForUseQuery(options, reference),
    ];
  }
  if (hook.isUseMutationHook) {
    return [
      ...hook.generateMockForMutate(options, reference),
      ...hook.generateMockForUseMutation(options, reference),
    ];
  } else {
    return const [];
  }
}
