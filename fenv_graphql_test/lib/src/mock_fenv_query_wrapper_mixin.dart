import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:fenv_graphql_test/src/mock_data_builder.dart';

/// A mixin that provides mock implementations for GraphQL operations.
///
/// This mixin allows tests to simulate GraphQL operations by using a
/// [MockDataBuilder] to generate mock responses instead of making
/// actual network requests.
@includeInBarrelFile
mixin MockFenvQueryMutateWrapperMixin<TParsed, TVariables> {
  /// The mock data builder used to generate responses for operations.
  ///
  /// Defaults to [emptyDataBuilder] which returns `null`.
  MockDataBuilder<TParsed, TVariables> dataBuilder = emptyDataBuilder;

  /// Converts JSON variables to the typed [TVariables] format.
  @protected
  TVariables? Function(Map<String, dynamic>) get jsonToVariables;

  /// Converts JSON data to the typed [TParsed] format.
  @protected
  TParsed? Function(Map<String, dynamic>) get jsonToParsed;

  /// Converts typed [TParsed] data to JSON format.
  @protected
  Map<String, dynamic> Function(TParsed) get parsedToJson;

  /// Executes a mock query operation using the configured [dataBuilder].
  ///
  /// Invokes callbacks on [options] based on operation success or failure.
  @protected
  Future<QueryResult<TParsed>> fetch(QueryOptions<TParsed> options) async {
    try {
      final data = await dataBuilder(jsonToVariables(options.variables));
      final rawData = data == null ? null : parsedToJson(data);
      if (options.onComplete != null) {
        await options.onComplete!(rawData);
      }
      return QueryResult(
        data: rawData,
        options: options,
        source: QueryResultSource.network,
      );
    } on OperationException catch (e) {
      if (options.onError != null) {
        await options.onError!(e);
      }
      return QueryResult(
        exception: e,
        options: options,
        source: QueryResultSource.network,
      );
    }
  }

  /// Executes a mock mutation operation using the configured [dataBuilder].
  ///
  /// Invokes callbacks on [options] based on operation success or failure.
  @protected
  Future<QueryResult<TParsed>> mutate(MutationOptions<TParsed> options) async {
    try {
      final data = await dataBuilder(jsonToVariables(options.variables));
      final rawData = data == null ? null : parsedToJson(data);
      if (options.onCompleted != null) {
        await options.onCompleted!(rawData);
      }
      return QueryResult(
        data: rawData,
        options: options,
        source: QueryResultSource.network,
      );
    } on OperationException catch (e) {
      if (options.onError != null) {
        await options.onError!(e);
      }
      return QueryResult(
        exception: e,
        options: options,
        source: QueryResultSource.network,
      );
    }
  }
}
