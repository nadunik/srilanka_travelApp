import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/translator.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/emergency.dart';

class SabaraPage extends StatefulWidget {
  const SabaraPage({Key? key}) : super(key: key);
  final String title = "Hotels in Sabaragamu";

  @override
  State<SabaraPage> createState() => _SabaraPageState();
}

class _SabaraPageState extends State<SabaraPage> {
  
  List<Map<String, dynamic>> _hotels = [
  {
    "id": 1,
    "name": "Jetwing Warwick Gardens",
    "address": "Ambewela, Nuwara Eliya",
    "number": 522345678
  },
  {
    "id": 2,
    "name": "Heritance Kandalama",
    "address": "Dambulla",
    "number": 662345679
  },
  {
    "id": 3,
    "name": "Randholee Resort & Spa",
    "address": "29 Keerimalai Rd, Kandy",
    "number": 812345680
  },
  {
    "id": 4,
    "name": "Villa Marissa",
    "address": "Balangoda",
    "number": 452345681
  },
  {
    "id": 5,
    "name": "Sanmali Eco Lodge",
    "address": "Gallella, Kandy",
    "number": 812345682
  },
  {
    "id": 6,
    "name": "Kandyan View Holiday Bungalow",
    "address": "Heerassagala, Kandy",
    "number": 812345683
  },
  {
    "id": 7,
    "name": "Theva Residency",
    "address": "11/B5/10, 6th Ln, Hantana, Kandy",
    "number": 812345684
  },
  {
    "id": 8,
    "name": "Mountbatten Bungalow",
    "address": "Koggala, Kandy",
    "number": 812345685
  },
  {
    "id": 9,
    "name": "Ella Regency",
    "address": "Rock side, Ettampitiya, Ella",
    "number": 812345686
  },
  {
    "id": 10,
    "name": "Ratnayake Holiday Home",
    "address": "Kandy Rd, Hatton",
    "number": 812345687
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