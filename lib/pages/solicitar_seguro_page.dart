import 'package:app_movil_ganaseguros/models/solicitud_seguro_model.dart';
import 'package:app_movil_ganaseguros/providers/solicita_seguro_provider.dart';
import 'package:app_movil_ganaseguros/services/consulta_poliza_service.dart';
import 'package:app_movil_ganaseguros/widgets/custom_bottom_navigator_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;
import 'package:app_movil_ganaseguros/utils/constantes.dart' as constantes;
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class SolicitarSeguroPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final solicitaSeguroProvider = Provider.of<SolicitaSeguroProvider>(context);
    final _formKey = GlobalKey<FormState>();

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
          children: <Widget>[
            Text(
                textAlign: TextAlign.center,
                'Solicita tu Seguro',
                //style: Estilos.stlTextoTitulo(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 10,
            ),
            Card(
                /*shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: colores.sec_verde_oscuro,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),*/
                elevation: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(

                        controller: solicitaSeguroProvider.txtNombreController,

                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.trim() == "") {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                        style:Theme.of(context).textTheme.bodyText1,
                        decoration:  InputDecoration(

                            labelStyle: Theme.of(context).textTheme.bodyText1,
                            labelText: 'Nombre(s)',
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colores.pri_verde_claro, width: 2))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller:
                            solicitaSeguroProvider.txtApellidoController,

                        keyboardType: TextInputType.text,
                        style:Theme.of(context).textTheme.bodyText1,
                        validator: (value) {
                          if (value == null || value.trim() == "") {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                        decoration:  InputDecoration(

                            labelStyle: Theme.of(context).textTheme.bodyText1,
                            labelText: 'Apellido(s)',
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colores.pri_verde_claro, width: 2))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: solicitaSeguroProvider.txtTelCelController,

                        keyboardType: TextInputType.number,
                        style:Theme.of(context).textTheme.bodyText1,
                        validator: (value) {
                          if (value == null || value.trim() == "") {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                        decoration:  InputDecoration(

                            labelStyle: Theme.of(context).textTheme.bodyText1,
                            labelText: 'Teléfono Celular',
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colores.pri_verde_claro, width: 2))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: solicitaSeguroProvider.txtCorreoController,

                        keyboardType: TextInputType.emailAddress,
                        style:Theme.of(context).textTheme.bodyText1,
                        decoration:  InputDecoration(

                            labelStyle: Theme.of(context).textTheme.bodyText1,
                            labelText: 'Correo',
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colores.pri_verde_claro, width: 2))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: solicitaSeguroProvider.txtCiudadController,

                        keyboardType: TextInputType.text,
                        style:Theme.of(context).textTheme.bodyText1,
                        validator: (value) {
                          if (value == null || value.trim() == "") {
                            return 'Campo requerido';
                          }
                          return null;
                        },
                        decoration:  InputDecoration(

                            labelStyle: Theme.of(context).textTheme.bodyText1,
                            labelText: 'Ciudad',
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colores.pri_verde_claro, width: 2))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            '¿Tienes algún seguro \n contratado con nosotros?',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Switch(
                              value: solicitaSeguroProvider
                                  .boolTieneSeguroConNosotros,
                              activeColor: colores.pri_verde_claro,
                              onChanged: (value) {
                                solicitaSeguroProvider
                                        .boolTieneSeguroConNosotros =
                                    !solicitaSeguroProvider
                                        .boolTieneSeguroConNosotros;
                              }),
                          Text(
                            solicitaSeguroProvider.boolTieneSeguroConNosotros
                                ? "SI"
                                : "NO",
                            //style: Estilos.stlTextoSubTitulo(),
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                          // cuando SELECCIONES SI, habilitra un campo donde ponga su seguro actual
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '¿Tienes algún seguro contratado \n con otra compañía de seguros?',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Switch(
                            // This bool value toggles the switch.
                            value:
                                solicitaSeguroProvider.boolTieneSeguroConOtros,
                            activeColor: colores.pri_verde_claro,
                            onChanged: (value) {
                              solicitaSeguroProvider.boolTieneSeguroConOtros =
                                  !solicitaSeguroProvider
                                      .boolTieneSeguroConOtros;
                            },
                          ),
                          Text(
                            solicitaSeguroProvider.boolTieneSeguroConOtros
                                ? "SI"
                                : "NO",
                            //style: Estilos.stlTextoSubTitulo(),
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                          // cuando SELECCIONES SI, habilitra un campo donde ponga su seguro actual
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller:
                            solicitaSeguroProvider.txtTipoSeguroController,

                        maxLines: 3,
                        keyboardType: TextInputType.text,
                        style:Theme.of(context).textTheme.bodyText1,
                        decoration:  InputDecoration(

                            labelStyle: Theme.of(context).textTheme.bodyText1,
                            labelText: '¿Que tipo de seguro te interesa?',
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: colores.pri_verde_claro, width: 2))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            // fromHeight use double.infinity as width and 40 is the height
                            elevation: 0,
                            backgroundColor:  colores.sec_verde_claro,


                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              bool res = await showDialog(
                                context: context,
                                builder: (context) => FutureProgressDialog(
                                    solicitaSeguroProvider
                                        .enviarSolicitudSeguro(),
                                    message: Text('Procesando...')),
                              );
                              if (res) {
                                await ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                        type: ArtSweetAlertType.success,
                                        title:
                                            "Su solicitud fue enviado",
                                        text: "En breve un especialista de GanaSeguros se comunicará contigo",
                                        confirmButtonText: "Aceptar",
                                        confirmButtonColor:
                                            colores.sec_negro_claro2));

                                limpiarFormulario(context);
                              } else {
                                await ArtSweetAlert.show(
                                    context: context,
                                    artDialogArgs: ArtDialogArgs(
                                        type: ArtSweetAlertType.danger,
                                        title: "No se pudo envair su Solicitud",
                                        confirmButtonText: "Aceptar",
                                        confirmButtonColor:
                                            colores.sec_negro_claro2));
                              }
                            }
                          },
                          child:  Text(
                            'Enviar Solicitud',
                            style: TextStyle(
                                color: colores.pri_blanco,
                                fontFamily: constantes.tipo_fuente_poppins,
                                fontSize: 17),
                          ))
                    ],
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigatorWidget(),
    );
  }

  void limpiarFormulario(BuildContext context) {
    final solicitaSeguroProvider =
        Provider.of<SolicitaSeguroProvider>(context, listen: false);
    solicitaSeguroProvider.txtNombreController.text = "";
    solicitaSeguroProvider.txtApellidoController.text = "";
    solicitaSeguroProvider.txtTelCelController.text = "";
    solicitaSeguroProvider.txtCorreoController.text = "";
    solicitaSeguroProvider.txtCiudadController.text = "";
    solicitaSeguroProvider.boolTieneSeguroConNosotros = false;
    solicitaSeguroProvider.boolTieneSeguroConOtros = false;
    solicitaSeguroProvider.txtTipoSeguroController.text = "";
  }
}
