// To parse this JSON data, do
//
//     final polizaModel = polizaModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class PolizaModel {
  PolizaModel({
    this.polizaId,
    this.nombreProducto,
    this.numeroProducto,
    this.nombreAsegurado,
    this.nombreTomador,
    this.lstBeneficiarios,
    this.numeroOperacion,
    this.nombrePoliza,
    this.fechaInicio,
    this.fechaFin,
    this.estado,
    this.tipoProducto,
    this.frecuencia,
    this.montoPrima,
    this.precio,
  });

  String ? polizaId;
  String ? nombreProducto;
  String  ? numeroProducto;
  String  ? nombreAsegurado;
  String  ? nombreTomador;
  List<String>  ? lstBeneficiarios;
  String  ? numeroOperacion;
  String  ? nombrePoliza;
  String  ? fechaInicio;
  String  ? fechaFin;
  String  ? estado;
  String  ? tipoProducto;
  String  ? frecuencia;
  String ?  montoPrima;
  String  ? precio;

  factory PolizaModel.fromJson(String str) => PolizaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PolizaModel.fromMap(Map<String, dynamic> json) => PolizaModel(
    polizaId: json["polizaId"] == null ? null : json["polizaId"],
    nombreProducto: json["nombreProducto"] == null ? null : json["nombreProducto"],
    numeroProducto: json["numeroProducto"] == null ? null : json["numeroProducto"],
    nombreAsegurado: json["nombreAsegurado"] == null ? null : json["nombreAsegurado"],
    nombreTomador: json["nombreTomador"] == null ? null : json["nombreTomador"],
    lstBeneficiarios: json["lstBeneficiarios"] == null ? null : List<String>.from(json["lstBeneficiarios"].map((x) => x)),
    numeroOperacion: json["numeroOperacion"] == null ? null : json["numeroOperacion"],
    nombrePoliza: json["nombrePoliza"] == null ? null : json["nombrePoliza"],
    fechaInicio: json["fechaInicio"] == null ? null : json["fechaInicio"],
    fechaFin: json["fechaFin"] == null ? null : json["fechaFin"],
    estado: json["estado"] == null ? null : json["estado"],
    tipoProducto: json["tipoProducto"] == null ? null : json["tipoProducto"],
    frecuencia: json["frecuencia"] == null ? null : json["frecuencia"],
    montoPrima: json["montoPrima"] == null ? null : json["montoPrima"],
    precio: json["precio"] == null ? null : json["precio"],
  );

  Map<String, dynamic> toMap() => {
    "polizaId": polizaId == null ? null : polizaId,
    "nombreProducto": nombreProducto == null ? null : nombreProducto,
    "numeroProducto": numeroProducto == null ? null : numeroProducto,
    "nombreAsegurado": nombreAsegurado == null ? null : nombreAsegurado,
    "nombreTomador": nombreTomador == null ? null : nombreTomador,
    "lstBeneficiarios": lstBeneficiarios == null ? null : List<String>.from(lstBeneficiarios!.map((x) => x)),
    "numeroOperacion": numeroOperacion == null ? null : numeroOperacion,
    "nombrePoliza": nombrePoliza == null ? null : nombrePoliza,
    "fechaInicio": fechaInicio == null ? null : fechaInicio,
    "fechaFin": fechaFin == null ? null : fechaFin,
    "estado": estado == null ? null : estado,
    "tipoProducto": tipoProducto == null ? null : tipoProducto,
    "frecuencia": frecuencia == null ? null : frecuencia,
    "montoPrima": montoPrima == null ? null : montoPrima,
    "precio": precio == null ? null : precio,
  };
}
