import 'package:example/api/countries/data/country_flag_dto.dart';
import 'package:example/api/countries/data/country_name_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_response_dto.g.dart';

/// DTO for country.
@JsonSerializable()
final class CountryResponseDto {
  final CountryNameDto name;
  final CountryFlagDto flags;

  CountryResponseDto({
    required this.name,
    required this.flags,
  });

  factory CountryResponseDto.fromJson(Map<String, dynamic> json) => _$CountryResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CountryResponseDtoToJson(this);
}
