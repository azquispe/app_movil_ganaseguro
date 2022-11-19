import 'package:flutter/material.dart';
import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;
import 'package:app_movil_ganaseguros/utils/constantes.dart' as constantes;

class Estilos {
  static TextStyle stlTextoTitulo(Color pColor) {
    return  TextStyle(
        color: pColor,
        letterSpacing: 0.5,
        fontSize: 22,
        fontFamily: constantes.tipo_fuente_poppins,
        fontWeight: FontWeight.bold);
  }

  static TextStyle stlTextoSubTitulo(Color pColor) {
    return  TextStyle(
        color: pColor,
        //color: colores.sec_verde_petroleo,
        letterSpacing: 0.5,
        fontSize: 18,
        fontFamily: constantes.tipo_fuente_poppins,
        fontWeight: FontWeight.bold);
  }

  static TextStyle stlTextoContenidoNegrilla(Color pColor) {
    return  TextStyle(
        color: pColor,
        letterSpacing: 0.5,
        fontSize: 16,
        fontFamily: constantes.tipo_fuente_poppins,
        fontWeight: FontWeight.bold);
  }

  static TextStyle stlTextoContenido(Color pColor) {
    return  TextStyle(
        color: pColor,
        letterSpacing: 0.5,
        fontSize: 16,
        fontFamily: constantes.tipo_fuente_poppins,
        fontWeight: FontWeight.normal);
  }


  static TextStyle stlTextoLink(Color pColor) {
    return  TextStyle(
        color: pColor,
        letterSpacing: 0.5,
        fontSize: 14,
        fontFamily: constantes.tipo_fuente_poppins,
        fontWeight: FontWeight.normal);
  }
}
