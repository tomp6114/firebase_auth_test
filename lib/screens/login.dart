import 'dart:developer';

import 'package:firebase_auth_test/screens/home.dart';
import 'package:firebase_auth_test/screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../controller/auth-helper.dart';

class LoginPage extends StatefulWidget {
 const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
final formkey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello",
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Sign into your account',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Color.fromARGB(193, 85, 81, 81),
                  ),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(90, 126, 123, 135), width: 0.7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(90, 126, 123, 135),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (RegExp(
                            "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                        .hasMatch(value!)) {
                      return null;
                    } else {
                      return "Please provide a valid email address";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    //filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(90, 126, 123, 135),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Please provide atleast 8 characters";
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async{
                    if (formkey.currentState!.validate()) {
                              String res = await AuthMethods().signInUser(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                              log(res);
                              if (res == 'Logged In Sucessfully') {
                                const  CircularProgressIndicator();
                                Get.off(const HomePage());
                                Get.showSnackbar(
                                  GetSnackBar(
                                    duration: const Duration(seconds: 3),
                                    title: 'Message',
                                    message: res.toString(),
                                    backgroundColor:
                                        const Color.fromARGB(237, 224, 31, 31),
                                  ),
                                );
                              } else {
                                Get.showSnackbar(GetSnackBar(
                                  title: 'Message',
                                  message: res.toString(),
                                  backgroundColor: Colors.transparent,
                                ),);
                              }
                            }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text('Sign in'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text('Dont have an Account ?'),
                        TextButton(
                          onPressed: () {
                            Get.to(SignupScreen());
                          },
                          child: const Text(
                            'Create Account',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {},
                          icon: Icon(Icons.g_mobiledata_rounded),
                          label: Text('Google'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
