import 'package:flutter/foundation.dart' as fnd;

class Logger {
  static late LoggerProvider _provider;

  static void init(LoggerProvider provider) {
    Logger._provider = provider;
  }

  static void m(String message) {
    _provider.log(message);
  }
}

abstract class LoggerProvider {
  void log(String message);
}

class BaseLogger implements LoggerProvider {
  @override
  void log(String message) {
    fnd.debugPrint.call(message);
  }
}
