import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart' show BuilderOptions;
import 'package:fenv_graphql_codegen/src/builder_options_extension.dart';
import 'package:fenv_graphql_codegen/src/casing_extension.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/generated_code.dart';
import 'package:fenv_graphql_codegen/src/hook_function_extension.dart';
import 'package:fenv_graphql_codegen/src/method_element_pagination_extension.dart';
import 'package:fenv_graphql_codegen/src/parameter_elements_extension.dart';

extension HookForQueryExtension on FunctionElement {
  /// "useQuery$HelloWorld" -> "query$HelloWorld"
  String get queryMethodName => queryName.camelCased;

  /// "useQuery$HelloWorld" -> "Fenv$Query$HelloWorld$Extension"
  String fenvQueryExtensionName(BuilderOptions options) =>
      '${options.symbolNamePrefix.pascalCased}\$$queryName\$Extension';

  /// "useQuery$HelloWorld" -> "fenv$Query$HelloWorld"
  String fenvQueryMethodName(BuilderOptions options) =>
      '${options.symbolNamePrefix.camelCased}\$$queryName';

  /// "useQuery$HelloWorld" -> "Fenv$Query$HelloWorld"
  String fenvQueryWrapperInterfaceName(BuilderOptions options) =>
      '${options.symbolNamePrefix.pascalCased}\$$queryName';

  /// "useQuery$HelloWorld" -> "Fenv$Query$HelloWorld$Operation"
  String fenvQueryWrapperOperationName(BuilderOptions options) =>
      '${options.symbolNamePrefix.pascalCased}\$$queryName\$Operation';

  /// "useQuery$HelloWorld" -> "_fenv$Query$HelloWorldImpl"
  String fenvQueryWrapperImplName(BuilderOptions options) =>
      '_${fenvQueryWrapperInterfaceName(options).camelCased}Impl';

  /// "useQuery$HelloWorld" -> "debugOverride$Fenv$Query&HelloWorld"
  String fenvQueryDebugOverrideName(BuilderOptions options) =>
      'debugOverride\$${fenvQueryWrapperInterfaceName(options)}';

  /// "useQuery$HelloWorld" -> "Fenv$Query$HelloWorld$PaginationMetaExtractor"
  String fenvQueryPaginationMetaExtractorName(BuilderOptions options) =>
      '${fenvQueryWrapperInterfaceName(options)}\$PaginationMetaExtractor';

  MethodElement findQueryMethod(Contents reference) => extensionMethods(
    reference,
  ).firstWhere((element) => element.name == queryMethodName);

  GeneratedCode generateHookForQuery(
    BuilderOptions options,
    Contents reference,
  ) {
    final queryMethod = findQueryMethod(reference);
    final additionalImports = <String>{};

    // Collect NodeType imports for paginated queries
    if (queryMethod.isPaginated) {
      final nodeTypeName = queryMethod.nodeType?.getDisplayString() ?? 'Never';
      final cleanNodeTypeName = nodeTypeName.replaceAll('?', '');

      final nodeTypeUri = _findNodeTypeLibraryUri(cleanNodeTypeName, reference);
      if (nodeTypeUri != null) {
        additionalImports.add(nodeTypeUri);
      }

      // Collect imports for extra field types
      for (final field in queryMethod.extraFields) {
        final fieldTypeUri = _findFieldTypeLibraryUri(field, reference);
        if (fieldTypeUri != null) {
          additionalImports.add(fieldTypeUri);
        }
      }
    }

    return (
      definitions: [
        ..._fenvExtension(options, reference),
        '',
        ..._fenvQueryWrapperInterfaceDeclaration(options, reference),
        '',
        ..._fenvQueryWrapperOperationDeclaration(options, reference),
        '',
        ..._fenvQueryWrapperDebugOverrideDeclaration(options),
        '',
        ..._fenvQueryWrapperImplDefinition(options, reference),
        if (queryMethod.isPaginated) ...[
          '',
          ..._fenvQueryPaginationMetaExtractorDefinition(options, reference),
        ],
      ],
      additionalImports: additionalImports,
    );
  }

  List<String> _fenvExtension(BuilderOptions options, Contents reference) {
    return [
      'extension ${fenvQueryExtensionName(options)} on GraphQLClient {',
      '  ${fenvQueryWrapperOperationName(options)} get ${fenvQueryMethodName(options)} =>',
      '      ${fenvQueryWrapperOperationName(options)}(this);',
      '}',
      '',
    ];
  }

