import 'package:example/features/countries/bloc/countries_list_event.dart';
import 'package:example/features/countries/bloc/countries_list_state.dart';
import 'package:example/features/countries/repository/countries_repository/countries_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Bloc for country list.
final class CountriesListBloc extends Bloc<ICountriesListEvent, CountriesListState> {
  final ICountriesRepository _repository;

  CountriesListBloc(this._repository) : super(const CountriesListState.initial()) {
    on<CountriesListEventLoad>(_onLoad);
  }

  Future<void> _onLoad(
    CountriesListEventLoad event,
    Emitter<CountriesListState> emit,
  ) async {
    emit(const CountriesListState.loading());

    final countries = await _repository.getCountries();
    countries.when(
      success: (countries) => countries.isEmpty
          ? emit(const CountriesListState.empty())
          : emit(CountriesListState.success(countries)),
      failure: (failure) => emit(CountriesListState.failure(failure)),
    );
  }
}
