import 'package:app_movil_ganaseguros/bd/db_provider.dart';
import 'package:app_movil_ganaseguros/models/datos_persona_model.dart';
import 'package:app_movil_ganaseguros/models/poliza_model.dart';
import 'package:app_movil_ganaseguros/models/request_poliza_model.dart';
import 'package:app_movil_ganaseguros/services/consulta_poliza_service.dart';

import 'package:flutter/material.dart';


class ConsultaPolizaProvider with ChangeNotifier {

  TextEditingController _txtNroDocumentoController = TextEditingController();
  TextEditingController _txtExtensionController = TextEditingController();
  TextEditingController _txtComplementoController = TextEditingController();
  TextEditingController _txtFechaNacimientoController = TextEditingController();
  List<PolizaModel> _lstPolizaModel = [];



  TextEditingController get txtNroDocumentoController =>
      _txtNroDocumentoController;

  set txtNroDocumentoController(TextEditingController value) {
    _txtNroDocumentoController = value;
  }

  TextEditingController get txtExtensionController => _txtExtensionController;

  set txtExtensionController(TextEditingController value) {
    _txtExtensionController = value;
  }

  List<PolizaModel> get lstPolizaModel => _lstPolizaModel;

  set lstPolizaModel(List<PolizaModel> value) {
    _lstPolizaModel = value;
  }

  TextEditingController get txtFechaNacimientoController =>
      _txtFechaNacimientoController;

  set txtFechaNacimientoController(TextEditingController value) {
    _txtFechaNacimientoController = value;
  }

  TextEditingController get txtComplementoController =>
      _txtComplementoController;

  set txtComplementoController(TextEditingController value) {
    _txtComplementoController = value;
  }


  ConsultaPolizasService _consultaPolizaService = new ConsultaPolizasService();

  // Creado por aquispe ............... 18/11/2022
  // Metodo que consulta poliza del servicio
  // registrar busqueda historica en caso no exista registrado
  Future<List<PolizaModel>> consultarPoliza() async {
    RequestPolizaModel objInsert = RequestPolizaModel(
      nroDocumento: this._txtNroDocumentoController.text,
      extension: this._txtExtensionController.text,
      complemento: this._txtComplementoController.text,
      fechaNacimiento: this._txtFechaNacimientoController.text
    );
    this.lstPolizaModel = await  _consultaPolizaService.obtenerPolizasPorNroDocumento(objInsert);

    // Verificar
    DatosPersonasModel? objDatosPersonas = await DBProvider.instance.obtenerDatosPersonaPorNroDocumento(this._txtNroDocumentoController.text.trim());
    if(objDatosPersonas==null){
          DatosPersonasModel objInsert = DatosPersonasModel(
          nroDocumento: this._txtNroDocumentoController.text.trim(),
          extension: this._txtExtensionController.text.trim(),
          complemento: this._txtComplementoController.text.trim(),
          nombreAsegurado:lstPolizaModel[0].nombreAsegurado, // OJO HAY Q REVISAR, DE MOMENTO ESTA AGARRANDO EL PRIMERO DE LA LISTA
          nombreTomador:lstPolizaModel[0].nombreTomador); // OJO HAY Q REVISAR, DE MOMENTO ESTA AGARRANDO EL PRIMERO DE LA LISTA
          await DBProvider.instance.nuevoDatosPersona(objInsert);
    }
    return this.lstPolizaModel;
  }
  limpiarCamposForm (){
    this.txtNroDocumentoController.text="";
    this.txtExtensionController.text = "";
    this.txtComplementoController.text="";
    this.txtFechaNacimientoController.text = "";
  }
}