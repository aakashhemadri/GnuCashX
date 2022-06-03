import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gnucashx/data/data.dart';

part 'split.freezed.dart';
part 'split.g.dart';

@Freezed()
class Split with _$Split {
  const factory Split(
      {required GUID guid,
      required GUID txGuid,
      required GUID accountGuid,
      @Default('') String memo,
      @Default('') String action,
      @Default('n') String reconcileState,
      required DateTime reconcileDate,
      required int valueNum,
      required int valueDenom,
      required int quantityNum,
      required int quantityDenom,
      @Default(null) GUID? lotGuid}) = _Split;

  const Split._();

  factory Split.fromJson(Map<String, dynamic> json) => _$SplitFromJson(json);

  double get value {
    return valueNum / valueDenom;
  }

  double get quantity {
    return quantityNum / quantityDenom;
  }
}
