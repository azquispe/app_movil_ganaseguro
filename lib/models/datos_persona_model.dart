// To parse this JSON data, do
//
//     final datosPersonasModel = datosPersonasModelFromMap(jsonString);

import 'dart:convert';

class DatosPersonasModel {
  DatosPersonasModel({
    this.datosPersonaId,
    this.nroDocumento,
    this.extension,
    this.complemento,
    this.nombreAsegurado,
    this.nombreTomador,
    this.fechaNacimiento,
  });

  int ? datosPersonaId;
  String ? nroDocumento;
  String ? extension;
  String ? complemento;
  String ? nombreAsegurado;
  String ? nombreTomador;
  String ? fechaNacimiento;

  factory DatosPersonasModel.fromJson(String str) => DatosPersonasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DatosPersonasModel.fromMap(Map<String, dynamic> json) => DatosPersonasModel(
    datosPersonaId: json["datosPersonaId"] == null ? null : json["datosPersonaId"],
    nroDocumento: json["nroDocumento"] == null ? null : json["nroDocumento"],
    extension: json["extension"] == null ? null : json["extension"],
    complemento: json["complemento"] == null ? null : json["complemento"],
    nombreAsegurado: json["nombreAsegurado"] == null ? null : json["nombreAsegurado"],
    nombreTomador: json["nombreTomador"] == null ? null : json["nombreTomador"],
    fechaNacimiento: json["fechaNacimiento"] == null ? null : json["fechaNacimiento"],
  );

  Map<String, dynamic> toMap() => {
    "datosPersonaId": datosPersonaId == null ? null : datosPersonaId,
    "nroDocumento": nroDocumento == null ? null : nroDocumento,
    "extension": extension == null ? null : extension,
    "complemento": complemento == null ? null : complemento,
    "nombreAsegurado": nombreAsegurado == null ? null : nombreAsegurado,
    "nombreTomador": nombreTomador == null ? null : nombreTomador,
    "fechaNacimiento": fechaNacimiento == null ? null : fechaNacimiento,
  };
}
