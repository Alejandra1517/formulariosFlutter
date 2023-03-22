import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class Producto {
  final int? id;
  final String name;
  final String price;
  final String quantity;
  final int status;

  const Producto({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.status
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'status': status
    };
  }

  @override
  String toString() {
    return 'Cliente{id: $id, name: $name, price: $price, quantity: $quantity, status: $status}';
  }

  static Future<List<Producto>> getProducto() async {
    final Database db = await DbHelper.initDb();
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (i) {
      return Producto(
        id: maps[i]['id'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        quantity: maps[i]['quantity'],
        status: maps[i]['status']
      );
    });
  }

  static Future<int> insertProducto(Producto producto) async {
    final Database db = await DbHelper.initDb();
    final int result = await db.insert('producto', producto.toMap());
    return result;
  }

  static Future<int> updateProducto(Producto producto) async {
    final Database db = await DbHelper.initDb();
    return await db.update(
      'producto',
      producto.toMap(),
      where: 'id = ?',
      whereArgs: [producto.id],
    );
  }

  static Future<int> deleteProducto(int id) async {
    final Database db = await DbHelper.initDb();
    return await db.delete(
      'producto',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
