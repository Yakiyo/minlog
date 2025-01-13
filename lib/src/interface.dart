import 'dart:io';

abstract interface class Writer {
  void write(String content) {}
}

/// A wrapper around the `File` class from dart:io that implements `Writer`
/// 
/// Logs are appended to the file and a newline is added at the end of each log
class FileWriter implements Writer {
  late final File file;
  FileWriter(this.file);

  // create a FileWriter from a file path
  FileWriter.fromPath(String path) {
    file = File(path);
  }

  @override
  write(String content) {
    file.writeAsString('$content\n', mode: FileMode.append);
  }
}

/// A wrapper around the `stderr` that implements `Writer`
class StdErrWriter implements Writer {
  @override
  write(String content) {
    stderr.write(content);
  }
}

class StdOutWriter implements Writer {
  @override
  write(String content) {
    stdout.writeln(content);
  }
}

class MultiWriter implements Writer {
  final List<Writer> writers;

  MultiWriter(this.writers);

  @override
  write(String content) {
    final wf = writers.map((w) {
      return (String content) async {
        w.write(content);
      };
    });
    Future.wait(wf.map((f) => f(content)));
  }
}
