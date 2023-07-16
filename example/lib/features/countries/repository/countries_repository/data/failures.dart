import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Error entity for the results of ICountriesRepository operations
@freezed
class CountriesFailure with _$CountriesFailure {
  /// Standard error factory for missing data
  /// Accepts two parameters:
  /// - [title] - the title of the error of type [String];
  /// - [message] - error message of [String] type.
  const factory CountriesFailure.dataUnavailable({
    required String title,
    required String message,
  }) = DataUnavailable;
}
