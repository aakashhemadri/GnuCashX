import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gnucashx/data/models/models.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@Freezed()
class Transaction with _$Transaction {
  const factory Transaction(
      {required GUID guid,
      required GUID currencyGuid,
      required DateTime postDate,
      required DateTime enterDate,
      required String description}) = _Transaction;

  factory Transaction.now(
          {required GUID guid,
          required GUID currencyGuid,
          required String description}) =>
      Transaction(
          guid: guid,
          currencyGuid: currencyGuid,
          postDate: DateTime.now(),
          enterDate: DateTime.now(),
          description: description);

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
