import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

/// Information about a connection field found in the query type.
class _ConnectionInfo {
  const _ConnectionInfo({
    required this.fieldPath,
    required this.connectionType,
    required this.hasNullableSegments,
  });

  /// Dot-separated path to the connection field (e.g., "fastTimelineOffers"
  /// or "recommendedOffers.offers").
  final String fieldPath;

  /// The InterfaceType of the connection.
  final InterfaceType connectionType;

  /// Whether any segment in the path is nullable.
  final bool hasNullableSegments;
}

/// Extension on [MethodElement] to analyze pagination structure in GraphQL queries.
///
/// Provides utilities to detect and extract information about paginated queries
/// following the Relay Cursor Connections Specification.
extension PaginationAnalysisExtension on MethodElement {
  /// Finds connection information in the query result.
  ///
  /// Recursively searches the query type for a connection field at any depth.
  /// Returns null if no connection is found.
  _ConnectionInfo? _findConnection() {
    final queryType = _getQueryType();
    if (queryType == null) return null;

    return _findConnectionInType(queryType, []);
  }

  /// Whether this query method returns a paginated result.
  ///
  /// Returns true if the query result contains a connection type with both
  /// edges and pageInfo fields.
  bool get isPaginated => _findConnection() != null;

  /// Path to the connection field in the query result.
  ///
  /// Returns the field path that contains the connection structure
  /// (e.g., "fastTimelineOffers" or "recommendedOffers.offers"),
  /// or null if not paginated.
  String? get connectionFieldPath => _findConnection()?.fieldPath;

  /// Generates a safe path with null-aware operators where needed.
  ///
  /// If the connection has nullable segments, uses '?.' for safe access.
  String? _generateSafePath(String? basePath) {
    if (basePath == null) return null;

    final connection = _findConnection();
    if (connection == null || !connection.hasNullableSegments) {
      return basePath;
    }

    final queryType = _getQueryType();
    if (queryType == null) return basePath;

    return _buildPathWithNullSafeAccess(queryType, basePath.split('.'));
  }

  /// Builds a path string with null-aware operators for nullable fields.
  String _buildPathWithNullSafeAccess(
    InterfaceType type,
    List<String> pathSegments,
  ) {
    if (pathSegments.isEmpty) return '';

    final buffer = StringBuffer();
    InterfaceType currentType = type;
    bool previousWasNullable = false;

    for (var i = 0; i < pathSegments.length; i++) {
      final segment = pathSegments[i];

      // Find the field in current type
      final field = currentType.element.fields
          .where((f) => f.name == segment)
          .firstOrNull;

      if (field == null) break;

      // Add operator before this segment (except for the first one)
      if (i > 0) {
        buffer.write(previousWasNullable ? '?.' : '.');
      }
      buffer.write(segment);

      // Check if current field is nullable for next iteration
      previousWasNullable = field.type.getDisplayString().endsWith('?');

      // Update current type for next iteration
      if (field.type is InterfaceType) {
        currentType = field.type as InterfaceType;
      }
    }

    return buffer.toString();
  }

  /// The node type from the connection's edges.
  ///
  /// Returns the type of nodes in the edges array
  /// (e.g., Fragment$TimelineOfferCard), or null if not paginated.
  DartType? get nodeType {
    final connection = _findConnection();
    if (connection == null) return null;

    final connectionType = connection.connectionType;

    // Find edges field
    final edgesField = connectionType.element.fields
        .where((f) => f.name == 'edges')
        .firstOrNull;

    if (edgesField == null) return null;

    final edgesType = edgesField.type;
    if (edgesType is! InterfaceType) return null;

    // Extract Edge type from List<Edge?>
    final edgeType = edgesType.typeArguments.firstOrNull;
    if (edgeType is! InterfaceType) return null;

    // Find node field in Edge
    final nodeField = edgeType.element.fields
        .where((f) => f.name == 'node')
        .firstOrNull;

    return nodeField?.type;
  }

  /// Reference path to hasNextPage field.
  ///
  /// Returns a dot-separated path like "fastTimelineOffers.pageInfo.hasNextPage"
  /// or "publicWorkplace?.experienceStories.pageInfo.hasNextPage ?? false"
  /// (with null-aware operators and fallback for nullable fields),
  /// or null if not paginated.
  String? get hasNextPagePath {
    final field = connectionFieldPath;
    if (field == null) return null;
    final safePath = _generateSafePath(field);
    final connection = _findConnection();

    // If there are nullable segments, add ?? false fallback
    if (connection != null && connection.hasNullableSegments) {
      return '$safePath.pageInfo.hasNextPage ?? false';
    }
    return '$safePath.pageInfo.hasNextPage';
  }

  /// Reference path to endCursor field.
  ///
  /// Returns a dot-separated path like "fastTimelineOffers.pageInfo.endCursor"
  /// or "publicWorkplace?.experienceStories.pageInfo.endCursor" (with null-aware
  /// operators for nullable fields), or null if not paginated.
  String? get endCursorPath {
    final field = connectionFieldPath;
    if (field == null) return null;
    final safePath = _generateSafePath(field);
    return '$safePath.pageInfo.endCursor';
  }

