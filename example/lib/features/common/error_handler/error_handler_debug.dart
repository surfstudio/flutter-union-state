import 'package:elementary/elementary.dart';
import 'package:example/utils/error/log_writer/log_writer.dart';
import 'package:union_state/union_state.dart';

/// Basic error handler for [ElementaryModel] application.
class ErrorHandlerDebug implements ErrorHandler {
  final ILogWriter _logWriter;

  /// @nodoc
  ErrorHandlerDebug(this._logWriter);

  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    if (error is Exception) {
      _logWriter.exception(error);
    } else if (error is Failure) {
      _logWriter.failure(error);
    } else {
      _logWriter.log(error.toString(), 'Elementary ErrorHandler');
    }
  }
}
