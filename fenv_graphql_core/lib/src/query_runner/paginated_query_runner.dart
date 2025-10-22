import 'package:fenv_graphql_core/src/predefined_states/paginated_query_state.dart';
import 'package:fenv_graphql_core/src/query_runner/fetch_more_result.dart';
import 'package:fenv_graphql_core/src/query_runner/fetcher.dart';
import 'package:fenv_graphql_core/src/query_runner/pagination_meta_extractor.dart';
import 'package:fenv_graphql_core/src/query_runner/refetch_result.dart';
import 'package:fenv_graphql_core/src/utils/unmodifiable_list_slice.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;

abstract interface class PaginatedQueryRunner<
  TData extends Object,
  TExtra extends Object,
  TOptions extends QueryOptions?
>
    implements foundation.ValueListenable<TData> {
  static UntypedPaginatedQueryRunnerBuilder builder() =>
      const UntypedPaginatedQueryRunnerBuilder();

  Future<void> start(TOptions options, {required bool retryOnNetworkError});

  Future<FetchMoreResult> fetchMore(TOptions options);

  Future<RefetchResult> refetch(TOptions options, {required bool forceRefetch});

  void disable();

  void reset();

  void dispose();
}

final class _PaginatedQueryRunnerImpl<
  TResult extends Object,
  TOptions extends QueryOptions<TResult>?,
  TNode extends Object,
  TExtra extends Object
