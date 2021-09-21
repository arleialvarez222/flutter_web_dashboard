import 'package:admin_dashboard/dataTables/users_datasource.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/labels/custom_label.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usersProvider = Provider.of<UsersProvider>(context);
    final useraDataSource = UsersDataSource(usersProvider.users);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [

          Text('User view', style: CustomLabels.h1,),

          const SizedBox(height: 10,),

          PaginatedDataTable(
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColumnIndex,
            columns: [
              const DataColumn(label: Text('Avatar')),
              DataColumn(label: const Text('Nombre'), onSort: (colIndex, _ ) {
                usersProvider.sortColumnIndex = colIndex;
                usersProvider.sort<String>((user) => user.nombre);
              }),
              DataColumn(label: const Text('Email'), onSort: (colIndex, _ ) {
                usersProvider.sortColumnIndex = colIndex;
                usersProvider.sort<String>((user) => user.correo);
              }),
              const DataColumn(label: Text('Uid')),
              const DataColumn(label: Text('Acciones')),
            ], 
            source: useraDataSource,
            onPageChanged: (page){
              print(': $page');
            },
          ),
        ],
      ),
    );
  }
}