import 'package:flutter/material.dart';

/// An universal model for mapping basic UI states.
///
/// * Guarantees a non-zero result [T] only for content.
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

  /// Creates [UnionStateContent] with the specified [data].
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

  /// Creates [UnionStateLoading] with optional [data].
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
  final Exception? exception;

  @override
  int get hashCode => data.hashCode ^ exception.hashCode;

  /// Creates [UnionStateFailure] with optional [exception] and [data].
  const UnionStateFailure([this.exception, this.data]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnionStateFailure<T> &&
            identical(other.data, data) &&
            identical(other.exception, exception));
  }
}
