import 'package:flutter/material.dart';

class DataModel {
  String name;
  String img;
  int stars;
  String description;
  String location;

  DataModel({
    required this.name,
    required this.img,
    required this.stars,
    required this.description,
    required this.location,
  });

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(name: json["name"],
     img: json["img"], 
     stars: json["stars"], 
     description: json["description"], 
     location: json["location"]
     );
  }
}