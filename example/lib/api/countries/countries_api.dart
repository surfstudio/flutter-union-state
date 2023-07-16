import 'package:dio/dio.dart';
import 'package:example/api/countries/countries_api_urls.dart';
import 'package:example/api/countries/data/country_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'countries_api.g.dart';

@RestApi()
abstract class CountriesApi {
  factory CountriesApi(Dio dio, {String baseUrl}) = _CountriesApi;

  /// Request to get a list of all countries
  @GET(CountriesApiUrls.all)
  Future<List<CountryResponseDto>> getAll();
}