  List<String> _fenvQueryWrapperOperationDeclaration(
    BuilderOptions options,
    Contents reference,
  ) {
    final queryMethod = findQueryMethod(reference);
    final isOptionsRequired = queryMethod.parameters.hasRequiredOptions;
    final optionsElement = queryMethod.parameters.optionsParameter;
    final optionsType = optionsElement.type.getDisplayString();
    final queryTypeName = queryMethod.queryName.pascalCased;
    final nodeTypeName = queryMethod.nodeType?.getDisplayString() ?? 'Never';

    // Determine TExtra type
    final extraTypeName = queryMethod.isPaginated && queryMethod.hasExtraFields
        ? '$queryTypeName\$Extra'
        : 'void';

    final implements = queryMethod.isPaginated
        ? 'PaginatedQueryOperation<$queryTypeName, ${queryMethod.parameters.optionsParameter.type}, $nodeTypeName, $extraTypeName>'
        : 'SimpleQueryOperation<$queryTypeName, ${queryMethod.parameters.optionsParameter.type}>';

    return [
      'class ${fenvQueryWrapperOperationName(options)}',
      '    implements $implements {',
      '  const ${fenvQueryWrapperOperationName(options)}(this._client);',
      '',
      '  final GraphQLClient _client;',
      '',
      '  ${queryMethod.returnType} call(',
      '    ${queryMethod.parameters.parametersToString()}',
      '  ) {',
      '    ${fenvQueryWrapperInterfaceName(options)} impl = ${fenvQueryWrapperImplName(options)};',
      '    assert(() {',
      '      if (${fenvQueryDebugOverrideName(options)} != null) {',
      '        impl = ${fenvQueryDebugOverrideName(options)}!;',
      '      }',
      '      return true;',
      '    }());',
      '    return impl(_client, options);',
      '  }',
      '',
      '  @override',
      '  ${queryMethod.returnType} Function({',
      '    ${isOptionsRequired ? 'required ' : ''}$optionsType options, ',
      '    required bool retryOnNetworkError,',
      '  })',
      '  get fetcher => ',
      if (isOptionsRequired)
        '      FetcherFactory.withRequiredOptions(call);'
      else
        '      FetcherFactory.withNullableOptions(call);',
      if (queryMethod.isPaginated) ...[
        '',
        '  @override',
        '  ${fenvQueryPaginationMetaExtractorName(options)} get extractor =>',
        '      const ${fenvQueryPaginationMetaExtractorName(options)}();',
      ],
      '}',
    ];
  }

  List<String> _fenvQueryWrapperInterfaceDeclaration(
    BuilderOptions options,
    Contents reference,
  ) {
    final queryMethod = findQueryMethod(reference);
    return [
      '@visibleForTesting',
      'typedef ${fenvQueryWrapperInterfaceName(options)} =',
      '  ${queryMethod.returnType} Function(',
      '    GraphQLClient client, ',
      '    ${queryMethod.parameters.parametersToString()}',
      '  );',
      '',
    ];
  }

  List<String> _fenvQueryWrapperDebugOverrideDeclaration(
    BuilderOptions options,
  ) => [
    '@visibleForTesting',
    '${fenvQueryWrapperInterfaceName(options)}? ${fenvQueryDebugOverrideName(options)};',
  ];

  List<String> _fenvQueryWrapperImplDefinition(
    BuilderOptions options,
    Contents reference,
  ) {
    final queryMethod = findQueryMethod(reference);
    return [
      '${queryMethod.returnType} ${fenvQueryWrapperImplName(options)}(',
      '  GraphQLClient client, ',
      '  ${queryMethod.parameters.parametersToString()}',
      ') {',
      '  return client.$queryMethodName(',
      '    $optionsArgument,',
      '  );',
      '}',
      '',
    ];
  }

