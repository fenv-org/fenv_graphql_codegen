// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QueryState<TData extends Object> {

 int get myQuerySession;
/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueryStateCopyWith<TData, QueryState<TData>> get copyWith => _$QueryStateCopyWithImpl<TData, QueryState<TData>>(this as QueryState<TData>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueryState<TData>&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession));
}


@override
int get hashCode => Object.hash(runtimeType,myQuerySession);

@override
String toString() {
  return 'QueryState<$TData>(myQuerySession: $myQuerySession)';
}


}

/// @nodoc
abstract mixin class $QueryStateCopyWith<TData extends Object,$Res>  {
  factory $QueryStateCopyWith(QueryState<TData> value, $Res Function(QueryState<TData>) _then) = _$QueryStateCopyWithImpl;
@useResult
$Res call({
 int myQuerySession
});




}
/// @nodoc
class _$QueryStateCopyWithImpl<TData extends Object,$Res>
    implements $QueryStateCopyWith<TData, $Res> {
  _$QueryStateCopyWithImpl(this._self, this._then);

  final QueryState<TData> _self;
  final $Res Function(QueryState<TData>) _then;

/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? myQuerySession = null,}) {
  return _then(_self.copyWith(
myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}



/// @nodoc


class _Created<TData extends Object> extends QueryState<TData> {
  const _Created({this.myQuerySession = 0}): super._();
  

@override@JsonKey() final  int myQuerySession;

/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<TData, _Created<TData>> get copyWith => __$CreatedCopyWithImpl<TData, _Created<TData>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created<TData>&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession));
}


@override
int get hashCode => Object.hash(runtimeType,myQuerySession);

@override
String toString() {
  return 'QueryState<$TData>.created(myQuerySession: $myQuerySession)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<TData extends Object,$Res> implements $QueryStateCopyWith<TData, $Res> {
  factory _$CreatedCopyWith(_Created<TData> value, $Res Function(_Created<TData>) _then) = __$CreatedCopyWithImpl;
@override @useResult
$Res call({
 int myQuerySession
});




}
/// @nodoc
class __$CreatedCopyWithImpl<TData extends Object,$Res>
    implements _$CreatedCopyWith<TData, $Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created<TData> _self;
  final $Res Function(_Created<TData>) _then;

/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myQuerySession = null,}) {
  return _then(_Created<TData>(
myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _InitialLoading<TData extends Object> extends QueryState<TData> {
  const _InitialLoading({required this.myQuerySession}): super._();
  

@override final  int myQuerySession;

/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialLoadingCopyWith<TData, _InitialLoading<TData>> get copyWith => __$InitialLoadingCopyWithImpl<TData, _InitialLoading<TData>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialLoading<TData>&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession));
}


@override
int get hashCode => Object.hash(runtimeType,myQuerySession);

@override
String toString() {
  return 'QueryState<$TData>.initialLoading(myQuerySession: $myQuerySession)';
}


}

/// @nodoc
abstract mixin class _$InitialLoadingCopyWith<TData extends Object,$Res> implements $QueryStateCopyWith<TData, $Res> {
  factory _$InitialLoadingCopyWith(_InitialLoading<TData> value, $Res Function(_InitialLoading<TData>) _then) = __$InitialLoadingCopyWithImpl;
@override @useResult
$Res call({
 int myQuerySession
});




}
/// @nodoc
class __$InitialLoadingCopyWithImpl<TData extends Object,$Res>
    implements _$InitialLoadingCopyWith<TData, $Res> {
  __$InitialLoadingCopyWithImpl(this._self, this._then);

  final _InitialLoading<TData> _self;
  final $Res Function(_InitialLoading<TData>) _then;

/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myQuerySession = null,}) {
  return _then(_InitialLoading<TData>(
myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _InitialLoadingFailed<TData extends Object> extends QueryState<TData> {
  const _InitialLoadingFailed(this.error, {required this.myQuerySession}): super._();
  

 final  OperationException error;
@override final  int myQuerySession;

/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialLoadingFailedCopyWith<TData, _InitialLoadingFailed<TData>> get copyWith => __$InitialLoadingFailedCopyWithImpl<TData, _InitialLoadingFailed<TData>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialLoadingFailed<TData>&&(identical(other.error, error) || other.error == error)&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession));
}


@override
int get hashCode => Object.hash(runtimeType,error,myQuerySession);

@override
String toString() {
  return 'QueryState<$TData>.initialLoadingFailed(error: $error, myQuerySession: $myQuerySession)';
}


}

