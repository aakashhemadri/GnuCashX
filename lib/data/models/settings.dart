import 'dart:io';

enum PersistenceType { xml, sqlite, local }

class Settings {
  String theme;
  String locale;
  List<File> books;

  PersistenceType persist;

  Settings(
      {required this.theme,
      required this.locale,
      required this.persist,
      required this.books});
}
