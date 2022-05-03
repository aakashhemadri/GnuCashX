import 'package:gnucashx/data/models/models.dart';

abstract class Repository<T extends Base> {
  late Persistence source;

  /// Possible specifics in sub classes
  ///
  /// Future<T> getOne(GUID guid);
  /// Future<List<T>> getAll();
  /// Future<bool> insert(T node);
  /// Future<bool> update(T node);
  /// Future<bool> delete(GUID guid);

  /// Future<List<Slot>> getSlots(GUID guid);
  /// Future<int> count();
}
