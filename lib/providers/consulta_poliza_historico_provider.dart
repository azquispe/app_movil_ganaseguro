import 'package:app_movil_ganaseguros/bd/db_provider.dart';
import 'package:flutter/material.dart';

import '../models/datos_persona_model.dart';

class ConsultaPolizaHistoricoProvider with ChangeNotifier {

  // GET AND SET
  List<DatosPersonasModel> _datosPersonasModel = [];
  List<DatosPersonasModel> get lstDatosPersonasModel => this._datosPersonasModel;
  set lstDatosPersonasModel(List<DatosPersonasModel> lstDatosPersonas) {
    this._datosPersonasModel = lstDatosPersonas;
    notifyListeners();
  }
  // ===========================

  Future<List<DatosPersonasModel>> obtenerTodosDatosPersonas() async {
    lstDatosPersonasModel =  await DBProvider.instance.obtenerTodosDatosPersonas();
    return lstDatosPersonasModel;
  }
  Future<void> eliminarDatosPersonas(BuildContext context, pDatosPersonaId) async {
    await DBProvider.instance.eliminarDatosPersonas(pDatosPersonaId);
    await this.obtenerTodosDatosPersonas();
  }

}
