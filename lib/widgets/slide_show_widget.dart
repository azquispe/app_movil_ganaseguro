import 'package:flutter/material.dart';
import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:app_movil_ganaseguros/utils/estilos.dart';


class SlideShowWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorColor: colores.pri_verde_claro,
      onPageChanged: (value) {
        debugPrint('Page changed: $value');
      },
      autoPlayInterval: 4000,
      isLoop: true,
      height: 300,
      children: [

         Column(
           children: [
             Image.asset(
                'assets/slide/seguro_hogar.jpg',
                fit: BoxFit.fill,
              ),
             Text('Pensando para vos y tu familia',style: Theme.of(context).textTheme.subtitle1),
             Text('Obtené ahora tu plan y obtené grandes beneficios',style: Theme.of(context).textTheme.bodyText1)
           ],
         ),

        Column(
          children: [
            Container(
              height: 250,
              child: Image.asset(
                'assets/slide/familia.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Text('La tranquilidad que tu familia se merece',style: Theme.of(context).textTheme.subtitle1)


          ],
        ),

      ],
    );
  }
}




