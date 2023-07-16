import 'package:example/features/countries/di/countries_list_scope.dart';
import 'package:example/features/countries/presentation/screens/country_list_screen/country_list_screen.dart';
import 'package:example/features/countries/presentation/screens/country_list_screen/country_list_screen_wm.dart';
import 'package:example/utils/error/di_scope/di_scope.dart';
import 'package:flutter/material.dart';

/// Navigation
abstract class AppRouter {
  static const String root = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.root:
      default:
        return MaterialPageRoute(builder: (context) {
          final countriesListScope = ICountriesListScope.create(context);

          return DiScope<ICountriesListScope>(
            factory: () => countriesListScope,
            child: const CountryListScreen(CountryListScreenWm.create),
          );
        });
    }
  }
}
