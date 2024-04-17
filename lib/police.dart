import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/translator.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/emergency.dart';

class PolicePage extends StatefulWidget {
  const PolicePage({Key? key}) : super(key: key);
  final String title = "Sri Lanka Police";

  @override
  State<PolicePage> createState() => _PolicePageState();
}

class _PolicePageState extends State<PolicePage> {
  
  List<Map<String, dynamic>> _police = [
    {"id":1,"name":"Colombo Police Headquarters", "address": "WRQW+326, Church St, Colombo","number": 112444444,},
    {"id":2,"name":"Mount Lavinia Police Station", "address": "Galle Road, Mount Lavinia","number": 112734114,},
    {"id":3,"name":"Moratuwa Police Station", "address": "Rawathawatte Road, Moratuwa","number": 112649414,},
    {"id":4,"name":"Kandy Police Headquarters", "address": "Sangaraja Mawatha, Kandy","number": 812222222,},
    {"id":5,"name":"Nuwara Eliya Police Station", "address": "Badulla Road, Nuwara Eliya","number": 522222222,},
    {"id":6,"name":"Galle Police Headquarters", "address": "Suduwella, Galle","number": 912222222,},
    {"id":7,"name":"Matara Police Station", "address": "Pamburana, Matara","number": 412222222,},
    {"id":8,"name":"Batticaloa Police Headquarters", "address": "Trincomalee Road, Batticaloa","number":  652222222,},
    {"id":9,"name":"Jaffna Police Headquarters", "address": "Mahatma Gandhi Road, Jaffna","number": 212222222,},
    {"id":10,"name":"Anuradhapura Police Headquarters", "address": "Mihindu Mawatha, Anuradhapura","number": 252222222,},
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
    _foundContacts = _police;
    super.initState();
  }

  void _runFilter(String enterKeyword){
    List<Map<String, dynamic>> results = [];
    if (enterKeyword.isEmpty){
      results = _police;
    }else{
      results= _police
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
                      _police[index]["id"].toString(),
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

