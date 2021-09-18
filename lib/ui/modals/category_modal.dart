import 'package:admin_dashboard/models/categoria.dart';
import 'package:admin_dashboard/providers/categoria_provider.dart';
import 'package:admin_dashboard/services/notification_service.dart';
import 'package:admin_dashboard/ui/bottons/custom_outlined_botton.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {

  final Categoria? categoria;

  const CategoryModal({Key? key, this.categoria}) : super(key: key);

  @override
  _CategoryModalState createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {

  String nombre = '';
  String? id;

  @override
  void initState() {
    
    super.initState();

    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {

    final categoryProvider = Provider.of<CategoriaProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(20),
      width: 500,
      height: 300,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                widget.categoria?.nombre ?? 'Nueva categoria',
                style: CustomLabels.h1.copyWith(color: Colors.white),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(), 
                icon: const  Icon(Icons.close, color: Colors.white,)
              ),

            ],
          ),

          Divider(color: Colors.white.withOpacity(0.3),),

          const SizedBox(height: 20,),

          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: (value){
              nombre = value;
            },
            decoration: CustomInputs.loginInputDecoration(
              hint: 'Nombre de la categoria', 
              label: 'Categoria', 
              icon: Icons.new_releases_outlined,
            ),
            style: const TextStyle(color: Colors.white),
          ),

          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {

                try {
                  
                  if(id == null){
                    await categoryProvider.newCategoria(nombre);
                    NotificationService.showSnacbar('$nombre creadacon con éxito');
                  }else{
                    await categoryProvider.updateCategoria(nombre, id!);
                    NotificationService.showSnacbar('$nombre Actualizado con éxito');
                  }

                  Navigator.of(context).pop();

                } catch (e) {
                  Navigator.of(context).pop();
                  NotificationService.showSnacbarError('No se pudo guardar la categoria');
                }
              },
              text: 'Guardar',
              color: Colors.white,
            ),
          )

        ],
      ),
      
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    borderRadius:  BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    color: Color(0xff0f2041),
  );
}