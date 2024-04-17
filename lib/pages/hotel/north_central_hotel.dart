import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/translator.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/emergency.dart';

class NCentralPage extends StatefulWidget {
  const NCentralPage({Key? key}) : super(key: key);
  final String title = "Hotels in North Central";

  @override
  State<NCentralPage> createState() => _NCentralPageState();
}

class _NCentralPageState extends State<NCentralPage> {
  
  List<Map<String, dynamic>> _hotels = [
  {
    "id": 1,
    "name": "The Sanctuary at Tissawewa",
    "address": "35 Sangamitta Mawatha, Anuradhapura",
    "number": 252345678
  },
  {
    "id": 2,
    "name": "Ulagalla by Uga Escapes",
    "address": "Thirappane Rd, Thirappane",
    "number": 252345679
  },
  {
    "id": 3,
    "name": "Hotel Alakamanda",
    "address": "14, Church Road, Anuradhapura",
    "number": 252345680
  },
  {
    "id": 4,
    "name": "The Lakeside at Nuwarawewa",
    "address": "33/02 Stage II, New Town, Anuradhapura",
    "number": 252345681
  },
  {
    "id": 5,
    "name": "Egreen Lodge",
    "address": "28/A, Sangamitta Mawatha, Anuradhapura",
    "number": 252345682
  },
  {
    "id": 6,
    "name": "Hotel Shalini",
    "address": "209, Trincomalee Rd, Anuradhapura",
    "number": 252345683
  },
  {
    "id": 7,
    "name": "Hotel White House",
    "address": "No 276/4, Trincomalee Rd, Anuradhapura",
    "number": 252345684
  },
  {
    "id": 8,
    "name": "Hotel Randiya",
    "address": "Samagi Mawatha, Anuradhapura",
    "number": 252345685
  },
  {
    "id": 9,
    "name": "Rajarata Lodge",
    "address": "No 137, Trincomalee Rd, Anuradhapura",
    "number": 252345686
  },
  {
    "id": 10,
    "name": "Vista BnB Family Guest House",
    "address": "11/33, Stage 01, New Town, Anuradhapura",
    "number": 252345687
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