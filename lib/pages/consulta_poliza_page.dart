import 'package:app_movil_ganaseguros/models/poliza_model.dart';
import 'package:app_movil_ganaseguros/bd/db_provider.dart';
import 'package:app_movil_ganaseguros/providers/consulta_poliza_historico_provider.dart';
import 'package:app_movil_ganaseguros/providers/consulta_poliza_provider.dart';
import 'package:app_movil_ganaseguros/services/consulta_poliza_service.dart';
import 'package:app_movil_ganaseguros/utils/estilos.dart';
import 'package:flutter/material.dart';
import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;
import 'package:app_movil_ganaseguros/utils/constantes.dart' as constantes;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_bottom_navigator_widget.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class ConsultaPolizaPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final consultaPolizaProvider = Provider.of<ConsultaPolizaProvider>(context);
    final _formKey = GlobalKey<FormState>();
    consultaPolizaProvider.limpiarCamposForm();

    return Scaffold(
      backgroundColor: colores.pri_blanco,
      appBar: AppBar(
        title: Image(
            width: 200,
            height: 50,
            image: AssetImage('assets/img/logo_ganaseguros_400.png')),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: colores.pri_verde_claro),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Consulta tu Póliza', textAlign: TextAlign.center,
              //style: Estilos.stlTextoTitulo()
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Ingresa y confirma los siguientes datos para visualizar Pólizas',
              textAlign: TextAlign.center,
              //style: Estilos.stlTextoSubTitulo()
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: consultaPolizaProvider.txtNroDocumentoController,
              maxLength: 100,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.trim() == "") {
                  return 'Campo requerido';
                }
                return null;
              },
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                  labelText: 'Nro de Identidad',
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  border: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: colores.pri_verde_claro, width: 2))),
            ),
            Row(
              children: [
                Flexible(
                  flex: 4,
                  child: TextFormField(
                    controller: consultaPolizaProvider.txtExtensionController,
                    maxLength: 100,
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                        labelText: "Extensión",
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: colores.pri_verde_claro, width: 2))),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  flex: 4,
                  child: TextFormField(
                    controller: consultaPolizaProvider.txtComplementoController,
                    maxLength: 100,
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).textTheme.bodyText1,
                    decoration: InputDecoration(
                        labelText: "Complemento",
                        labelStyle: Theme.of(context).textTheme.bodyText1,
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: colores.pri_verde_claro, width: 2))),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                readOnly: true,
                controller: consultaPolizaProvider.txtFechaNacimientoController,
                maxLength: 100,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.trim() == "") {
                    return 'Campo requerido';
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                    labelText: "Fecha de Nacimiento, formato (dd/mm/yyyy)",
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: colores.pri_verde_claro, width: 2))),
                onTap: () async {
                  DateTime? newdate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1980),
                      lastDate: DateTime.now());
                  if (newdate == null) return;
                  consultaPolizaProvider.txtFechaNacimientoController.text =
                      newdate.day.toString().padLeft(2, '0') +
                          "/" +
                          newdate.month.toString().padLeft(2, '0') +
                          "/" +
                          newdate.year.toString().padLeft(2, '0');
                  ;
                }),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                // fromHeight use double.infinity as width and 40 is the height
                elevation: 0,
                backgroundColor: colores.sec_verde_claro,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {

                  List<PolizaModel> ? lstPolizaModel = await showDialog(
                    context: context,
                    builder: (context) =>
                        FutureProgressDialog(consultaPolizaProvider.consultarPoliza() ,
                            message: Text(
                              'Procesando...',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: colores.sec_negro_claro2,
                                    letterSpacing: 0.3,
                                    //fontSize: 22,
                                    fontWeight: FontWeight.normal),
                              ),
                            )),
                  );
                  //List<PolizaModel>? lstPolizaModel = await consultarPoliza(context);
                  if (lstPolizaModel!=null && lstPolizaModel.length > 0) {
                    Navigator.of(context)
                        .pushNamed('lista_poliza_detalle_page');
                  } else {
                    ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.info,
                            text: "No se ha encontrado Póliza!",
                            confirmButtonText: "Aceptar",
                            confirmButtonColor: colores.sec_negro_claro2));
                  }
                  consultaPolizaProvider.limpiarCamposForm();
                }
              },
              child: Text(
                'Consultar Pólizas',
                style: TextStyle(
                    color: colores.pri_blanco,
                    fontFamily: constantes.tipo_fuente_poppins,
                    fontSize: 17),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigatorWidget(),
    );
  }




}
