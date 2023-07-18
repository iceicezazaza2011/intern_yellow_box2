import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intern_yellow_box/Domain/component_cycle.dart';


import 'dart:convert';
import 'dart:developer';

class CycleService{
  Future<List<CycleBlock>> getCycleBlock() async{
    String url = "https://648b1e6917f1536d65ea68a8.mockapi.io/cycle";
    final queryParameters = {
      'org': '',
    };
    // print(uri);
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200)
      {
        List list = jsonDecode(response.body)??[];
        List<CycleBlock> result = list.map((e) => CycleBlock.fromJson(e)).toList();
        return result;
      }//
      else
      {
        throw Exception("Error Occur");
      }
    }catch(e){
      print("xxxxxxxx");
      print(e.toString());
    }
    return [];
  }
} //