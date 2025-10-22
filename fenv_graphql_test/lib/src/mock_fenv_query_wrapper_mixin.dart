import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';
import 'package:barrel_files_annotation/barrel_files_annotation.dart';
import 'package:fenv_graphql_test/src/mock_data_builder.dart';

@includeInBarrelFile
mixin MockFenvQueryMutateWrapperMixin<TParsed, TVariables> {
  MockDataBuilder<TParsed, TVariables> dataBuilder = emptyDataBuilder;

  @protected
  TVariables? Function(Map<String, dynamic>) get jsonToVariables;

  @protected
  TParsed? Function(Map<String, dynamic>) get jsonToParsed;

  @protected
  Map<String, dynamic> Function(TParsed) get parsedToJson;

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
