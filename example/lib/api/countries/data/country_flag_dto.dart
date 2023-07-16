import 'package:json_annotation/json_annotation.dart';

part 'country_flag_dto.g.dart';

/// DTO for country.
@JsonSerializable()
final class CountryFlagDto {
  final String png;
  final String svg;

  CountryFlagDto({
    required this.png,
    required this.svg,
  });

  factory CountryFlagDto.fromJson(Map<String, dynamic> json) => _$CountryFlagDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CountryFlagDtoToJson(this);
}
