import 'package:fenv_graphql_core/src/predefined_states/query_state.dart';
import 'package:fenv_graphql_core/src/query_runner/fetcher.dart';
import 'package:fenv_graphql_core/src/query_runner/refetch_result.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;

abstract interface class QueryRunner<
  TData extends Object,
  TOptions extends QueryOptions?
>
    implements foundation.ValueListenable<TData> {
  static UntypedQueryRunnerBuilder builder() =>
      const UntypedQueryRunnerBuilder();

  Future<void> start(TOptions options, {required bool retryOnNetworkError});

  Future<RefetchResult> refetch(TOptions options, {required bool forceRefetch});

  void disable();

  void reset();

  void dispose();
}

final class _QueryRunnerImpl<
  TResult extends Object,
  TOptions extends QueryOptions<TResult>?
>
    extends foundation.ValueNotifier<QueryState<TResult>>
    implements QueryRunner<QueryState<TResult>, TOptions> {
  _QueryRunnerImpl(this._fetcherFactory) : super(const QueryState.created());

  final FetcherFactory<TResult, TOptions> _fetcherFactory;

  Fetcher<TResult, TOptions> get fetch => _fetcherFactory.fetcher;

  @internal
  @override
  set value(QueryState<TResult> newValue) {
    super.value = newValue;
  }

  @override
  Future<void> start(
    TOptions options, {
    required bool retryOnNetworkError,
  }) async {
    final oldState = value;
    final int myQuerySession;
    switch (oldState) {
      case QueryState$Created(myQuerySession: final oldQuerySession) ||
          QueryState$InitialLoadingFailed(
            myQuerySession: final oldQuerySession,
          ):
        // Proceed
        myQuerySession = oldQuerySession + 1;

      case _:
        // Do nothing
        return;
    }

    // Trampoline once not to modify the state in the build method.
    await null;

    if (value.myQuerySession != myQuerySession - 1) {
      // Stale session, do nothing
      return;
    }

    final intermediateState = QueryState<TResult>.initialLoading(
      myQuerySession: myQuerySession,
    );
    value = intermediateState;

    final result = await fetch(
      options: options,
      retryOnNetworkError: retryOnNetworkError,
    );

    if (value.myQuerySession != myQuerySession) {
      // Stale result, do nothing
      return;
    }

    if (result.hasException) {
      value = QueryState<TResult>.initialLoadingFailed(
        result.exception!,
        myQuerySession: myQuerySession,
      );
      return;
    }

    value = QueryState<TResult>.loaded(
      result.parsedData,
      myQuerySession: myQuerySession,
      isRefetching: false,
    );
  }

  @override
  Future<RefetchResult> refetch(
    TOptions options, {
    required bool forceRefetch,
  }) async {
    final int myQuerySession;
    final TResult? oldData;
    switch (value) {
      case QueryState$Created() ||
          QueryState$InitialLoading() ||
          QueryState$InitialLoadingFailed() ||
          QueryState$Disabled():
        // Do nothing
        return const RefetchResult.ignored();

      case QueryState$Loaded(
        :final data,
        myQuerySession: final oldQuerySession,
        isRefetching: false,
      ):
        // Proceed
        myQuerySession = oldQuerySession + 1;
        oldData = data;

      case QueryState$Loaded(:final data, myQuerySession: final oldQuerySession)
          when forceRefetch:
        // Proceed, even if isRefetching is true
        myQuerySession = oldQuerySession + 1;
        oldData = data;

      case QueryState$Loaded():
        // Do nothing
        return const RefetchResult.ignored();
    }

    final intermediateState = QueryState<TResult>.loaded(
      oldData,
      myQuerySession: myQuerySession,
      isRefetching: true,
    );
    value = intermediateState;

    final result = await fetch(options: options, retryOnNetworkError: false);
    if (value.myQuerySession != myQuerySession) {
      // Stale result, do nothing
      return const RefetchResult.cancelled();
    }

    value = QueryState<TResult>.loaded(
      result.hasException ? oldData : result.parsedData!,
      myQuerySession: myQuerySession,
      isRefetching: false,
    );

    if (result.hasException) {
      return RefetchResult.failed(result.exception);
    }

    return const RefetchResult.succeeded();
  }

  @override
  void disable() {
    if (value is! QueryState$Disabled) {
      value = QueryState<TResult>.disabled(
        myQuerySession: value.myQuerySession + 1,
      );
    }
  }

  @override
  void reset() {
    if (value is! QueryState$Created) {
      value = QueryState<TResult>.created(
        myQuerySession: value.myQuerySession + 1,
      );
    }
  }
}

class _TransformedQueryRunner<
  TDataIn extends Object,
  TDataOut extends Object,
  TOptions extends QueryOptions?
