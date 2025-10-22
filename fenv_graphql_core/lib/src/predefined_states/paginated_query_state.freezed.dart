// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_query_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaginatedQueryState<TData extends Object,TExtra extends Object> {

 int get myQuerySession;
/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedQueryStateCopyWith<TData, TExtra, PaginatedQueryState<TData, TExtra>> get copyWith => _$PaginatedQueryStateCopyWithImpl<TData, TExtra, PaginatedQueryState<TData, TExtra>>(this as PaginatedQueryState<TData, TExtra>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedQueryState<TData, TExtra>&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession));
}


@override
int get hashCode => Object.hash(runtimeType,myQuerySession);

@override
String toString() {
  return 'PaginatedQueryState<$TData, $TExtra>(myQuerySession: $myQuerySession)';
}


}

/// @nodoc
abstract mixin class $PaginatedQueryStateCopyWith<TData extends Object,TExtra extends Object,$Res>  {
  factory $PaginatedQueryStateCopyWith(PaginatedQueryState<TData, TExtra> value, $Res Function(PaginatedQueryState<TData, TExtra>) _then) = _$PaginatedQueryStateCopyWithImpl;
@useResult
$Res call({
 int myQuerySession
});




}
/// @nodoc
class _$PaginatedQueryStateCopyWithImpl<TData extends Object,TExtra extends Object,$Res>
    implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  _$PaginatedQueryStateCopyWithImpl(this._self, this._then);

  final PaginatedQueryState<TData, TExtra> _self;
  final $Res Function(PaginatedQueryState<TData, TExtra>) _then;

/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? myQuerySession = null,}) {
  return _then(_self.copyWith(
myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}



/// @nodoc


class _Created<TData extends Object,TExtra extends Object> extends PaginatedQueryState<TData, TExtra> {
  const _Created({this.myQuerySession = 0}): super._();
  

@override@JsonKey() final  int myQuerySession;

/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<TData, TExtra, _Created<TData, TExtra>> get copyWith => __$CreatedCopyWithImpl<TData, TExtra, _Created<TData, TExtra>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created<TData, TExtra>&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession));
}


@override
int get hashCode => Object.hash(runtimeType,myQuerySession);

@override
String toString() {
  return 'PaginatedQueryState<$TData, $TExtra>.created(myQuerySession: $myQuerySession)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<TData extends Object,TExtra extends Object,$Res> implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  factory _$CreatedCopyWith(_Created<TData, TExtra> value, $Res Function(_Created<TData, TExtra>) _then) = __$CreatedCopyWithImpl;
@override @useResult
$Res call({
 int myQuerySession
});




}
/// @nodoc
class __$CreatedCopyWithImpl<TData extends Object,TExtra extends Object,$Res>
    implements _$CreatedCopyWith<TData, TExtra, $Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created<TData, TExtra> _self;
  final $Res Function(_Created<TData, TExtra>) _then;

/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myQuerySession = null,}) {
  return _then(_Created<TData, TExtra>(
myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _InitialLoading<TData extends Object,TExtra extends Object> extends PaginatedQueryState<TData, TExtra> {
  const _InitialLoading({required this.myQuerySession}): super._();
  

@override final  int myQuerySession;

/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialLoadingCopyWith<TData, TExtra, _InitialLoading<TData, TExtra>> get copyWith => __$InitialLoadingCopyWithImpl<TData, TExtra, _InitialLoading<TData, TExtra>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialLoading<TData, TExtra>&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession));
}


@override
int get hashCode => Object.hash(runtimeType,myQuerySession);

@override
String toString() {
  return 'PaginatedQueryState<$TData, $TExtra>.initialLoading(myQuerySession: $myQuerySession)';
}


}

/// @nodoc
abstract mixin class _$InitialLoadingCopyWith<TData extends Object,TExtra extends Object,$Res> implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  factory _$InitialLoadingCopyWith(_InitialLoading<TData, TExtra> value, $Res Function(_InitialLoading<TData, TExtra>) _then) = __$InitialLoadingCopyWithImpl;
@override @useResult
$Res call({
 int myQuerySession
});




}
/// @nodoc
class __$InitialLoadingCopyWithImpl<TData extends Object,TExtra extends Object,$Res>
    implements _$InitialLoadingCopyWith<TData, TExtra, $Res> {
  __$InitialLoadingCopyWithImpl(this._self, this._then);

  final _InitialLoading<TData, TExtra> _self;
  final $Res Function(_InitialLoading<TData, TExtra>) _then;

/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myQuerySession = null,}) {
  return _then(_InitialLoading<TData, TExtra>(
myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _InitialLoadingFailed<TData extends Object,TExtra extends Object> extends PaginatedQueryState<TData, TExtra> {
  const _InitialLoadingFailed(this.error, {required this.myQuerySession}): super._();
  

 final  OperationException error;
@override final  int myQuerySession;

/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialLoadingFailedCopyWith<TData, TExtra, _InitialLoadingFailed<TData, TExtra>> get copyWith => __$InitialLoadingFailedCopyWithImpl<TData, TExtra, _InitialLoadingFailed<TData, TExtra>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialLoadingFailed<TData, TExtra>&&(identical(other.error, error) || other.error == error)&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession));
}


@override
int get hashCode => Object.hash(runtimeType,error,myQuerySession);

@override
String toString() {
  return 'PaginatedQueryState<$TData, $TExtra>.initialLoadingFailed(error: $error, myQuerySession: $myQuerySession)';
}


}

