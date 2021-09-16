import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus {

  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {

  //GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider(){
    isAuthenticated();
  }

  login( String email, String pasword) {

    _token = 'arleisonalvarez222esteeseltoken';
    LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);

    //isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    
    final token = LocalStorage.prefs.getString('token');

    if( token == null){
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();

    return true;
  }

}