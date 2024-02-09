// provider for user data
import 'package:flutter/material.dart';
import 'package:users_project/User_repository.dart';
import 'package:users_project/user_data.dart';

class UserProvider extends ChangeNotifier {

  UserRepository _userRepository;

  UserProvider(this._userRepository);

  // add a new user
  Future<void> addUser(String username) async {
    await _userRepository.addUser(username);
    notifyListeners();
  }

  // get all users
  Future<List<User>> getUsers() async {
    return _userRepository.getUsers();
  }
  
}
