import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpperCaseTxt extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue txtOld, TextEditingValue txtNew){
    return txtNew.copyWith(text: txtNew.text.toUpperCase());
  }
}