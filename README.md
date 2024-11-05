# Minlog

A dart/flutter logging package inspired from the awesome rust based [env_logger](https://crates.io/crates/env_logger). 

## Installation
```bash
flutter pub add minlog

dart pub add minlog
```

## Usage
The base Logger class is the root of the package. Once instantiated, the logger class can be used to log messages

```dart
final logger = Logger(level: Level.warn, writer: StdErrWriter());

logger.info("Info message"); // this wont get printed
logger.error("Unexpected crash", { // this will get printed
    "error": "reason of crash", // attach a map of key values that will added to the error log
    "time": DateTime.now().toString(),
});

```

The logger's writer determines where the output goes. The package comes with 3 writers, StdErrWriter (which writes to stderr), StdOutWriter (which writes to stdout) and FileWriter (which writes to a File). 
```dart
final stdoutw = StdOutWriter();
final stderrw = StdErrWriter();
final filew = FileWriter(File("path/to/file.txt"));
```

There is also a MultiWriter, which takes multiple writers and writes output to all of them. This is useful if you want to write your logs to multiple files or a file and stderr at a time. Custom writers can be written as long as it implements the `Writer` interface, which is essentially a class with a method `void write(String content) {}`. See the documentation for details.

The format of the logger can be changed too. Just pass along a formatter function to the Logger class. See the documentation for the formatter function for more details. The default logger's implementation can be seen at [formatter.dart](lib/src/formatter.dart).

### Default logger
The package has some global logging functions that can be used to log messages without creating a logger instance. 

```dart
import 'package:minlog/minlog.dart';

void main() {
    log(Level.info, "Info message");
    error("Unexpected crash", {
        "error": "reason of crash",
        "time": DateTime.now().toString(),
    });
}
```

This global `info`, `error`, `warn`, `debug` and `trace` functions use a default logger instance that can be modified by calling `updateDefaultLogger`. The default logger is a logger with level `Level.info` and a `StdErrWriter`.


## License

This project is licensed under the MIT License.

## Contact

For any questions or suggestions, please open an issue on GitHub.
