import 'dart:convert';

import 'package:firebase_auth_test/controller/auth-helper.dart';
import 'package:firebase_auth_test/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

var newUser ;

class _HomePageState extends State<HomePage> {
  @override
  

  

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //  // decoration: BoxDecoration(image:DecorationImage(image: Image.network(newUser.image.toString())) ),
              //   height: 150,
              //   width: MediaQuery.of(context).size.width*0.8,
              //   child: Image.network(
              //    // newUser.image.toString(),
              //     fit: BoxFit.cover,
                
              //     width:  MediaQuery.of(context).size.width*0.8,
              //   ),
              // ),
              const SizedBox(
                height: 30,
              ),
              Text(_auth.currentUser!.phoneNumber.toString()),
              const SizedBox(
                height: 20,
              ),
              Text(_auth.currentUser!.email.toString()),
              const SizedBox(
                height: 20,
              ),
              Text(_auth.currentUser!.displayName.toString()),
              const SizedBox(
                height: 20,
              ),
              TextButton(onPressed: (){
                AuthMethods().logoutUser();
              }, child: Text('Logout'))
            ],
          ),
        ),
      ),
    );
  }
}
