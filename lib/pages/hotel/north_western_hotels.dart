import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/translator.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/emergency.dart';

class NWesternPage extends StatefulWidget {
  const NWesternPage({Key? key}) : super(key: key);
  final String title = "Hotels in North Western";

  @override
  State<NWesternPage> createState() => _NWesternPageState();
}

class _NWesternPageState extends State<NWesternPage> {
  
  List<Map<String, dynamic>> _hotels = [
  {
    "id": 1,
    "name": "Jetwing Beach",
    "address": "Porutota Rd, Negombo",
    "number": 312345678
  },
  {
    "id": 2,
    "name": "Jetwing Blue",
    "address": "Ethukala, Negombo",
    "number": 312345679
  },
  {
    "id": 3,
    "name": "Heritance Negombo",
    "address": "175, Poruthota Road, Negombo",
    "number": 312345680
  },
  {
    "id": 4,
    "name": "Amagi Beach Negombo",
    "address": "76, Poruthota Road, Negombo",
    "number": 312345681
  },
  {
    "id": 5,
    "name": "The Beach - All Suite Hotel",
    "address": "Nirmala Fernando Mawatha, Ethukala, Negombo",
    "number": 312345682
  },
  {
    "id": 6,
    "name": "Goldi Sands Hotel",
    "address": "Ethukala, Negombo",
    "number": 312345683
  },
  {
    "id": 7,
    "name": "Club Hotel Dolphin",
    "address": "Kammala South, Waikkal",
    "number": 312345684
  },
  {
    "id": 8,
    "name": "Jetwing Lagoon",
    "address": "Pamunugama Rd, Thalahena, Negombo",
    "number": 312345685
  },
  {
    "id": 9,
    "name": "St. Lachlan Hotel & Suites",
    "address": "No. 22 Lewis Place, Negombo",
    "number": 312345686
  },
  {
    "id": 10,
    "name": "Camelot Beach Hotel",
    "address": "Lewis Place, Negombo",
    "number": 312345687
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