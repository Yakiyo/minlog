import 'interface.dart';
import 'levels.dart';

/// A formatter function
///
/// The function is provided with the log level, message, the map of variables
/// and the writer. The writer should be used to write, but rather can be used
/// for handling output cases. For example, if the writer is stderr/stdout, then
/// colored output is possible, while for a File, it should format to plain string.
/// The formatter must return a String that will be piped to the `Writer`
typedef Formatter = String Function(Level, String, Map<String, String>, Writer);

String _defaultFormatter(
    Level lvl, String message, Map<String, String> vars, Writer writer) {
  var s = "";
  for (final e in vars.entries) {
    s += "${e.key}: ${e.value} ";
  }
  return "[${lvl.name.toUpperCase()}] $message\t$s";
}

/// A logger class that logs any message of level `level` and above to
/// `writer`
class Logger {
  /// The allowed level to output log for
  Level level;

  /// The writer to pipe message to
  Writer writer;

  /// A formatter function that formats provided values into the desired
  /// output string
  Formatter formatter;
  Logger(
      {required this.level,
      required this.writer,
      this.formatter = _defaultFormatter});

  /// The main logging function
  /// 
  /// lvl - The level to log at (using Level.off will throw an error)
  /// message - The log message
  /// vars - Optional key value variables that accompany the message
  void log(Level lvl, String message, {Map<String, String> vars = const {}}) {
    if (lvl == Level.off) throw "Cannot use Level.off as a logging level";
    if (level == Level.off || lvl.index > level.index) return;

    writer.write(formatter(lvl, message, vars, writer));
  }

  void error(String message, {Map<String, String> vars = const {}}) {
    writer.write(formatter(Level.error, message, vars, writer));
  }

  void warn(String message, {Map<String, String> vars = const {}}) {
    writer.write(formatter(Level.warn, message, vars, writer));
  }

  void info(String message, {Map<String, String> vars = const {}}) {
    writer.write(formatter(Level.info, message, vars, writer));
  }

  void debug(String message, {Map<String, String> vars = const {}}) {
    writer.write(formatter(Level.debug, message, vars, writer));
  }

  void trace(String message, {Map<String, String> vars = const {}}) {
    writer.write(formatter(Level.trace, message, vars, writer));
  }
}
