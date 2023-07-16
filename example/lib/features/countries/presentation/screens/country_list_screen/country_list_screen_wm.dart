import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:example/features/app/di/app_scope.dart';
import 'package:example/features/countries/di/countries_list_scope.dart';
import 'package:example/features/countries/presentation/screens/country_list_screen/country_list_screen.dart';
import 'package:example/features/countries/presentation/screens/country_list_screen/country_list_screen_model.dart';
import 'package:example/res/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Interface of [CountryListScreenWm]
abstract interface class ICountryListWM implements IWidgetModel {
  /// Country list state
  CountryListState get countryListState;

  /// Style of country name
  TextStyle get countryNameStyle;

  /// Refresh the list
  Future<void> onRefresh();
}

/// Widget Model for [CountryListScreen]
class CountryListScreenWm extends WidgetModel<CountryListScreen, ICountryListScreenModel>
    implements ICountryListWM {
  final ThemeWrapper _themeWrapper;

  @override
  CountryListState get countryListState => model.countryListState;

  @override
  TextStyle get countryNameStyle => _countryNameStyle;

  late TextStyle _countryNameStyle;

  CountryListScreenWm(
    super._model,
    this._themeWrapper,
  );

  /// Create WM screen Country List by context.
  factory CountryListScreenWm.create(BuildContext context) => _create(context);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _countryNameStyle = _themeWrapper.getTextTheme(context).headlineMedium ?? AppTypography.title3;
  }

  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);

    if (error is DioException &&
        (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Connection troubles')));
    }
  }

  @override
  Future<void> onRefresh() => model.refresh();
}

/// Factory for [CountryListScreenWm]
CountryListScreenWm _create(BuildContext context) {
  final appScope = context.read<IAppScope>();
  final countriesScope = context.read<ICountriesListScope>();

  final model = CountryListScreenModel(countriesScope.countriesListBloc);
  final theme = appScope.themeWrapper;

  return CountryListScreenWm(model, theme);
}
