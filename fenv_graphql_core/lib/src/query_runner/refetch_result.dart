import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphql/client.dart';
import 'package:barrel_files_annotation/barrel_files_annotation.dart';

part 'refetch_result.freezed.dart';

/// Represents the result of a refetch operation.
@includeInBarrelFile
@Freezed(
  map: FreezedMapOptions(map: false, mapOrNull: false, maybeMap: false),
  when: FreezedWhenOptions(when: false, whenOrNull: false, maybeWhen: false),
)
sealed class RefetchResult with _$RefetchResult {
  /// The refetch operation completed successfully.
  const factory RefetchResult.succeeded() = _Succeeded;

  /// The refetch operation failed with an exception.
  const factory RefetchResult.failed(OperationException? exception) = _Failed;

  /// The refetch operation was ignored because the query was in an invalid
  /// state.
  const factory RefetchResult.ignored() = _Ignored;

  /// The refetch operation was cancelled because the query session became
  /// stale.
  const factory RefetchResult.cancelled() = _Cancelled;

  const RefetchResult._();
}

@includeInBarrelFile
typedef RefetchResult$Succeeded = _Succeeded;
@includeInBarrelFile
typedef RefetchResult$Failed = _Failed;
@includeInBarrelFile
typedef RefetchResult$Ignored = _Ignored;
@includeInBarrelFile
typedef RefetchResult$Cancelled = _Cancelled;
