import 'package:elementary/elementary.dart';
import 'package:example/example/example_wm.dart';
import 'package:flutter/material.dart';
import 'package:union_state/union_state.dart';

/// Main widget for Example module
class ExampleScreen extends ElementaryWidget<IExampleWM> {
  const ExampleScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultExampleWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IExampleWM wm) {
    final refreshBtn = IconButton(
      onPressed: wm.refreshData,
      icon: ValueListenableBuilder<UnionState<String>>(
        valueListenable: wm.dataState,
        builder: (_, data, ___) => switch (data) {
          UnionStateLoading(data: _) => const SizedBox.shrink(),
          _ => const Icon(Icons.refresh),
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(actions: [refreshBtn]),
      body: UnionStateListenableBuilder<String>(
        unionStateListenable: wm.dataState,
        builder: (_, data) => Center(child: Text(data)),
        loadingBuilder: (_, lastData) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              if (lastData != null) ...[
                const SizedBox(height: 10),
                Text('Last data: $lastData'),
              ],
            ],
          ),
        ),
        failureBuilder: (_, failure, lastData) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(failure?.message ?? 'Unexpected error'),
              if (lastData != null) ...[
                const SizedBox(height: 10),
                Text('Last data: $lastData'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
