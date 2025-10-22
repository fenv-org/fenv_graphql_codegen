import 'package:freezed_annotation/freezed_annotation.dart';

abstract interface class QuerySession {
  int get myQuerySession;
}

@internal
mixin CreatedQuerySession implements QuerySession {
  @override
  int get myQuerySession => 0;
}
