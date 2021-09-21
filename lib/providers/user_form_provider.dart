import 'package:admin_dashboard/models/usuario.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {

  Usuario? user;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  /* void updateListener(){
    notifyListeners();
  } */

  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }){
    user = Usuario(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado,
      google: google ?? user!.google,
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo,
      uid: uid ?? user!.uid,
      img: img ?? user!.img,
    );
    notifyListeners();
  }

  bool validaForm(){
    return formkey.currentState!.validate();
  }

  updateUsers(){
    if(!validaForm()) return;

    print('Informacion correcta');
    print(user!.nombre);
    print(user!.correo);
  }
}