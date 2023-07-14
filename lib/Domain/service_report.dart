import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'component_report.dart';

class ReportService{
  Future<List<Report>> getReport() async{
    String url = "https://648b1f7c17f1536d65ea6c0a.mockapi.io/ReportCycle";
    final queryParameters ={
      'org' : "",
    };
    try{
      final response = await http.get(Uri.parse(url));
      print("xxxxxx2");
      print(response);
      if(response.statusCode == 200){
        List list = jsonDecode(utf8.decode(response.bodyBytes))??[];
        List<Report> result = list.map((e) => Report.fromJson(e)).toList();
        print(result);
        return result;
      }
      else{
        throw Exception("Error Occur");
      }
    }catch(e){
      print("xxxxxxx");
      print(e.toString());
    }
    return [];
  }
//
}