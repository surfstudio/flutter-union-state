import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:union_state/src/entity/failure/failure.dart';

/// A universal model for mapping basic UI states.
///
/// Internal replacement for [EntityState]. Unlike [EntityState]:
/// * Guarantees a non-zero result [T].
/// * Explicitly guarantees only 3 states: loading, content, error.
class UnionState<T> {
  /// Union is in a state of error.
  bool get hasFailure => this is UnionStateFailure<T>;

  /// Union is in a bootstrapped state.
  bool get isLoading => this is UnionStateLoading<T>;

  /// Data [T] entity.
  T? get data => null;

  const UnionState._();

  /// See [UnionStateContent]
  const factory UnionState.content(T data) = UnionStateContent<T>;

  /// See [UnionStateLoading]
  const factory UnionState.loading([T? data]) = UnionStateLoading<T>;

  /// See [UnionStateFailure]
  const factory UnionState.failure([Failure? failure, T? data]) =
      UnionStateFailure<T>;

  /// Kotlin-like function to optionally handle all possible floes.
  void maybeWhen({
    ValueChanged<T>? content,
    ValueChanged<T?>? loading,
    void Function(Failure?, T?)? failure,
  }) {
    if (isLoading) loading?.call(data);
    if (hasFailure) failure?.call((this as UnionStateFailure<T>).failure, data);
    if (data != null) content?.call(data as T);
  }

  /// Kotlin-like function to handle all possible floes.
  void when({
    required ValueChanged<T> content,
    required ValueChanged<T?> loading,
    required void Function(Failure?, T?) failure,
  }) =>
      maybeWhen(
        content: content,
        loading: loading,
        failure: failure,
      );

  /// Kotlin-like function to optionally convert to [R] all possible floes.
  R? maybeMap<R>({
    R Function(T)? content,
    R Function(T?)? loading,
    R Function(Failure?, T?)? failure,
  }) {
    if (isLoading) return loading?.call(data);
    if (hasFailure) {
      return failure?.call((this as UnionStateFailure<T>).failure, data);
    }
    if (data != null) return content?.call(data as T);

    return null;
  }

  /// Kotlin-like function to convert to [R] all possible floes.
  R map<R>({
    required R Function(T) content,
    required R Function(T?) loading,
    required R Function(Failure?, T?) failure,
  }) =>
      maybeMap(
        content: content,
        loading: loading,
        failure: failure,
      )!;
}

/// Content Availability State.
class UnionStateContent<T> extends UnionState<T> {
  @override
  final T data;

  /// Content Availability Status.
  const UnionStateContent(this.data) : super._();
}

/// Loading status.
class UnionStateLoading<T> extends UnionState<T> {
  @override
  final T? data;

  /// Loading status.
  const UnionStateLoading([this.data]) : super._();
}

/// Error Status.
class UnionStateFailure<T> extends UnionState<T> {
  /// Error Object.
  final Failure? failure;

  @override
  final T? data;

  /// Error Status.
  const UnionStateFailure([this.failure, this.data]) : super._();
}
