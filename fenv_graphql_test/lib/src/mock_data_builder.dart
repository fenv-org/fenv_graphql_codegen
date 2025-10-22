import 'dart:async';

import 'package:graphql/client.dart';
import 'package:barrel_files_annotation/barrel_files_annotation.dart';

@includeInBarrelFile
typedef MockDataBuilder<TParsed, TVariables> =
    FutureOr<TParsed?> Function(TVariables? variables);

/// A pre-defined [MockDataBuilder] that returns `null`.
@includeInBarrelFile
// ignore: prefer_void_to_null
MockDataBuilder<Null, dynamic> emptyDataBuilder = (dynamic _) => null;

/// A pre-defined [MockDataBuilder] that throws an [OperationException].
@includeInBarrelFile
// ignore: prefer_void_to_null
MockDataBuilder<Null, dynamic> errorDataBuilder = (dynamic _) =>
    throw OperationException();

/// A pre-defined [MockDataBuilder] that throws an [OperationException].
@includeInBarrelFile
// ignore: prefer_void_to_null
MockDataBuilder<Null, dynamic> asyncErrorDataBuilder = (dynamic _) async {
  await null;
  throw OperationException();
};

/// A pre-defined [MockDataBuilder] that returns the given [data].
@includeInBarrelFile
MockDataBuilder<TParsed, dynamic> valueDataBuilder<TParsed>(TParsed data) =>
    (_) => data;

/// A pre-defined [MockDataBuilder] that never completes.
@includeInBarrelFile
// ignore: prefer_void_to_null
MockDataBuilder<Null, dynamic> nonFinishingDataBuilder =
    // ignore: prefer_void_to_null
    (_) => Completer<Null>().future;
