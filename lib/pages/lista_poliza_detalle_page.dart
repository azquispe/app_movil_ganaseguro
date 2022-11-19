import 'package:app_movil_ganaseguros/models/poliza_model.dart';
import 'package:app_movil_ganaseguros/providers/consulta_poliza_provider.dart';
import 'package:app_movil_ganaseguros/utils/estilos.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;
import 'package:app_movil_ganaseguros/utils/constantes.dart' as constantes;
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import '../services/consulta_poliza_service.dart';
import '../widgets/custom_bottom_navigator_widget.dart';

class ListaPolizaDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final consultaPolizaProvider = Provider.of<ConsultaPolizaProvider>(context);



    return Scaffold(
      backgroundColor: colores.pri_blanco,
      appBar: AppBar(
        title:  Image(
            width: 200,
            height: 50,
            image: AssetImage('assets/img/logo_ganaseguros_400.png')),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: colores.pri_verde_claro),
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: consultaPolizaProvider.lstPolizaModel.length,
            itemBuilder: (BuildContext context, int index) {
              return _crearItemInformacionPolizas(
                  pPolizaModel: consultaPolizaProvider.lstPolizaModel[index], context:context );
            }),
      ),
      bottomNavigationBar: CustomBottomNavigatorWidget(),
    );
  }

  Widget _crearItemInformacionPolizas({required PolizaModel pPolizaModel, required BuildContext context}) {

    return Card(
        color: colores.pri_blanco,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: colores.sec_verde_oscuro,
          ),
          borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        ),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  //border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                  //color: colores.sec_verde_claro2
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          pPolizaModel.nombreProducto.toString(),
                          //style: Estilos.stlTextoSubTitulo(),
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Número:',
                          //style: Estilos.stlTextoSubTitulo(),
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          pPolizaModel.numeroOperacion.toString(),
                          //style: Estilos.stlTextoSubTitulo(),
                          style: Theme.of(context).textTheme.subtitle2,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: colores.sec_verde_oscuro,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Nombre Asegurado:',
                //style: Estilos.stlTextoContenidoNegrilla(),
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.left,
              ),
              Text(
                pPolizaModel.nombreAsegurado.toString(),
                //style: Estilos.stlTextoContenido(),
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.left,
              ),
              Text(
                'Nombre Tomador:',
                //style: Estilos.stlTextoContenidoNegrilla(),
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.left,
              ),
              Text(
                pPolizaModel.nombreTomador.toString(),
                //style: Estilos.stlTextoContenido(),
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Beneficiarios:',
                //style: Estilos.stlTextoContenidoNegrilla(),
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.left,
              ),
              Text(
                pPolizaModel.lstBeneficiarios.toString(),
                //style: Estilos.stlTextoContenido(),
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                      flex: 6,
                      child: Text(
                        'Número Operación:',
                        //style: Estilos.stlTextoContenidoNegrilla(),
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                      flex: 6,
                      child: Text(
                        pPolizaModel.numeroOperacion.toString(),
                        //style: Estilos.stlTextoContenido(),
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      flex: 6,
                      child: Text(
                        'Nombre de la Póliza:',
                        //style: Estilos.stlTextoContenidoNegrilla(),
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 6,
                      child: Text(
                        pPolizaModel.nombrePoliza.toString(),
                        //style: Estilos.stlTextoContenido(),
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      flex: 6,
                      child: Text(
                        'Fecha Inicio:',
                        //style: Estilos.stlTextoContenidoNegrilla(),
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 6,
                      child: Text(
                        pPolizaModel.fechaInicio.toString(),
                        //style: Estilos.stlTextoContenido(),
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      flex: 6,
                      child: Text(
                        'Fecha Fin:',
                        //style: Estilos.stlTextoContenidoNegrilla(),
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 6,
                      child: Text(
                        pPolizaModel.fechaFin.toString(),
                        //style: Estilos.stlTextoContenido(),
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      flex: 6,
                      child: Text(
                        'Tipo de Producto:',
                        //style: Estilos.stlTextoContenidoNegrilla(),
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 6,
                      child: Text(
                        pPolizaModel.tipoProducto.toString(),
                        //style: Estilos.stlTextoContenido(),
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      flex: 6,
                      child: Text(
                        'Frecuencia de Pago:',
                        //style: Estilos.stlTextoContenidoNegrilla(),
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 6,
                      child: Text(
                        pPolizaModel.frecuencia.toString(),
                        //style: Estilos.stlTextoContenido(),
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      flex: 10,
                      child: Text(
                        'Monto de Prima:',
                        //style: Estilos.stlTextoContenidoNegrilla(),
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      flex: 6,
                      child: Text(
                        pPolizaModel.montoPrima.toString(),
                        //style: Estilos.stlTextoContenido(),
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      flex: 6,
                      child: Text(
                        'Precio:',
                        //style: Estilos.stlTextoContenidoNegrilla(),
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      flex: 6,
                      child: Text(
                        pPolizaModel.precio.toString(),
                        //style: Estilos.stlTextoContenido(),
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      )),
                ],
              ),
              Divider(
                color: colores.sec_verde_oscuro,
              ),
              Row(
                children: [
                 /* Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          //border: Border.all(),
                          //borderRadius: BorderRadius.circular(20.0),
                          //color: colores.sec_verde_claro2
                          ),
                      child: Text(
                        'Vigente',
                        //style: Estilos.stlTextoContenidoPequeno_VerdePetroleo(),
                      )),*/
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    'Descargar Póliza',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.file_download,
                      color: colores.sec_verde_petroleo,
                    ),
                    onPressed: () async  {

                      ConsultaPolizasService consultaPolizaService = new ConsultaPolizasService();
                      String? path = await showDialog(
                        context: context,
                        builder: (context) =>
                            FutureProgressDialog(consultaPolizaService.descargarPoliza(pPolizaModel.polizaId.toString()), message: Text('Descargando...')),
                      );

                      if(path!=null && path!.trim()!=""){
                        OpenFile.open(path);
                      }else{

                        ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                                barrierColor: colores.pri_negro,
                                type: ArtSweetAlertType.danger,
                                title: "No se ha encontrado adjunto de Póliza",
                                confirmButtonText: "Aceptar",
                                confirmButtonColor: colores.sec_negro_claro2
                            )
                        );

                      }

                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }


}
