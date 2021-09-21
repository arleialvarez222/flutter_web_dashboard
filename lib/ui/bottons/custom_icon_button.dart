import 'package:flutter/material.dart';

class CustomIconButtom extends StatelessWidget {

  final Function onPressed;
  final String text;
  final IconData icon;
  final Color color;
  final bool isFilled;

  const CustomIconButtom({
    Key? key, 
    required this.onPressed, 
    required this.text, 
    required this.icon,
    this.color = Colors.indigo,
    this.isFilled = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(color.withOpacity(0.5)),
        overlayColor: MaterialStateProperty.all(color.withOpacity(0.3)),
      ),
      onPressed: () => onPressed(),
      child: Row(
        children: [
          Icon(icon, color: Colors.white,),
          Text(text, style: const TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}