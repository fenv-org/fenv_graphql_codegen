import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';

/// An unmodifiable [List] view of another List.
///
/// The key difference from the original [UnmodifiableListView] is that this
/// class allows to slice the original list. Thus, even if the original list
/// grows, the sliced list will not be affected.
@internal
class UnmodifiableListSlice<T> extends UnmodifiableListView<T> {
  UnmodifiableListSlice(super.source, this.start, this.end);

  factory UnmodifiableListSlice.withAll(Iterable<T> source) =>
      UnmodifiableListSlice<T>(source, 0, source.length);

  final int start;
  final int end;

  @override
  List<R> cast<R>() => UnmodifiableListSlice(super.cast<R>(), start, end);

  @override
  int get length => end - start;

  @override
  T operator [](int index) => super[start + index];
}
