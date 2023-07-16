import 'package:dio/dio.dart';
import 'package:example/api/countries/countries_api.dart';
import 'package:example/features/common/mappers/dio_exception_mapper.dart';
import 'package:example/features/countries/repository/countries_repository/countries_repository.dart';
import 'package:example/features/countries/repository/countries_repository/data/results.dart';
import 'package:example/features/countries/repository/countries_repository/mappers/country_mappers.dart';
import 'package:example/utils/error/log_writer/log_writer.dart';
import 'package:union_state/union_state.dart';

/// Implementation of [ICountriesRepository] working with api
final class CountriesRepositoryRemote implements ICountriesRepository {
  final CountriesApi _countriesApi;

  final ILogWriter _logWriter;

  /// @nodoc
  CountriesRepositoryRemote(
    this._countriesApi,
    this._logWriter,
  );

  @override
  Future<CountriesResult> getCountries() async {
    try {
      final result = await _countriesApi.getAll();
      return CountriesResult.success(
        result.map(mapCountry).toList(),
      );
    } on DioException catch (e, st) {
      return CountriesResult.failure(
        DioExceptionMapper.mapToFailure(e, st),
      );
    } on Exception catch (e, st) {
      _logWriter.exception(e);
      return CountriesResult.failure(
        Failure(
          parentException: e,
          stackTrace: st,
        ),
      );
    }
  }
}
