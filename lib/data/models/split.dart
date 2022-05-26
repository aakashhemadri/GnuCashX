import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gnucashx/data/data.dart';

part 'split.freezed.dart';
part 'split.g.dart';

@Freezed()
class Split extends Base with _$Split {
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

  factory Split.fromJson(Map<String, dynamic> json) => _$SplitFromJson(json);
}
