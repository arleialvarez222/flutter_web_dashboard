import 'package:admin_dashboard/ui/bottons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      height: (size.width > 1000) ? size.height * 0.1 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children:  [

          LinkText( text: 'About', onPressed: () => print('about')),
          LinkText( text: 'Help center'),
          LinkText( text: 'Terms of Service'),
          LinkText( text: 'Privacy policy'),
          LinkText( text: 'Cookie policy'),
          LinkText( text: 'Adds info'),
          LinkText( text: 'Blog'),
          LinkText( text: 'Status'),
          LinkText( text: 'Careers'),
          LinkText( text: 'Brand Resources'),
          LinkText( text: 'Advertising'),
          LinkText( text: 'Marketing'),

        ],
      ),
    );
  }
}