// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_query_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedQueryState<TData extends Object, TExtra extends Object> {
  int get myQuerySession;

  /// Create a copy of PaginatedQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginatedQueryStateCopyWith<
    TData,
    TExtra,
    PaginatedQueryState<TData, TExtra>
  >
  get copyWith =>
      _$PaginatedQueryStateCopyWithImpl<
        TData,
        TExtra,
        PaginatedQueryState<TData, TExtra>
      >(this as PaginatedQueryState<TData, TExtra>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginatedQueryState<TData, TExtra> &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myQuerySession);

  @override
  String toString() {
    return 'PaginatedQueryState<$TData, $TExtra>(myQuerySession: $myQuerySession)';
  }
}

/// @nodoc
abstract mixin class $PaginatedQueryStateCopyWith<
  TData extends Object,
  TExtra extends Object,
  $Res
> {
  factory $PaginatedQueryStateCopyWith(
    PaginatedQueryState<TData, TExtra> value,
    $Res Function(PaginatedQueryState<TData, TExtra>) _then,
  ) = _$PaginatedQueryStateCopyWithImpl;
  @useResult
  $Res call({int myQuerySession});
}

/// @nodoc
class _$PaginatedQueryStateCopyWithImpl<
  TData extends Object,
  TExtra extends Object,
  $Res
>
    implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  _$PaginatedQueryStateCopyWithImpl(this._self, this._then);

  final PaginatedQueryState<TData, TExtra> _self;
  final $Res Function(PaginatedQueryState<TData, TExtra>) _then;

  /// Create a copy of PaginatedQueryState
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

class PaginatedQueryState$Created<TData extends Object, TExtra extends Object>
    extends PaginatedQueryState<TData, TExtra> {
  const PaginatedQueryState$Created({this.myQuerySession = 0}) : super._();

  @override
  @JsonKey()
  final int myQuerySession;

  /// Create a copy of PaginatedQueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginatedQueryState$CreatedCopyWith<
    TData,
    TExtra,
    PaginatedQueryState$Created<TData, TExtra>
  >
  get copyWith =>
      _$PaginatedQueryState$CreatedCopyWithImpl<
        TData,
        TExtra,
        PaginatedQueryState$Created<TData, TExtra>
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginatedQueryState$Created<TData, TExtra> &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myQuerySession);

  @override
  String toString() {
    return 'PaginatedQueryState<$TData, $TExtra>.created(myQuerySession: $myQuerySession)';
  }
}

/// @nodoc
abstract mixin class $PaginatedQueryState$CreatedCopyWith<
  TData extends Object,
  TExtra extends Object,
  $Res
>
    implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  factory $PaginatedQueryState$CreatedCopyWith(
    PaginatedQueryState$Created<TData, TExtra> value,
    $Res Function(PaginatedQueryState$Created<TData, TExtra>) _then,
  ) = _$PaginatedQueryState$CreatedCopyWithImpl;
  @override
  @useResult
  $Res call({int myQuerySession});
}

/// @nodoc
class _$PaginatedQueryState$CreatedCopyWithImpl<
  TData extends Object,
  TExtra extends Object,
  $Res