  /// Reference path to edges field.
  ///
  /// Returns a dot-separated path like "fastTimelineOffers.edges"
  /// or "publicWorkplace?.experienceStories.edges" (with null-aware operators
  /// for nullable fields), or null if not paginated.
  String? get edgesPath {
    final field = connectionFieldPath;
    if (field == null) return null;
    final safePath = _generateSafePath(field);
    return '$safePath.edges';
  }

  /// Display string of the edges type.
  ///
  /// Returns the full type string like "List&lt;Fragment\$TimelineOfferEdge?&gt;?",
  /// or null if not paginated.
  String? get edgesTypeDisplayString {
    final connection = _findConnection();
    if (connection == null) return null;

    final connectionType = connection.connectionType;

    // Find edges field
    final edgesField = connectionType.element.fields
        .where((f) => f.name == 'edges')
        .firstOrNull;

    return edgesField?.type.getDisplayString();
  }

  /// Recursively searches for a connection type within [type].
  ///
  /// [pathSegments] tracks the field path to reach the current type.
  /// [hasNullableInPath] tracks if any field in the path so far is nullable.
  /// Returns the first connection found, or null if none exists.
  _ConnectionInfo? _findConnectionInType(
    InterfaceType type,
    List<String> pathSegments, {
    int maxDepth = 3,
    bool hasNullableInPath = false,
  }) {
    // Prevent infinite recursion
    if (pathSegments.length >= maxDepth) return null;

    final fields = type.element.fields;

    for (final field in fields) {
      // Skip special fields
      if (field.name?.startsWith('\$') ?? false) continue;

      // Check if field type ends with '?' (is nullable)
      final isFieldNullable = field.type.getDisplayString().endsWith('?');
      final updatedHasNullable = hasNullableInPath || isFieldNullable;

      // Check if this field itself is a connection
      if (_isConnectionType(field.type)) {
        final fieldPath = [...pathSegments, field.name].join('.');
        return _ConnectionInfo(
          fieldPath: fieldPath,
          connectionType: field.type as InterfaceType,
          hasNullableSegments: updatedHasNullable,
        );
      }

      // Recursively search nested types
      if (field.type is InterfaceType) {
        final nestedType = field.type as InterfaceType;
        final nestedResult = _findConnectionInType(
          nestedType,
          [...pathSegments, ?field.name],
          maxDepth: maxDepth,
          hasNullableInPath: updatedHasNullable,
        );
        if (nestedResult != null) {
          return nestedResult;
        }
      }
    }

    return null;
  }

  /// Extracts the Query$Xxxx type from the method's return type.
  ///
  /// Expects return type: `Future<QueryResult<Query$Xxxx>>`
  InterfaceType? _getQueryType() {
    final returnType = this.returnType;

    // Extract QueryResult<Query$Xxxx> from Future<QueryResult<Query$Xxxx>>
    if (returnType is! InterfaceType) return null;

    final futureTypeArgs = returnType.typeArguments;
    if (futureTypeArgs.isEmpty) return null;

    // This should be QueryResult<Query$Xxxx>
    final queryResultType = futureTypeArgs.first;
    if (queryResultType is! InterfaceType) return null;

    // Extract Query$Xxxx from QueryResult<Query$Xxxx>
    final queryResultTypeArgs = queryResultType.typeArguments;
    if (queryResultTypeArgs.isEmpty) return null;

    final actualQueryType = queryResultTypeArgs.first;
    if (actualQueryType is! InterfaceType) return null;

    return actualQueryType;
  }

  /// Whether [type] is a Connection type.
  ///
  /// A connection type must have both edges and pageInfo fields.
  bool _isConnectionType(DartType type) {
    if (type is! InterfaceType) return false;

    final element = type.element;
    final fields = element.fields;

    // Check for edges field
    final hasEdges = fields.any(
      (f) => f.name == 'edges' && _isListType(f.type),
    );

    // Check for pageInfo field
    final hasPageInfo = fields.any(
      (f) => f.name == 'pageInfo' && _hasPageInfoFields(f.type),
    );

    return hasEdges && hasPageInfo;
  }

  /// Whether [type] is a List type.
  bool _isListType(DartType type) {
    if (type is! InterfaceType) return false;
    return type.element.name == 'List';
  }

  /// Whether [type] has PageInfo fields (hasNextPage and endCursor).
  bool _hasPageInfoFields(DartType type) {
    if (type is! InterfaceType) return false;

    final element = type.element;
    final fields = element.fields;

    final hasNextPage = fields.any(
      (f) => f.name == 'hasNextPage' && f.type.isDartCoreBool,
    );

    final hasEndCursor = fields.any((f) => f.name == 'endCursor');

    return hasNextPage && hasEndCursor;
  }

