import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notification_service.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_label.dart';
import 'package:provider/provider.dart';

class UseridView extends StatefulWidget {

  final String uid;

  const UseridView({
    Key? key, 
    required this.uid
  }) : super(key: key);

  @override
  State<UseridView> createState() => _UseridViewState();
}

class _UseridViewState extends State<UseridView> {

  Usuario? user;

  @override
  void initState() {
    super.initState();

    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider = Provider.of<UserFormProvider>(context, listen: false);

    usersProvider .getUserById(widget.uid)
      .then((userDB) {
        if(userDB != null){
          userFormProvider.user = userDB;
          //limpiar el provider despues de salir o ingresar un id no valid
          userFormProvider.formkey = GlobalKey<FormState>();
          setState(() {user = userDB;});
        }else{
          NavigationService.replaceTo('/dashboard/users');
        }

      });

  }

  @override
  void dispose() {

    user = null;
    Provider.of<UserFormProvider>(context, listen: false).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [

          Text('User view id', style: CustomLabels.h1,),

          const SizedBox(height: 10,),

          if(user == null)
            WhiteCard(
            child: Container(
              alignment: Alignment.center,
              height: 300,
              child: const CircularProgressIndicator(),
            )
          ),
          
          if(user != null)
            _UserViewBody()
          
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Table(
      columnWidths: const {0:FixedColumnWidth(250)},
      children: const [
        TableRow(
          children: [

            _AvatarContainer(),

            _UserViewForm(),

          ]
        )
      ],
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user;

    return WhiteCard(
      title: 'Informacion general',
      child: Form(
        key: userFormProvider.formkey,
        child: Column(
          children: [

            TextFormField(
              initialValue: user!.nombre,
              decoration: CustomInputs.formInputDecoration(
                hint: 'Nombre usuario', 
                label: 'Nombre', 
                icon: Icons.supervised_user_circle_outlined
              ),
              onChanged: (value) => userFormProvider.copyUserWith(nombre: value),
              validator: (value) {
                if(value == null || value.isEmpty) return 'Ingrese un nombre';
                if(value.length < 2) return 'Nombre debe contener mas de dos caracteres';
                return null;
              },
            ),

            const SizedBox(height: 15,),

            TextFormField(
              initialValue: user.correo,
              decoration: CustomInputs.formInputDecoration(
                hint: 'Correo usuario', 
                label: 'Correo', 
                icon: Icons.email_outlined
              ),
              onChanged: (value) => userFormProvider.copyUserWith(correo: value),
              validator: (value) {
                if( !EmailValidator.validate(value ?? '')) return 'E-mail no es válido';
                return null;
              },
            ),

            const SizedBox(height: 15,),

            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 120),
              child: ElevatedButton(
                onPressed: () async{
                  final saved = await userFormProvider.updateUsers();
                  if(saved){
                    NotificationService.showSnacbar('Usuario actualizado');
                    Provider.of<UsersProvider>(context, listen: false).refresUsers(user);
                  }else{
                    NotificationService.showSnacbarError('No se actualizo');
                  }
                }, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.save_outlined),
                    Text(' Guardar')
                  ],
                )
              ),
            ),
          ],
        ) 
      ),
    );
    
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user;

    return WhiteCard(
      width: 250,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Profile', style: CustomLabels.h2,),

            const SizedBox(height: 20,),

            SizedBox(
              width: 150,
              height: 160,
              child: Stack(
                children: [

                  const ClipOval(child: Image(image: AssetImage('no-image.jpg'),)),

                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 5),
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        elevation: 0,
                        child: const Icon(Icons.camera_alt_outlined, size: 20,),
                        onPressed: (){},

                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20,),

            Text(
              user!.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )

          ],
        ),
      ),
    );
  }
}