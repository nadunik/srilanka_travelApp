import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srilankatravel_app/widgets/app_bold_text.dart';
import 'package:srilankatravel_app/widgets/app_text.dart';
import 'package:srilankatravel_app/widgets/button.dart';
import 'package:srilankatravel_app/cubit/app_cubits.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
      "assets/images/sll.jpeg",
      "assets/images/sl3.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (_, index){
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(
                  images[index]
                ),
                fit: BoxFit.cover
                )
              ),
                child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppBoldText(text: "Welcome", size: 40,),
                          AppText(text: "Sri Lanka", size: 40,color: Colors.black,),
                          const SizedBox(height: 20,),
                          SizedBox(
                            width: 250,
                            child: AppText(
                              text: "Step into Sri Lanka's enchanting world where every moment becomes an adventure. Let's discover the magic together!", 
                              size: 14,
                              color: Colors.black,
                              ),
                          ),
                          const SizedBox(height: 40,),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, '/home');
                            },
                            child: Container(
                              width: 200,
                              child: Button(
                                  isResponsive: true,
                                  width: 120,
                                backgroundColor: Color.fromARGB(255, 59, 168, 195),
                                color: Colors.white,
                                buttonText: "Let's go",),
                              ),
                            ),]
                          ),
                        
                      ),
                    );  
            }
              ),
        ),
      ),
        );
      }
  }

