import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hash_password/hash_password.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:fast_base58/fast_base58.dart';
import 'package:flutter/services.dart';

import 'package:hash_password/hashing_functionalities.dart';
import 'package:hash_password/password_hasher.dart';

void main() => runApp(MaterialApp(
  home: Hash_Password(),
));

class Hash_Password extends StatefulWidget {
  @override
  _Hash_PasswordState createState() => _Hash_PasswordState();
}

class _Hash_PasswordState extends State<Hash_Password> {

  TextEditingController _controller = TextEditingController();
  //Trigger for generating the hash code for the entered password
  bool password_hash_trigger = false;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Hash Password',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
          ),
        ),

      body: Column(

        children: <Widget>[
          Password_Hasher(
            algorithm_number: '256',
            Hex: true,
            controller: _controller,
            restrict: true,
            restrict_number: 10,

            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter Password Here!',
              ),
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              onChanged: (String newValue){
                //Do something with the user input.
              },
            ),
          ),

          SizedBox(height: 15.0,),

          TextButton(
            child: Text('Submit', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            onPressed: (){
              setState(() {
                password_hash_trigger = true;
              });
            },
          ),
        ],
      ),
    );
  }
}