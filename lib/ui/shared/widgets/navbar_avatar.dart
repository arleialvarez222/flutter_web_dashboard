import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        child: Image.network('https://cdn.pixabay.com/photo/2019/06/11/20/13/canserbero-4267812__480.png'),
        width: 30,
        height: 30,
        
      ),
    );
  }
}