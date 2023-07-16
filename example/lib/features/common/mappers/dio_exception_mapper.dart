import 'package:dio/dio.dart';
import 'package:union_state/union_state.dart';

/// A class that converts a [DioException] to a [Failure].
abstract class DioExceptionMapper {
  /// Converts [DioException] to [Failure].
  static Failure mapToFailure(DioException error, [StackTrace? st]) {
    final dynamic e = error.error;
    if (e is Failure) {
      return e;
    }

    return Failure(
      parentException: error,
      stackTrace: st,
    );
  }
}
