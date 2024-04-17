import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/translator.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/emergency.dart';

class EasternPage extends StatefulWidget {
  const EasternPage({Key? key}) : super(key: key);
  final String title = "Hotels in Eastern";

  @override
  State<EasternPage> createState() => _EasternPageState();
}

class _EasternPageState extends State<EasternPage> {
  
  List<Map<String, dynamic>> _hotels = [
  {
    "id": 1,
    "name": "Amethyst Resort",
    "address": "No 2, Oluvil Harbour Road, Oluvil",
    "number": 632345678
  },
  {
    "id": 2,
    "name": "Uga Bay by Uga Escapes",
    "address": "Coconut Road, Passekudah",
    "number": 632345679
  },
  {
    "id": 3,
    "name": "Maalu Maalu Resort & Spa",
    "address": "19 Passekudah Rd, Kalkudah",
    "number": 632345680
  },
  {
    "id": 4,
    "name": "Amaya Beach Passikudah",
    "address": "10th Mile Post, Passikudah",
    "number": 632345681
  },
  {
    "id": 5,
    "name": "Anilana Pasikuda",
    "address": "Coconut Board Road, Pasikuda",
    "number": 632345682
  },
  {
    "id": 6,
    "name": "Sun Aqua Pasikudah",
    "address": "Coconut Board Rd, Pasikuda",
    "number": 632345683
  },
  {
    "id": 7,
    "name": "Amora Lagoon",
    "address": "298 Pethiyagoda Rd, Maradankadawala",
    "number": 632345684
  },
  {
    "id": 8,
    "name": "Sea Lotus Park Hotel",
    "address": "B 344 Road, Batticaloa",
    "number": 632345685
  },
  {
    "id": 9,
    "name": "Rivi Ras Hotel",
    "address": "98 Pethiyagoda Rd, Maradankadawala",
    "number": 632345686
  },
  {
    "id": 10,
    "name": "Hotel de le Ocean",
    "address": "2-4 Alles Garden, Batticaloa",
    "number": 632345687
  }
]
;

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
    _foundContacts = _hotels;
    super.initState();
  }

  void _runFilter(String enterKeyword){
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty){
      results = _hotels;
    }else{
      results= _hotels
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
                      _hotels[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                     ), 
                     title: Text(_foundContacts[index]["name"],
                     style: TextStyle(color: Colors.white),
                     ),
                     subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(_foundContacts[index]["address"],
                         style: TextStyle(color: Colors.white)),
                         Text('${_foundContacts[index]["number"].toString()}',
                         style: TextStyle(color: Colors.white),)
                       ],
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