import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fenv_graphql_core/src/strict_fetch_more.dart';

class StrictQueryHookResult<TParsed, TVariables> {
  factory StrictQueryHookResult({
    required QueryResult<TParsed> result,
    required Refetch<TParsed> refetch,
    required StrictFetchMore<TParsed, TVariables> fetchMore,
  }) => StrictQueryHookResult.fromResultSupplier(
    resultSupplier: () => result,
    refetch: refetch,
    fetchMore: fetchMore,
  );

  @visibleForTesting
  StrictQueryHookResult.fromResultSupplier({
    required QueryResult<TParsed> Function() resultSupplier,
    required this.refetch,
    required this.fetchMore,
  }) : _resultSupplier = resultSupplier;

  QueryResult<TParsed> get result => _resultSupplier();

  final Refetch<TParsed> refetch;
  final StrictFetchMore<TParsed, TVariables> fetchMore;
  final QueryResult<TParsed> Function() _resultSupplier;
}
