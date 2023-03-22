import 'package:flutter/material.dart';
import 'package:flutter_application_1/list_clientes.dart';

import 'cliente_model.dart';

class ClientePage extends StatefulWidget {
  const ClientePage({super.key});

  @override
  State<ClientePage> createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {

  final _key = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _adressController = TextEditingController();
  final _stateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Registro de clientes"),
      ),


      body: Form(
          key: _key,
          child: Column(
            children: [
      
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  label: Text('Nombre'),
                  icon: Icon(Icons.person),
                ),
              ),
      
            TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  label: Text('Apellido'),
                  icon: Icon(Icons.person_2_outlined),
                ),
              ),
      
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  label: Text('Correo'),
                  icon: Icon(Icons.email),
                ),
              ),
      
      
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration: const InputDecoration(
                  label: Text('Teléfono'),
                  icon: Icon(Icons.phone),
                ),
              ),
      
      
              TextFormField(
                controller: _adressController,
                decoration: const InputDecoration(
                  label: Text('Dirección'),
                  icon: Icon(Icons.app_registration_rounded),
                ),
              ),
      
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _stateController,
                decoration: const InputDecoration(
                  label: Text('Estado'),
                  icon: Icon(Icons.mode),
                ),
              ),
        const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                
                submit();
      
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registro exitoso"),),);
      
      
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ListaClientes()),);
      
      
              }, child: const Text("Registrar"))
      
            ],
      
      
      
          ),
      ),




    );

  }

  void submit() async {

    final name = _nameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final adress = _adressController.text;
    // final state = _stateController.text;


    Cliente cliente = Cliente(name: name, lastName: lastName, email: email, phone: phone, adress: adress);
  
    await Cliente.insertCliente(cliente);


  }



}