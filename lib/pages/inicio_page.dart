import 'package:app_movil_ganaseguros/providers/consulta_poliza_provider.dart';
import 'package:app_movil_ganaseguros/utils/estilos.dart';
import 'package:app_movil_ganaseguros/widgets/custom_bottom_navigator_widget.dart';

import 'package:flutter/material.dart';
import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;
import 'package:app_movil_ganaseguros/utils/constantes.dart' as constantes;
import 'package:provider/provider.dart';

import '../widgets/card_inicio_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/slide_show_widget.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: colores.pri_blanco,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: colores.pri_verde_claro),
        elevation: 0,
        title: Container(
          alignment: Alignment.center,
          child:  Image(
              width: 200,
              height: 50,
              image:  AssetImage('assets/img/logo_ganaseguros_400.png')),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('En proceso')));
            },
          )
        ],
      ),
      /*body: Stack(
        children: [
          // Home Body
          _HomeBody()
        ],
      ),*/
      body:  _HomeBody()

      ,
      drawer: DrawerWidget(),
      bottomNavigationBar: CustomBottomNavigatorWidget(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Text(' un seguro al alcance de tu mano que te acompaña a todos lados'),
            const SizedBox(
              height: 10,
            ),

            Text('Nuestras Ofertas',
                style: Theme.of(context).textTheme.headline5),
            Card(
                elevation: 0,
                margin: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: colores.sec_verde_oscuro,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
                child: Container(  child:        SlideShowWidget(),)),

            const SizedBox(
              height: 10,
            ),
            // titulos

            Text('¿Que necesitas?',
                //style: Estilos.stlTextoTitulo()
                style: Theme.of(context).textTheme.headline5
            ),
            SizedBox(
              height: 5,
            ),
            CardInicioWidget(),
          ],
        ),
      ),
    );
  }
}
