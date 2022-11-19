import 'package:app_movil_ganaseguros/pages/consulta_poliza_historico_page.dart';
import 'package:app_movil_ganaseguros/pages/consulta_poliza_page.dart';
import 'package:app_movil_ganaseguros/pages/inicio_page.dart';
import 'package:app_movil_ganaseguros/pages/lista_poliza_detalle_page.dart';
import 'package:app_movil_ganaseguros/pages/nosotros_page.dart';
import 'package:app_movil_ganaseguros/pages/solicitar_seguro_page.dart';
import 'package:app_movil_ganaseguros/providers/solicita_seguro_provider.dart';
import 'package:app_movil_ganaseguros/providers/consulta_poliza_historico_provider.dart';
import 'package:app_movil_ganaseguros/providers/consulta_poliza_provider.dart';
import 'package:app_movil_ganaseguros/widgets/encuentranos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app_movil_ganaseguros/utils/colores.dart' as colores;

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ConsultaPolizaProvider()),
          ChangeNotifierProvider(create: (_) => ConsultaPolizaHistoricoProvider()),
          ChangeNotifierProvider(create: (_) => SolicitaSeguroProvider()),
          //ChangeNotifierProvider(create: (_) => ThemeProvider())
        ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''), // English, no country code
            const Locale('es', ''), // Spanish, no country code
          ],
          //initialRoute: 'inicio_page',
          routes: {
            'inicio_page': (_) => InicioPage(),
            'consulta_poliza_historico_page': (_) =>
                ConsultaPolizaHistoricoPage(),
            'consulta_poliza_page': (_) => ConsultaPolizaPage(),
            'lista_poliza_detalle_page': (_) => ListaPolizaDetallePage(),
            'solicitar_seguro_page': (_) => SolicitarSeguroPage(),
            'encuentranos_page': (_) => EncuentranosPage(),
            'nosotros_page': (_) => NosotrosPage(),
          },
          home:  AnimatedSplashScreen(

              duration: 3000,
              splash:  Column(
                children: [
                  Text("Bienvenido a:",style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color:  colores.pri_blanco,
                        letterSpacing: 0.3,
                        //fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
                  const Image(
                      width: 200,
                      height: 50,
                      image:  AssetImage('assets/img/logo_verde.jpg')),
                ],
              ),
              nextScreen: InicioPage(),

              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: colores.pri_verde_claro),
          theme: ThemeData(


            // Define el TextTheme por defecto. Usa esto para espicificar el estilo de texto por defecto
            // para cabeceras, títulos, cuerpos de texto, y más.
            textTheme: TextTheme(


            /*
            https://api.flutter.dev/flutter/material/TextTheme-class.html
            https://www.didierboelens.com/2020/05/material-textstyle-texttheme/
            NAME         SIZE  WEIGHT  SPACING
            headline1    96.0  light   -1.5
            headline2    60.0  light   -0.5
            headline3    48.0  regular  0.0
            headline4    34.0  regular  0.25
            headline5    24.0  regular  0.0
            headline6    20.0  medium   0.15
            subtitle1    16.0  regular  0.15
            subtitle2    14.0  medium   0.1
            body1        16.0  regular  0.5   (bodyText1)
            body2        14.0  regular  0.25  (bodyText2)
            button       14.0  medium   1.25
            caption      12.0  regular  0.4
            overline     10.0  regular  1.5
             */

              // PARA LOS TITULOS GRANDES
              headline5: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color:  colores.pri_verde_claro,
                    letterSpacing: 0.3,
                    //fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              // ============================

              // PARA LOS SUBTITULOS
              subtitle1: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: colores.sec_verde_oscuro,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.bold),
              ),
              subtitle2: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: colores.sec_verde_oscuro,
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.bold),
              ),
              // ================================

              // PARA TEXTOS
              bodyText1: GoogleFonts.poppins( // normal
                textStyle: TextStyle(
                    color: colores.pri_negro,
                    letterSpacing: 0.3,
                    //fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
              bodyText2: GoogleFonts.poppins( // negrilla
                textStyle: TextStyle(
                    color:colores.pri_negro,
                    letterSpacing: 0.3,
                    //fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              // ==============================


              // TEXTO PEQUEÑO

              overline: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color:  colores.sec_verde_petroleo,
                    letterSpacing: 0.3,
                    //fontSize: 22,
                    fontWeight: FontWeight.normal),
              ),
            ),
          )

      ),
    );
  }
}
