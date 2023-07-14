// ignore_for_file: comment_references

import 'package:flutter/foundation.dart';
import 'package:union_state/src/core/union_state.dart';
import 'package:union_state/src/entity/failure/failure.dart';

/// Internal replacement for [EntityStateNotifier]. Unlike [EntityState]:
/// * Guarantees a non-zero result [T].
/// * Explicitly guarantees only 3 states: loading, content, failure.
class UnionStateNotifier<T> extends ValueNotifier<UnionState<T>> {
  /// Создает UnionStateNotifier
  UnionStateNotifier(T initialData) : super(UnionState<T>.content(initialData));

  /// Creates UnionStateNotifier.loading
  UnionStateNotifier.loading([T? data]) : super(UnionState<T>.loading(data));

  /// Creates UnionStateNotifier.failure
  UnionStateNotifier.failure([Failure? failure, T? data])
      : super(UnionState<T>.failure(failure, data));

  /// Accept state with content.
  void content(T data) => super.value = UnionState<T>.content(data);

  /// Accept state with failure.
  void failure([Failure? failure, T? data]) =>
      super.value = UnionState<T>.failure(failure, data);

  /// Accept loading state.
  void loading([T? previousData]) =>
      super.value = UnionState<T>.loading(previousData);
}
