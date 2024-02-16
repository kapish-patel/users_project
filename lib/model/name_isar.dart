import 'package:isar/isar.dart';

part 'name_isar.g.dart';

@collection
class NameIsar {
  Id? id;
  final String name;

  NameIsar(this.name);
}
