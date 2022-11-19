import 'package:app_movil_ganaseguros/utils/estilos.dart';
import 'package:flutter/material.dart';
import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;
import 'package:app_movil_ganaseguros/utils/constantes.dart' as constantes;
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(

      backgroundColor:colores.pri_blanco,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(context,
                    color: colores.pri_verde_claro, width: 0.5),
              ),
            ),
            child: Image(
                width: 200,
                height: 50,
                image: AssetImage( 'assets/img/logo_ganaseguros_400.png'
                    )),
          ),

          ListTile(
            leading: Icon(Icons.home_outlined),
            iconColor: colores.pri_verde_claro,
            title:  Text('Inicio ',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'inicio_page');
            },
          ),
          ListTile(
            leading: Icon(Icons.search_outlined),
            iconColor: colores.pri_verde_claro,
            title: Text('Consulta Pólizas',style: Theme.of(context).textTheme.bodyText1,),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'consulta_poliza_historico_page');
            },
          ),
          ListTile(
            leading: Icon(Icons.assured_workload),
            iconColor: colores.pri_verde_claro,
            title: Text('Solicitar Seguro',style: Theme.of(context).textTheme.bodyText1,),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'solicitar_seguro_page');
            },
          ),
          ListTile(
            leading: Icon(Icons.map_outlined),
            iconColor: colores.pri_verde_claro,
            title: Text('Encuentranos',style: Theme.of(context).textTheme.bodyText1,),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'encuentranos_page');
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            iconColor: colores.pri_verde_claro,
            title: Text('Nosotros',style: Theme.of(context).textTheme.bodyText1,),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'nosotros_page');
            },
          ),
          Divider(
            color: colores.pri_verde_claro,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: colores.pri_negro,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Respaldado por  GRUPO GANADERO',style: Theme.of(context).textTheme.overline,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