/// @nodoc
abstract mixin class _$InitialLoadingFailedCopyWith<TData extends Object,TExtra extends Object,$Res> implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  factory _$InitialLoadingFailedCopyWith(_InitialLoadingFailed<TData, TExtra> value, $Res Function(_InitialLoadingFailed<TData, TExtra>) _then) = __$InitialLoadingFailedCopyWithImpl;
@override @useResult
$Res call({
 OperationException error, int myQuerySession
});




}
/// @nodoc
class __$InitialLoadingFailedCopyWithImpl<TData extends Object,TExtra extends Object,$Res>
    implements _$InitialLoadingFailedCopyWith<TData, TExtra, $Res> {
  __$InitialLoadingFailedCopyWithImpl(this._self, this._then);

  final _InitialLoadingFailed<TData, TExtra> _self;
  final $Res Function(_InitialLoadingFailed<TData, TExtra>) _then;

/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? myQuerySession = null,}) {
  return _then(_InitialLoadingFailed<TData, TExtra>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as OperationException,myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Loaded<TData extends Object,TExtra extends Object> extends PaginatedQueryState<TData, TExtra> {
  const _Loaded(final  List<TData> data, {required this.extra, required this.myQuerySession, required this.isRefetching, required this.isFetchingMore, required this.endCursor, required this.hasMore}): assert(!isRefetching || !isFetchingMore, 'Cannot be refetching and fetching more at the same time.'),assert(!hasMore || endCursor != null, 'endCursor must be set if hasMore is true.'),_data = data,super._();
  

 final  List<TData> _data;
 List<TData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

 final  TExtra? extra;
@override final  int myQuerySession;
 final  bool isRefetching;
 final  bool isFetchingMore;
 final  String? endCursor;
 final  bool hasMore;

/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<TData, TExtra, _Loaded<TData, TExtra>> get copyWith => __$LoadedCopyWithImpl<TData, TExtra, _Loaded<TData, TExtra>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded<TData, TExtra>&&const DeepCollectionEquality().equals(other._data, _data)&&const DeepCollectionEquality().equals(other.extra, extra)&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession)&&(identical(other.isRefetching, isRefetching) || other.isRefetching == isRefetching)&&(identical(other.isFetchingMore, isFetchingMore) || other.isFetchingMore == isFetchingMore)&&(identical(other.endCursor, endCursor) || other.endCursor == endCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),const DeepCollectionEquality().hash(extra),myQuerySession,isRefetching,isFetchingMore,endCursor,hasMore);

@override
String toString() {
  return 'PaginatedQueryState<$TData, $TExtra>._loaded(data: $data, extra: $extra, myQuerySession: $myQuerySession, isRefetching: $isRefetching, isFetchingMore: $isFetchingMore, endCursor: $endCursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<TData extends Object,TExtra extends Object,$Res> implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  factory _$LoadedCopyWith(_Loaded<TData, TExtra> value, $Res Function(_Loaded<TData, TExtra>) _then) = __$LoadedCopyWithImpl;
@override @useResult
$Res call({
 List<TData> data, TExtra? extra, int myQuerySession, bool isRefetching, bool isFetchingMore, String? endCursor, bool hasMore
});




}
/// @nodoc
class __$LoadedCopyWithImpl<TData extends Object,TExtra extends Object,$Res>
    implements _$LoadedCopyWith<TData, TExtra, $Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded<TData, TExtra> _self;
  final $Res Function(_Loaded<TData, TExtra>) _then;

/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? extra = freezed,Object? myQuerySession = null,Object? isRefetching = null,Object? isFetchingMore = null,Object? endCursor = freezed,Object? hasMore = null,}) {
  return _then(_Loaded<TData, TExtra>(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TData>,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as TExtra?,myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,isRefetching: null == isRefetching ? _self.isRefetching : isRefetching // ignore: cast_nullable_to_non_nullable
as bool,isFetchingMore: null == isFetchingMore ? _self.isFetchingMore : isFetchingMore // ignore: cast_nullable_to_non_nullable
as bool,endCursor: freezed == endCursor ? _self.endCursor : endCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Disabled<TData extends Object,TExtra extends Object> extends PaginatedQueryState<TData, TExtra> {
  const _Disabled({required this.myQuerySession}): super._();
  

@override final  int myQuerySession;

/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisabledCopyWith<TData, TExtra, _Disabled<TData, TExtra>> get copyWith => __$DisabledCopyWithImpl<TData, TExtra, _Disabled<TData, TExtra>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disabled<TData, TExtra>&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession));
}


@override
int get hashCode => Object.hash(runtimeType,myQuerySession);

@override
String toString() {
  return 'PaginatedQueryState<$TData, $TExtra>.disabled(myQuerySession: $myQuerySession)';
}


}

/// @nodoc
abstract mixin class _$DisabledCopyWith<TData extends Object,TExtra extends Object,$Res> implements $PaginatedQueryStateCopyWith<TData, TExtra, $Res> {
  factory _$DisabledCopyWith(_Disabled<TData, TExtra> value, $Res Function(_Disabled<TData, TExtra>) _then) = __$DisabledCopyWithImpl;
@override @useResult
$Res call({
 int myQuerySession
});




}
/// @nodoc
class __$DisabledCopyWithImpl<TData extends Object,TExtra extends Object,$Res>
    implements _$DisabledCopyWith<TData, TExtra, $Res> {
  __$DisabledCopyWithImpl(this._self, this._then);

  final _Disabled<TData, TExtra> _self;
  final $Res Function(_Disabled<TData, TExtra>) _then;

/// Create a copy of PaginatedQueryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myQuerySession = null,}) {
  return _then(_Disabled<TData, TExtra>(
myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
