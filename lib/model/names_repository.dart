import 'package:isar/isar.dart';
import 'package:users_project/model/name_isar.dart';

class NamesRepository {
  final IsarCollection<NameIsar> _names;

  NamesRepository(this._names);

  // get all names from isar database before the widget is built
  Future<List<NameIsar>> getNames() async {
    return await _names.where().findAll();
  }

  // use isar write transaction to add new name
  Future<void> addName(String name) async {
    await _names.isar.writeTxn(() async {
      await _names.put(NameIsar(name));
    });
  }

}
