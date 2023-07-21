import 'package:elementary/elementary.dart';
import 'package:example/example/example_model.dart';
import 'package:example/example/example_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:union_state/union_state.dart';

abstract class IExampleWM extends IWidgetModel {
  ValueListenable<UnionState<String>> get dataState;

  void refreshData();
}

ExampleWM defaultExampleWidgetModelFactory(BuildContext context) {
  return ExampleWM(ExampleModel());
}

/// Default widget model for ExampleWidget
class ExampleWM extends WidgetModel<ExampleScreen, ExampleModel>
    implements IExampleWM {
  @override
  ValueListenable<UnionState<String>> get dataState => model.dataState;

  //@nodoc.
  ExampleWM(ExampleModel model) : super(model);

  @override
  void initWidgetModel() {
    model.initLoadData();
    super.initWidgetModel();
  }

  @override
  void refreshData() {
    model.initLoadData();
  }
}
