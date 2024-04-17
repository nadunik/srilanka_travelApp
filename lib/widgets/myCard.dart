import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String backgroundImage;
  final String cardText;
  final Widget destinationPage;

  MyCard({
    required this.backgroundImage,
    required this.cardText,
    required this.destinationPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Card(
          elevation: 10,
          shadowColor: Color.fromARGB(255, 187, 191, 195),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          margin: EdgeInsets.all(32),
          color: Colors.white.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              cardText,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

