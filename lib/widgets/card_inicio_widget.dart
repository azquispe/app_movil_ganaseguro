import 'package:app_movil_ganaseguros/utils/estilos.dart';
import 'package:flutter/material.dart';
import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class CardInicioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children:  [
        TableRow(children: [
          _SingleCard(
              pathImg: "assets/img/ganaSeguros_banner1.jpg",
              color: colores.sec_negro_claro1,
              text: 'Consultar Póliza',
              pageName: 'consulta_poliza_historico_page'),
          _SingleCard(
              pathImg: "assets/img/ganaSeguros_banner2.jpg",
              color: colores.sec_negro_claro1,
              text: 'Solicitar Seguro',
              pageName: 'solicitar_seguro_page'),

        ]),

      ],
    );
  }
}

class _SingleCard extends StatelessWidget {

  final String pathImg;
  final Color color;
  final String text;
  final String pageName;

  const _SingleCard(
      {required this.pathImg,
      required this.color,
      required this.text,
      required this.pageName});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

        onTap: () {
          Navigator.of(context).pushNamed(this.pageName);
        },

    child: Card(
      elevation:0,
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: colores.sec_verde_oscuro,
        ),
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(this.pathImg,width: 110),
            const SizedBox(height: 10,),
            Text( text,
              //style: Estilos.stlTextoContenido(),
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,)
          ],
        ),
      ),
    ));
  }
  Future<void> _launchUrl(pUrl) async {
    if (!await launchUrl( Uri.parse(pUrl))) {
      throw 'Could not launch $pUrl';
    }
  }
}
