// ignore_for_file: comment_references

import 'package:flutter/foundation.dart';
import 'package:union_state/src/core/union_state.dart';

/// Internal replacement for [EntityStateNotifier]. Unlike [EntityState]:
/// * Guarantees a non-zero result [T].
/// * Explicitly guarantees only 3 states: loading, content, failure.
class UnionStateNotifier<T> extends ValueNotifier<UnionState<T>> {
  /// Instantiate [UnionStateNotifier].
  UnionStateNotifier(T initialData) : super(UnionStateContent<T>(initialData));

  /// Creates UnionStateNotifier.loading
  UnionStateNotifier.loading([T? data]) : super(UnionStateLoading<T>(data));

  /// Creates UnionStateNotifier.failure
  UnionStateNotifier.failure([Exception? exception, T? data])
      : super(UnionStateFailure<T>(exception, data));

  /// Accept state with content.
  void content(T data) => super.value = UnionStateContent<T>(data);

  /// Accept state with failure.
  void failure([Exception? exception, T? data]) =>
      super.value = UnionStateFailure<T>(exception, data);

  /// Accept loading state.
  void loading([T? previousData]) =>
      super.value = UnionStateLoading<T>(previousData);
}
