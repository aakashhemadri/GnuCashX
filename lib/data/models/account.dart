import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:gnucashx/data/models/models.dart';

part 'account.freezed.dart';
part 'account.g.dart';

enum AccountType {
  root,
  asset,
  equity,
  liabiliy,
  income,
  expense,
  bank,
}

@Freezed()
class Account extends Base with _$Account {
  const factory Account(
      {required String guid,
      required AccountType type,
      required String name,
      required GUID commodityGuid,
      @Default(100) int commodityScu,
      @Default(0) int nonStdScu,
      required GUID parentGuid,
      @Default('') String code,
      @Default('') String description,
      @Default(false) bool hidden,
      @Default(false) bool placeholder}) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
