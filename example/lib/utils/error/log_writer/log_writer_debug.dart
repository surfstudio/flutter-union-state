import 'package:example/utils/error/log_writer/log_writer.dart';
import 'package:logger/logger.dart';
import 'package:union_state/union_state.dart';

/// Log writer for debug mode.
final class LogWriterDebug implements ILogWriter {
  final Logger _logger;

  /// @nodoc
  LogWriterDebug(this._logger);

  @override
  void exception(Exception exception, [StackTrace? stackTrace]) {
    _logger.e('An exception occured', exception, stackTrace);
  }

  @override
  void log(String message, [String? sender]) {
    _logger.d(message);
  }

  @override
  void failure(Failure failure) {
    _logger.e(failure.message, failure.parentException);
  }
}
