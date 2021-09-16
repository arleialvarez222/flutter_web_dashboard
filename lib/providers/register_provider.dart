import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {

  GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';

  validateRegisterForm(){
    if(formKeyRegister.currentState!.validate()){
      print('this form is valid');
      print('$email --- $password --- $name');
    }else{
      print('this form is invalid');
    }
  }

}