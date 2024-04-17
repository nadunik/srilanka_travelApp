//import 'dart:html';

import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:translator/translator.dart';
import 'package:srilankatravel_app/pages/home_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/map_page.dart';
import 'package:srilankatravel_app/pages/nav_pages/emergency.dart';

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({super.key});
  final String title = "Translator";

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  List<String> languages = [
    'Albanian',
    'Arabic',
    'Bengali',
    'Chinese (Simplified)',
    'English',
    'French',
    'German',
    'Hindi',
    'Italian',
    'Korean',
    'Sinhala (Sinhalese)',
    'Tamil',
  ];
  List<String> languagescode = [
    'sq','ar','bn','zh-CN or zh','en','fr','de','hi','it','ko','si','ta'
  ];
  String from='en';
  String to='si';
  String data='';
  String selectedvalue='English';
  String selectedvalue2='Sinhala (Sinhalese)';
  TextEditingController controller = TextEditingController(text: 'How are you?');
  final formkey = GlobalKey<FormState>();
  bool isloading=false;

  final translator = GoogleTranslator();
  translate()async{
    //try{
      if(formkey.currentState!.validate()){
      await translator
    .translate(controller.text,from: from, to: to )
    .then((value){
      data = value.text;
      isloading=false;
      setState(() {
        //print value
      });
    });
    }
    }
/*on SocketException catch(_){
      isloading=true;
        SnackBar mysnackbar=SnackBar(content: Text('No Internet'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),);
        ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
        setState(() {
        });
      };
    }
}*/

  /*@override
  void initState(){
    super.initState();
    translate();
  }*/
  @override
  void dispose(){
    //todo
    super.dispose();
    controller.dispose();
  }

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
                title: Text(widget.title),centerTitle: true,
        backgroundColor: Color.fromARGB(255, 126, 124, 124),
      ),
      backgroundColor: Color.fromARGB(255, 251, 251, 253),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5,),
          Container(margin:EdgeInsets.symmetric(horizontal: 40),
          decoration : BoxDecoration(
            color: Color.fromARGB(255, 115, 196, 228),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('From'),
              SizedBox(width: 100,),
              DropdownButton(
                  value: selectedvalue,
                  focusColor: Colors.transparent,
                  items: languages.map((lang){
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                      onTap: (){
                        if(lang == languages[0]){
                          from = languagescode[0];
                        }else if(lang==languages[1]){
                          from = languagescode[1];
                        }else if(lang==languages[2]){
                          from = languagescode[2];
                        }else if(lang==languages[3]){
                          from = languagescode[3];
                        }else if(lang==languages[4]){
                          from = languagescode[4];
                        }else if(lang==languages[5]){
                          from = languagescode[5];
                        }else if(lang==languages[6]){
                          from = languagescode[6];
                        }else if(lang==languages[7]){
                          from = languagescode[7];
                        }else if(lang==languages[8]){
                          from = languagescode[8];
                        }else if(lang==languages[9]){
                          from = languagescode[9];
                        }else if(lang==languages[10]){
                          from = languagescode[10];
                        }else if(lang==languages[11]){
                          from = languagescode[11];
                        }
                        setState(() {
                          print(lang);
                          print(from);
                        });
                      },
                      ); 

                  }).toList(),
                  onChanged: (value){
                    selectedvalue = value! ; 
                  },
                        
                )
            ],),
          ),

          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)
            ),
            child: Form(
              key: formkey,
              child: TextFormField(controller: controller,
              maxLines: null,
              minLines: null,
              validator: (value){
                if(value!.isEmpty){
                  return 'please enter some text';
                }else null;
              },
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                errorStyle: TextStyle(color: Colors.white)
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              
              ),
              ),
            ),
          ),

          Container(margin:EdgeInsets.symmetric(horizontal: 40),
          decoration : BoxDecoration(
            color:  Color.fromARGB(255, 115, 196, 228),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('To'),
              SizedBox(width: 100,),
              DropdownButton(
                  value: selectedvalue2,
                  focusColor: Colors.transparent,
                  items: languages.map((lang){
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                      onTap: (){
                        if(lang == languages[0]){
                          from = languagescode[0];
                        }else if(lang==languages[1]){
                          from = languagescode[1];
                        }else if(lang==languages[2]){
                          from = languagescode[2];
                        }else if(lang==languages[3]){
                          from = languagescode[3];
                        }else if(lang==languages[4]){
                          from = languagescode[4];
                        }else if(lang==languages[5]){
                          from = languagescode[5];
                        }else if(lang==languages[6]){
                          from = languagescode[6];
                        }else if(lang==languages[7]){
                          from = languagescode[7];
                        }else if(lang==languages[8]){
                          from = languagescode[8];
                        }else if(lang==languages[9]){
                          from = languagescode[9];
                        }else if(lang==languages[10]){
                          from = languagescode[10];
                        }else if(lang==languages[11]){
                          from = languagescode[11];
                        }
                        setState(() {
                          print(lang);
                          print(to);
                        });
                      },
                      ); 

                  }).toList(),
                  onChanged: (value){
                    selectedvalue2 = value! ; 
                  },
                        
                )
            ],),
          ),

          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)
            ),
            child: Center(child: SelectableText(
              data,style: TextStyle(color: Color.fromARGB(255, 254, 252, 252),fontSize: 20,
              fontWeight: FontWeight.bold
              ),
            ),),
           
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: translate,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Color.fromARGB(255, 4, 77, 104),
              ),fixedSize: MaterialStatePropertyAll(
                Size(300, 45)),
                foregroundColor:MaterialStatePropertyAll(Colors.white),
              ), 
            child: Text('Translate'),
            )
        ]
      ),
        
      );
    
  }
}