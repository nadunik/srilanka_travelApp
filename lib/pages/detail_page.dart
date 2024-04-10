import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srilankatravel_app/cubit/app_cubit_states.dart';
import 'package:srilankatravel_app/cubit/app_cubits.dart';
import 'package:srilankatravel_app/widgets/app_bold_text.dart';
import 'package:srilankatravel_app/widgets/app_text.dart';
import 'package:srilankatravel_app/widgets/button.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);
  
  final int gottenStars=4;
  
  /*final List mountains = [
    "assets/images/piduruthalagala.jpeg",
    "assets/images/adamspeak.jpeg",
    "assets/images/kirigalpotta.jpeg",
    "assets/images/knuckles.jpeg",
    "assets/images/greatewestern.jpeg",
  ];
  final List names = [
    "Piduruthalagala"
    "Adam's Peak",
    "Kirigalpoththa",
    "Knuckles",
    "Great Western",
  ];
  final List locations = [
    "Nuwara Eliya, Sri Lanka",

  ];*/
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: 360,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          //mountains[index];
                          "assets/images/piduruthalagala.jpeg"
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: const Icon(Icons.backspace),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 330,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AppBoldText(
                              text: /*names[index]*/"Piduruthalagala", 
                             color:Colors.black,)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.location_on, color:Color.fromARGB(255, 95, 129, 222)),
                            SizedBox(width: 5,),
                            AppText(
                              text:"Nuwara Eliya,Sri Lanka", 
                              color: Color.fromARGB(255, 95, 129, 222),)
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Wrap(
                          children: List.generate(5, (index){
                             return Icon(Icons.star, color:index<gottenStars?const Color.fromARGB(255, 243, 191, 5):Color.fromARGB(255, 203, 200, 200),);
                          }),
                        ),
                        SizedBox(width: 10,),
                        AppText(text: "(4.0)",color:Color.fromARGB(255, 54, 123, 219),)
                          ],
                        ),
                        SizedBox(height: 25 ,),
                        AppBoldText(text: "Description", color: Colors.black,size: 20,),
                        SizedBox(height: 10,),
                        AppText(text: "Pidurutalagala (Sinhala: පිදුරුතලාගල, pronounced [ˌpidurutaˈlaːɡələ], Straw Plateau Rock), or previously Mount Pedro in English, is the highest mountain in Sri Lanka, at 2,524 m (8,281 ft). It is situated North-North-East from the town of Nuwara Eliya and is easily visible from most areas of the Central Province")
                        
        
                    ],),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(children:[
                    Button(
                      width: 60,
                      color: Colors.black,
                      backgroundColor: Color.fromARGB(255, 253, 253, 253),
                      buttonText: "",
                      borderColor: Colors.black54,
                      //isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(width: 20,),
                    Button(
                         isResponsive: true,
                          width: 200,
                          backgroundColor: Color.fromARGB(255, 63, 183, 216),
                          color: Colors.white,
                          buttonText: "View Directions")
                  ],)
                  )
              ],
            ),
          ),
        );
      }
    );
      
    }
  }
