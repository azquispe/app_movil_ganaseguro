// To parse this JSON data, do
//
//     final solicitudSeguroModel = solicitudSeguroModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SolicitudSeguroModel {
  SolicitudSeguroModel({
    required this.nombres,
    required this.apellidos,
    required this.telefonoCelular,
    required this.correo,
    required this.ciudad,
    required this.tieneSeguroConNosotros,
    required this.tieneSeguroConOtros,
    required this.tipoSeguroInteresado,
  });

  String nombres;
  String apellidos;
  String telefonoCelular;
  String correo;
  String ciudad;
  bool tieneSeguroConNosotros;
  bool tieneSeguroConOtros;
  String tipoSeguroInteresado;

  factory SolicitudSeguroModel.fromJson(String str) => SolicitudSeguroModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SolicitudSeguroModel.fromMap(Map<String, dynamic> json) => SolicitudSeguroModel(
    nombres: json["nombres"] == null ? null : json["nombres"],
    apellidos: json["apellidos"] == null ? null : json["apellidos"],
    telefonoCelular: json["telefonoCelular"] == null ? null : json["telefonoCelular"],
    correo: json["correo"] == null ? null : json["correo"],
    ciudad: json["ciudad"] == null ? null : json["ciudad"],
    tieneSeguroConNosotros: json["tieneSeguroConNosotros"] == null ? null : json["tieneSeguroConNosotros"],
    tieneSeguroConOtros: json["tieneSeguroConOtros"] == null ? null : json["tieneSeguroConOtros"],
    tipoSeguroInteresado: json["tipoSeguroInteresado"] == null ? null : json["tipoSeguroInteresado"],
  );

  Map<String, dynamic> toMap() => {
    "nombres": nombres == null ? null : nombres,
    "apellidos": apellidos == null ? null : apellidos,
    "telefonoCelular": telefonoCelular == null ? null : telefonoCelular,
    "correo": correo == null ? null : correo,
    "ciudad": ciudad == null ? null : ciudad,
    "tieneSeguroConNosotros": tieneSeguroConNosotros == null ? null : tieneSeguroConNosotros,
    "tieneSeguroConOtros": tieneSeguroConOtros == null ? null : tieneSeguroConOtros,
    "tipoSeguroInteresado": tipoSeguroInteresado == null ? null : tipoSeguroInteresado,
  };
}

