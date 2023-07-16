import 'package:example/features/countries/entity/country_entity.dart';
import 'package:example/features/countries/repository/countries_repository/countries_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:union_state/union_state.dart';

part 'results.freezed.dart';

/// Result of [ICountriesRepository.getCountries] method
///
/// Can return the following values:
/// * [CountriesResult.success] - if the request is successful
/// * [CountriesResult.failure] - if the request was unsuccessful.
@freezed
class CountriesResult with _$CountriesResult {
  /// @nodoc
  const factory CountriesResult.success(List<CountryEntity> countries) = _CountriesSuccess;

  /// @nodoc
  const factory CountriesResult.failure(Failure failure) = _CountriesFailure;
}
