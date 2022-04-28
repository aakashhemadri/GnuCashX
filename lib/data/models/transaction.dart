import 'package:gnucashx/data/models/models.dart';

class Transaction extends Node {
  final GUID guid;
  final GUID currencyGuid;
  late DateTime postDate;
  late DateTime enterDate;
  String description;

  Transaction(
      {required this.guid,
      required this.currencyGuid,
      required this.postDate,
      required this.enterDate,
      required this.description});

  Transaction.now(
      {required this.guid,
      required this.currencyGuid,
      required this.description}) {
    postDate = DateTime.now();
    enterDate = DateTime.now();
  }
}
