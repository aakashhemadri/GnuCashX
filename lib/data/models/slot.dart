import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gnucashx/data/models/models.dart';

part 'slot.freezed.dart';
part 'slot.g.dart';

@Freezed()
class SlotType with _$SlotType {
  const factory SlotType({required String name, required int value}) =
      _SlotType;

  factory SlotType.invalid() => const SlotType(name: 'invalid', value: -1);
  factory SlotType.integer() => const SlotType(name: 'integer', value: 1);
  factory SlotType.double() => const SlotType(name: 'double', value: 2);
  factory SlotType.numeric() => const SlotType(name: 'numeric', value: 3);
  factory SlotType.string() => const SlotType(name: 'string', value: 4);
  factory SlotType.guid() => const SlotType(name: 'guid', value: 5);
  factory SlotType.timespec() => const SlotType(name: 'timespec', value: 6);
  factory SlotType.placeholder() =>
      const SlotType(name: 'placeholder', value: 7);
  factory SlotType.glist() => const SlotType(name: 'glist', value: 8);
  factory SlotType.frame() => const SlotType(name: 'frame', value: 9);
  factory SlotType.gdate() => const SlotType(name: 'gdate', value: 10);

  factory SlotType.fromJson(Map<String, dynamic> json) =>
      _$SlotTypeFromJson(json);
}

/// A [Slot] holds data lacking any particular table
///
/// [objGuid] refers to an instance of another unique object whose data is attached
/// [name] is key path of slot.
@Freezed()
class Slot extends Base with _$Slot {
  const factory Slot(
      {required GUID objGuid,
      required String name,
      required dynamic value,
      required SlotType type}) = _Slot;

  /// TODO: Will have to convert type to BigInt and handle as unsigned integer
  factory Slot.integer(
          {required GUID objGuid, required String name, required int value}) =>
      Slot(
          objGuid: objGuid, name: name, value: value, type: SlotType.integer());

  factory Slot.double(
          {required GUID objGuid,
          required String name,
          required double value}) =>
      Slot(objGuid: objGuid, name: name, value: value, type: SlotType.double());

  factory Slot.numeric(
          {required GUID objGuid, required String name, required int value}) =>
      Slot(
          objGuid: objGuid, name: name, value: value, type: SlotType.numeric());

  factory Slot.numericDenom(
          {required GUID objGuid, required String name, required int value}) =>
      Slot(
          objGuid: objGuid, name: name, value: value, type: SlotType.numeric());

  factory Slot.string(
          {required GUID objGuid,
          required String name,
          required String value}) =>
      Slot(objGuid: objGuid, name: name, value: value, type: SlotType.string());

  factory Slot.guid(
          {required GUID objGuid, required String name, required GUID value}) =>
      Slot(objGuid: objGuid, name: name, value: value, type: SlotType.guid());

  factory Slot.timespec(
          {required GUID objGuid,
          required String name,
          required DateTime value}) =>
      Slot(
          objGuid: objGuid,
          name: name,
          value: value,
          type: SlotType.timespec());

  factory Slot.placeholder(
          {required GUID objGuid, required String name, required bool value}) =>
      Slot(
          objGuid: objGuid,
          name: name,
          value: value,
          type: SlotType.placeholder());

  factory Slot.glist(
          {required GUID objGuid,
          required String name,
          required String value}) =>
      Slot(objGuid: objGuid, name: name, value: value, type: SlotType.glist());

  factory Slot.frame(
          {required GUID objGuid,
          required String name,
          required String value}) =>
      Slot(objGuid: objGuid, name: name, value: value, type: SlotType.frame());

  factory Slot.gdate(
          {required GUID objGuid,
          required String name,
          required DateTime value}) =>
      Slot(objGuid: objGuid, name: name, value: value, type: SlotType.gdate());
}
