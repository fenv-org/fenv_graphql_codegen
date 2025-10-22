import 'package:graphql/client.dart';
import 'package:fenv_graphql_core/src/query_runner/pagination_meta_extractor.dart';
import 'package:fenv_graphql_core/src/query_runner/simple_query_operation.dart';

/// Interface for paginated GraphQL query operations.
///
/// Extends [SimpleQueryOperation] to add pagination capabilities through
/// [PaginationMetaExtractorFactory]. A paginated query operation can extract
/// pagination metadata (hasNextPage, endCursor, nodes) and extra fields
/// from query results.
///
/// This interface models the relationship that every paginated query IS-A
/// simple query with additional pagination capabilities.
///
/// Type parameters:
/// - [TResult]: The type of the parsed query result
/// - [TOptions]: The type of query options, extending [QueryOptions]
/// - [TNode]: The type of individual nodes in the paginated list
/// - [TExtra]: The type of extra fields alongside the connection (use [void] if none)
abstract class PaginatedQueryOperation<
  TResult extends Object,
  TOptions extends QueryOptions<TResult>?,
  TNode extends Object,
  TExtra
>
    extends SimpleQueryOperation<TResult, TOptions>
    implements PaginationMetaExtractorFactory<TResult, TNode, TExtra> {}
