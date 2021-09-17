import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {

  GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  validateRegisterForm(){
    if(formKeyRegister.currentState!.validate()){
      //print('this form is valid');
      //print('$email --- $password --- $name');

      return true;
    }else{
      //print('this form is invalid');

      return false;
    }
  }

}