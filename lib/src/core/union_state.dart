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
class UnionStateContent<T> implements UnionState<T> {
  @override
  final T data;

  UnionStateContent(this.data);
}

/// Loading status.
class UnionStateLoading<T> implements UnionState<T> {
  @override
  final T? data;

  UnionStateLoading([this.data]);
}

/// Error Status.
class UnionStateFailure<T> implements UnionState<T> {
  @override
  final T? data;
  final Failure? failure;

  UnionStateFailure([this.failure, this.data]);
}
