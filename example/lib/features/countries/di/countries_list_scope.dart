import 'package:example/api/countries/countries_api.dart';
import 'package:example/features/app/di/app_scope.dart';
import 'package:example/features/countries/bloc/countries_list_bloc.dart';
import 'package:example/features/countries/repository/countries_repository/countries_repository.dart';
import 'package:example/features/countries/repository/countries_repository/countries_repository_remote.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// DI component interface for Country List
abstract class ICountriesListScope {
  /// BLoC country list
  CountriesListBloc get countriesListBloc;

  /// @nodoc
  factory ICountriesListScope.create(BuildContext context) {
    final appScope = context.read<IAppScope>();
    return CountriesListScope._(appScope);
  }
}

/// Specific Component.
class CountriesListScope implements ICountriesListScope {
  final IAppScope _appScope;

  @override
  CountriesListBloc get countriesListBloc => CountriesListBloc(
        _createCountriesRepository(),
      );

  CountriesApi get _countriesApi => CountriesApi(_appScope.dio);

  /// @nodoc
  CountriesListScope._(this._appScope);

  ICountriesRepository _createCountriesRepository() => CountriesRepositoryRemote(
        _countriesApi,
        _appScope.logWriter,
      );

  /// Uncomment to use mock instead real backend
  /// ICountriesRepository _createCountriesRepository() => CountriesRepositoryMock();
}
