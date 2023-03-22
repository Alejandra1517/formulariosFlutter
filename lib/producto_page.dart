import 'package:flutter/material.dart';
import 'package:flutter_application_1/list_productos.dart';
import 'package:flutter_application_1/producto_model.dart';

class ProductoPage extends StatefulWidget {
  const ProductoPage({super.key});


  @override
  State<ProductoPage> createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {

   final _key = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _statusController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),


      body: Form(
        key: _key,
        child: Column(
          children: [

            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                label: Text('Producto'),
              ),
            ),

          TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(
                label: Text('Precio'),
              ),
            ),

            TextFormField(
              controller: _quantityController,
              decoration: const InputDecoration(
                label: Text('Cantidad'),
              ),
            ),


            TextFormField(
              controller: _statusController,
              decoration: const InputDecoration(
                label: Text('Estado'),
              ),
            ),

            ElevatedButton(onPressed: (){
              
              submit();

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registro exitoso"),),);


              Navigator.push(context, MaterialPageRoute(builder: (context) => const ListaProducto()),);


            }, child: const Text("Registrar"))

          ],



        ),
        ),




    );

  }

  void submit() async {

    final name = _nameController.text;
    final price = _priceController.text;
    final quantity = _quantityController.text;
    final status = _statusController.text;


    Producto producto = Producto(name: name, price: price, quantity: quantity, status: int.parse(status));
  
    await Producto.insertProducto(producto);


  }



  }
