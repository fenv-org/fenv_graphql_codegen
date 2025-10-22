import 'dart:async';

import 'package:graphql/client.dart';

/// A function that builds mock data for testing GraphQL operations.
///
/// Takes optional [variables] and returns the parsed data of type
/// [TParsed], or `null` if no data should be returned. Can be
/// synchronous or asynchronous.
typedef MockDataBuilder<TParsed, TVariables> =
    FutureOr<TParsed?> Function(TVariables? variables);

/// A pre-defined [MockDataBuilder] that returns `null`.
// ignore: prefer_void_to_null
MockDataBuilder<Null, dynamic> emptyDataBuilder = (dynamic _) => null;

/// A pre-defined [MockDataBuilder] that throws an [OperationException].
// ignore: prefer_void_to_null
MockDataBuilder<Null, dynamic> errorDataBuilder = (dynamic _) =>
    throw OperationException();

/// A pre-defined [MockDataBuilder] that throws an [OperationException].
// ignore: prefer_void_to_null
MockDataBuilder<Null, dynamic> asyncErrorDataBuilder = (dynamic _) async {
  await null;
  throw OperationException();
};

/// A pre-defined [MockDataBuilder] that returns the given [data].
MockDataBuilder<TParsed, dynamic> valueDataBuilder<TParsed>(TParsed data) =>
    (_) => data;

/// A pre-defined [MockDataBuilder] that never completes.
// ignore: prefer_void_to_null
MockDataBuilder<Null, dynamic> nonFinishingDataBuilder =
    // ignore: prefer_void_to_null
    (_) => Completer<Null>().future;
