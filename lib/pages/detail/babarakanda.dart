import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:srilankatravel_app/widgets/app_bold_text.dart';
import 'package:srilankatravel_app/widgets/app_text.dart';
import 'package:srilankatravel_app/widgets/button.dart';

class BabarakandaPage extends StatelessWidget {
  const BabarakandaPage({Key? key}) : super(key: key);
  
  final int gottenStars=4;

  @override
  Widget build(BuildContext context) {
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
                          "assets/images/babarakanda.jpeg"
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
                          Navigator.pushNamed(context, '/destination5');
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
                              text: /*names[index]*/"Babarakanda", 
                             color:Colors.black,)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.location_on, color:Color.fromARGB(255, 95, 129, 222)),
                            SizedBox(width: 5,),
                            AppText(
                              text:"Kalupahana,Sri Lanka", 
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
                        AppText(text: "Bambarakanda Falls (also known as Bambarakele Falls) is the tallest waterfall in Sri Lanka. With a height of 263 m (863 ft),[1] it ranks as the 461st highest waterfall in the world.[2] Situated in Kalupahana in the Badulla District, this waterfall is 5 km (3.1 mi) away from the A4 Highway. The waterfall was formed by Kuda Oya, which is a tributary of the Walawe River. The Bambarakanda Falls can be found in a forest of pine trees.")
                        
        
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
}