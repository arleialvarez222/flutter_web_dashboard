import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/ui/api/cafe_api.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {

  Usuario? user;
  late GlobalKey<FormState> formkey;

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

  bool _validaForm(){
    return formkey.currentState!.validate();
  }

  updateUsers() async {
    if(!_validaForm()) return false;

    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };

    try {
      await CafeApi.put('/usuarios/${user!.uid}', data);
      //print(resp);
      return true;
      
    } catch (e) {
      //print('error: $e');
      throw('Error en el put $e');
      //return false;
    }

  }
}