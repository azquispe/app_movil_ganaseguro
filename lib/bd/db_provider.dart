import 'package:app_movil_ganaseguros/models/datos_persona_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  static final DBProvider instance = DBProvider._init();

  static Database? _database;

  DBProvider._init();

  final String tableDatosPersonas = 'DatosPersonas';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('Ganaseguros.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    await db.execute('''
     CREATE TABLE $tableDatosPersonas(
    datosPersonaId INTEGER PRIMARY KEY AUTOINCREMENT, 
    nroDocumento TEXT,  
    extension TEXT, 
    complemento TEXT, 
    nombreAsegurado TEXT, 
    nombreTomador TEXT, 
    fechaNacimiento TEXT)
    ''');

  }

  Future<void> nuevoDatosPersona(DatosPersonasModel item) async {
    print("REGISTRANDO NUEVO DATOS PERSONA==============================");
    final db = await instance.database;
    await db.transaction((txn) async {
      await txn.insert(tableDatosPersonas, item.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<DatosPersonasModel>> obtenerTodosDatosPersonas() async {
    print("OBTENIENDO TODOS DATOS PERSONAS DE SQLITE ================================");
    final db = await instance.database;
    final List<Map<String, dynamic>> res = await db.query(tableDatosPersonas);

    //List<Map<String, dynamic>> res = await db.rawQuery('SELECT * FROM $tableDatosPersonas');

    List<DatosPersonasModel> list = res.isNotEmpty
        ? res.map((e) => DatosPersonasModel.fromMap(e)).toList()
        : [];
    return list;

  }
  Future<DatosPersonasModel?> obtenerDatosPersonaPorNroDocumento(String pNroDocumento) async {
    print("OBTENIENDO DATOS POR NRO DE CARNET DE SQLITE ==============================");
    final db = await instance.database;
      final res = await db.query(tableDatosPersonas,where: 'nroDocumento=?',whereArgs: [pNroDocumento]);
      return res.isNotEmpty? DatosPersonasModel.fromMap(res.first):null ;

  }
   Future<int?> eliminarDatosPersonas(int pDatosPersonaId) async {
    print("ELIMINANDO REGISTRO DE SQLITE =================================");
    final db = await instance.database;
    return  await db.delete(tableDatosPersonas, where: 'datosPersonaId=?', whereArgs: [pDatosPersonaId]);
    /*await db.transaction((txn) async {
      return await txn.rawDelete('DELETE FROM $tableDatosPersonas WHERE id = $pDatosPersonaId');
    });*/
  }
}
