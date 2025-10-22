// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_more_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FetchMoreResult {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FetchMoreResult);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FetchMoreResult()';
  }
}

/// @nodoc
class $FetchMoreResultCopyWith<$Res> {
  $FetchMoreResultCopyWith(
    FetchMoreResult _,
    $Res Function(FetchMoreResult) __,
  );
}

/// @nodoc

class _Succeeded extends FetchMoreResult {
  const _Succeeded() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Succeeded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FetchMoreResult.succeeded()';
  }
}

/// @nodoc

class _Failed extends FetchMoreResult {
  const _Failed(this.exception) : super._();

  final OperationException? exception;

  /// Create a copy of FetchMoreResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailedCopyWith<_Failed> get copyWith =>
      __$FailedCopyWithImpl<_Failed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failed &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  String toString() {
    return 'FetchMoreResult.failed(exception: $exception)';
  }
}

/// @nodoc
abstract mixin class _$FailedCopyWith<$Res>
    implements $FetchMoreResultCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) =
      __$FailedCopyWithImpl;
  @useResult
  $Res call({OperationException? exception});
}

/// @nodoc
class __$FailedCopyWithImpl<$Res> implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

  /// Create a copy of FetchMoreResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? exception = freezed}) {
    return _then(
      _Failed(
        freezed == exception
            ? _self.exception
            : exception // ignore: cast_nullable_to_non_nullable
                  as OperationException?,
      ),
    );
  }
}

/// @nodoc

class _Ignored extends FetchMoreResult {
  const _Ignored() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Ignored);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FetchMoreResult.ignored()';
  }
}

/// @nodoc

class _Cancelled extends FetchMoreResult {
  const _Cancelled() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Cancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FetchMoreResult.cancelled()';
  }
}
