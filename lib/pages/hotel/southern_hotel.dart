import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/translator.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/emergency.dart';

class SouthernPage extends StatefulWidget {
  const SouthernPage({Key? key}) : super(key: key);
  final String title = "Hotels in Southern";

  @override
  State<SouthernPage> createState() => _SouthernPageState();
}

class _SouthernPageState extends State<SouthernPage> {
  
  List<Map<String, dynamic>> _hotels = [
  {
    "id": 1,
    "name": "Anantara Peace Haven Tangalle Resort",
    "address": "Goyambokka Estate, Tangalle",
    "number": 472345678
  },
  {
    "id": 2,
    "name": "Cape Weligama",
    "address": "Abimanagama Rd, Weligama",
    "number": 412345678
  },
  {
    "id": 3,
    "name": "Shangri-La's Hambantota Golf Resort & Spa",
    "address": "Chithragala, Ambalantota",
    "number": 472233344
  },
  {
    "id": 4,
    "name": "Jetwing Lighthouse",
    "address": "Dadella, Galle",
    "number": 912345678
  },
  {
    "id": 5,
    "name": "The Fortress Resort & Spa",
    "address": "Koggala, Galle",
    "number": 912345679
  },
  {
    "id": 6,
    "name": "Amari Galle",
    "address": "523 Colombo Rd, Galle",
    "number": 912345680
  },
  {
    "id": 7,
    "name": "The Surf Hotel Bentota",
    "address": "Arungambay Rd, Bentota",
    "number": 712345678
  },
  {
    "id": 8,
    "name": "Centara Ceysands Resort & Spa",
    "address": "Aluthgama, Bentota",
    "number": 712345679
  },
  {
    "id": 9,
    "name": "Cinnamon Bey Beruwala",
    "address": "Moragalla, Beruwala",
    "number": 712345680
  },
  {
    "id": 10,
    "name": "Heritance Ahungalla",
    "address": "Galle Rd, Ahungalla",
    "number": 712345681
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