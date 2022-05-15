import 'package:gnucashx/data/models/models.dart';
import 'package:gnucashx/data/repositories/repositories.dart';

abstract class SettingsRepo implements Repository<Settings> {
  Future<Settings> read();
  Future<bool> write(Settings settings);
  Future<bool> backup();
  Future<bool> restore(Settings settings);
  Future<bool> reset();
  // Sync between repositories
  Future<bool> sync(Settings settings);

  factory SettingsRepo() {
    return LocalSettingsRepo();
  }
}
