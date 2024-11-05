import 'formatter.dart';
import 'interface.dart';
import 'levels.dart';

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
      this.formatter = defaultFormatter});

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
