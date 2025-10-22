// ignore_for_file: unnecessary_null_comparison

import 'package:fenv_graphql_core/fenv_graphql_core.dart';
import 'package:fenv_graphql_test/src/mock_data_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

/// A mixin that provides mock implementations for stateful GraphQL hooks.
///
/// This mixin simulates the behavior of [useFenvQuery] hooks by
/// maintaining query state and providing methods to fetch, refetch,
/// and fetch more data using a [MockDataBuilder].
mixin MockUseFenvQueryWrapperMixin<TParsed, TVariables> {
  /// The mock data builder used to generate responses for queries.
  ///
  /// Defaults to [emptyDataBuilder] which returns `null`.
  MockDataBuilder<TParsed, TVariables> dataBuilder = emptyDataBuilder;

  /// The most recent query options used for this query.
  @protected
  QueryOptions<TParsed>? latestOptions;

  /// The most recent query result.
  @protected
  late QueryResult<TParsed> latest;

  /// A notifier that increments when the query state changes.
  ///
  /// Used to trigger UI updates in widgets watching this query.
  @protected
  ValueNotifier<int>? dirty;

  /// Converts JSON variables to the typed [TVariables] format.
  @protected
  TVariables? Function(Map<String, dynamic>) get jsonToVariables;

  /// Converts typed [TVariables] to JSON format.
  @protected
  Map<String, dynamic> Function(TVariables) get variablesToJson;

  /// Converts JSON data to the typed [TParsed] format.
  @protected
  TParsed? Function(Map<String, dynamic>) get jsonToParsed;

  /// Converts typed [TParsed] data to JSON format.
  @protected
  Map<String, dynamic> Function(TParsed) get parsedToJson;

  TVariables? get _latestVariables => latestOptions?.variables == null
      ? null
      : jsonToVariables(latestOptions!.variables);

  final Map<(int, TVariables), QueryResult<TParsed>> _cache = {};

  /// Executes a query operation using the configured [dataBuilder].
  ///
  /// Updates [latest] with the result and notifies listeners via [dirty].
  /// Caches successful results for subsequent [fetchMore] calls.
  @protected
  Future<void> fetch() async {
    dirty!.value++;
    latest = QueryResult(
      data: latest.data,
      options: latestOptions!,
      exception: latest.exception,
      source: QueryResultSource.loading,
    );

    try {
      final newData = await dataBuilder(_latestVariables);
      final result = _applyFetchResultToLatest(
        data: await _invokeOnComplete(newData),
      );
      if (_latestVariables != null) {
        _cache[(dataBuilder.hashCode, _latestVariables!)] = result;
      }
    } on OperationException catch (e) {
      await _invokeOnError(e);
      _applyFetchResultToLatest(exception: e);
    } finally {
      dirty!.value++;
    }
  }

  /// Re-fetches the query by clearing cache and executing [dataBuilder].
  ///
  /// Returns the new query result and updates [latest].
  @protected
  Future<QueryResult<TParsed>?> refetch() async {
    _cache.clear();
    dirty!.value++;
    latest = QueryResult(
      data: latest.data,
      options: latestOptions!,
      exception: latest.exception,
      source: QueryResultSource.loading,
    );

    try {
      // Just re-fetch the data and throw its result.
      await dataBuilder(_latestVariables);
      return _applyFetchResultToLatest(
        data: await _invokeOnComplete(latest.parsedData),
      );
    } on OperationException catch (e) {
      await _invokeOnError(e);
      return _applyFetchResultToLatest(exception: e);
    } finally {
      dirty!.value++;
    }
  }

  /// Fetches additional data and merges it with existing results.
  ///
  /// Returns cached results if available for the given variables,
  /// otherwise executes [dataBuilder] and merges the new data with
  /// [latest] using [options.updateQuery].
  @protected
  Future<QueryResult<TParsed>> fetchMore(
    StrictFetchMoreOptions<TParsed, TVariables> options,
  ) async {
    dirty!.value++;
    latest = QueryResult(
      data: latest.data,
      options: latestOptions!,
      exception: latest.exception,
      source: QueryResultSource.loading,
    );

    try {
      if (options.variables != null &&
          _cache.containsKey((dataBuilder.hashCode, options.variables!))) {
        return _cache[(dataBuilder.hashCode, options.variables!)]!;
      }
      final data = await dataBuilder(options.variables);
      QueryResult<TParsed> result;
      if (latest.parsedData == null) {
        result = _applyFetchResultToLatest(data: await _invokeOnComplete(data));
      } else if (data == null) {
        result = _applyFetchResultToLatest(
          data: await _invokeOnComplete(latest.parsedData),
        );
      } else {
        result = _applyFetchResultToLatest(
          data: await _invokeOnComplete(
            options.updateQuery(latest.parsedData as TParsed, data),
          ),
        );
      }
      if (options.variables != null) {
        _cache[(dataBuilder.hashCode, options.variables!)] = result;
      }
      return result;
    } on OperationException catch (e) {
      await _invokeOnError(e);
      return _applyFetchResultToLatest(exception: e);
    } finally {
      dirty!.value++;
    }
  }

  Future<TParsed?> _invokeOnComplete(TParsed? data) async {
    if (latestOptions?.onComplete == null) {
      return data;
    }

    final rawData = data == null ? null : parsedToJson(data);
    await latestOptions!.onComplete!.call(rawData);
    return rawData == null ? null : jsonToParsed(rawData);
  }

  Future<void> _invokeOnError(OperationException e) async {
    await latestOptions?.onError?.call(e);
  }

  QueryResult<TParsed> _applyFetchResultToLatest({
    TParsed? data,
    OperationException? exception,
  }) {
    assert(latestOptions != null);
    latest = QueryResult(
      data: data == null ? latest.data : parsedToJson(data),
      options: latestOptions!,
      exception: exception,
      source: QueryResultSource.network,
    );
    return latest;
  }
}
