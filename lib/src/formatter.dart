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

String defaultFormatter(
    Level lvl, String message, Map<String, String> vars, Writer writer) {
  var s = "";
  for (final e in vars.entries) {
    s += "${e.key}: ${e.value} ";
  }
  return "[${lvl.name.toUpperCase()}] $message\t$s";
}