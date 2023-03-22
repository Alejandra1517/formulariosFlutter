import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class Cliente {
  final int? id;
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String adress;

  const Cliente({
    this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.adress
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'adress': adress
    };
  }
 
  @override
  String toString() {
    return 'Cliente{id: $id, name: $name, lastName: $lastName, email: $email, phone: $phone, adress: $adress}';
  }

static Future<List<Cliente>> getCliente() async {
    final Database db = await DbHelper.initDb();
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
      return Cliente(
        id: maps[i]['id'],
        name: maps[i]['name'],
        lastName: maps[i]['lastName'],
        email: maps[i]['email'],
        phone: maps[i]['phone'],
        adress: maps[i]['adress']
      );
    });
  }

 static Future<int> insertCliente(Cliente cliente) async {
    final Database db = await DbHelper.initDb();
    final int result = await db.insert('cliente', cliente.toMap());
    return result;
  }

  static Future<int> updateCliente(Cliente cliente) async {
    final Database db = await DbHelper.initDb();
    return await db.update(
      'cliente',
      cliente.toMap(),
      where: 'id = ?',
      whereArgs: [cliente.id],
    );
  }

  static Future<int> deleteCliente(int id) async {
    final Database db = await DbHelper.initDb();
    return await db.delete(
      'cliente',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
