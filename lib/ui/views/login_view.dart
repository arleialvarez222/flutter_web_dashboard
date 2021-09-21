import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/bottons/custom_outlined_botton.dart';
import 'package:admin_dashboard/ui/bottons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: ( _ ) => LoginFormProvider(),
      child: Builder(builder: (context) {

        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                //autovalidateMode => valida que campo son obigatorios pero al empezar a escribir en el form
                //autovalidateMode: AutovalidateMode.always,
                key: loginFormProvider.formKey,
                child: Column(
                  children: [
      
                    TextFormField(
                      onFieldSubmitted: ( _ ) => onFormSubmit(loginFormProvider, authProvider), 
                      onChanged: (value) => {
                        loginFormProvider.email = value
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
                      onFieldSubmitted: ( _ ) => onFormSubmit(loginFormProvider, authProvider), 
                      onChanged: (value) => {
                        loginFormProvider.password = value
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
                      onPressed: () => onFormSubmit(loginFormProvider, authProvider), 
                      text:'Ingresar',
                      color: Colors.white,
                    ),
      
                    const SizedBox(height: 20,),
      
                    LinkText(
                      text: 'Nueva cuenta',
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, Flurorouter.registerRoute);
                      },
                    ),
      
                  ],
                )
              ),
            ),
          ),
        );
      },)
    );

  }

  void onFormSubmit(LoginFormProvider loginFormProvider,AuthProvider authProvider){
    final isValid = loginFormProvider.validateForm();
    if(!isValid) return;

    //final authProvider = Provider.of<AuthProvider>(context, listen: false);

    authProvider.login(
      loginFormProvider.email, 
      loginFormProvider.password
    );
  }

}