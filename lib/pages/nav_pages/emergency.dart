import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/translator.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({Key? key}) : super(key: key);
  final String title = "Emergency Contacts";

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  
  List<Map<String, dynamic>> _emergencyContacts = [
    {"id":1, "name":"Police Emergency Service", "number": 119/118},
    {"id":2, "name":"Ambulance/Fire & Rescue", "number": 110},
    {"id":3, "name":"Tourist Police", "number": 0112421052},
    {"id":4, "name":"Police Emergency", "number": 0112433333},
    {"id":5, "name":"Goverment Information Center", "number": 1919},
    {"id":6, "name":"Emergency Police Mobile Squad", "number": 0115717171},
    {"id":7, "name":"Fire & Ambulance Service", "number": 0112422222},
    {"id":8, "name":"Suwa Seriya Ambulance Service", "number": 1990},
    {"id":9, "name":"Bomb Disposal", "number": 0112433335},
    {"id":10, "name":"United States Embassy", "number": 0112498500},
    {"id":11, "name":"China Embassy", "number": 0112688610},
    {"id":12, "name":"Japan Embassy", "number": 0112693831},
    {"id":13, "name":"Embassy of the State Of Kuwait", "number": 0112597958},
    {"id":14, "name":"Embassy of Germany", "number": 0112580431},
    {"id":15, "name":"Embassy of Saudi Arabia", "number": 0112682089},
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

  List<Map<String, dynamic>> _foundContacts = [];
  @override
  void initState() {
    _foundContacts = _emergencyContacts;
    super.initState();
  }

  void _runFilter(String enterKeyword){
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty){
      results = _emergencyContacts;
    }else{
      results= _emergencyContacts
           .where((contact) =>
               contact["name"].toLowerCase().contains(enterKeyword.toLowerCase()))
               .toList();
    }
  
  setState((){
    _foundContacts = results;
  });
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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)
                ),
              ),
            const SizedBox(
                height: 20,
              ),
              
              Expanded(
                child: ListView.builder(
                  itemCount:_foundContacts.length,
                  itemBuilder: (context, index) => Card(
                    key: ValueKey(_foundContacts[index]["id"]),
                    color: Color.fromARGB(255, 51, 151, 179),
                    //radius: Radius(10),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                     leading: Text(
                      _emergencyContacts[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                     ), 
                     title: Text(_foundContacts[index]["name"],
                     style: TextStyle(color: Colors.white),
                     ),
                     subtitle: Text('${_foundContacts[index]["number"].toString()}',
                     style: TextStyle(color: Colors.white),
                     ),
                
                    ), 
                    ),
                    ),
              ),
            ],
          ),
        ));
  }
}