/// @nodoc
abstract mixin class _$InitialLoadingFailedCopyWith<TData extends Object,$Res> implements $QueryStateCopyWith<TData, $Res> {
  factory _$InitialLoadingFailedCopyWith(_InitialLoadingFailed<TData> value, $Res Function(_InitialLoadingFailed<TData>) _then) = __$InitialLoadingFailedCopyWithImpl;
@override @useResult
$Res call({
 OperationException error, int myQuerySession
});




}
/// @nodoc
class __$InitialLoadingFailedCopyWithImpl<TData extends Object,$Res>
    implements _$InitialLoadingFailedCopyWith<TData, $Res> {
  __$InitialLoadingFailedCopyWithImpl(this._self, this._then);

  final _InitialLoadingFailed<TData> _self;
  final $Res Function(_InitialLoadingFailed<TData>) _then;

/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = null,Object? myQuerySession = null,}) {
  return _then(_InitialLoadingFailed<TData>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as OperationException,myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Loaded<TData extends Object> extends QueryState<TData> {
  const _Loaded(this.data, {required this.myQuerySession, required this.isRefetching}): super._();
  

 final  TData? data;
@override final  int myQuerySession;
 final  bool isRefetching;

/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<TData, _Loaded<TData>> get copyWith => __$LoadedCopyWithImpl<TData, _Loaded<TData>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded<TData>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession)&&(identical(other.isRefetching, isRefetching) || other.isRefetching == isRefetching));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),myQuerySession,isRefetching);

@override
String toString() {
  return 'QueryState<$TData>.loaded(data: $data, myQuerySession: $myQuerySession, isRefetching: $isRefetching)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<TData extends Object,$Res> implements $QueryStateCopyWith<TData, $Res> {
  factory _$LoadedCopyWith(_Loaded<TData> value, $Res Function(_Loaded<TData>) _then) = __$LoadedCopyWithImpl;
@override @useResult
$Res call({
 TData? data, int myQuerySession, bool isRefetching
});




}
/// @nodoc
class __$LoadedCopyWithImpl<TData extends Object,$Res>
    implements _$LoadedCopyWith<TData, $Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded<TData> _self;
  final $Res Function(_Loaded<TData>) _then;

/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? myQuerySession = null,Object? isRefetching = null,}) {
  return _then(_Loaded<TData>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TData?,myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,isRefetching: null == isRefetching ? _self.isRefetching : isRefetching // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Disabled<TData extends Object> extends QueryState<TData> {
  const _Disabled({required this.myQuerySession}): super._();
  

@override final  int myQuerySession;

/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisabledCopyWith<TData, _Disabled<TData>> get copyWith => __$DisabledCopyWithImpl<TData, _Disabled<TData>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Disabled<TData>&&(identical(other.myQuerySession, myQuerySession) || other.myQuerySession == myQuerySession));
}


@override
int get hashCode => Object.hash(runtimeType,myQuerySession);

@override
String toString() {
  return 'QueryState<$TData>.disabled(myQuerySession: $myQuerySession)';
}


}

/// @nodoc
abstract mixin class _$DisabledCopyWith<TData extends Object,$Res> implements $QueryStateCopyWith<TData, $Res> {
  factory _$DisabledCopyWith(_Disabled<TData> value, $Res Function(_Disabled<TData>) _then) = __$DisabledCopyWithImpl;
@override @useResult
$Res call({
 int myQuerySession
});




}
/// @nodoc
class __$DisabledCopyWithImpl<TData extends Object,$Res>
    implements _$DisabledCopyWith<TData, $Res> {
  __$DisabledCopyWithImpl(this._self, this._then);

  final _Disabled<TData> _self;
  final $Res Function(_Disabled<TData>) _then;

/// Create a copy of QueryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myQuerySession = null,}) {
  return _then(_Disabled<TData>(
myQuerySession: null == myQuerySession ? _self.myQuerySession : myQuerySession // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
