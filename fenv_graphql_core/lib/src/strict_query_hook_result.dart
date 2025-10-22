import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fenv_graphql_core/src/strict_fetch_more.dart';

/// Result of a GraphQL query hook with type-safe operations.
///
/// Provides access to query results and type-safe methods for refetching
/// and fetching more data, improving upon graphql_flutter's raw JSON approach.
class StrictQueryHookResult<TParsed, TVariables> {
  /// Creates a query hook result with the given operations.
  factory StrictQueryHookResult({
    required QueryResult<TParsed> result,
    required Refetch<TParsed> refetch,
    required StrictFetchMore<TParsed, TVariables> fetchMore,
  }) => StrictQueryHookResult.fromResultSupplier(
    resultSupplier: () => result,
    refetch: refetch,
    fetchMore: fetchMore,
  );

  /// Creates a query hook result with a result supplier function.
  @visibleForTesting
  StrictQueryHookResult.fromResultSupplier({
    required QueryResult<TParsed> Function() resultSupplier,
    required this.refetch,
    required this.fetchMore,
  }) : _resultSupplier = resultSupplier;

  /// The current query result.
  QueryResult<TParsed> get result => _resultSupplier();

  /// Function to refetch the query.
  final Refetch<TParsed> refetch;

  /// Function to fetch more data with type-safe options.
  final StrictFetchMore<TParsed, TVariables> fetchMore;

  final QueryResult<TParsed> Function() _resultSupplier;
}
