import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_label.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [

          Text('Blank layoud', style: CustomLabels.h1,),

          const SizedBox(height: 10,),

          const WhiteCard(
            title: 'Sales statistics',
            child: Text('Hi Arlei in the page view')
          ),
        ],
      ),
    );
  }
}