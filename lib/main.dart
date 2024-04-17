import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/hospitals.dart';
import 'package:srilankatravel_app/pages/detail/adamspeak.dart';
import 'package:srilankatravel_app/pages/detail/arugam.dart';
import 'package:srilankatravel_app/pages/detail/babarakanda.dart';
import 'package:srilankatravel_app/pages/detail/bentota.dart';
import 'package:srilankatravel_app/pages/detail/detail_galvihara.dart';
import 'package:srilankatravel_app/pages/detail/devon.dart';
import 'package:srilankatravel_app/pages/detail/diyaluma.dart';
import 'package:srilankatravel_app/pages/detail/galleport.dart';
import 'package:srilankatravel_app/pages/detail/gedige.dart';
import 'package:srilankatravel_app/pages/detail/girithale.dart';
import 'package:srilankatravel_app/pages/detail/greatewestern.dart';
import 'package:srilankatravel_app/pages/detail/hikkaduwa.dart';
import 'package:srilankatravel_app/pages/detail/kalaWewa.dart';
import 'package:srilankatravel_app/pages/detail/kandalama.dart';
import 'package:srilankatravel_app/pages/detail/kirigal.dart';
import 'package:srilankatravel_app/pages/detail/knuckles.dart';
import 'package:srilankatravel_app/pages/detail/maligawa.dart';
import 'package:srilankatravel_app/pages/detail/mirissa.dart';
import 'package:srilankatravel_app/pages/detail/nallur.dart';
import 'package:srilankatravel_app/pages/detail/parakrama.dart';
import 'package:srilankatravel_app/pages/detail/pettahMusjid.dart';
import 'package:srilankatravel_app/pages/detail/polonnaruwa.dart';
import 'package:srilankatravel_app/pages/detail/ravana.dart';
import 'package:srilankatravel_app/pages/detail/ruwanweli.dart';
import 'package:srilankatravel_app/pages/detail/sigiriya.dart';
import 'package:srilankatravel_app/pages/detail/stclairs.dart';
import 'package:srilankatravel_app/pages/detail/thisa.dart';
import 'package:srilankatravel_app/pages/detail/unawatuna.dart';
import 'package:srilankatravel_app/pages/detail/yapahuwa.dart';
//import 'package:srilankatravel_app/widgets/app_bold_text.dart';
//import 'package:srilankatravel_app/widgets/app_text.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/hotels.dart';
import 'package:srilankatravel_app/pages/mountain_page.dart';
import 'package:srilankatravel_app/pages/lakes.dart';
import 'package:srilankatravel_app/pages/beaches.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/religiousPage.dart';
import 'package:srilankatravel_app/pages/historicalPage.dart';
import 'package:srilankatravel_app/pages/detail_page.dart';
import 'package:srilankatravel_app/pages/waterfalls.dart';
import 'package:srilankatravel_app/pages/welcome_page.dart';
import 'package:srilankatravel_app/police.dart';


void main() {
  runApp(const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

    @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Default route to the Welcome Page
      routes: {
        '/': (context) => WelcomePage(), // Welcome Page
        '/home': (context) => HomePage(), // Home Page
        '/destination0': (context) => MountainPage(), // Mountain Page
        '/detail': (context) => DetailPage(),
        '/destination1':(context) => HistoricalPage(),
        '/destination3':(context) => ReligiousPage(),
        '/destination2':(context) => BeachPage(),
        '/destination5':(context) => WaterfallPage(),
        '/destination4':(context) => LakesPage(),
        '/explore0':(context) => HotelPage(),
        '/explore2' :(context) => PolicePage(),
        '/explore1' : (context) => HospitalPage(),
        '/mountain0':(context) => DetailPage(),
        '/mountain1':(context) => AdamsPeakPage(),
        '/mountain2':(context) => KirigalpottaPage(),
        '/mountain3':(context) => KnucklesPage(),
        '/mountain4':(context) => GWesternPage(),
        '/history0':(context) => GedigePage(),
        '/history1':(context) => SigiriyaPage(),
        '/history2':(context) => GallePortPage(),
        '/history3':(context) => PolonnaruwaPage(),
        '/history4':(context) => YapahuwaPage(),
        '/beach0':(context) => ArugamBayPage(),
        '/beach1':(context) => MirissaPage(),
        '/beach2':(context) => BentotaPage(),
        '/beach3':(context) => HikkaduwaPage(),
        '/beach4':(context) => UnawatunaPage(),
        '/reli0':(context) => GalViharaPage(),
        '/reli1':(context) => RuwanwelisayaPage(),
        '/reli2':(context) => MaligawaPage(),
        '/reli3':(context) => MusjidPage(),
        '/reli4':(context) => NallurPage(),
        '/lake0':(context) => KalaWewaPage(),
        '/lake1':(context) => KandalamaPage(),
        '/lake2':(context) => GirithalePage(),
        '/lake3':(context) => ParakramaPage(),
        '/lake4':(context) => ThisaPage(),
        '/water0':(context) => DevonPage(),
        '/water1':(context) => BabarakandaPage(),
        '/water2':(context) => RavanaPage(),
        '/water3':(context) => DiyalumaPage(),
        '/water4':(context) => StclairsPage(),



      },);
  }

  }
