import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'dart:io';

import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http;

import 'component_report.dart';

class ReportService {
  Future<List<Report>> getReport() async {
    String url = "https://648b1f7c17f1536d65ea6c0a.mockapi.io/ReportCycle";
    final queryParameters = {
      'org': "",
    };
    try {
      final response = await http.get(Uri.parse(url));
      print("xxxxxx2");
      print(response);
      if (response.statusCode == 200) {
        List list = jsonDecode(utf8.decode(response.bodyBytes)) ?? [];
        List<Report> result = list.map((e) => Report.fromJson(e)).toList();
        print(result);
        return result;
      } else {
        throw Exception("Error Occur");
      }
    } catch (e) {
      print("xxxxxxx");
      print(e.toString());
    }
    return [];
  }
//
}

Future<void> downloadConfirmCaseCSV(String data, String fileName) async {
  log('HecFinanceService.downloadConfirmCasePdf[call api]');
  BrowserClient browserClient = BrowserClient()..withCredentials = true;
  try {
    final response = await browserClient
        .post(
          Uri.parse(
              'https://media.githubusercontent.com/media/datablist/sample-csv-files/main/files/organizations/organizations-100.csv'),
          headers: {
            "Content-Type": "application/json",
            "accept": "*/*",
            "Access-Control-Allow-Origin": "*",
          },
          body: data,
        )
        .timeout(const Duration(seconds: 30));
    if (response.statusCode == 200) {
      log('HecFinanceService.downloadConfirmCasePdf[done]');
      final blob = Blob([response.bodyBytes]);
      final url = Url.createObjectUrlFromBlob(blob);

      final anchor = document.createElement('a') as AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = "$fileName.csv";
      document.body!.children.add(anchor);
      anchor.click();
      document.body!.children.remove(anchor);
      Url.revokeObjectUrl(url);
    } else {
      log('HecFinanceService.downloadConfirmCasePdf[error]');
      throw "error";
    }
  } on TimeoutException catch (_) {
    // A timeout occurred.
    log('HecFinanceService.downloadConfirmCasePdf[TimeoutException]');
    throw 'Cannot connect to server';
  } on SocketException catch (_) {
    log('HecFinanceService.downloadConfirmCasePdf[SocketException]');
    // Other exception
    throw 'Please check your internet connection';
  } catch (ex) {
    rethrow;
  }
}
