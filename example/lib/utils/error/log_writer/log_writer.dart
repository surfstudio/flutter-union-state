
import 'package:union_state/union_state.dart';

/// Log writer utility.
abstract class ILogWriter {
  /// Log simple message.
  void log(String message, [String? sender]);

  /// Log some exception.
  void exception(Exception exception, [StackTrace? stackTrace]);

  /// Log some failure.
  void failure(Failure failure);
}
