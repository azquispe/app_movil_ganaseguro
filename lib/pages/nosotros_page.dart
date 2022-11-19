import 'package:app_movil_ganaseguros/utils/estilos.dart';
import 'package:app_movil_ganaseguros/widgets/custom_bottom_navigator_widget.dart';
import 'package:flutter/material.dart';


import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;
import 'package:app_movil_ganaseguros/utils/constantes.dart' as constantes;
import 'package:provider/provider.dart';


class NosotrosPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

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
          child: Column(
        children: [
          Text('Sobre Nosotros',
              //style: Estilos.stlTextoTitulo()
              style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 10,),
          _crearMision(context),
          _crearVision(context),
        ],
      )),
      bottomNavigationBar: CustomBottomNavigatorWidget(),
    );
  }

  Widget _crearVision(BuildContext context) {
    return Card(
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
            children: [
              Text('Visión',
                //style: Estilos.stlTextoContenidoNegrilla(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ',
                //style: Estilos.stlTextoContenido(),
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ));
  }

  Widget _crearMision(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: colores.sec_verde_oscuro,
          ),
          borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        ),
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text('Misión',
                  //style: Estilos.stlTextoContenidoNegrilla(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ',
                //style: Estilos.stlTextoContenido(),
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ));
  }
}
