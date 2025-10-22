import 'package:gql/ast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fenv_graphql_core/fenv_graphql_core.dart';

/// A function that updates the existing query result with the new data that is
/// fetched by the given [options].
///
/// [FetchMore] of `graphql_flutter` package does not provide a very type-safe
/// way to update the existing query result. But, it forces to manipulate the
/// raw JSON data.
///
/// In contrast, this function provides a type-safe way to update the existing
/// query result with [TypedUpdateQuery] function.
typedef StrictFetchMore<TParsed, TVariables> =
    Future<QueryResult<TParsed>> Function(
      StrictFetchMoreOptions<TParsed, TVariables> options,
    );

/// Options for [StrictFetchMore] function.
class StrictFetchMoreOptions<TParsed, TVariables> {
  StrictFetchMoreOptions({
    required this.updateQuery,
    this.document,
    this.variables,
  });

  final DocumentNode? document;
  final TVariables? variables;

  /// A function that updates the existing query result with the new data in a
  /// type-safe way.
  final TypedUpdateQuery<TParsed> updateQuery;
}

/// A function that returns the reduced data from the [previousResultData] and
/// the new [fetchMoreResultData].
///
/// [previousResultData] is the data that is already fetched by the query and
/// cached.
///
/// [fetchMoreResultData] is the new data that is fetched by the
/// [StrictQueryHookResult.fetchMore].
typedef TypedUpdateQuery<TParsed> =
    TParsed Function(TParsed previousResultData, TParsed fetchMoreResultData);
