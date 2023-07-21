import 'dart:math';

import 'package:elementary/elementary.dart';
import 'package:union_state/union_state.dart';

/// Default Elementary model for Example module
class ExampleModel extends ElementaryModel {
  final _random = Random();
  final dataState = UnionStateNotifier<String>.loading();

  void initLoadData() {
    dataState.loading(dataState.value.data);
    Future.delayed(
      const Duration(seconds: 1),
      () {
        _random.nextInt(10) < 8
            ? dataState.content('Loaded Data')
            : dataState.failure();
      },
    );
  }
}
