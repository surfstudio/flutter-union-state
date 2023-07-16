import 'package:example/features/countries/repository/countries_repository/data/results.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Country list repository interface
///
/// Used by the business logic component.
// ignore: one_member_abstracts
abstract interface class ICountriesRepository {
  /// Get a list of all countries
  /// The result [CountriesResult] as a [freezed]-object contains either
  /// success [CountriesResult.success] with the list of TCs (the list can be empty),
  /// or an error [CountriesResult.failure] (also [freezed]-object) with an error message
  Future<CountriesResult> getCountries();
}
