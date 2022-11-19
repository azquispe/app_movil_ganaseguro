import 'package:flutter/material.dart';
import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


class CustomBottomNavigatorWidget extends StatefulWidget {
  @override
  State<CustomBottomNavigatorWidget> createState() => _CustomBottomNavigatorWidgetState();
}

class _CustomBottomNavigatorWidgetState extends State<CustomBottomNavigatorWidget> {
  @override
  Widget build(BuildContext context) {



    return BottomNavigationBar(

        //showSelectedLabels: true,
        //showUnselectedLabels: true,

        selectedItemColor: colores.pri_negro,
        backgroundColor: Colors.transparent,
        unselectedItemColor:  colores.pri_negro,
        elevation: 0,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '',),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), label: '')
        ],
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    if(index==0){
      Navigator.pushNamed(context, 'inicio_page');
    }
    if(index==1){
      Navigator.pushNamed(context, 'consulta_poliza_historico_page');
    }
    if(index==2){
      _launchUrl("https://www.ganaseguros.com.bo");
    }

  }

  Future<void> _launchUrl(pUrl) async {
    if (!await launchUrl( Uri.parse(pUrl))) {
      throw 'Could not launch $pUrl';
    }
  }
}
