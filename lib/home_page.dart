import 'package:flutter/material.dart';
import 'package:flutter_application_1/cliente_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),

      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.green
                ),
                child: IconButton(onPressed: () {
              
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ClientePage()),);
              
              
                }, icon: const Icon(Icons.person), color: Colors.indigo,),
              ),
                Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.deepPurpleAccent
                    ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClientePage()),
                    );
                  },
                  icon: const Icon(Icons.production_quantity_limits, color: Colors.redAccent, size: 25,),
                ),
              )
            ],
          ),
        ),
      ),


    );
  }
}