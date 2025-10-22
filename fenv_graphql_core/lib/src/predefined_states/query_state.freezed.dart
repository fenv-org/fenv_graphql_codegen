// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryState<TData extends Object> {
  int get myQuerySession;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryStateCopyWith<TData, QueryState<TData>> get copyWith =>
      _$QueryStateCopyWithImpl<TData, QueryState<TData>>(
        this as QueryState<TData>,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryState<TData> &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myQuerySession);

  @override
  String toString() {
    return 'QueryState<$TData>(myQuerySession: $myQuerySession)';
  }
}

/// @nodoc
abstract mixin class $QueryStateCopyWith<TData extends Object, $Res> {
  factory $QueryStateCopyWith(
    QueryState<TData> value,
    $Res Function(QueryState<TData>) _then,
  ) = _$QueryStateCopyWithImpl;
  @useResult
  $Res call({int myQuerySession});
}

/// @nodoc
class _$QueryStateCopyWithImpl<TData extends Object, $Res>
    implements $QueryStateCopyWith<TData, $Res> {
  _$QueryStateCopyWithImpl(this._self, this._then);

  final QueryState<TData> _self;
  final $Res Function(QueryState<TData>) _then;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? myQuerySession = null}) {
    return _then(
      _self.copyWith(
        myQuerySession: null == myQuerySession
            ? _self.myQuerySession
            : myQuerySession // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class QueryState$Created<TData extends Object> extends QueryState<TData> {
  const QueryState$Created({this.myQuerySession = 0}) : super._();

  @override
  @JsonKey()
  final int myQuerySession;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryState$CreatedCopyWith<TData, QueryState$Created<TData>> get copyWith =>
      _$QueryState$CreatedCopyWithImpl<TData, QueryState$Created<TData>>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryState$Created<TData> &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myQuerySession);

  @override
  String toString() {
    return 'QueryState<$TData>.created(myQuerySession: $myQuerySession)';
  }
}

/// @nodoc
abstract mixin class $QueryState$CreatedCopyWith<TData extends Object, $Res>
    implements $QueryStateCopyWith<TData, $Res> {
  factory $QueryState$CreatedCopyWith(
    QueryState$Created<TData> value,
    $Res Function(QueryState$Created<TData>) _then,
  ) = _$QueryState$CreatedCopyWithImpl;
  @override
  @useResult
  $Res call({int myQuerySession});
}

/// @nodoc
class _$QueryState$CreatedCopyWithImpl<TData extends Object, $Res>
    implements $QueryState$CreatedCopyWith<TData, $Res> {
  _$QueryState$CreatedCopyWithImpl(this._self, this._then);

  final QueryState$Created<TData> _self;
  final $Res Function(QueryState$Created<TData>) _then;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? myQuerySession = null}) {
    return _then(
      QueryState$Created<TData>(
        myQuerySession: null == myQuerySession
            ? _self.myQuerySession
            : myQuerySession // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class QueryState$InitialLoading<TData extends Object>
    extends QueryState<TData> {
  const QueryState$InitialLoading({required this.myQuerySession}) : super._();

  @override
  final int myQuerySession;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryState$InitialLoadingCopyWith<TData, QueryState$InitialLoading<TData>>
  get copyWith =>
      _$QueryState$InitialLoadingCopyWithImpl<
        TData,
        QueryState$InitialLoading<TData>
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryState$InitialLoading<TData> &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myQuerySession);

  @override
  String toString() {
    return 'QueryState<$TData>.initialLoading(myQuerySession: $myQuerySession)';
  }
}

/// @nodoc
abstract mixin class $QueryState$InitialLoadingCopyWith<
  TData extends Object,
  $Res
>
    implements $QueryStateCopyWith<TData, $Res> {
  factory $QueryState$InitialLoadingCopyWith(
    QueryState$InitialLoading<TData> value,
    $Res Function(QueryState$InitialLoading<TData>) _then,
  ) = _$QueryState$InitialLoadingCopyWithImpl;
  @override
  @useResult
  $Res call({int myQuerySession});
}

/// @nodoc
class _$QueryState$InitialLoadingCopyWithImpl<TData extends Object, $Res>
    implements $QueryState$InitialLoadingCopyWith<TData, $Res> {
  _$QueryState$InitialLoadingCopyWithImpl(this._self, this._then);

  final QueryState$InitialLoading<TData> _self;
  final $Res Function(QueryState$InitialLoading<TData>) _then;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? myQuerySession = null}) {
    return _then(
      QueryState$InitialLoading<TData>(
        myQuerySession: null == myQuerySession
            ? _self.myQuerySession
            : myQuerySession // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class QueryState$InitialLoadingFailed<TData extends Object>
    extends QueryState<TData> {
  const QueryState$InitialLoadingFailed(
    this.error, {
    required this.myQuerySession,
  }) : super._();

  final OperationException error;
  @override
  final int myQuerySession;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryState$InitialLoadingFailedCopyWith<
    TData,
    QueryState$InitialLoadingFailed<TData>
  >
  get copyWith =>
      _$QueryState$InitialLoadingFailedCopyWithImpl<
        TData,
        QueryState$InitialLoadingFailed<TData>
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryState$InitialLoadingFailed<TData> &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, myQuerySession);

  @override
  String toString() {
    return 'QueryState<$TData>.initialLoadingFailed(error: $error, myQuerySession: $myQuerySession)';
  }
}

/// @nodoc
abstract mixin class $QueryState$InitialLoadingFailedCopyWith<
  TData extends Object,
  $Res
>
    implements $QueryStateCopyWith<TData, $Res> {
  factory $QueryState$InitialLoadingFailedCopyWith(
    QueryState$InitialLoadingFailed<TData> value,
    $Res Function(QueryState$InitialLoadingFailed<TData>) _then,
  ) = _$QueryState$InitialLoadingFailedCopyWithImpl;
  @override
  @useResult
  $Res call({OperationException error, int myQuerySession});
}

/// @nodoc
class _$QueryState$InitialLoadingFailedCopyWithImpl<TData extends Object, $Res>
    implements $QueryState$InitialLoadingFailedCopyWith<TData, $Res> {
  _$QueryState$InitialLoadingFailedCopyWithImpl(this._self, this._then);

  final QueryState$InitialLoadingFailed<TData> _self;
  final $Res Function(QueryState$InitialLoadingFailed<TData>) _then;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? error = null, Object? myQuerySession = null}) {
    return _then(
      QueryState$InitialLoadingFailed<TData>(
        null == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as OperationException,
        myQuerySession: null == myQuerySession
            ? _self.myQuerySession
            : myQuerySession // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class QueryState$Loaded<TData extends Object> extends QueryState<TData> {
  const QueryState$Loaded(
    this.data, {
    required this.myQuerySession,
    required this.isRefetching,
  }) : super._();

  final TData? data;
  @override
  final int myQuerySession;
  final bool isRefetching;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryState$LoadedCopyWith<TData, QueryState$Loaded<TData>> get copyWith =>
      _$QueryState$LoadedCopyWithImpl<TData, QueryState$Loaded<TData>>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryState$Loaded<TData> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession) &&
            (identical(other.isRefetching, isRefetching) ||
                other.isRefetching == isRefetching));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    myQuerySession,
    isRefetching,
  );

  @override
  String toString() {
    return 'QueryState<$TData>.loaded(data: $data, myQuerySession: $myQuerySession, isRefetching: $isRefetching)';
  }
}

/// @nodoc
abstract mixin class $QueryState$LoadedCopyWith<TData extends Object, $Res>
    implements $QueryStateCopyWith<TData, $Res> {
  factory $QueryState$LoadedCopyWith(
    QueryState$Loaded<TData> value,
    $Res Function(QueryState$Loaded<TData>) _then,
  ) = _$QueryState$LoadedCopyWithImpl;
  @override
  @useResult
  $Res call({TData? data, int myQuerySession, bool isRefetching});
}

/// @nodoc
class _$QueryState$LoadedCopyWithImpl<TData extends Object, $Res>
    implements $QueryState$LoadedCopyWith<TData, $Res> {
  _$QueryState$LoadedCopyWithImpl(this._self, this._then);

  final QueryState$Loaded<TData> _self;
  final $Res Function(QueryState$Loaded<TData>) _then;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
    Object? myQuerySession = null,
    Object? isRefetching = null,
  }) {
    return _then(
      QueryState$Loaded<TData>(
        freezed == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as TData?,
        myQuerySession: null == myQuerySession
            ? _self.myQuerySession
            : myQuerySession // ignore: cast_nullable_to_non_nullable
                  as int,
        isRefetching: null == isRefetching
            ? _self.isRefetching
            : isRefetching // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class QueryState$Disabled<TData extends Object> extends QueryState<TData> {
  const QueryState$Disabled({required this.myQuerySession}) : super._();

  @override
  final int myQuerySession;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryState$DisabledCopyWith<TData, QueryState$Disabled<TData>>
  get copyWith =>
      _$QueryState$DisabledCopyWithImpl<TData, QueryState$Disabled<TData>>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryState$Disabled<TData> &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myQuerySession);

  @override
  String toString() {
    return 'QueryState<$TData>.disabled(myQuerySession: $myQuerySession)';
  }
}

/// @nodoc
abstract mixin class $QueryState$DisabledCopyWith<TData extends Object, $Res>
    implements $QueryStateCopyWith<TData, $Res> {
  factory $QueryState$DisabledCopyWith(
    QueryState$Disabled<TData> value,
    $Res Function(QueryState$Disabled<TData>) _then,
  ) = _$QueryState$DisabledCopyWithImpl;
  @override
  @useResult
  $Res call({int myQuerySession});
}

/// @nodoc
class _$QueryState$DisabledCopyWithImpl<TData extends Object, $Res>
    implements $QueryState$DisabledCopyWith<TData, $Res> {
  _$QueryState$DisabledCopyWithImpl(this._self, this._then);

  final QueryState$Disabled<TData> _self;
  final $Res Function(QueryState$Disabled<TData>) _then;

  /// Create a copy of QueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? myQuerySession = null}) {
    return _then(
      QueryState$Disabled<TData>(
        myQuerySession: null == myQuerySession
            ? _self.myQuerySession
            : myQuerySession // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
