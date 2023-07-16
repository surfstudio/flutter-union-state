import 'package:example/features/countries/bloc/countries_list_bloc.dart';
import 'package:example/features/countries/bloc/countries_list_event.dart';
import 'package:example/features/countries/entity/country_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:union_state/union_state.dart';

part 'countries_list_state.freezed.dart';

/// State of country list for[CountriesListBloc]
@freezed
class CountriesListState with _$CountriesListState {
  /// Initial status. The country list has not yet been loaded.
  const factory CountriesListState.initial() = CountriesListStateInitial;

  /// Loading the list of countries.
  const factory CountriesListState.loading() = CountriesListStateLoading;

  /// The list of countries [countries] has been successfully loaded.
  const factory CountriesListState.success(
    List<CountryEntity> countries,
  ) = CountriesListStateSuccess;

  /// An error [failure] occurred while loading the list of countries.
  const factory CountriesListState.failure(Failure failure) = CountriesListStateFailure;

  /// List is empty
  ///
  /// Comes after [CountriesListEvent.load] if the list is empty
  const factory CountriesListState.empty() = _Empty;
}
