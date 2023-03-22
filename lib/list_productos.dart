import 'package:flutter/material.dart';
import 'package:flutter_application_1/producto_model.dart';

class ListaProducto extends StatefulWidget {
  const ListaProducto({super.key});

  @override
  State<ListaProducto> createState() => _ListaProductoState();
}

class _ListaProductoState extends State<ListaProducto> {

  List<Producto> productos = [];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: 
ListView.separated(
          itemCount: productos.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('item $index'),
              subtitle: Text('${productos[index]}'),
            );
          },
        )


    );
  }


 void cargarProductos(){





 }


}