>
    extends foundation.ValueNotifier<PaginatedQueryState<TNode, TExtra>>
    implements
        PaginatedQueryRunner<
          PaginatedQueryState<TNode, TExtra>,
          TExtra,
          TOptions
        > {
  _PaginatedQueryRunnerImpl(this._fetcherFactory, this._extractorFactory)
    : super(const PaginatedQueryState.created());

  final FetcherFactory<TResult, TOptions> _fetcherFactory;
  final PaginationMetaExtractorFactory<TResult, TNode, TExtra>
  _extractorFactory;

  Fetcher<TResult, TOptions> get fetch => _fetcherFactory.fetcher;
  PaginationMetaExtractor<TResult, TNode, TExtra> get extractor =>
      _extractorFactory.extractor;

  @internal
  @override
  set value(PaginatedQueryState<TNode, TExtra> newValue) {
    super.value = newValue;
  }

  var _bufferedNodes = <TNode>[];

  @override
  Future<void> start(
    TOptions options, {
    required bool retryOnNetworkError,
  }) async {
    final oldState = value;
    final int myQuerySession;
    switch (oldState) {
      case PaginatedQueryState$Created(myQuerySession: final oldQuerySession) ||
          PaginatedQueryState$InitialLoadingFailed(
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

    final intermediateState = PaginatedQueryState<TNode, TExtra>.initialLoading(
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
      value = PaginatedQueryState<TNode, TExtra>.initialLoadingFailed(
        result.exception!,
        myQuerySession: myQuerySession,
      );
      return;
    }

    _bufferedNodes = result.parsedData == null
        ? <TNode>[]
        : <TNode>[...extractor.nodes(result.parsedData!)];
    value = PaginatedQueryState<TNode, TExtra>.loadedIdle(
      UnmodifiableListSlice.withAll(_bufferedNodes),
      result.parsedData == null ? null : extractor.extra(result.parsedData!),
      myQuerySession: myQuerySession,
      endCursor: result.parsedData == null
          ? null
          : extractor.endCursor(result.parsedData!),
      hasMore: result.parsedData == null
          ? false
          : extractor.hasNextPage(result.parsedData!),
    );
  }

  @override
  Future<FetchMoreResult> fetchMore(TOptions options) async {
    final oldState = value;
    final int myQuerySession;
    final String? endCursor;
    final List<TNode> oldData;
    final TExtra? oldExtra;
    switch (oldState) {
      case PaginatedQueryState$Loaded(
        :final data,
        :final extra,
        myQuerySession: final oldQuerySession,
        endCursor: final oldEndCursor,
        hasMore: true,
        isRefetching: false,
        isFetchingMore: false,
      ):
        // Proceed
        myQuerySession = oldQuerySession + 1;
        endCursor = oldEndCursor;
        oldData = data;
        oldExtra = extra;

      case _:
        // Do nothing
        return const FetchMoreResult.ignored();
    }

    final intermediateState = PaginatedQueryState<TNode, TExtra>.fetchingMore(
      oldData,
      oldExtra,
      myQuerySession: myQuerySession,
      endCursor: endCursor,
      hasMore: true,
    );
    value = intermediateState;

    final result = await fetch(options: options, retryOnNetworkError: false);

    if (value.myQuerySession != myQuerySession) {
      // Stale result, do nothing
      return const FetchMoreResult.cancelled();
    }

    final parsedData = result.parsedData;
    if (result.hasException) {
      value = PaginatedQueryState.loadedIdle(
        oldData,
        oldExtra,
        myQuerySession: myQuerySession,
        endCursor: endCursor,
        hasMore: true,
      );
      return FetchMoreResult.failed(result.exception);
    } else if (parsedData == null) {
      value = PaginatedQueryState.loadedIdle(
        oldData,
        oldExtra,
        myQuerySession: myQuerySession,
        endCursor: null,
        hasMore: false,
      );
      return const FetchMoreResult.succeeded();
    } else {
      _bufferedNodes.addAll(extractor.nodes(parsedData));
      value = PaginatedQueryState<TNode, TExtra>.loadedIdle(
        UnmodifiableListSlice.withAll(_bufferedNodes),
        extractor.extra(parsedData),
        myQuerySession: myQuerySession,
        endCursor: extractor.endCursor(parsedData),
        hasMore: extractor.hasNextPage(parsedData),
      );
      return const FetchMoreResult.succeeded();
    }
  }

  @override
  Future<RefetchResult> refetch(
    TOptions options, {
    required bool forceRefetch,
  }) async {
    // final oldState = value;
    final int myQuerySession;
    final List<TNode> oldData;
    final TExtra? oldExtra;
    final String? oldEndCursor;
    final bool oldHasMore;
    switch (value) {
      case PaginatedQueryState$Created() ||
          PaginatedQueryState$InitialLoading() ||
          PaginatedQueryState$InitialLoadingFailed() ||
          PaginatedQueryState$Disabled():
        // Do nothing
        return const RefetchResult.ignored();

      case PaginatedQueryState$Loaded(
        :final data,
        :final extra,
        myQuerySession: final oldQuerySession,
        isRefetching: false,
        :final endCursor,
        :final hasMore,
      ):
        // Proceed
        myQuerySession = oldQuerySession + 1;
        oldData = data;
        oldExtra = extra;
        oldEndCursor = endCursor;
        oldHasMore = hasMore;

      case PaginatedQueryState$Loaded(
            :final data,
            :final extra,
            myQuerySession: final oldQuerySession,
            :final endCursor,
            :final hasMore,
          )
          when forceRefetch:
        // Proceed, even if isRefetching is true
        myQuerySession = oldQuerySession + 1;
        oldData = data;
        oldExtra = extra;
        oldEndCursor = endCursor;
        oldHasMore = hasMore;

      case PaginatedQueryState$Loaded():
        // Do nothing
        return const RefetchResult.ignored();
    }

    final intermediateState = PaginatedQueryState<TNode, TExtra>.refetching(
      oldData,
      oldExtra,
      myQuerySession: myQuerySession,
      endCursor: oldEndCursor,
      hasMore: oldHasMore,
    );
    value = intermediateState;

    final result = await fetch(options: options, retryOnNetworkError: false);
    if (value.myQuerySession != myQuerySession) {
      // Stale result, do nothing
      return const RefetchResult.cancelled();
    }

    final parsedData = result.parsedData;
    if (result.hasException) {
      value = PaginatedQueryState.loadedIdle(
        oldData,
        oldExtra,
        myQuerySession: myQuerySession,
        endCursor: oldEndCursor,
        hasMore: oldHasMore,
      );
      return RefetchResult.failed(result.exception);
    } else if (parsedData == null) {
      _bufferedNodes = <TNode>[];
      value = PaginatedQueryState.loadedIdle(
        UnmodifiableListSlice.withAll(_bufferedNodes),
        null,
        myQuerySession: myQuerySession,
        endCursor: null,
        hasMore: false,
      );
      return const RefetchResult.succeeded();
    } else {
      _bufferedNodes = [...extractor.nodes(parsedData)];
      value = PaginatedQueryState<TNode, TExtra>.loadedIdle(
        UnmodifiableListSlice.withAll(_bufferedNodes),
        extractor.extra(parsedData),
        myQuerySession: myQuerySession,
        endCursor: extractor.endCursor(parsedData),
        hasMore: extractor.hasNextPage(parsedData),
      );
      return const RefetchResult.succeeded();
    }
  }

  @override
  void disable() {
    if (value is! PaginatedQueryState$Disabled) {
      value = PaginatedQueryState<TNode, TExtra>.disabled(
        myQuerySession: value.myQuerySession + 1,
      );
    }
  }

  @override
  void reset() {
    if (value is! PaginatedQueryState$Created) {
      value = PaginatedQueryState<TNode, TExtra>.created(
        myQuerySession: value.myQuerySession + 1,
      );
    }
  }
}

class _TransformedPaginatedQueryRunner<
  TDataIn extends Object,
  TDataOut extends Object,
  TExtra extends Object,
  TOptions extends QueryOptions?
>
    extends foundation.ValueListenable<TDataOut>
    implements PaginatedQueryRunner<TDataOut, TExtra, TOptions> {
  _TransformedPaginatedQueryRunner(this._delegate, this._mapper);

  final PaginatedQueryRunner<TDataIn, TExtra, TOptions> _delegate;
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
  Future<FetchMoreResult> fetchMore(TOptions options) =>
      _delegate.fetchMore(options);

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

final class UntypedPaginatedQueryRunnerBuilder {
  const UntypedPaginatedQueryRunnerBuilder();

  PaginatedQueryRunnerBuilder<
    PaginatedQueryState<TNode, TExtra>,
    TExtra,
    TOptions
  >
  queryOperation<
    TResult extends Object,
    TOptions extends QueryOptions<TResult>?,
    TNode extends Object,
    TExtra extends Object
  >(PaginationMetaExtractorFactory<TResult, TNode, TExtra> operation) =>
      _NonMappedPaginatedQueryRunnerBuilder<TResult, TOptions, TNode, TExtra>(
        operation as FetcherFactory<TResult, TOptions>,
        operation,
      );

  PaginatedQueryRunnerBuilder<
    PaginatedQueryState<TNode, TExtra>,
    TExtra,
    TOptions
  >
  queryOperationSupplier<
    TResult extends Object,
    TOptions extends QueryOptions<TResult>?,
    TNode extends Object,
    TExtra extends Object
  >(
    PaginationMetaExtractorFactory<TResult, TNode, TExtra> Function()
    operationSupplier,
  ) => _NonMappedPaginatedQueryRunnerBuilder<TResult, TOptions, TNode, TExtra>(
    FetcherFactory<TResult, TOptions>.fromSupplier(
      () => operationSupplier() as FetcherFactory<TResult, TOptions>,
    ),
    PaginationMetaExtractorFactory<TResult, TNode, TExtra>.fromSupplier(
      operationSupplier,
    ),
  );
}

abstract interface class PaginatedQueryRunnerBuilder<
  TData extends Object,
  TExtra extends Object,
  TOptions extends QueryOptions?
> {
  PaginatedQueryRunnerBuilder<TMapped, TExtra, TOptions>
  transform<TMapped extends Object>(TMapped Function(TData) mapper);

  StateApplyingPaginatedQueryRunnerBuilder<TData, TExtra, TOptions> applyTo(
    riverpod.Notifier<TData> notifier,
  );

  PaginatedQueryRunner<TData, TExtra, TOptions> build();
}

abstract interface class StateApplyingPaginatedQueryRunnerBuilder<
  TData extends Object,
  TExtra extends Object,
  TOptions extends QueryOptions?
> {
  PaginatedQueryRunner<TData, TExtra, TOptions> build();
}

final class _NonMappedPaginatedQueryRunnerBuilder<
  TResult extends Object,
  TOptions extends QueryOptions<TResult>?,
  TNode extends Object,
  TExtra extends Object
>
    implements
        PaginatedQueryRunnerBuilder<
          PaginatedQueryState<TNode, TExtra>,
          TExtra,
          TOptions
        > {
  _NonMappedPaginatedQueryRunnerBuilder(
    this._fetcherFactory,
    this._extractorFactory,
  );

  final FetcherFactory<TResult, TOptions> _fetcherFactory;
  final PaginationMetaExtractorFactory<TResult, TNode, TExtra>
  _extractorFactory;

  @override
  PaginatedQueryRunner<PaginatedQueryState<TNode, TExtra>, TExtra, TOptions>
  build() => _PaginatedQueryRunnerImpl<TResult, TOptions, TNode, TExtra>(
    _fetcherFactory,
    _extractorFactory,
  );

  @override
  PaginatedQueryRunnerBuilder<TMapped, TExtra, TOptions> transform<
    TMapped extends Object
  >(TMapped Function(PaginatedQueryState<TNode, TExtra>) mapper) =>
      _TransformedPaginatedQueryRunnerBuilder<
        PaginatedQueryState<TNode, TExtra>,
        TMapped,
        TExtra,
        TOptions
      >(this, mapper);

  @override
  StateApplyingPaginatedQueryRunnerBuilder<
    PaginatedQueryState<TNode, TExtra>,
    TExtra,
    TOptions
  >
  applyTo(riverpod.Notifier<PaginatedQueryState<TNode, TExtra>> notifier) =>
      _StateApplyingPaginatedQueryRunnerBuilder<
        PaginatedQueryState<TNode, TExtra>,
        TExtra,
        TOptions
      >(this, notifier);
}

final class _TransformedPaginatedQueryRunnerBuilder<
  TDataIn extends Object,
  TDataOut extends Object,
  TExtra extends Object,
  TOptions extends QueryOptions?
>
    implements PaginatedQueryRunnerBuilder<TDataOut, TExtra, TOptions> {
  _TransformedPaginatedQueryRunnerBuilder(this._delegate, this._mapper);

  final PaginatedQueryRunnerBuilder<TDataIn, TExtra, TOptions> _delegate;
  final TDataOut Function(TDataIn) _mapper;

  @override
  PaginatedQueryRunner<TDataOut, TExtra, TOptions> build() =>
      _TransformedPaginatedQueryRunner<TDataIn, TDataOut, TExtra, TOptions>(
        _delegate.build(),
        _mapper,
      );

  @override
  PaginatedQueryRunnerBuilder<TMapped, TExtra, TOptions>
  transform<TMapped extends Object>(TMapped Function(TDataOut) mapper) =>
      _TransformedPaginatedQueryRunnerBuilder<
        TDataIn,
        TMapped,
        TExtra,
        TOptions
      >(_delegate, (TDataIn data) => mapper(_mapper(data)));

  @override
  StateApplyingPaginatedQueryRunnerBuilder<TDataOut, TExtra, TOptions> applyTo(
    riverpod.Notifier<TDataOut> notifier,
  ) => _StateApplyingPaginatedQueryRunnerBuilder<TDataOut, TExtra, TOptions>(
    this,
    notifier,
  );
}

final class _StateApplyingPaginatedQueryRunnerBuilder<
  TData extends Object,
  TExtra extends Object,
  TOptions extends QueryOptions?
>
    implements
        StateApplyingPaginatedQueryRunnerBuilder<TData, TExtra, TOptions> {
  _StateApplyingPaginatedQueryRunnerBuilder(this._delegate, this._notifier);

  final PaginatedQueryRunnerBuilder<TData, TExtra, TOptions> _delegate;
  final riverpod.Notifier<TData> _notifier;

  @override
  PaginatedQueryRunner<TData, TExtra, TOptions> build() {
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
