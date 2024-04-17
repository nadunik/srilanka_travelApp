//import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/widgets/app_bold_text.dart';
import 'package:srilankatravel_app/widgets/app_text.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/translator.dart';
import 'package:srilankatravel_app/pages/nav_pages/emergency.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "assets/images/hotel.png": "Hotels",
    "assets/images/hospitals.jpeg": "Hospitals",
    "assets/images/police.jpeg": "Police",
  };
  List destinations = [
      "assets/images/mountain.jpeg",
      "assets/images/historical.jpeg",
      "assets/images/beach.jpeg",
      "assets/images/religious.jpeg",
      "assets/images/lakes.jpeg",
      "assets/images/waterfalls.jpeg"
  ];
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
    /*return BlocBuilder<AppCubits, CubitStates>(builder: (contex, state){
      if(state is LoadedState){
        var info = state.places;*/
     
    TabController _tabController =
        TabController(length: 2, vsync: this, initialIndex: 0);
    return Scaffold(
      //body: pages[currentIndex],
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

      body: /*BlocBuilder<AppCubits, CubitStates>(
          builder: (context, state){
            if(state is LoadedState){
              var info = state.places;
              return*/ Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: [
                  Icon(Icons.menu, size: 30, color: Colors.black54),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 51, 167, 180).withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppBoldText(text: "Explore"),
            ),
            SizedBox(height: 20),
            //tabbar
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator:
                        CircleTabIndicator(color: Colors.indigo, radius: 4),
                    tabs: [
                      Tab(text: "Destinations"),
                      //Tab(text: "Near You "),
                    ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: destinations.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                              onTap: (){
                                String route='/destination$index';
                                Navigator.pushNamed(context, route);
                              },
        
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                     destinations[index]),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    },
                  ),
                  /*ListView.builder(
                    itemCount: info.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/maligawa.jpeg"),
                                fit: BoxFit.cover)),
        
                         );
                      
                    },
                  ),*/
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBoldText(text: "Explore More", size: 22),
                    //AppText(text: "see all", color: Colors.blueGrey,)
                  ]),
            ),
            SizedBox(height: 10),
            Container(
              height: 120,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap:() {
                        Navigator.pushNamed(context, '/explore$index');
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  //margin: const EdgeInsets.only(right: 50),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              images.keys.elementAt(index)),
                                          fit: BoxFit.cover)),
                                ),
                              
                              SizedBox(height: 10),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: Colors.blueGrey,
                                ),
                              )
                            ],
                          )),
                    );
                  }),
            
            )
          ],
        ));
            //}else{
              //return Container();
            }
            
          }
    

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChaneged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}