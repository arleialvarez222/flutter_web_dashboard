import 'package:admin_dashboard/models/categoria.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:admin_dashboard/ui/api/cafe_api.dart';
import 'package:flutter/material.dart';

class CategoriaProvider extends ChangeNotifier {

  List<Categoria> categorias = [];

  getCategorias() async {

    final resp = await CafeApi.httpGet('/categorias');
    final categoriaResponse = CategoriesResponse.fromMap(resp);

    categorias = [...categoriaResponse.categorias];

    //print(categorias);

    notifyListeners();
  }

  Future newCategoria (String name) async {

    final data = {
       'nombre': name,
    };

    try {

      final json = await CafeApi.post('/categorias', data);
      final newCategory = Categoria.fromMap(json);

      categorias.add(newCategory);
      notifyListeners();
    } catch (e) {
     throw 'error ingresando una categoria';
    }
  }

  Future updateCategoria (String name, String id) async {

    final data = {
       'nombre': name,
    };

    try {

      await CafeApi.put('/categorias/$id', data);
      categorias = categorias.map((c) {
        if(c.id != id ) return c;

        c.nombre = name;
        return c;
      }).toList();

      notifyListeners();
    } catch (e) {
      throw 'error editando';
    }
  }

  Future deleteCategoria (String id) async {

    try {

      await CafeApi.delete('/categorias/$id', {});
      categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();
    } catch (e) {
      throw 'error eliminando';
    }
  }

}