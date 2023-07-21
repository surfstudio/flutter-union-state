import 'package:flutter/material.dart';
import 'package:union_state/union_state.dart';

/// A universal model for mapping basic UI states.
///
/// Internal replacement for [EntityState]. Unlike [EntityState]:
/// * Guarantees a non-zero result [T].
/// * Explicitly guarantees only 3 states: loading, content, error.
sealed class UnionState<T> {
  T? get data;
}

/// Content Availability State.
@immutable
class UnionStateContent<T> implements UnionState<T> {
  @override
  final T data;

  @override
  int get hashCode => data.hashCode;

  const UnionStateContent(this.data);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnionStateContent<T> &&
            identical(other.data, data));
  }
}

/// Loading status.
@immutable
class UnionStateLoading<T> implements UnionState<T> {
  @override
  final T? data;

  @override
  int get hashCode => data.hashCode;

  const UnionStateLoading([this.data]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnionStateLoading<T> &&
            identical(other.data, data));
  }
}

/// Error Status.
@immutable
class UnionStateFailure<T> implements UnionState<T> {
  @override
  final T? data;
  final Failure? failure;

  @override
  int get hashCode => data.hashCode ^ failure.hashCode;

  const UnionStateFailure([this.failure, this.data]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnionStateFailure<T> &&
            identical(other.data, data) &&
            identical(other.failure, failure));
  }
}
