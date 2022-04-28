import 'package:gnucashx/data/models/models.dart';

class Book extends Node {
  final GUID guid;
  final GUID rootAccountGuid;
  final GUID templateAccountGuid;

  Book({
    required this.guid,
    required this.rootAccountGuid,
    required this.templateAccountGuid,
  });
}