  /// Returns the parent type that contains the connection field.
  ///
  /// For example, if the connection is at "recommendedOffers.offers",
  /// this returns the type of "recommendedOffers".
  InterfaceType? get connectionParentType {
    final connection = _findConnection();
    if (connection == null) return null;

    final queryType = _getQueryType();
    if (queryType == null) return null;

    final pathParts = connection.fieldPath.split('.');
    if (pathParts.isEmpty) return null;

    // If connection is at top level (e.g., "items"), return query type
    if (pathParts.length == 1) return queryType;

    // Navigate to parent type (all but last segment)
    InterfaceType currentType = queryType;
    for (var i = 0; i < pathParts.length - 1; i++) {
      final fieldName = pathParts[i];
      final field = currentType.element.fields
          .where((f) => f.name == fieldName)
          .firstOrNull;

      if (field == null || field.type is! InterfaceType) return null;
      currentType = field.type as InterfaceType;
    }

    return currentType;
  }

  /// Returns extra (non-connection) fields at the connection parent level.
  ///
  /// Returns empty list if no extra fields exist.
  List<FieldElement> get extraFields {
    final connection = _findConnection();
    if (connection == null) return [];

    final parentType = connectionParentType;
    if (parentType == null) return [];

    final connectionFieldName = connection.fieldPath.split('.').last;

    // List of field names inherited from Object that should be excluded
    const objectFields = {'hashCode', 'runtimeType'};

    // Return all fields except:
    // - The connection field itself
    // - Special fields (starting with $)
    // - Inherited fields from Object (hashCode, runtimeType)
    // - Synthetic fields (generated by the analyzer)
    return parentType.element.fields
        .where(
          (f) =>
              f.name != connectionFieldName &&
              f.name?.startsWith('\$') != true &&
              !objectFields.contains(f.name) &&
              !f.isSynthetic,
        )
        .toList();
  }

  /// Whether this paginated query has extra fields alongside the connection.
  bool get hasExtraFields => extraFields.isNotEmpty;

  /// Returns a null-safe path to the connection parent.
  ///
  /// For example, if connection is at "recommendedOffers.offers",
  /// this returns "recommendedOffers" or "publicWorkplace?.experienceStories"
  /// with null-aware operators as needed.
  String? get connectionParentPath {
    final field = connectionFieldPath;
    if (field == null) return null;

    final pathParts = field.split('.');

    // If connection is at top level, return null (no parent path needed)
    if (pathParts.length == 1) return null;

    // Get path to parent (all but last segment)
    final parentPath = pathParts.sublist(0, pathParts.length - 1).join('.');

    // Apply null-safe navigation
    return _generateSafePath(parentPath);
  }

  /// Returns all non-connection fields at the Query root level.
  ///
  /// These are sibling fields to the connection path that should be preserved
  /// as extra data. Excludes special fields (starting with $), synthetic fields,
  /// and inherited Object fields.
  List<FieldElement> get rootLevelExtraFields {
    final connection = _findConnection();
    if (connection == null) return [];

    final queryType = _getQueryType();
    if (queryType == null) return [];

    final pathParts = connection.fieldPath.split('.');
    final connectionRootFieldName = pathParts.first;

    // List of field names inherited from Object that should be excluded
    const objectFields = {'hashCode', 'runtimeType'};

    // Return all root-level fields except:
    // - The connection root field itself (or its parent if nested)
    // - Special fields (starting with $)
    // - Inherited fields from Object (hashCode, runtimeType)
    // - Synthetic fields (generated by the analyzer)
    return queryType.element.fields
        .where(
          (f) =>
              f.name != connectionRootFieldName &&
              f.name?.startsWith('\$') != true &&
              !objectFields.contains(f.name) &&
              !f.isSynthetic,
        )
        .toList();
  }

  /// Whether the connection parent path contains any nullable segments.
  ///
  /// Returns true if any field in the path from Query root to the connection
  /// parent is nullable. Returns false if connection is at root level.
  bool get isConnectionParentNullable {
    final connection = _findConnection();
    if (connection == null) return false;

    return connection.hasNullableSegments;
  }

  /// Returns the simple name of the connection parent field.
  ///
  /// For example, if connection is at "recommendedOffers.offers",
  /// returns "recommendedOffers". For "offer.workplace.experienceStories",
  /// returns "workplace" (the immediate parent). Returns null if connection
  /// is at root level.
  String? get connectionParentFieldName {
    final field = connectionFieldPath;
    if (field == null) return null;

    final pathParts = field.split('.');
    if (pathParts.length == 1) return null;

    // Return the immediate parent (second to last segment)
    return pathParts[pathParts.length - 2];
  }

  /// Returns the full path to the connection parent, using $ as separator.
  ///
  /// For example, if connection is at "recommendedOffers.offers",
  /// returns "recommendedOffers". For "offer.workplace.experienceStories",
  /// returns "offer$workplace". This is suitable for use in typedef names.
  /// Returns null if connection is at root level.
  String? get connectionParentFullPath {
    final field = connectionFieldPath;
    if (field == null) return null;

    final pathParts = field.split('.');
    if (pathParts.length == 1) return null;

    // Get path to parent (all but last segment), joined with $
    return pathParts.sublist(0, pathParts.length - 1).join('\$');
  }
}
