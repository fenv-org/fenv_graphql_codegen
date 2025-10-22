// ignore_for_file: unnecessary_null_comparison

import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:fenv_graphql_core/fenv_graphql_core.dart';
import 'package:fenv_graphql_test/src/mock_data_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

@includeInBarrelFile
mixin MockUseFenvQueryWrapperMixin<TParsed, TVariables> {
  MockDataBuilder<TParsed, TVariables> dataBuilder = emptyDataBuilder;

  @protected
  QueryOptions<TParsed>? latestOptions;

  @protected
  late QueryResult<TParsed> latest;

  @protected
  ValueNotifier<int>? dirty;

  @protected
  TVariables? Function(Map<String, dynamic>) get jsonToVariables;

  @protected
  Map<String, dynamic> Function(TVariables) get variablesToJson;

  @protected
  TParsed? Function(Map<String, dynamic>) get jsonToParsed;

  @protected
  Map<String, dynamic> Function(TParsed) get parsedToJson;

  TVariables? get _latestVariables => latestOptions?.variables == null
      ? null
      : jsonToVariables(latestOptions!.variables);

  final Map<(int, TVariables), QueryResult<TParsed>> _cache = {};

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
