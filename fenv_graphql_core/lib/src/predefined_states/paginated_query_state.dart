import 'package:fenv_graphql_core/src/predefined_states/query_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql/client.dart';

part 'paginated_query_state.freezed.dart';

/// Represents the state of a paginated GraphQL query.
///
/// Tracks the lifecycle of a paginated query from creation through loading,
/// loaded states with pagination metadata, and disabled states. This state
/// machine ensures type-safe pagination with cursor-based navigation.
@Freezed(
  map: FreezedMapOptions(map: false, mapOrNull: false, maybeMap: false),
  when: FreezedWhenOptions(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class PaginatedQueryState<TData extends Object, TExtra extends Object>
    with _$PaginatedQueryState<TData, TExtra>
    implements QuerySession {
  /// The initial state before any query has been started.
  const factory PaginatedQueryState.created({@Default(0) int myQuerySession}) =
      PaginatedQueryState$Created;

  /// The query is loading for the first time.
  const factory PaginatedQueryState.initialLoading({
    required int myQuerySession,
  }) = PaginatedQueryState$InitialLoading;

  /// The initial load failed with an error.
  const factory PaginatedQueryState.initialLoadingFailed(
    OperationException error, {
    required int myQuerySession,
  }) = PaginatedQueryState$InitialLoadingFailed;

  /// The query has loaded successfully and is idle.
  factory PaginatedQueryState.loadedIdle(
    List<TData> data,
    TExtra? extra, {
    required int myQuerySession,
    required String? endCursor,
    required bool hasMore,
  }) => PaginatedQueryState._loaded(
    data,
    extra: extra,
    myQuerySession: myQuerySession,
    isRefetching: false,
    isFetchingMore: false,
    endCursor: endCursor,
    hasMore: hasMore,
  );

  /// The query is refetching to get updated data.
  factory PaginatedQueryState.refetching(
    List<TData> data,
    TExtra? extra, {
    required int myQuerySession,
    required String? endCursor,
    required bool hasMore,
  }) => PaginatedQueryState._loaded(
    data,
    extra: extra,
    myQuerySession: myQuerySession,
    isRefetching: true,
    isFetchingMore: false,
    endCursor: endCursor,
    hasMore: hasMore,
  );

  /// The query is fetching more paginated data.
  factory PaginatedQueryState.fetchingMore(
    List<TData> data,
    TExtra? extra, {
    required int myQuerySession,
    required String? endCursor,
    required bool hasMore,
  }) => PaginatedQueryState._loaded(
    data,
    extra: extra,
    myQuerySession: myQuerySession,
    isRefetching: false,
    isFetchingMore: true,
    endCursor: endCursor,
    hasMore: hasMore,
  );

  @Assert(
    '!isRefetching || !isFetchingMore',
    'Cannot be refetching and fetching more at the same time.',
  )
  @Assert(
    '!hasMore || endCursor != null',
    'endCursor must be set if hasMore is true.',
  )
  const factory PaginatedQueryState._loaded(
    List<TData> data, {
    required TExtra? extra,
    required int myQuerySession,
    required bool isRefetching,
    required bool isFetchingMore,
    required String? endCursor,
    required bool hasMore,
  }) = PaginatedQueryState$Loaded<TData, TExtra>;

  /// The query has been disabled and will not execute.
  const factory PaginatedQueryState.disabled({required int myQuerySession}) =
      PaginatedQueryState$Disabled;

  const PaginatedQueryState._();
}
