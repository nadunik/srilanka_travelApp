import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/translator.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/emergency.dart';

class WesternPage extends StatefulWidget {
  const WesternPage({Key? key}) : super(key: key);
  final String title = "Hotels in Western";

  @override
  State<WesternPage> createState() => _WesternPageState();
}

class _WesternPageState extends State<WesternPage> {
  
  List<Map<String, dynamic>> _hotels = [
  {
    "id": 1,
    "name": "Shangri-La Hotel, Colombo",
    "address": "1 Galle Face, Colombo 2",
    "number": 112123123
  },
  {
    "id": 2,
    "name": "Cinnamon Grand Colombo",
    "address": "77 Galle Rd, Colombo 3",
    "number": 112743743
  },
  {
    "id": 3,
    "name": "Taj Samudra Colombo",
    "address": "25 Galle Face Center Rd, Colombo 3",
    "number": 112446446
  },
  {
    "id": 4,
    "name": "The Kingsbury Colombo",
    "address": "48 Janadhipathi Mawatha, Colombo 1",
    "number": 112433444
  },
  {
    "id": 5,
    "name": "Cinnamon Lakeside Colombo",
    "address": "115 Sir Chittampalam A Gardiner Mawatha, Colombo 2",
    "number": 112491111
  },
  {
    "id": 6,
    "name": "Hilton Colombo",
    "address": "2 Sir Chittampalam A Gardiner Mawatha, Colombo 2",
    "number": 112345678
  },
  {
    "id": 7,
    "name": "Galle Face Hotel",
    "address": "2 Galle Road, Colombo 3",
    "number": 112444555
  },
  {
    "id": 8,
    "name": "Galadari Hotel",
    "address": "64 Lotus Rd, Colombo 1",
    "number": 112326789
  },
  {
    "id": 9,
    "name": "Mövenpick Hotel Colombo",
    "address": "24 Dharmapala Mawatha, Colombo 3",
    "number": 112001100
  },
  {
    "id": 10,
    "name": "OZO Colombo",
    "address": "36-38, Clifford Pl, Colombo 4",
    "number": 112345100
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