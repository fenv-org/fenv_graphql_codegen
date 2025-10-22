import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql/client.dart';
import 'package:barrel_files_annotation/barrel_files_annotation.dart';

part 'fetch_more_result.freezed.dart';

/// Represents the result of a fetchMore operation.
@includeInBarrelFile
@Freezed(
  map: FreezedMapOptions(map: false, mapOrNull: false, maybeMap: false),
  when: FreezedWhenOptions(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class FetchMoreResult with _$FetchMoreResult {
  /// The fetchMore operation completed successfully.
  const factory FetchMoreResult.succeeded() = _Succeeded;

  /// The fetchMore operation failed with an exception.
  const factory FetchMoreResult.failed(OperationException? exception) = _Failed;

  /// The fetchMore operation was ignored because the query was in an invalid
  /// state.
  const factory FetchMoreResult.ignored() = _Ignored;

  /// The fetchMore operation was cancelled because the query session became
  /// stale.
  const factory FetchMoreResult.cancelled() = _Cancelled;

  const FetchMoreResult._();
}

@includeInBarrelFile
typedef FetchMoreResult$Succeeded = _Succeeded;
@includeInBarrelFile
typedef FetchMoreResult$Failed = _Failed;
@includeInBarrelFile
typedef FetchMoreResult$Ignored = _Ignored;
@includeInBarrelFile
typedef FetchMoreResult$Cancelled = _Cancelled;
