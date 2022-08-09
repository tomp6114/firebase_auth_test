import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_test/screens/home.dart';
import 'package:firebase_auth_test/screens/login.dart';
import 'package:firebase_auth_test/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethods {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _DB = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String> signUpUser({
    required String email,
    required String password,
    required String fullName,
    required String mobileNumber,
    FilePickerResult? image,
  }) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          fullName.isNotEmpty ||
          mobileNumber.isNotEmpty) {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        final user = UserModel(
          email: email,
          fullName: fullName,
          mobileNumber: mobileNumber,
          uid: newUser.user!.uid,
        );
        user.image = await userImageUpload(image!);
        final SharedPreferences prefs = await _prefs;

        await prefs.setString('name', fullName);
        await prefs.setString('email', email);
        await prefs.setString('phone', mobileNumber);
        await prefs.setString('image', user.image.toString());
        //await _DB.collection('users').doc(newUser.user!.uid).set(user.toJson());
        res = 'Sucess';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'email-already-in-use') {
        res = 'The email address is already in use';
      }
    }
    print(res);
    return res;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid);
        });
        res = 'Logged In Sucessfully';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-password') {
        res = 'Invalid  password';
      }
      if (e.code == 'user-not-found') {
        res = 'User not found';
      }
      if (e.code == 'invalid-email') {
        res = 'Inavlid Email';
      }
    }
    return res;
  }

  Future<UserModel> getUserDetails() async {
    final SharedPreferences prefs = await _prefs;
   
   var name= await prefs.getString('name');
   var email= await prefs.getString('email');
   var phone= await prefs.getString('phone');
   var image= await prefs.getString('image');
   final newUser =UserModel(fullName: name,email: email,mobileNumber: phone,image: image);
   return newUser;
  }

  logoutUser() async {
    await _auth.signOut().then((value) => Get.offAll(() => LoginPage()));
  }

  googleSignIn() async {
    var user = await _googleSignIn.signIn();
    print(user);
    if (user!.id.isNotEmpty) {
      Get.to(HomePage());
    }
  }

  Future<String?> userImageUpload(FilePickerResult image) async {
    final FirebaseStorage storage = FirebaseStorage.instance;
    final path = image.files.single.path;
    final fileName = image.files.single.name;
    File file = File(path!);
    String? imageurl;
    try {
      final ref = storage.ref('userImages/$fileName');
      final link = await ref.putFile(file).whenComplete(() => null);
      String imageUrl = await link.ref.getDownloadURL();
      imageurl = imageUrl;
    } on FirebaseException catch (e) {
      log(e.toString());
    }
    return imageurl;
  }
}
