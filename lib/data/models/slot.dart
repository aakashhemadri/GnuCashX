import 'package:gnucashx/data/models/models.dart';

class SlotType {
  final String name;
  final int value;

  const SlotType({required this.name, required this.value});
}

const SlotType kInvalidSlot = SlotType(name: 'invalid', value: -1);
const SlotType kIntegerSlot = SlotType(name: 'integer', value: 1);
const SlotType kDoubleSlot = SlotType(name: 'double', value: 2);
const SlotType kNumericSlot = SlotType(name: 'numeric', value: 3);
const SlotType kStringSlot = SlotType(name: 'string', value: 4);
const SlotType kGuidSlot = SlotType(name: 'guid', value: 5);
const SlotType kTimespecSlot = SlotType(name: 'timespec', value: 6);
const SlotType kPlaceholderSlot = SlotType(name: 'placeholder', value: 7);
const SlotType kGListSlot = SlotType(name: 'glist', value: 8);
const SlotType kFrameSlot = SlotType(name: 'frame', value: 9);
const SlotType kGDateSlot = SlotType(name: 'gdate', value: 10);

/// A [Slot] holds data lacking any particular table
///
/// [objGuid] refers to an instance of another unique object whose data is attached
/// [name] is key path of slot.
///
class Slot extends Node {
  GUID objGuid;
  String name;
  dynamic value;
  late SlotType type;

  /// TODO: Will have to convert type to BigInt and handle as unsigned integer
  Slot.integer({required this.objGuid, required this.name, required this.value})
      : assert(value is int) {
    type = kIntegerSlot;
  }

  Slot.double({required this.objGuid, required this.name, required this.value})
      : assert(value is double) {
    type = kDoubleSlot;
  }

  Slot.numeric({required this.objGuid, required this.name, required this.value})
      : assert(value is int) {
    type = kNumericSlot;
  }

  Slot.numericDenom(
      {required this.objGuid, required this.name, required this.value})
      : assert(value is int) {
    type = kNumericSlot;
  }

  Slot.string({required this.objGuid, required this.name, required this.value})
      : assert(value is String) {
    type = kStringSlot;
  }

  Slot.guid({required this.objGuid, required this.name, required this.value})
      : assert(value is GUID) {
    type = kGuidSlot;
  }

  Slot.timespec(
      {required this.objGuid, required this.name, required this.value})
      : assert(value is DateTime) {
    type = kTimespecSlot;
  }

  Slot.placeholder(
      {required this.objGuid, required this.name, required this.value})
      : assert(value is bool) {
    type = kPlaceholderSlot;
  }

  Slot.glist({required this.objGuid, required this.name, required this.value})
      : assert(value is String) {
    kGListSlot;
  }

  Slot.frame({required this.objGuid, required this.name, required this.value})
      : assert(value is String) {
    type = kFrameSlot;
  }

  Slot.gdate({required this.objGuid, required this.name, required this.value})
      : assert(value is DateTime) {
    type = kGDateSlot;
  }
}
