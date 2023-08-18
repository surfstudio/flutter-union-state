import 'package:flutter/foundation.dart';
import 'package:union_state/src/core/union_state.dart';

/// A custom [ValueNotifier] that encapsulates the state of a union type. It provides methods
/// to manage different states of data:
///
/// - [content]: Represents a state with successful content.
/// - [failure]: Represents a state with an error and, optionally, previous data.
/// - [loading]: Represents a state indicating that data is being loaded.
///
/// This class simplifies the management of different states within your application by providing
/// convenient methods to update and handle these states.
/// * Guarantees a non-zero result [T].
/// * Explicitly guarantees only 3 states: loading, content, failure.
class UnionStateNotifier<T> extends ValueNotifier<UnionState<T>> {
  /// Instantiate [UnionStateNotifier] with an initial content state.
  ///
  /// The [initialData] parameter represents the initial content data.
  UnionStateNotifier(T initialData) : super(UnionStateContent<T>(initialData));

  /// Creates [UnionStateNotifier] with a loading state.
  ///
  /// The [data] parameter (optional) can be used to specify previous data that might be
  /// relevant during loading.
  UnionStateNotifier.loading([T? data]) : super(UnionStateLoading<T>(data));

  /// Creates [UnionStateNotifier] with a failure state.
  ///
  /// The [exception] parameter (optional) represents the exception that occurred,
  /// and the [data] parameter (optional) can hold previous data.
  UnionStateNotifier.failure([Exception? exception, T? data])
      : super(UnionStateFailure<T>(exception, data));

  /// Sets the state to content with the provided [data].
  ///
  /// The [data] parameter represents the successful content data.
  void content(T data) => super.value = UnionStateContent<T>(data);

  /// Sets the state to failure with the given [exception] and [data].
  ///
  /// The [exception] parameter (optional) represents the exception that occurred,
  /// and the [data] parameter (optional) can hold previous data.
  void failure([Exception? exception, T? data]) =>
      super.value = UnionStateFailure<T>(exception, data);

  /// Sets the state to loading.
  ///
  /// The [previousData] parameter (optional) can be used to specify previous data that might
  /// be relevant during loading.
  void loading([T? previousData]) =>
      super.value = UnionStateLoading<T>(previousData);
}
