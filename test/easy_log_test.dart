// ignore_for_file: avoid_print

import 'dart:io';

import 'package:test/test.dart';

import 'package:easy_log/easy_log.dart';

void main() {
  test('level test', () {
    print("${Level.off.index} ${Level.error.name}");
  });

  test('logger test', () {
    final l = Logger(level: Level.warn, writer: StdErrWriter());
    l.debug("this should not be printed");
    l.error("this should be printed");
  });

  test('stderr printing test', () {
    stderr
        .writeln(""); // in test, the first char in stderr/stdout is not printed
    error("This is an error");
    warn("This is a warning");
    info("This is an info");
    debug("This is a debug");
    trace("This is a trace");
  });
}
