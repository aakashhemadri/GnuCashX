import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gnucashx/data/models/models.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@Freezed()
class Book with _$Book {
  const factory Book({
    required GUID guid,
    required GUID rootAccountGuid,
    required GUID templateAccountGuid,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
