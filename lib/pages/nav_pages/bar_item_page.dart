import 'package:flutter/material.dart';

class BarItemPage extends StatelessWidget{
  const BarItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          "Bar Item page"
        )
      ),
    );
  }
}