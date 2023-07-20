// ignore_for_file: public_member_api_docs

import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elementary/elementary.dart';
import 'package:example/features/common/error_handler/error_handler_debug.dart';
import 'package:example/utils/error/log_writer/log_writer.dart';
import 'package:example/utils/error/log_writer/log_writer_debug.dart';
import 'package:logger/logger.dart';

/// App dependencies.
abstract interface class IAppScope {
  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Log writer for entire app.
  ILogWriter get logWriter;

  /// Interface for handle error in [ElementaryModel].
  ErrorHandler get errorHandler;

  /// Http client.
  Dio get dio;

  ThemeWrapper get themeWrapper;
}

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final ThemeWrapper _themeWrapper;
  late final ErrorHandler _errorHandler;
  final Logger _logger = Logger();

  @override
  ThemeWrapper get themeWrapper => _themeWrapper;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  late final ILogWriter logWriter = _createLogWriter();

  @override
  late final Dio dio;

  @override
  late VoidCallback applicationRebuilder;

  /// Create an instance [AppScope].
  AppScope() {
    _themeWrapper = ThemeWrapper();
    _errorHandler = _createErrorHandler();
    dio = _initDio();
  }

  ILogWriter _createLogWriter() {
    return LogWriterDebug(_logger);
  }

  ErrorHandler _createErrorHandler() {
    return ErrorHandlerDebug(logWriter);
  }

  Dio _initDio() {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () => HttpClient()..badCertificateCallback = ((_, __, ___) => true);
    return dio;
  }
}
