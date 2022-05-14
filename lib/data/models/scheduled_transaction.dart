import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gnucashx/data/models/models.dart';

part 'scheduled_transaction.freezed.dart';
part 'scheduled_transaction.g.dart';

@Freezed()
class ScheduledTransaction extends Base with _$ScheduledTransaction {
  const factory ScheduledTransaction(
      {required GUID guid,
      required String name,
      required bool enabled,
      required DateTime startDate,
      required DateTime endDate,
      required DateTime lastOccur,
      required int numOccur,
      required int remOccur,
      required bool autoCreate,
      required bool autoNotify,
      required bool advCreation,
      required bool advNotify,
      required int instanceCount,
      required GUID templateAccountGUID}) = _ScheduledTransaction;

  factory ScheduledTransaction.fromJson(Map<String, dynamic> json) =>
      _$ScheduledTransactionFromJson(json);
}
