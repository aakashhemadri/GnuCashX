import 'dart:io';
import 'package:archive/archive_io.dart';

void main() {
  final user = File('resources/user.gnucash');
  final sample = File('resources/sample.gnucash');

  if (user.existsSync()) {
    final inStream = InputFileStream('resources/user.gnucash');
    final outStream = OutputFileStream('resources/user.xml');
    GZipDecoder().decodeStream(inStream, outStream);
  }

  if (sample.existsSync()) {
    final inStream = InputFileStream('resources/sample.gnucash');
    final outStream = OutputFileStream('resources/sample.xml');
    GZipDecoder().decodeStream(inStream, outStream);
  }
}
