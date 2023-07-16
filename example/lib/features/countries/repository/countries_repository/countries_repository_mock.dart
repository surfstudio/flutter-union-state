import 'dart:convert';

import 'package:example/api/countries/data/country_response_dto.dart';
import 'package:example/features/countries/repository/countries_repository/countries_repository.dart';
import 'package:example/features/countries/repository/countries_repository/data/results.dart';
import 'package:example/features/countries/repository/countries_repository/mappers/country_mappers.dart';
import 'package:flutter/services.dart';

/// Country repository, for emulate backend if api die.
final class CountriesRepositoryMock implements ICountriesRepository {
  CountriesRepositoryMock();

  /// Return all countries
  @override
  Future<CountriesResult> getCountries() async {
    final countriesJson = await rootBundle.loadString('assets/mock_data/countries.json');
    final listData = (jsonDecode(countriesJson) as List<dynamic>).map(
      // ignore: avoid_annotating_with_dynamic
      (dynamic i) => CountryResponseDto.fromJson(i as Map<String, dynamic>),
    );

    return CountriesResult.success(
      listData.map(mapCountry).toList(),
    );
  }
}
