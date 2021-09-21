import 'package:admin_dashboard/ui/bottons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      height: (size.width > 1000) ? size.height * 0.04 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children:  [

          LinkText( text: 'About', onPressed: () {}),
          LinkText( text: 'Help center', onPressed: () {}),
          LinkText( text: 'Terms of Service', onPressed: () {}),
          LinkText( text: 'Privacy policy', onPressed: () {}),
          LinkText( text: 'Cookie policy', onPressed: () {}),
          LinkText( text: 'Adds info', onPressed: () {}),
          LinkText( text: 'Blog', onPressed: () {}),
          LinkText( text: 'Status', onPressed: () {}),
          LinkText( text: 'Careers', onPressed: () {}),
          LinkText( text: 'Brand Resources', onPressed: () {}),
          LinkText( text: 'Advertising', onPressed: () {}),
          LinkText( text: 'Marketing', onPressed: () {}),

        ],
      ),
    );
  }
}