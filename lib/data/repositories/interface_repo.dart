import 'package:gnucashx/data/models/models.dart';

abstract class Repository<T extends Base> {
  /// Possible specifics in sub classes
  ///
  /// late Persistence source;
  ///
  /// Future<T> getOne(GUID guid);
  /// Future<List<T>> getAll();
  /// Future<bool> insert(T node);
  /// Future<bool> update(T node);
  /// Future<bool> delete(GUID guid);

  /// Future<List<Slot>> getSlots(GUID guid);
  /// Future<int> count();
}
