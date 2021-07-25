### hash_password

 [hash_password](https://pub.dev/packages/hash_password) is a Flutter Plugin to make your user's passwords safe and secure and at the same time easy to remember, hash_password produces a hashcode for the password that the user enters in the textfield, effectively producing a highly secure password and removing the need for remembering a complex password.

## [Installation](https://pub.dev/packages/hash_password/install)

In the dependencies: section of your pubspec.yaml, add the following line:
```

dependencies:
  hash_password: <latest_version>
```

## [Usage](https://pub.dev/packages/hash_password)

A usage example is provided below. Check the API Reference for detailed docs:
```
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
```
Like in the example given above, to use the plugin in your flutter project, simply enclose the widget where user is going enter the password by **Password_Hasher()** widget,

# Properties

| **Properties**  | --- |
| ------------- | ------------- |
| algorithm_number  | String  |
| Base58  | bool  |
| Base64  | bool  |
| Hex  | bool  |
| restrict  | bool  |
| restrict_number  | double  |
| trigger  | bool  |
| child  | TextFormField  |
| controller  | TextEditingController  |

- ***Hashing Algorithms***: *algorithm_number* property specify the number afetr **SHA** for specifying an algorithm to produce hashcode for the password entered.
- ***Number System***: *Base58*, *Base64*, *Hex* are bool properties which specify the Number System for the hash code (**Note:** only one of these is needed to be specified as true, *Hex* is true by default, if multiple number systems sre set true, then it may result to unwanted outcomes)
- ***Character Restriction***: In case there is restriction on number of characters to be entered for the password, set *restrict* as true, and then, specify the number of characters allowed using *restrict_number* property.
- ***trigger***: it is a bool property which specifies when to convert entered text to its corresponding hashcode.
- ***child***: it is the child property of **Password_Hasher()** widget, it takes TextFormField, in which password is supposed to be entered.
- ***controller***: it takes the TextEditingController of the child TextFormField as input.

## [Example App](https://pub.dev/packages/hash_password/example)

You can View the full code implementation in the ```example``` directory
Example Flutter App:

![](example/images/hash_password_example.gif)

