import 'package:easy_log/easy_log.dart';

final _logger = Logger(level: Level.warn, writer: StdErrWriter());

/// Logs an error message.
///
/// [message] The error message to log.
/// [vars] Optional variables to include in the log.
void error(String message, {Map<String, String> vars = const {}}) =>
    _logger.error(message, vars: vars);

/// Logs a warning message.
///
/// [message] The warning message to log.
/// [vars] Optional variables to include in the log.
void warn(String message, {Map<String, String> vars = const {}}) =>
    _logger.warn(message, vars: vars);

/// Logs an informational message.
///
/// [message] The informational message to log.
/// [vars] Optional variables to include in the log.
void info(String message, {Map<String, String> vars = const {}}) =>
    _logger.info(message, vars: vars);

/// Logs a debug message.
///
/// [message] The debug message to log.
/// [vars] Optional variables to include in the log.
void debug(String message, {Map<String, String> vars = const {}}) =>
    _logger.debug(message, vars: vars);

/// Logs a trace message.
///
/// [message] The trace message to log.
/// [vars] Optional variables to include in the log.
void trace(String message, {Map<String, String> vars = const {}}) =>
    _logger.trace(message, vars: vars);

/// Update specific values for the default logger
void updateDefaultLogger({Level? level, Writer? writer, Formatter? formatter}) {
  if (level != null) _logger.level = level;
  if (writer != null) _logger.writer = writer;
  if (formatter != null) _logger.formatter = formatter;
}
