import 'package:flutter/material.dart';

class SplashLayoud extends StatelessWidget {
  const SplashLayoud({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 20,),
            Text('Checking...'),
          ],
        ),
      ),
    );
  }
}