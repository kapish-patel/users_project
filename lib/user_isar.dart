// this is a isar class 
import 'package:isar/isar.dart';

part 'user_isar.g.dart';

@Collection()
class User {
  Id ?id;
  String? username;

  User({this.username});
}