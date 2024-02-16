import 'package:flutter/material.dart';
import 'package:users_project/model/name_isar.dart';
import 'package:users_project/model/names_repository.dart';

class NamesProvider extends ChangeNotifier {

  final NamesRepository _repository;

  NamesProvider(this._repository);

  List<NameIsar> _names = [];
  List<NameIsar> get names => _names;

  // add new user
  void addName(String name) async{
    await _repository.addName(name);
    _names = await _repository.getNames();
    notifyListeners();
  }

  // get all users from isar database before the widget is built
  Future<void> getNames() async {
    _names = await _repository.getNames();
    notifyListeners();
  }
}
