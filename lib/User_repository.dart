import 'package:isar/isar.dart';
import 'package:users_project/user_data.dart';

class UserRepository {
  final IsarCollection<User> _users;

  UserRepository(this._users);

  // all a new user
  Future<void> addUser(String username) async {
    await _users.put(User(name: username));
  }

  // get all users
  Future<List<User>> getUsers() async {
    return _users.where().findAll();
  }

}