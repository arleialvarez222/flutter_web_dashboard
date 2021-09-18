
import 'package:flutter/material.dart';

class NotificationService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnacbarError (String message){

    final snackbar = SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 20),)
    );

    messengerKey.currentState!.showSnackBar(snackbar);

  }

  static showSnacbar (String message){

    final snackbar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white, fontSize: 20),)
    );

    messengerKey.currentState!.showSnackBar(snackbar);

  }

}