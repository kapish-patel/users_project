import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'name_isar.dart';

class Database {
  static late Isar _isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [NameIsarSchema],
      directory: dir.path,
    );
  }

  static Isar get isar {
    return _isar;
  }
}
