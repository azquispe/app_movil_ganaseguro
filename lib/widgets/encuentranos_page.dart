import 'dart:ffi';

import 'package:flutter/material.dart';


import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;
import 'package:app_movil_ganaseguros/utils/constantes.dart' as constantes;
import 'package:url_launcher/url_launcher.dart';

import '../utils/estilos.dart';
import 'custom_bottom_navigator_widget.dart';

class EncuentranosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colores.pri_blanco,
      appBar: AppBar(
        title: const Image(
            width: 200,
            height: 50,
            image: AssetImage('assets/img/logo_ganaseguros_400.png')),
        backgroundColor: colores.pri_blanco,
        iconTheme: const IconThemeData(color: colores.pri_verde_claro),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Nuestras Oficinas",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: colores.sec_verde_oscuro,
                ),
                borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
              ),
              elevation: 0.5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Oficina Central - SANTA CRUZ',
                      style: Theme.of(context).textTheme.bodyText1,),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Dirección:',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "3er anillo interno Nº 1050, entre calles Sandía y Buena Vista, frente al Mercado Mutualista ",
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Horario de Atención:',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Lunes a Viernes 07:00 am a 09:00 pm ",
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Línea Gratuita:',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "800-10-39-99",
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Sitio Web",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {_launchUrl("https://www.ganaseguros.com.bo");},
              child:  Text('https://www.ganaseguros.com.bo',style: Theme.of(context).textTheme.bodyText1,),
            ),
          /*GestureDetector(
              child: Text(
                "https://www.ganaseguros.com.bo",
                textAlign: TextAlign.center,
                style: estiloTexto.stlTextoContenido,
              ),
              onTap: () => {
                _launchUrl("https://www.ganaseguros.com.bo")
              }
            ),*/
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigatorWidget(),
    );
  }
  Future<void> _launchUrl(pUrl) async {
    if (!await launchUrl( Uri.parse(pUrl))) {
      throw 'Could not launch $pUrl';
    }
  }
}
