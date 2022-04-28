import 'package:gnucashx/data/models/models.dart';

enum AccountType {
  root,
  asset,
  equity,
  liabiliy,
  income,
  expense,
  bank,
}

class Account extends Node {
  final GUID guid;
  final AccountType type;
  String name;
  GUID commodityGuid;
  int commodityScu;
  int nonStdScu;
  GUID parentGuid;
  String code;
  String description;
  bool hidden;
  bool placeholder;

  Account(
      {required this.guid,
      required this.name,
      required this.type,
      required this.commodityGuid,
      this.commodityScu = 100,
      this.nonStdScu = 0,
      required this.parentGuid,
      this.code = '',
      this.description = '',
      this.hidden = false,
      this.placeholder = false});
}
