import 'package:example/features/countries/bloc/countries_list_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'countries_list_event.freezed.dart';

/// Country List Events for [CountriesListBloc]
abstract interface class ICountriesListEvent {}

@freezed
class CountriesListEvent with _$CountriesListEvent  implements ICountriesListEvent {
  /// Download country list
  const factory CountriesListEvent.load() = CountriesListEventLoad;
}
