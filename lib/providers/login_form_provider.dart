//import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //cuando se crea el login form se obliga  a que cree una instancia del authprovider
  //final AuthProvider authProvider;

  String email = '';
  String password = '';

  //LoginFormProvider(this.authProvider);


  bool validateForm(){

    if(formKey.currentState!.validate() ) {
      //print('Form valido');
      //print('$email --- $password');

      return true;
     // authProvider.login(email, password);
    }else{
      //print('Form invalido');
      return false;
    }
    

  }

}