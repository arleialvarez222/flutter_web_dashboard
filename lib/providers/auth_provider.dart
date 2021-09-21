import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notification_service.dart';
import 'package:admin_dashboard/ui/api/cafe_api.dart';
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
  Usuario? user;

  AuthProvider(){
    isAuthenticated();
  }

  login( String email, String password) {

    final data = {
      "correo": email,
      "password":password,
    };

    CafeApi.post('/auth/login', data).then((json) {

      print(json);

      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      CafeApi.configureDio();
      
      notifyListeners();

    }).catchError((e){
      print('Error en: $e');

      NotificationService.showSnacbarError('Usuario / password no validos');
    });
  }

  register( String name, String email, String password) {

    final data =  {
      'nombre': name,
      'correo': email,
      'password': password,
    };

    CafeApi.post('/usuarios', data).then((json) {
      print(json);

      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      CafeApi.configureDio();

      notifyListeners();

    } ).catchError( (e){
      print('error en : $e');

      NotificationService.showSnacbarError('Usuario / password no validos');
    });


    //isAuthenticated();
  }

  Future<bool> isAuthenticated() async {
    
    final token = LocalStorage.prefs.getString('token');

    if( token == null){
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final resp = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authResponse.token);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
      
    } catch (e) {
      print('Error en: $e');
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    /* await Future.delayed(const Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();

    return true; */
  }


  logout(){
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }

}