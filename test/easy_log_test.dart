// ignore_for_file: avoid_print

import 'dart:io';

import 'package:test/test.dart';

import 'package:easy_log/easy_log.dart';

void main() {
  // in test, the first char in stderr/stdout is not printed
  stderr.writeln("");
  stdout.writeln("");
  updateDefaultLogger(writer: StdOutWriter());
  test('level test', () {
    print("${Level.off.index} ${Level.error.name}");
  });

  test('logger test', () {
    final l = Logger(level: Level.warn, writer: StdOutWriter());
    l.debug("this should not be printed");
    l.error("this should be printed");
  });

  test('stderr printing test', () {
    error("This is an error");
    warn("This is a warning");
    info("This is an info");
    debug("This is a debug");
    trace("This is a trace");
  });

  test("logger update test", () {
    debug("This message should not be printed");
    updateDefaultLogger(level: Level.debug);
    debug("This message should be printed");
  });
}
