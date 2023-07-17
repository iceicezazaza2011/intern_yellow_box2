import 'dart:convert';

import 'package:intern_yellow_box/Domain/vault/vaultAccount.dart';
import 'package:intern_yellow_box/constant.dart';
import 'package:http/http.dart' as http;

class VaultService{

  Map<String, String> header = {
    "Content-Type": "application/json",
    "accept": "*/*",
    "Access-Control-Allow-Origin": "*",
    "vaultkey": kVaultkey,
  };

  Future<VaultAccount?> login(String user, String password, String org) async {
    String url = kVaultBaseUrl + kLoginUrl;
    var body = {
      'user':user,
      'key':password,
      'applicationID': 'zeenaudit',
      'org' : org
    };
    try{
      final response = await http.post(Uri.parse(url), body: jsonEncode(body),
      headers: header);
      if(response.statusCode == 200){
        return VaultAccount.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      }
    }catch (ex){
      rethrow;
    }
  }
}