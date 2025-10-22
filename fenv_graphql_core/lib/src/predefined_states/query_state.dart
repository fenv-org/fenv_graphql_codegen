import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql/client.dart';
import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:fenv_graphql_core/src/predefined_states/query_session.dart';

part 'query_state.freezed.dart';

@includeInBarrelFile
@Freezed(
  map: FreezedMapOptions(map: false, mapOrNull: false, maybeMap: false),
  when: FreezedWhenOptions(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class QueryState<TData extends Object>
    with _$QueryState<TData>
    implements QuerySession {
  const factory QueryState.created({@Default(0) int myQuerySession}) = _Created;

  const factory QueryState.initialLoading({required int myQuerySession}) =
      _InitialLoading;

  const factory QueryState.initialLoadingFailed(
    OperationException error, {
    required int myQuerySession,
  }) = _InitialLoadingFailed;

  const factory QueryState.loaded(
    TData? data, {
    required int myQuerySession,
    required bool isRefetching,
  }) = _Loaded<TData>;

  const factory QueryState.disabled({required int myQuerySession}) = _Disabled;

  const QueryState._();
}

@includeInBarrelFile
typedef QueryState$Created<TData extends Object> = _Created<TData>;
@includeInBarrelFile
typedef QueryState$InitialLoading<TData extends Object> =
    _InitialLoading<TData>;
@includeInBarrelFile
typedef QueryState$InitialLoadingFailed<TData extends Object> =
    _InitialLoadingFailed<TData>;
@includeInBarrelFile
typedef QueryState$Loaded<TData extends Object> = _Loaded<TData>;
@includeInBarrelFile
typedef QueryState$Disabled<TData extends Object> = _Disabled<TData>;
