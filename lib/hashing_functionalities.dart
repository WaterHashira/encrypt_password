import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:fast_base58/fast_base58.dart';
import 'package:flutter/services.dart';

class Hashing_Functionalities{
  String input_hash(String userText, String userSha) {
    var bytes = utf8.encode(userText);
    if (userSha == '256') {
      var digest1 = sha256.convert(bytes);
      String digest1str = digest1.toString();
      return digest1str;
    }
    else if (userSha == '384') {
      var digest2 = sha384.convert(bytes);
      String digest2str = digest2.toString();
      return digest2str;
    }
    else {
      var digest3 = sha512.convert(bytes);
      String digest3str = digest3.toString();
      return digest3str;
    }
  }

  String number_system_convert (String userNumSys, String convHashText){
    List<int> bytes = hex.decode(convHashText);
    if (userNumSys == 'Hex'){
      return convHashText;
    }
    else if (userNumSys == 'Base64'){
      String base64text = base64.encode(bytes);
      return base64text;
    }
    else{
      String base58text = Base58Encode(bytes);
      return base58text;
    }
  }

  String final_encrypted_password (String convertedText, double outputDigits){
    int outputDigitsInt = outputDigits.round();
    if (outputDigitsInt == 0){
      return convertedText;
    }
    else{
      int stringLength = convertedText.length;
      if (stringLength <= outputDigits){
        return convertedText;
      }
      else{
        String newString = convertedText.substring(0,outputDigitsInt);
        return newString;
      }
    }

  }
}