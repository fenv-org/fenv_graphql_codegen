import 'package:fenv_graphql_core/src/predefined_states/query_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql/client.dart';

part 'query_state.freezed.dart';

/// Represents the state of a simple GraphQL query.
///
/// Tracks the lifecycle of a non-paginated query from creation through loading,
/// loaded states, and disabled states. This provides a simpler state machine
/// compared to [PaginatedQueryState] for queries without pagination.
@Freezed(
  map: FreezedMapOptions(map: false, mapOrNull: false, maybeMap: false),
  when: FreezedWhenOptions(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class QueryState<TData extends Object>
    with _$QueryState<TData>
    implements QuerySession {
  /// The initial state before any query has been started.
  const factory QueryState.created({@Default(0) int myQuerySession}) =
      QueryState$Created;

  /// The query is loading for the first time.
  const factory QueryState.initialLoading({required int myQuerySession}) =
      QueryState$InitialLoading;

  /// The initial load failed with an error.
  const factory QueryState.initialLoadingFailed(
    OperationException error, {
    required int myQuerySession,
  }) = QueryState$InitialLoadingFailed;

  /// The query has loaded successfully.
  const factory QueryState.loaded(
    TData? data, {
    required int myQuerySession,
    required bool isRefetching,
  }) = QueryState$Loaded<TData>;

  /// The query has been disabled and will not execute.
  const factory QueryState.disabled({required int myQuerySession}) =
      QueryState$Disabled;

  const QueryState._();
}
