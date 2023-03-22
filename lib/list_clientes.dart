import 'package:flutter/material.dart';
import 'cliente_model.dart';

class ListaClientes extends StatefulWidget {
  const ListaClientes({super.key});

  @override
  State<ListaClientes> createState() => _ListaClientesState();
}

class _ListaClientesState extends State<ListaClientes> {

  List<Cliente> clientes = [];


  @override
  void initState() {
    cargarClientes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Lista clientes"),),

      body: ListView.separated(
          itemCount: clientes.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(clientes[index].name),
              subtitle: Text(clientes[index].lastName),
            );
          },
        ),
    );
  }


  void cargarClientes() async {

    final cliente = await Cliente.getCliente();


    setState(() {
      clientes = cliente;
    });
  }



}