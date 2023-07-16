import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_entity.freezed.dart';

/// Entity Country model
@freezed
class CountryEntity with _$CountryEntity {
  /// Factory for creating the entity of a country
  factory CountryEntity({
    required String name,
    required String flag,
  }) = _CountryEntity;
}
