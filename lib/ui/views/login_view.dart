import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/bottons/custom_outlined_botton.dart';
import 'package:admin_dashboard/ui/bottons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [

                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su e-mail',
                    label: 'E-mail',
                    icon: Icons.email_outlined,
                  ),
                ),

                SizedBox(height: 20,),

                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su password',
                    label: 'Password',
                    icon: Icons.lock_outline_rounded,
                  ),
                ),

                SizedBox(height: 20,),

                CustomOutlinedButton(
                  onPressed: () {}, 
                  text:'Ingresar',
                  color: Colors.white,
                ),

                SizedBox(height: 20,),

                LinkText(
                  text: 'Nueva cuenta',
                  onPressed: (){
                    Navigator.pushNamed(context, Flurorouter.registerRoute);
                  },
                ),

              ],
            )
          ),
        ),
      ),
    );

  }

}