>
    extends foundation.ValueListenable<TDataOut>
    implements QueryRunner<TDataOut, TOptions> {
  _TransformedQueryRunner(this._delegate, this._mapper);

  final QueryRunner<TDataIn, TOptions> _delegate;
  final TDataOut Function(TDataIn) _mapper;

  @override
  TDataOut get value {
    return _mapper(_delegate.value);
  }

  @override
  void addListener(foundation.VoidCallback listener) =>
      _delegate.addListener(listener);

  @override
  void disable() => _delegate.disable();

  @override
  void dispose() => _delegate.dispose();

  @override
  Future<RefetchResult> refetch(
    TOptions options, {
    required bool forceRefetch,
  }) => _delegate.refetch(options, forceRefetch: forceRefetch);

  @override
  void removeListener(foundation.VoidCallback listener) =>
      _delegate.removeListener(listener);

  @override
  void reset() => _delegate.reset();

  @override
  Future<void> start(TOptions options, {required bool retryOnNetworkError}) =>
      _delegate.start(options, retryOnNetworkError: retryOnNetworkError);
}

final class UntypedQueryRunnerBuilder {
  const UntypedQueryRunnerBuilder();

  QueryRunnerBuilder<QueryState<TResult>, TOptions> queryOperation<
    TResult extends Object,
    TOptions extends QueryOptions<TResult>?
  >(FetcherFactory<TResult, TOptions> operation) =>
      _NonMappedQueryRunnerBuilder<TResult, TOptions>(operation);

  QueryRunnerBuilder<QueryState<TResult>, TOptions> queryOperationSupplier<
    TResult extends Object,
    TOptions extends QueryOptions<TResult>?
  >(FetcherFactory<TResult, TOptions> Function() operationSupplier) =>
      _NonMappedQueryRunnerBuilder<TResult, TOptions>(
        FetcherFactory<TResult, TOptions>.fromSupplier(operationSupplier),
      );
}

abstract interface class QueryRunnerBuilder<
  TData extends Object,
  TOptions extends QueryOptions?
> {
  QueryRunnerBuilder<TMapped, TOptions> transform<TMapped extends Object>(
    TMapped Function(TData) mapper,
  );

  StateApplyingQueryRunnerBuilder<TData, TOptions> applyTo(
    riverpod.Notifier<TData> notifier,
  );

  QueryRunner<TData, TOptions> build();
}

abstract interface class StateApplyingQueryRunnerBuilder<
  TData extends Object,
  TOptions extends QueryOptions?
> {
  QueryRunner<TData, TOptions> build();
}

final class _NonMappedQueryRunnerBuilder<
  TResult extends Object,
  TOptions extends QueryOptions<TResult>?
>
    implements QueryRunnerBuilder<QueryState<TResult>, TOptions> {
  _NonMappedQueryRunnerBuilder(this._fetcherFactory);

  final FetcherFactory<TResult, TOptions> _fetcherFactory;

  @override
  QueryRunner<QueryState<TResult>, TOptions> build() =>
      _QueryRunnerImpl<TResult, TOptions>(_fetcherFactory);

  @override
  QueryRunnerBuilder<TMapped, TOptions> transform<TMapped extends Object>(
    TMapped Function(QueryState<TResult>) mapper,
  ) => _TransformedQueryRunnerBuilder<QueryState<TResult>, TMapped, TOptions>(
    this,
    mapper,
  );

  @override
  StateApplyingQueryRunnerBuilder<QueryState<TResult>, TOptions> applyTo(
    riverpod.Notifier<QueryState<TResult>> notifier,
  ) => _StateApplyingQueryRunnerBuilder<QueryState<TResult>, TOptions>(
    this,
    notifier,
  );
}

final class _TransformedQueryRunnerBuilder<
  TDataIn extends Object,
  TDataOut extends Object,
  TOptions extends QueryOptions?
>
    implements QueryRunnerBuilder<TDataOut, TOptions> {
  _TransformedQueryRunnerBuilder(this._delegate, this._mapper);

  final QueryRunnerBuilder<TDataIn, TOptions> _delegate;
  final TDataOut Function(TDataIn) _mapper;

  @override
  QueryRunner<TDataOut, TOptions> build() =>
      _TransformedQueryRunner<TDataIn, TDataOut, TOptions>(
        _delegate.build(),
        _mapper,
      );

  @override
  QueryRunnerBuilder<TMapped, TOptions> transform<TMapped extends Object>(
    TMapped Function(TDataOut) mapper,
  ) => _TransformedQueryRunnerBuilder<TDataIn, TMapped, TOptions>(
    _delegate,
    (TDataIn data) => mapper(_mapper(data)),
  );

  @override
  StateApplyingQueryRunnerBuilder<TDataOut, TOptions> applyTo(
    riverpod.Notifier<TDataOut> notifier,
  ) => _StateApplyingQueryRunnerBuilder<TDataOut, TOptions>(this, notifier);
}

final class _StateApplyingQueryRunnerBuilder<
  TData extends Object,
  TOptions extends QueryOptions?
>
    implements StateApplyingQueryRunnerBuilder<TData, TOptions> {
  _StateApplyingQueryRunnerBuilder(this._delegate, this._notifier);

  final QueryRunnerBuilder<TData, TOptions> _delegate;
  final riverpod.Notifier<TData> _notifier;

  @override
  QueryRunner<TData, TOptions> build() {
    final runner = _delegate.build();
    runner.addListener(() {
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      _notifier.state = runner.value;
    });
    // ignore: invalid_use_of_protected_member
    _notifier.ref.onDispose(runner.dispose);
    return runner;
  }
}
