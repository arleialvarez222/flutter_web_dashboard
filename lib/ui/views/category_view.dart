import 'package:admin_dashboard/dataTables/categories_datasource.dart';
import 'package:admin_dashboard/providers/categoria_provider.dart';
import 'package:admin_dashboard/ui/bottons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_label.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CategoriaProvider>(context, listen: false).getCategorias();
  }

  @override
  Widget build(BuildContext context) {

    final categorias = Provider.of<CategoriaProvider>(context).categorias;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [

          Text('Categories', style: CustomLabels.h1,),

          const SizedBox(height: 10,),

          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Categoria')),
              DataColumn(label: Text('Creado por')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CategoriesDTS(categorias, context),
            header: const Text('Lista de categorias', maxLines: 2,),
            onRowsPerPageChanged: (value){
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButtom(
                onPressed: (){
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context, 
                    builder: ( _ ) => CategoryModal(categoria: null,)
                  );
                }, 
                text: 'Crear', 
                icon: Icons.add
              ),
            ],

          ),
        ],
      ),
    );
  }
}