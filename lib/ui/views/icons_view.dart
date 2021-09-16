import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_label.dart';

class IconsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [

          Text('Icons View', style: CustomLabels.h1,),

          const SizedBox(height: 10,),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: const [

              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(child: Icon(Icons.ac_unit_outlined),),
                width: 170,
              ),

              WhiteCard(
                title: 'access_alarm_outlined',
                child: Center(child: Icon(Icons.access_alarm_outlined),),
                width: 170,
              ),
              
              WhiteCard(
                title: 'dangerous_outlined',
                child: Center(child: Icon(Icons.dangerous_outlined),),
                width: 170,
              ),

              WhiteCard(
                title: 'dark_mode',
                child: Center(child: Icon(Icons.dark_mode),),
                width: 170,
              ),

              WhiteCard(
                title: 'format_align_justify_outlined',
                child: Center(child: Icon(Icons.format_align_justify_outlined),),
                width: 170,
              ),

              WhiteCard(
                title: 'padding_outlined',
                child: Center(child: Icon(Icons.padding_outlined),),
                width: 170,
              ),

            ],
          ),
         
        ],
      ),
    );
  }
}