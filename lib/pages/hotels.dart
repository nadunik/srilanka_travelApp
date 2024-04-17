import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srilankatravel_app/pages/hotel/central_hotel.dart';
import 'package:srilankatravel_app/pages/hotel/estern_hotels.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/hotel/north_central_hotel.dart';
import 'package:srilankatravel_app/pages/hotel/north_western_hotels.dart';
import 'package:srilankatravel_app/pages/hotel/nothern_hotel.dart';
import 'package:srilankatravel_app/pages/hotel/sabara_hotel.dart';
import 'package:srilankatravel_app/pages/hotel/southern_hotel.dart';
import 'package:srilankatravel_app/pages/hotel/uva_hotel.dart';
import 'package:srilankatravel_app/pages/nav_pages/emergency.dart';
import 'package:srilankatravel_app/pages/nav_pages/my_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/translator.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/hotel/western_hotels.dart';
import 'package:srilankatravel_app/widgets/myCard.dart';


class HotelPage extends StatefulWidget {
  const HotelPage({super.key});
  final String title = "Hotels & Restaurants";

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {

     List pages = [
    const HomePage(),
    const TranslatorPage(),
    const MapPage(),
    const EmergencyPage()
  ];
  int currentIndex=0;
  void onTap(int index){
     setState(() {
       currentIndex = index;
     });
     Navigator.push(context, MaterialPageRoute(builder: (context) =>pages[index]));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.translate), label: 'tanslator'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.emergency), label: 'emergency'),
        ]
        ),
      appBar: AppBar(
        //crossAxisAlignment: CrossAxisAlignment.start;
        title: Text(widget.title),centerTitle: true,
        backgroundColor: Color.fromARGB(255, 126, 124, 124),
        ),
      

       body: SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            MyCard(
              backgroundImage: 'assets/images/western.jpeg',
              cardText: 'Hotels in Western Province',
              destinationPage: WesternPage(),
            ),
            SizedBox(height: 20),
            MyCard(
              backgroundImage: 'assets/images/eastern.jpeg',
              cardText: 'Hotels in Eastern Province',
              destinationPage: EasternPage(),
            ),
            SizedBox(height: 20),
            MyCard(
              backgroundImage: 'assets/images/northcentral.jpeg',
              cardText: 'Hotels in North Central Province',
              destinationPage: NCentralPage(),
            ),SizedBox(height: 20),
            MyCard(
              backgroundImage: 'assets/images/southern.jpeg',
              cardText: 'Hotels in Southern Province',
              destinationPage: SouthernPage(),
            ),SizedBox(height: 20),
            MyCard(
              backgroundImage: 'assets/images/northwestern.jpeg',
              cardText: 'Hotels in North Western Province',
              destinationPage: NWesternPage(),
            ),SizedBox(height: 20),
            MyCard(
              backgroundImage: 'assets/images/central.jpeg',
              cardText: 'Hotels in Central Province',
              destinationPage: CentralPage(),
            ),SizedBox(height: 20),
            MyCard(
              backgroundImage: 'assets/images/nothern.jpeg',
              cardText: 'Hotels in Nothern Province',
              destinationPage: NothernPage(),
            ),SizedBox(height: 20),
            MyCard(
              backgroundImage: 'assets/images/uva.jpeg',
              cardText: 'Hotels in Uva Province',
              destinationPage: UvaPage(),
            ),SizedBox(height: 20),
            MyCard(
              backgroundImage: 'assets/images/sabara.jpeg',
              cardText: 'Hotels in Sabaragamuwa Province',
              destinationPage: SabaraPage(),
            ),
            
          ],
               ),
       ),
    );
  }
}