>
    implements $PaginatedQueryState$CreatedCopyWith<TData, TExtra, $Res> {
  _$PaginatedQueryState$CreatedCopyWithImpl(this._self, this._then);

  final PaginatedQueryState$Created<TData, TExtra> _self;
  final $Res Function(PaginatedQueryState$Created<TData, TExtra>) _then;

  /// Create a copy of PaginatedQueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? myQuerySession = null}) {
    return _then(
      PaginatedQueryState$Created<TData, TExtra>(
        myQuerySession: null == myQuerySession
            ? _self.myQuerySession
            : myQuerySession // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class PaginatedQueryState$InitialLoading<
  TData extends Object,
  TExtra extends Object
>
    extends PaginatedQueryState<TData, TExtra> {
  const PaginatedQueryState$InitialLoading({required this.myQuerySession})
    : super._();

  @override
  final int myQuerySession;

  /// Create a copy of PaginatedQueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginatedQueryState$InitialLoadingCopyWith<
    TData,
    TExtra,
    PaginatedQueryState$InitialLoading<TData, TExtra>
  >
  get copyWith =>
      _$PaginatedQueryState$InitialLoadingCopyWithImpl<
        TData,
        TExtra,
        PaginatedQueryState$InitialLoading<TData, TExtra>
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginatedQueryState$InitialLoading<TData, TExtra> &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myQuerySession);

  @override
  String toString() {
    return 'PaginatedQueryState<$TData, $TExtra>.initialLoading(myQuerySession: $myQuerySession)';
  }
}

/// @nodoc
abstract mixin class $PaginatedQueryState$InitialLoadingCopyWith<
  TData extends Object,
  TExtra extends Object,
  $Res
>
    implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  factory $PaginatedQueryState$InitialLoadingCopyWith(
    PaginatedQueryState$InitialLoading<TData, TExtra> value,
    $Res Function(PaginatedQueryState$InitialLoading<TData, TExtra>) _then,
  ) = _$PaginatedQueryState$InitialLoadingCopyWithImpl;
  @override
  @useResult
  $Res call({int myQuerySession});
}

/// @nodoc
class _$PaginatedQueryState$InitialLoadingCopyWithImpl<
  TData extends Object,
  TExtra extends Object,
  $Res
>
    implements
        $PaginatedQueryState$InitialLoadingCopyWith<TData, TExtra, $Res> {
  _$PaginatedQueryState$InitialLoadingCopyWithImpl(this._self, this._then);

  final PaginatedQueryState$InitialLoading<TData, TExtra> _self;
  final $Res Function(PaginatedQueryState$InitialLoading<TData, TExtra>) _then;

  /// Create a copy of PaginatedQueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? myQuerySession = null}) {
    return _then(
      PaginatedQueryState$InitialLoading<TData, TExtra>(
        myQuerySession: null == myQuerySession
            ? _self.myQuerySession
            : myQuerySession // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class PaginatedQueryState$InitialLoadingFailed<
  TData extends Object,
  TExtra extends Object
>
    extends PaginatedQueryState<TData, TExtra> {
  const PaginatedQueryState$InitialLoadingFailed(
    this.error, {
    required this.myQuerySession,
  }) : super._();

  final OperationException error;
  @override
  final int myQuerySession;

  /// Create a copy of PaginatedQueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginatedQueryState$InitialLoadingFailedCopyWith<
    TData,
    TExtra,
    PaginatedQueryState$InitialLoadingFailed<TData, TExtra>
  >
  get copyWith =>
      _$PaginatedQueryState$InitialLoadingFailedCopyWithImpl<
        TData,
        TExtra,
        PaginatedQueryState$InitialLoadingFailed<TData, TExtra>
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginatedQueryState$InitialLoadingFailed<TData, TExtra> &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, myQuerySession);

  @override
  String toString() {
    return 'PaginatedQueryState<$TData, $TExtra>.initialLoadingFailed(error: $error, myQuerySession: $myQuerySession)';
  }
}

/// @nodoc
abstract mixin class $PaginatedQueryState$InitialLoadingFailedCopyWith<
  TData extends Object,
  TExtra extends Object,
  $Res
>
    implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  factory $PaginatedQueryState$InitialLoadingFailedCopyWith(
    PaginatedQueryState$InitialLoadingFailed<TData, TExtra> value,
    $Res Function(PaginatedQueryState$InitialLoadingFailed<TData, TExtra>)
    _then,
  ) = _$PaginatedQueryState$InitialLoadingFailedCopyWithImpl;
  @override
  @useResult
  $Res call({OperationException error, int myQuerySession});
}

/// @nodoc
class _$PaginatedQueryState$InitialLoadingFailedCopyWithImpl<
  TData extends Object,
  TExtra extends Object,
  $Res
>
    implements
        $PaginatedQueryState$InitialLoadingFailedCopyWith<TData, TExtra, $Res> {
  _$PaginatedQueryState$InitialLoadingFailedCopyWithImpl(
    this._self,
    this._then,
  );

  final PaginatedQueryState$InitialLoadingFailed<TData, TExtra> _self;
  final $Res Function(PaginatedQueryState$InitialLoadingFailed<TData, TExtra>)
  _then;

  /// Create a copy of PaginatedQueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? error = null, Object? myQuerySession = null}) {
    return _then(
      PaginatedQueryState$InitialLoadingFailed<TData, TExtra>(
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

class PaginatedQueryState$Loaded<TData extends Object, TExtra extends Object>
    extends PaginatedQueryState<TData, TExtra> {
  const PaginatedQueryState$Loaded(
    final List<TData> data, {
    required this.extra,
    required this.myQuerySession,
    required this.isRefetching,
    required this.isFetchingMore,
    required this.endCursor,
    required this.hasMore,
  }) : assert(
         !isRefetching || !isFetchingMore,
         'Cannot be refetching and fetching more at the same time.',
       ),
       assert(
         !hasMore || endCursor != null,
         'endCursor must be set if hasMore is true.',
       ),
       _data = data,
       super._();

  final List<TData> _data;
  List<TData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final TExtra? extra;
  @override
  final int myQuerySession;
  final bool isRefetching;
  final bool isFetchingMore;
  final String? endCursor;
  final bool hasMore;

  /// Create a copy of PaginatedQueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginatedQueryState$LoadedCopyWith<
    TData,
    TExtra,
    PaginatedQueryState$Loaded<TData, TExtra>
  >
  get copyWith =>
      _$PaginatedQueryState$LoadedCopyWithImpl<
        TData,
        TExtra,
        PaginatedQueryState$Loaded<TData, TExtra>
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginatedQueryState$Loaded<TData, TExtra> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other.extra, extra) &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession) &&
            (identical(other.isRefetching, isRefetching) ||
                other.isRefetching == isRefetching) &&
            (identical(other.isFetchingMore, isFetchingMore) ||
                other.isFetchingMore == isFetchingMore) &&
            (identical(other.endCursor, endCursor) ||
                other.endCursor == endCursor) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    const DeepCollectionEquality().hash(extra),
    myQuerySession,
    isRefetching,
    isFetchingMore,
    endCursor,
    hasMore,
  );

  @override
  String toString() {
    return 'PaginatedQueryState<$TData, $TExtra>._loaded(data: $data, extra: $extra, myQuerySession: $myQuerySession, isRefetching: $isRefetching, isFetchingMore: $isFetchingMore, endCursor: $endCursor, hasMore: $hasMore)';
  }
}

/// @nodoc
abstract mixin class $PaginatedQueryState$LoadedCopyWith<
  TData extends Object,
  TExtra extends Object,
  $Res
>
    implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  factory $PaginatedQueryState$LoadedCopyWith(
    PaginatedQueryState$Loaded<TData, TExtra> value,
    $Res Function(PaginatedQueryState$Loaded<TData, TExtra>) _then,
  ) = _$PaginatedQueryState$LoadedCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<TData> data,
    TExtra? extra,
    int myQuerySession,
    bool isRefetching,
    bool isFetchingMore,
    String? endCursor,
    bool hasMore,
  });
}

