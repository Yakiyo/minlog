/// Log levels
///
/// If the logger has a level of `warn`, then only log messages of `warn` and
/// `error` will be outputted. As in the chosen level and those higher than it.
enum Level {
  error,
  warn,
  info,
  debug,
  trace,
  off,
}
