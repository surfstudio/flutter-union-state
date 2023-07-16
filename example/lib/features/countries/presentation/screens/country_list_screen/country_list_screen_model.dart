import 'package:elementary/elementary.dart';
import 'package:example/features/countries/bloc/countries_list_bloc.dart';
import 'package:example/features/countries/bloc/countries_list_event.dart';
import 'package:example/features/countries/entity/country_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:union_state/union_state.dart';

/// Country list state type
typedef CountryListState = ValueListenable<UnionState<List<CountryEntity>>>;

/// Interface [ElementaryModel] for CountryListScreen
abstract interface class ICountryListScreenModel extends ElementaryModel {
  CountryListState get countryListState;

  /// Update country list
  Future<void> refresh();
}

/// Model for CountryListScreen
final class CountryListScreenModel extends ElementaryModel implements ICountryListScreenModel {
  final CountriesListBloc _countriesListBloc;

  @override
  final UnionStateNotifier<List<CountryEntity>> countryListState =
      UnionStateNotifier<List<CountryEntity>>([]);

  CountryListScreenModel(this._countriesListBloc);

  @override
  void init() {
    super.init();
    _countriesListBloc.add(const CountriesListEvent.load());
    _countriesListBloc.stream.listen((state) {
      state.whenOrNull(
        loading: () {
          countryListState.loading();
        },
        success: (data) {
          countryListState.content(data);
        },
        failure: (failure) {
          countryListState.failure(failure);
        },
        empty: () {
          countryListState.content([]);
        },
      );
    });
  }

  @override
  Future<void> refresh() async {
    _countriesListBloc.add(const CountriesListEvent.load());
  }
}
