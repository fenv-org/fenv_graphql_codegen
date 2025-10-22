import 'package:graphql/client.dart';
import 'package:fenv_graphql_core/src/query_runner/fetcher.dart';

/// Base interface for GraphQL query operations.
///
/// Represents a simple query operation that provides a fetcher for executing
/// GraphQL queries. This is the base interface for all query operations.
///
/// Type parameters:
/// - [TResult]: The type of the parsed query result
/// - [TOptions]: The type of query options, extending [QueryOptions]
abstract class SimpleQueryOperation<
  TResult extends Object,
  TOptions extends QueryOptions<TResult>?
>
    implements FetcherFactory<TResult, TOptions> {}
