import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_label.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AuthProvider>(context).user!;

    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [

          Text('Dashboard layoud', style: CustomLabels.h1,),

          const SizedBox(height: 10,),

           WhiteCard(
            title: user.nombre,
            child: Text(user.correo)
          ),
        ],
      ),
    );
  }
}