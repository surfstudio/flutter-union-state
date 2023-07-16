// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryResponseDto _$CountryResponseDtoFromJson(Map<String, dynamic> json) =>
    CountryResponseDto(
      name: CountryNameDto.fromJson(json['name'] as Map<String, dynamic>),
      flags: CountryFlagDto.fromJson(json['flags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryResponseDtoToJson(CountryResponseDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'flags': instance.flags,
    };
