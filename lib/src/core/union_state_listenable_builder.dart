import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:union_state/src/core/union_state.dart';
import 'package:union_state/src/entity/failure/failure.dart';

/// Presentation part builder for [ValueListenable] and [UnionState].
class UnionStateListenableBuilder<T> extends StatelessWidget {
  /// [ValueListenable] which builder callbacks react.
  final ValueListenable<UnionState<T>> unionStateListenable;

  /// Builder describing the interface when [UnionStateContent] arrives.
  final DataWidgetBuilder<T> builder;

  /// Builder describing the interface when [UnionStateLoading] arrives.
  final LoadingWidgetBuilder<T> loadingBuilder;

  /// Builder describing the interface when [UnionStateFailure] arrives.
  final FailureWidgetBuilder<T> failureBuilder;

  /// @nodoc
  const UnionStateListenableBuilder({
    required this.unionStateListenable,
    required this.builder,
    required this.loadingBuilder,
    required this.failureBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UnionState<T>>(
      valueListenable: unionStateListenable,
      builder: (context, state, _) {
        if (state is UnionStateFailure<T>) {
          return failureBuilder(context, state.failure, state.data);
        }

        if (state is UnionStateLoading<T>) {
          return loadingBuilder(context, state.data);
        }

        if (state is UnionStateContent<T>) {
          return builder(context, state.data);
        }

        throw StateError('Wrong state type of $state');
      },
    );
  }
}

/// Builder function for the [UnionStateLoading] state.
typedef LoadingWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T? data,
);

/// Builder function for the [UnionStateContent] state.
typedef DataWidgetBuilder<T> = Widget Function(BuildContext context, T data);

/// Builder function for the [UnionStateFailure] state.
typedef FailureWidgetBuilder<T> = Widget Function(
  BuildContext context,
  Failure? e,
  T? data,
);
