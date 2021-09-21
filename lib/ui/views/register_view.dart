import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/bottons/custom_outlined_botton.dart';
import 'package:admin_dashboard/ui/bottons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),
      child: Builder(builder:(context){

        final registerProvider = Provider.of<RegisterProvider>(context, listen: false);

        return Container(
         // height: 1000,
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                key: registerProvider.formKeyRegister,
                child: Column(
                  children: [

                    TextFormField(
                      onChanged: (value){
                        registerProvider.name = value;
                      },
                      validator: (value) {
                        if(value == null || value.isEmpty) return 'Ingrese su nombre';
                        if(value.length < 3) return 'El nombre de contener mas de 3 caracteres';
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su nombre',
                        label: 'Nombre',
                        icon: Icons.person,
                      ),
                    ),

                    const SizedBox(height: 20,),


                    TextFormField(
                      onChanged: (value) => {
                          registerProvider.email = value
                        },
                        validator: (value) {
                          if(!EmailValidator.validate(value ?? '')) return 'E-mail no válido';
                          return null;
                        },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su e-mail',
                        label: 'E-mail',
                        icon: Icons.email_outlined,
                      ),
                    ),

                    const SizedBox(height: 20,),

                    TextFormField(
                      onChanged: (value) => {
                          registerProvider.password = value
                        },
                        validator: (value) {
                          if(value == null || value.isEmpty) return 'Ingrese la contraseña';
                          if(value.length < 6) return 'La contraseña de contener mas de 6 caracteres';
                        },
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecoration(
                        hint: 'Ingrese su password',
                        label: 'Password',
                        icon: Icons.lock_outline_rounded,
                      ),
                    ),

                    const SizedBox(height: 20,),

                    CustomOutlinedButton(
                      onPressed: () {
                        final validForm = registerProvider.validateRegisterForm();
                        if(!validForm) return;

                        final authProvider = Provider.of<AuthProvider>(context, listen: false);

                        authProvider.register(
                          registerProvider.name, 
                          registerProvider.email, 
                          registerProvider.password, 
                        );

                      }, 
                      text:'Crear cuenta',
                      color: Colors.white,
                    ),

                    const SizedBox(height: 20,),

                    LinkText(
                      text: 'Inicio de sesion',
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, Flurorouter.loginRoute);
                      },
                    ),

                  ],
                )
              ),
            ),
          ),
        );
      }),
    );

  }

  
}