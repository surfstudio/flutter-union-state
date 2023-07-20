import 'package:union_state/union_state.dart';

sealed class UnionState<T> {
  T? get data;
}

class UnionStateContent<T> implements UnionState<T> {
  @override
  final T data;

  UnionStateContent(this.data);
}

class UnionStateLoading<T> implements UnionState<T> {
  @override
  final T? data;

  UnionStateLoading([this.data]);
}

class UnionStateFailure<T> implements UnionState<T> {
  @override
  final T? data;
  final Failure? failure;

  UnionStateFailure([this.failure, this.data]);
}
