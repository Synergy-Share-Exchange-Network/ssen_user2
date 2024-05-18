import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ssen_user/Repository/firebase/model%20methods/firebase_user_methods.dart';

import '../Models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    String id = FirebaseAuth.instance.currentUser!.uid;
    UserModel user = await FirebaseUserMethods().read(id);
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    print(user);
    _user = user;
    notifyListeners();
  }
}
