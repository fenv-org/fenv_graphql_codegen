import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql/client.dart';
import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:fenv_graphql_core/src/predefined_states/query_session.dart';

part 'paginated_query_state.freezed.dart';

@includeInBarrelFile
@Freezed(
  map: FreezedMapOptions(map: false, mapOrNull: false, maybeMap: false),
  when: FreezedWhenOptions(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class PaginatedQueryState<TData extends Object, TExtra extends Object>
    with _$PaginatedQueryState<TData, TExtra>
    implements QuerySession {
  const factory PaginatedQueryState.created({@Default(0) int myQuerySession}) =
      _Created;

  const factory PaginatedQueryState.initialLoading({
    required int myQuerySession,
  }) = _InitialLoading;

  const factory PaginatedQueryState.initialLoadingFailed(
    OperationException error, {
    required int myQuerySession,
  }) = _InitialLoadingFailed;

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
  }) = _Loaded<TData, TExtra>;

  const factory PaginatedQueryState.disabled({required int myQuerySession}) =
      _Disabled;

  const PaginatedQueryState._();
}

@includeInBarrelFile
typedef PaginatedQueryState$Created<
  TData extends Object,
  TExtra extends Object
> = _Created<TData, TExtra>;
@includeInBarrelFile
typedef PaginatedQueryState$InitialLoading<
  TData extends Object,
  TExtra extends Object
> = _InitialLoading<TData, TExtra>;
@includeInBarrelFile
typedef PaginatedQueryState$InitialLoadingFailed<
  TData extends Object,
  TExtra extends Object
> = _InitialLoadingFailed<TData, TExtra>;
@includeInBarrelFile
typedef PaginatedQueryState$Loaded<
  TData extends Object,
  TExtra extends Object
> = _Loaded<TData, TExtra>;
@includeInBarrelFile
typedef PaginatedQueryState$Disabled<
  TData extends Object,
  TExtra extends Object
> = _Disabled<TData, TExtra>;
