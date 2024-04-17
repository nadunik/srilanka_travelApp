import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/translator.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/emergency.dart';

class CentralPage extends StatefulWidget {
  const CentralPage({Key? key}) : super(key: key);
  final String title = "Hotels in Central";

  @override
  State<CentralPage> createState() => _CentralPageState();
}

class _CentralPageState extends State<CentralPage> {
  
  List<Map<String, dynamic>> _hotels = [
  {
    "id": 1,
    "name": "Grand Hotel Nuwara Eliya",
    "address": "Grand Hotel Rd, Nuwara Eliya",
    "number": 522222222
  },
  {
    "id": 2,
    "name": "Jetwing St. Andrew's",
    "address": "No 10 St. Andrew's Drive, Nuwara Eliya",
    "number": 522234567
  },
  {
    "id": 3,
    "name": "Heritance Tea Factory",
    "address": "Kandapola, Nuwara Eliya",
    "number": 522223344
  },
  {
    "id": 4,
    "name": "Araliya Green City Hotel",
    "address": "No 10, Gregory's Rd, Nuwara Eliya",
    "number": 522235678
  },
  {
    "id": 5,
    "name": "Langdale by Amaya",
    "address": "Radella, Nuwara Eliya",
    "number": 522234321
  },
  {
    "id": 6,
    "name": "Heaven Seven Hotel Nuwara Eliya",
    "address": "22/1, General's Road, Nuwara Eliya",
    "number": 522235432
  },
  {
    "id": 7,
    "name": "The Blackpool Hotel Nuwara Eliya",
    "address": "Blackpool, Nuwara Eliya",
    "number": 522237654
  },
  {
    "id": 8,
    "name": "Tea Bush Hotel",
    "address": "No. 50 Park Rd, Nuwara Eliya",
    "number": 522239876
  },
  {
    "id": 9,
    "name": "Heaven Seven Hotels",
    "address": "No 3, Wedderburn Road, Nuwara Eliya",
    "number": 522231234
  },
  {
    "id": 10,
    "name": "The Grand Indian",
    "address": "Lover's Leap, Nuwara Eliya",
    "number": 522239999
  }
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
