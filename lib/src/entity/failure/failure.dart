/// Error handled in the application's binary logic layer.
///
/// This is expected to be the only kind of error we can get
/// in the presentation layer of the application.
class Failure implements Exception {
  /// Error message.
  ///
  /// Should have a content that will be understandable when reading logs
  //// or at least when displayed to the user.
  final String? message;

  /// Parent [Exception], if present.
  ///
  /// Necessary for correct logging.
  final Exception? parentException;

  /// [StackTrace] parent error, if any.
  final StackTrace? stackTrace;

  /// Extended error message.
  ///
  /// Not for the user's eyes. Use when logging or debugging.
  final String? debugMessage;

  /// @nodoc
  const Failure({
    this.message,
    this.parentException,
    this.stackTrace,
    this.debugMessage,
  });

  @override
  String toString() =>
      'Failure(message: "$message", debugMessage: "$debugMessage", parentException: $parentException)';
}
