//packages
// ignore_for_file: unused_field, avoid_print, dead_code_catch_following_catch, no_leading_underscores_for_local_identifiers



import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

//services

import '../services/colud_storage_services.dart';
import '../services/database_services.dart';
import '../services/navigation_services.dart';

class AuthenticationProvider extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final NavigationServices _navigationServices;
  late final DatabaseServices _databaseServices;

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigationServices = GetIt.instance.get<NavigationServices>();
    _databaseServices = GetIt.instance.get<DatabaseServices>();

    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
        print("loogged in");
      } else {
        print("Not authentication");
      }
    });
  }

  Future<void> loginUsingEmailAndPassword(
      String _email, String _password) async {
    try {} catch (e) {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      print(_auth.currentUser);
    } on FirebaseAuthException {
      print("Error logging user into Firebase");
    } catch (e) {
      print(e);
    }
  }
}
