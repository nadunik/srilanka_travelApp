import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:srilankatravel_app/model/data_model.dart';
import 'dart:convert';


class DataServices{
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getInfo() async{
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e)=>DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];
      }
    }catch(e){
      print(e);
      return<DataModel>[];
    }
  }
}