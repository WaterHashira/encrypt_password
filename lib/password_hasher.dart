import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:fast_base58/fast_base58.dart';
import 'package:flutter/services.dart';

import 'hashing_functionalities.dart';

class Password_Hasher extends StatefulWidget {
  //hashing algos
  final String algorithm_number;

//Number System
  final bool Base58;
  final bool Base64;
  final bool Hex;

//parameters for the the password characters restriction (if any)
  final bool restrict;
  final double restrict_number;

  bool trigger;

  TextFormField child;

  TextEditingController controller;

  Password_Hasher({required this.algorithm_number,
    this.Base58 = false, this.Base64 = false, this.Hex = false,
    this.restrict = false, this.restrict_number = 100,
    this.trigger = false, required this.child, required this.controller,});

  @override
  _Password_HasherState createState() => _Password_HasherState();
}

class _Password_HasherState extends State<Password_Hasher> {

  //Method that contains the logic for hashing te password:-
   hashing_method(){
     var hashed_password;
     var encrypt_step1 = Hashing_Functionalities().input_hash(widget.controller.text, widget.algorithm_number);
     var encrypt_step2;
      if(widget.Base58 == true){
        encrypt_step2 = Hashing_Functionalities().number_system_convert('Base58', encrypt_step1);
    }
      else if(widget.Base64 == true){
        encrypt_step2 = Hashing_Functionalities().number_system_convert('Base64', encrypt_step1);
      }
      else if(widget.Hex == true){
        encrypt_step2 = Hashing_Functionalities().number_system_convert('Hex', encrypt_step1);
      }

     if (widget.restrict == false) {
       hashed_password = encrypt_step2;
     }
     else {
       hashed_password = Hashing_Functionalities().final_encrypted_password(encrypt_step2, widget.restrict_number);
     }
     return hashed_password;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(
        builder: (BuildContext context){
          if(widget.trigger == true){
            return widget.child;
          }
          else{
            var encrypted_password = hashing_method();
            widget.controller.text = encrypted_password;
            return widget.child;
          }
        },
      ),
    );
  }
}