/// @nodoc
class _$PaginatedQueryState$LoadedCopyWithImpl<
  TData extends Object,
  TExtra extends Object,
  $Res
>
    implements $PaginatedQueryState$LoadedCopyWith<TData, TExtra, $Res> {
  _$PaginatedQueryState$LoadedCopyWithImpl(this._self, this._then);

  final PaginatedQueryState$Loaded<TData, TExtra> _self;
  final $Res Function(PaginatedQueryState$Loaded<TData, TExtra>) _then;

  /// Create a copy of PaginatedQueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? extra = freezed,
    Object? myQuerySession = null,
    Object? isRefetching = null,
    Object? isFetchingMore = null,
    Object? endCursor = freezed,
    Object? hasMore = null,
  }) {
    return _then(
      PaginatedQueryState$Loaded<TData, TExtra>(
        null == data
            ? _self._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<TData>,
        extra: freezed == extra
            ? _self.extra
            : extra // ignore: cast_nullable_to_non_nullable
                  as TExtra?,
        myQuerySession: null == myQuerySession
            ? _self.myQuerySession
            : myQuerySession // ignore: cast_nullable_to_non_nullable
                  as int,
        isRefetching: null == isRefetching
            ? _self.isRefetching
            : isRefetching // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFetchingMore: null == isFetchingMore
            ? _self.isFetchingMore
            : isFetchingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        endCursor: freezed == endCursor
            ? _self.endCursor
            : endCursor // ignore: cast_nullable_to_non_nullable
                  as String?,
        hasMore: null == hasMore
            ? _self.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class PaginatedQueryState$Disabled<TData extends Object, TExtra extends Object>
    extends PaginatedQueryState<TData, TExtra> {
  const PaginatedQueryState$Disabled({required this.myQuerySession})
    : super._();

  @override
  final int myQuerySession;

  /// Create a copy of PaginatedQueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginatedQueryState$DisabledCopyWith<
    TData,
    TExtra,
    PaginatedQueryState$Disabled<TData, TExtra>
  >
  get copyWith =>
      _$PaginatedQueryState$DisabledCopyWithImpl<
        TData,
        TExtra,
        PaginatedQueryState$Disabled<TData, TExtra>
      >(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginatedQueryState$Disabled<TData, TExtra> &&
            (identical(other.myQuerySession, myQuerySession) ||
                other.myQuerySession == myQuerySession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, myQuerySession);

  @override
  String toString() {
    return 'PaginatedQueryState<$TData, $TExtra>.disabled(myQuerySession: $myQuerySession)';
  }
}

/// @nodoc
abstract mixin class $PaginatedQueryState$DisabledCopyWith<
  TData extends Object,
  TExtra extends Object,
  $Res
>
    implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  factory $PaginatedQueryState$DisabledCopyWith(
    PaginatedQueryState$Disabled<TData, TExtra> value,
    $Res Function(PaginatedQueryState$Disabled<TData, TExtra>) _then,
  ) = _$PaginatedQueryState$DisabledCopyWithImpl;
  @override
  @useResult
  $Res call({int myQuerySession});
}

/// @nodoc
class _$PaginatedQueryState$DisabledCopyWithImpl<
  TData extends Object,
  TExtra extends Object,
  $Res
>
    implements $PaginatedQueryState$DisabledCopyWith<TData, TExtra, $Res> {
  _$PaginatedQueryState$DisabledCopyWithImpl(this._self, this._then);

  final PaginatedQueryState$Disabled<TData, TExtra> _self;
  final $Res Function(PaginatedQueryState$Disabled<TData, TExtra>) _then;

  /// Create a copy of PaginatedQueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? myQuerySession = null}) {
    return _then(
      PaginatedQueryState$Disabled<TData, TExtra>(
        myQuerySession: null == myQuerySession
            ? _self.myQuerySession
            : myQuerySession // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
