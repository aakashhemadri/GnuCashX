import 'package:gnucashx/data/models/models.dart';

class ScheduledTransaction extends Node {
  GUID guid;
  String name;
  bool enabled;
  DateTime startDate;
  DateTime endDate;
  DateTime lastOccur;
  int numOccur;
  int remOccur;
  bool autoCreate;
  bool autoNotify;
  bool advCreation;
  bool advNotify;
  int instanceCount;
  GUID templateAccountGUID;

  ScheduledTransaction(
      {required this.guid,
      required this.name,
      required this.enabled,
      required this.startDate,
      required this.endDate,
      required this.lastOccur,
      required this.numOccur,
      required this.remOccur,
      required this.autoCreate,
      required this.autoNotify,
      required this.advCreation,
      required this.advNotify,
      required this.instanceCount,
      required this.templateAccountGUID});
}
