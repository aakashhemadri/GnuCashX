import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:gnucashx/data/models/models.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@Freezed()
abstract class AccountType with _$AccountType {
  const AccountType._();

  const factory AccountType({
    required String name,
    required String type,
  }) = _AccountType;

  factory AccountType.root() => const AccountType(name: 'Root', type: 'ROOT');
  factory AccountType.bank() => const AccountType(name: 'Bank', type: 'BANK');
  factory AccountType.cash() => const AccountType(name: 'Cash', type: 'CASH');
  factory AccountType.asset() =>
      const AccountType(name: 'Asset', type: 'ASSET');
  factory AccountType.credit() =>
      const AccountType(name: 'Credit Card', type: 'CREDIT');
  factory AccountType.stock() =>
      const AccountType(name: 'Stock', type: 'STOCK');
  factory AccountType.mutual() =>
      const AccountType(name: 'Mutal Fund', type: 'MUTUAL');
  factory AccountType.income() =>
      const AccountType(name: 'Income', type: 'INCOME');
  factory AccountType.expense() =>
      const AccountType(name: 'Expense', type: 'EXPENSE');
  factory AccountType.equity() =>
      const AccountType(name: 'Equity', type: 'EQUITY');
  factory AccountType.receivable() =>
      const AccountType(name: 'A/Receivable', type: 'RECEIVABLE');
  factory AccountType.payable() =>
      const AccountType(name: 'A/Payable', type: 'PAYABLE');

  factory AccountType.fromJson(Map<String, dynamic> json) =>
      _$AccountTypeFromJson(json);
}

@Freezed()
abstract class Account extends Base with _$Account {
  const Account._();

  const factory Account(
      {required GUID guid,
      required AccountType type,
      required String name,
      required GUID commodityGuid,
      @Default(null) GUID? parentGuid,
      @Default(100) int commodityScu,
      @Default(0) int nonStdScu,
      @Default('') String code,
      @Default('') String description,
      @Default(false) bool hidden,
      @Default(false) bool placeholder}) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
