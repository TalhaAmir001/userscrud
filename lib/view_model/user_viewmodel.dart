import 'package:flutter/foundation.dart';
import 'package:userscrud/model/user.dart';
import 'package:userscrud/services/offline_database_helper.dart';

class UserViewModel with ChangeNotifier {
  List<User> _users = [];

  Future<void> fetchUsers() async {
    _users = await DatabaseHelper.instance.getUsers();
    notifyListeners();
  }

  List<User> get users => _users;

  // setUsers(List<User> list){
  //   _users = list;
  // }


  int currentId = 1;

  Future<void> addUser(User user) async {
    await DatabaseHelper.instance.insertUser(user);
    await fetchUsers();
    currentId++;
  }

  int getNextId(){
    return currentId;
  }

  Future<void> deleteUser(int id) async {
    await DatabaseHelper.instance.deleteUser(id);
    await fetchUsers();
  }

  Future<void> updateUser(User user) async {
    await DatabaseHelper.instance.updateUser(user);
    await fetchUsers();
  }

}
