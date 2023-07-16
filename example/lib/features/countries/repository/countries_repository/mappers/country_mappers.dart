import 'package:example/api/countries/data/country_response_dto.dart';
import 'package:example/features/countries/entity/country_entity.dart';

/// Map Country from CountryData
CountryEntity mapCountry(CountryResponseDto dto) {
  return CountryEntity(
    name: dto.name.common,
    flag: dto.flags.png.replaceFirst('/w320/', '/w640/'),
  );
}