  List<String> _fenvQueryPaginationMetaExtractorDefinition(
    BuilderOptions options,
    Contents reference,
  ) {
    final queryMethod = findQueryMethod(reference);
    final queryTypeName = queryMethod.queryName.pascalCased;
    final nodeTypeName = queryMethod.nodeType?.getDisplayString() ?? 'Never';
    final hasNextPagePath = queryMethod.hasNextPagePath;
    final endCursorPath = queryMethod.endCursorPath;
    final edgesPath = queryMethod.edgesPath;

    final connectionParentFields = queryMethod.extraFields;
    final rootLevelFields = queryMethod.rootLevelExtraFields;
    final hasAnyExtraFields =
        connectionParentFields.isNotEmpty || rootLevelFields.isNotEmpty;
    final connectionParentPath = queryMethod.connectionParentPath;
    final connectionParentFieldName = queryMethod.connectionParentFieldName;
    final isParentNullable = queryMethod.isConnectionParentNullable;

    // Determine TExtra type
    final extraTypeName = hasAnyExtraFields ? '$queryTypeName\$Extra' : '()';

    final lines = <String>[];

    // Generate typedef for extra fields if needed
    if (hasAnyExtraFields) {
      // Generate nested typedef for connection parent fields if they exist
      if (connectionParentFields.isNotEmpty &&
          connectionParentFieldName != null) {
        final parentExtraTypeName =
            '$queryTypeName\$Extra\$$connectionParentFieldName';
        lines.addAll([
          'typedef $parentExtraTypeName = ({',
          ...connectionParentFields.map((field) {
            final fieldType = field.type.getDisplayString();
            return '  $fieldType ${field.name},';
          }),
          '});',
          '',
        ]);
      }

      // Generate main Extra typedef
      lines.add('typedef $extraTypeName = ({');

      // Add connection parent field (as nested record) if it exists
      if (connectionParentFields.isNotEmpty &&
          connectionParentFieldName != null) {
        final parentExtraTypeName =
            '$queryTypeName\$Extra\$$connectionParentFieldName';
        final nullableSuffix = isParentNullable ? '?' : '';
        lines.add(
          '  $parentExtraTypeName$nullableSuffix $connectionParentFieldName,',
        );
      }

      // Add root-level extra fields
      for (final field in rootLevelFields) {
        final fieldType = field.type.getDisplayString();
        lines.add('  $fieldType ${field.name},');
      }

      lines.addAll(['});', '']);
    }

    // Generate extractor class
    lines.addAll([
      'final class ${fenvQueryPaginationMetaExtractorName(options)}',
      '    implements PaginationMetaExtractor<$queryTypeName, $nodeTypeName, $extraTypeName> {',
      '  const ${fenvQueryPaginationMetaExtractorName(options)}();',
      '',
      '  @override',
      '  bool hasNextPage($queryTypeName query) =>',
      '      query.$hasNextPagePath;',
      '',
      '  @override',
      '  String? endCursor($queryTypeName query) =>',
      '      query.$endCursorPath;',
      '',
      '  @override',
      '  Iterable<$nodeTypeName> nodes($queryTypeName query) =>',
      '      query.$edgesPath?.map((edge) => edge?.node).nonNulls ??',
      '      const <$nodeTypeName>[];',
      '',
      '  @override',
    ]);

    // Generate extra() method
    if (hasAnyExtraFields) {
      lines.add('  $extraTypeName extra($queryTypeName query) => (');

      // Handle connection parent fields
      if (connectionParentFields.isNotEmpty &&
          connectionParentPath != null &&
          connectionParentFieldName != null) {
        if (isParentNullable) {
          // Nullable parent: check for null and use safe navigation
          lines.add(
            '        $connectionParentFieldName: query.$connectionParentPath == null',
          );
          lines.add('          ? null');
          lines.add('          : (');
          for (final field in connectionParentFields) {
            lines.add(
              '              ${field.name}: query.$connectionParentPath!.${field.name},',
            );
          }
          lines.add('            ),');
        } else {
          // Non-nullable parent: direct access
          lines.add('        $connectionParentFieldName: (');
          for (final field in connectionParentFields) {
            lines.add(
              '          ${field.name}: query.$connectionParentPath.${field.name},',
            );
          }
          lines.add('        ),');
        }
      }

      // Handle root-level extra fields
      for (final field in rootLevelFields) {
        lines.add('        ${field.name}: query.${field.name},');
      }

      lines.add('      );');
    } else {
      // No extra fields - use empty record
      lines.add('  $extraTypeName extra($queryTypeName query) => const ();');
    }

    lines.add('}');

    return lines;
  }

  /// Finds the library URI where the nodeType class is defined.
  /// Returns null if the class is in the current library or not found.
  String? _findNodeTypeLibraryUri(String nodeTypeName, Contents reference) {
    // 1. Check if it's in the current library (no additional import needed)
    if (reference.classes.containsKey(nodeTypeName)) {
      return null;
    }

    // 2. Search in imported libraries (like mock_data_func.dart does)
    for (final lib in reference.importedLibraries) {
      for (final el in lib.topLevelElements) {
        if ((el is ClassElement || el is EnumElement) && el.name == nodeTypeName) {
          return lib.librarySource.uri.toString();
        }
      }
    }

    // Not found - this might be a problem, but we'll let the analyzer catch it
    return null;
  }

  /// Finds the library URI where a field's type is defined.
  /// Returns null if the type is in the current library or not found.
  String? _findFieldTypeLibraryUri(FieldElement field, Contents reference) {
    final fieldType = field.type.getDisplayString();
    final cleanTypeName = fieldType.replaceAll('?', '');

    // 1. Check if it's in the current library (no additional import needed)
    if (reference.classes.containsKey(cleanTypeName)) {
      return null;
    }

    // 2. Search in imported libraries
    for (final lib in reference.importedLibraries) {
      // Skip dart:core - primitive types don't need explicit imports
      if (lib.librarySource.uri.toString() == 'dart:core') {
        continue;
      }

      for (final el in lib.topLevelElements) {
        if ((el is ClassElement || el is EnumElement) && el.name == cleanTypeName) {
          return lib.librarySource.uri.toString();
        }
      }
    }

    // Not found - this might be a problem, but we'll let the analyzer catch it
    return null;
  }
}
