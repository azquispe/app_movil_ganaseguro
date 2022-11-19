import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/solicitud_seguro_model.dart';
import '../services/consulta_poliza_service.dart';

class SolicitaSeguroProvider with ChangeNotifier{
  TextEditingController  _txtNombreController = TextEditingController();
  TextEditingController _txtApellidoController = TextEditingController();
  TextEditingController _txtTelCelController = TextEditingController();
  TextEditingController _txtCorreoController = TextEditingController();
  TextEditingController _txtCiudadController = TextEditingController();
  bool _boolTieneSeguroConNosotros = false;
  bool _boolTieneSeguroConOtros = false;
  TextEditingController _txtTipoSeguroController = TextEditingController();

  TextEditingController get txtNombreController => _txtNombreController;

  set txtNombreController(TextEditingController value) {
    _txtNombreController = value;
  }

  TextEditingController get txtApellidoController => _txtApellidoController;

  set txtApellidoController(TextEditingController value) {
    _txtApellidoController = value;
  }

  TextEditingController get txtTelCelController => _txtTelCelController;

  set txtTelCelController(TextEditingController value) {
    _txtTelCelController = value;
  }

  TextEditingController get txtCorreoController => _txtCorreoController;

  set txtCorreoController(TextEditingController value) {
    _txtCorreoController = value;
  }

  TextEditingController get txtCiudadController => _txtCiudadController;

  set txtCiudadController(TextEditingController value) {
    _txtCiudadController = value;
  }

  bool get boolTieneSeguroConNosotros => _boolTieneSeguroConNosotros;

  set boolTieneSeguroConNosotros(bool value) {
    _boolTieneSeguroConNosotros = value;
    notifyListeners();
  }

  bool get boolTieneSeguroConOtros => _boolTieneSeguroConOtros;

  set boolTieneSeguroConOtros(bool value) {
    _boolTieneSeguroConOtros = value;
    notifyListeners();
  }

  TextEditingController get txtTipoSeguroController => _txtTipoSeguroController;

  set txtTipoSeguroController(TextEditingController value) {
    _txtTipoSeguroController = value;
  }




  ConsultaPolizasService _consultaPolizaService = new ConsultaPolizasService();

  Future<bool> enviarSolicitudSeguro() async {
    SolicitudSeguroModel objSolicitudSeguroModel = new SolicitudSeguroModel(
        nombres: _txtNombreController.text,
        apellidos: _txtApellidoController.text,
        telefonoCelular: _txtTelCelController.text,
        correo: _txtCorreoController.text,
        ciudad: _txtCiudadController.text,
        tieneSeguroConNosotros: _boolTieneSeguroConNosotros,
        tieneSeguroConOtros:_boolTieneSeguroConOtros,
        tipoSeguroInteresado:_txtTipoSeguroController.text
    );
    return await _consultaPolizaService.enviarSolicitudSeguro(objSolicitudSeguroModel);
  }

}