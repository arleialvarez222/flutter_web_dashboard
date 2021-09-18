import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/models/categoria.dart';
import 'package:admin_dashboard/providers/categoria_provider.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';

class CategoriesDTS extends DataTableSource {

  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);

  @override
  DataRow getRow(int index) {

    final category = categorias[index];

    return DataRow.byIndex(
      index: index,
      cells:  [
        DataCell(Text(category.id)),
        DataCell(Text(category.nombre)),
        DataCell(Text(category.usuario.nombre)),
        DataCell(Row(
          children: [
            IconButton(
              onPressed: (){
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context, 
                  builder: ( _ ) => CategoryModal(categoria: category,)
                );
                //print('Editando categoria: $categorias');
              }, 
              icon: const Icon(Icons.edit_outlined),
            ),
            IconButton(
              onPressed: (){
                final dialog = AlertDialog(
                  title: const Text('Esta seguro de eliminar este archivo'),
                  content: Text('Confrimar eliminar: ${category.nombre}'),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                      child: const Text('No')
                    ),
                    TextButton(
                      onPressed: () async{
                        await Provider.of<CategoriaProvider>(context, listen: false)
                          .deleteCategoria(category.id); 
                        Navigator.of(context).pop();
                      }, 
                      child: const Text('Si')
                    ),
                  ],
                );

                showDialog(context: context, builder: ( _ ) => dialog );
              }, 
              icon: Icon(Icons.delete_outline, color: Colors.red.withOpacity(0.8),),
            ),
          ],
        )),
      ] 
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;



}