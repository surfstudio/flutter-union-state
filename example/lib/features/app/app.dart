import 'package:example/features/app/di/app_scope.dart';
import 'package:example/features/navigation/app_router.dart';
import 'package:example/utils/error/di_scope/di_scope.dart';
import 'package:flutter/material.dart';

/// App widget.
class App extends StatefulWidget {
  /// Scope of dependencies which need through all app's life.
  final AppScope appScope;

  /// Create an instance App.
  const App(this.appScope, {super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late IAppScope _scope;

  @override
  void initState() {
    super.initState();
    _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
  }

  void _rebuildApplication() {
    setState(() {
      _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      key: ObjectKey(_scope),
      factory: () {
        return _scope;
      },
      child: MaterialApp(
        title: 'Countries',
        theme: ThemeData(
          primaryColor: Colors.blue,
          fontFamily: 'Roboto',
        ),
        darkTheme: ThemeData.dark(),
        initialRoute: AppRouter.root,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
