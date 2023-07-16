import 'package:example/features/app/app.dart';
import 'package:example/features/app/di/app_scope.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    App(AppScope()),
  );
}
