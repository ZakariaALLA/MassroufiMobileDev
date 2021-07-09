import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../DBhelp/dbhelper.dart';

class User {
  final String id;
  final String username;
  final String password;

  const User(
      {this.id, this.username, this.password});

  Map<String, dynamic> toMap(User u) {
    return {
      'id': u.id,
      'username': u.username,
      'password': u.password,
    };
  }
}

class Users with ChangeNotifier {
  List<User> _users = [];

  List<User> get users {
    return [..._users];
  }


  void addUser(User user) {
    _users.add(user);
    notifyListeners();
    DBHelper.insertUser(user);
  }

}
