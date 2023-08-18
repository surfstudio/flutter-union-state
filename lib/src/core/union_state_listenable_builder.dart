import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:union_state/src/core/union_state.dart';

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

  /// Creates a [UnionStateListenableBuilder].
  ///
  /// The [unionStateListenable], [builder], [loadingBuilder] and [failureBuilder] arguments
  /// must not be null.
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
        switch (state) {
          case UnionStateContent(data: final data):
            return builder(context, data);
          case UnionStateLoading(data: final data):
            return loadingBuilder(context, data);
          case UnionStateFailure(data: final data, exception: final exception):
            return failureBuilder(context, exception, data);
        }
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
  Exception? e,
  T? data,
);
