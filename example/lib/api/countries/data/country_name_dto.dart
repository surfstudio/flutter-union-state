import 'package:json_annotation/json_annotation.dart';

part 'country_name_dto.g.dart';

/// DTO for country.
@JsonSerializable()
final class CountryNameDto {
  final String common;
  final String official;

  CountryNameDto({
    required this.common,
    required this.official,
  });

  factory CountryNameDto.fromJson(Map<String, dynamic> json) => _$CountryNameDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CountryNameDtoToJson(this);
}
