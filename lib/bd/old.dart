import 'dart:io';

import 'package:app_movil_ganaseguros/models/datos_persona_model.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';




class Old {

  static Future<Database> _openDB() async {
  return openDatabase(join(await getDatabasesPath(),'ganaseguros_db.db'),
  onCreate: (db,version){
  return  db.execute('CREATE TABLE DatosPersonas( datosPersonaId INTEGER PRIMARY KEY AUTOINCREMENT, nroDocumento TEXT,  extension TEXT, complemento TEXT, nombreAsegurado TEXT, nombreTomador TEXT, fechaNacimiento TEXT)');
  },version: 2
  );
  }
  static Future<int> nuevoDatosPersona(DatosPersonasModel datosPersonasModel) async {
  final db = await _openDB();
  int i =   await db.insert('DatosPersonas', datosPersonasModel.toMap());

  return i;
  }

  static Future<List<DatosPersonasModel>> obtenerTodosDatosPersonas() async {
  final db = await _openDB();
  final res = await db.query('DatosPersonas');

  List<DatosPersonasModel> list = res.isNotEmpty
  ? res.map((e) => DatosPersonasModel.fromMap(e)).toList()
      : [];
  return list;
  }
  static Future<DatosPersonasModel?>obtenerDatosPersonaPorNroDocumento(String pNroDocumento) async {
  final db = await _openDB();
  final res = await db.query('DatosPersonas',where: 'nroDocumento=?',whereArgs: [pNroDocumento]);

  return res.isNotEmpty? DatosPersonasModel.fromMap(res.first):null ;
  }
  static Future<int> eliminarDatosPersonas(int pDatosPersonaId) async {
  final db = await _openDB();
  final res = await db.delete('DatosPersonas',
  where: 'datosPersonaId=?', whereArgs: [pDatosPersonaId]);
  if(db.isOpen) db.close();
  return res;
  }


}