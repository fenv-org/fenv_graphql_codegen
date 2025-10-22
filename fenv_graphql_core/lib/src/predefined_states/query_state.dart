import 'package:fenv_graphql_core/src/predefined_states/query_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql/client.dart';

part 'query_state.freezed.dart';

@Freezed(
  map: FreezedMapOptions(map: false, mapOrNull: false, maybeMap: false),
  when: FreezedWhenOptions(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class QueryState<TData extends Object>
    with _$QueryState<TData>
    implements QuerySession {
  const factory QueryState.created({@Default(0) int myQuerySession}) =
      QueryState$Created;

  const factory QueryState.initialLoading({required int myQuerySession}) =
      QueryState$InitialLoading;

  const factory QueryState.initialLoadingFailed(
    OperationException error, {
    required int myQuerySession,
  }) = QueryState$InitialLoadingFailed;

  const factory QueryState.loaded(
    TData? data, {
    required int myQuerySession,
    required bool isRefetching,
  }) = QueryState$Loaded<TData>;

  const factory QueryState.disabled({required int myQuerySession}) =
      QueryState$Disabled;

  const QueryState._();
}
