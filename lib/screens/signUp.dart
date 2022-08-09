// import 'package:firebase_auth_test/auth-helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'home.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// TextEditingController emailContr = TextEditingController();
// TextEditingController passwordContr = TextEditingController();
// TextEditingController phoneContr = TextEditingController();
// TextEditingController fullnameContr= TextEditingController();
// final formkey = GlobalKey<FormState>();
// String? imagePath;
// FilePickerResult? image;

// Future getImage() async {
//   image = await FilePicker.platform
//       .pickFiles(allowMultiple: false, type: FileType.any);
//   if (image == null) {
//     Get.showSnackbar(const GetSnackBar(message: 'No file selected'));
//   }
//   imagePath = await FirebaseAuth.instance.currentUser!.photoURL;

//   // final ImagePicker image = ImagePicker();
//   // _image = await image.pickImage(source: ImageSource.gallery);

//   // setState(() {
//   //   if (_image != null) {
//   //     imagePath = _image!.path;
//   //   }
//   //   return null;
//   // });
// }

// class _SignUpPageState extends State<SignUpPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Create an Account",
//                     style: TextStyle(
//                       color: Color.fromARGB(234, 0, 0, 0),
//                       fontSize: 27,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Form(
//                     key: formkey,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     child: SizedBox(
//                       width: 320,
//                       child: Column(
//                         children: [
//                           Stack(
//                             children: [
//                               imagePath == null
//                                   ? const CircleAvatar(
//                                       radius: 75,
//                                       backgroundColor: Colors.grey,
//                                       child: Text(
//                                         "Add Image",
//                                         style: TextStyle(color: Colors.black),
//                                       ),
//                                     )
//                                   : GestureDetector(
//                                       onTap: () {
//                                         //Get.to(ViewImage(imagepath: imagePath));
//                                       },
//                                       child: ClipOval(
//                                         child: Image.network(
//                                           imagePath.toString(),
//                                           width: 150,
//                                           height: 150,
//                                           fit: BoxFit.contain,
//                                         ),
//                                       ),
//                                     ),
//                               Positioned(
//                                 bottom: 5,
//                                 right: 5,
//                                 child: CircleAvatar(
//                                   backgroundColor: Colors.black.withOpacity(0.2),
//                                   child: IconButton(
//                                     icon: const Icon(
//                                       Icons.camera_alt,
//                                       color: Colors.black,
//                                     ),
//                                     onPressed: () {
//                                       getImage();
//                                       setState(() {
//                                         imagePath =  FirebaseAuth.instance.currentUser!.photoURL;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                           TextFormField(
//                             style: const TextStyle(
//                               color: Color.fromARGB(193, 85, 81, 81),
//                             ),
//                             decoration: const InputDecoration(
//                               fillColor: Color.fromARGB(255, 255, 255, 255),
//                               //filled: true,
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Color.fromARGB(105, 97, 97, 103),
//                                     width: 0.7),
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(90, 126, 123, 135),
//                                 ),
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                               ),
//                               labelText: "Full name",
//                               labelStyle: TextStyle(
//                                   color: Color.fromARGB(114, 61, 59, 59)),
//                             ),
//                             controller: fullnameContr,
//                             validator: (value) {
//                               if (value!.length < 3) {
//                                 return "Please provide atleast 3 characters";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onChanged: (value) {
//                               //name = value;
//                             },
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                             style: const TextStyle(
//                               color: Color.fromARGB(193, 85, 81, 81),
//                             ),
//                             decoration: const InputDecoration(
//                               //fillColor: Color.fromARGB(255, 151, 30, 30),
//                               //filled: true,
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(105, 97, 97, 103),
//                                   width: 0.7,
//                                 ),
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(90, 126, 123, 135),
//                                 ),
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                               ),

//                               labelText: "Email",
//                               labelStyle: TextStyle(
//                                 color: Color.fromARGB(114, 61, 59, 59),
//                               ),
//                             ),
//                             controller: emailContr,
//                             // onChanged: (value) {
//                             //   //email = value;
//                             // },
//                             validator: (value) {
//                               if (RegExp(
//                                       "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
//                                   .hasMatch(value!)) {
//                                 return null;
//                               } else {
//                                 return "please provide a valid email address";
//                               }
//                             },
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                             style: const TextStyle(
//                               color: Color.fromARGB(193, 85, 81, 81),
//                             ),
//                             decoration: const InputDecoration(
//                               fillColor: Color.fromARGB(255, 255, 255, 255),
//                               //filled: true,
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(105, 97, 97, 103),
//                                   width: 0.7,
//                                 ),
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(90, 126, 123, 135),
//                                 ),
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                               ),
//                               labelText: "Phone",
//                               labelStyle: TextStyle(
//                                 color: Color.fromARGB(114, 61, 59, 59),
//                               ),
//                             ),
//                             controller: phoneContr,
//                             // onChanged: (value) {
//                             //   // phone = value;
//                             // },
//                             validator: (value) {
//                               if (value!.length < 10) {
//                                 return "Enter a valid number";
//                               } else {
//                                 return null;
//                               }
//                             },
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                             style: const TextStyle(
//                               color: Color.fromARGB(193, 85, 81, 81),
//                             ),
//                             decoration: const InputDecoration(
//                               fillColor: Color.fromARGB(255, 255, 255, 255),
//                               //filled: true,
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                     color: Color.fromARGB(105, 97, 97, 103),
//                                     width: 0.7),
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: Color.fromARGB(90, 126, 123, 135),
//                                 ),
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                               ),
//                               labelText: "Password",
//                               labelStyle: TextStyle(
//                                 color: Color.fromARGB(114, 61, 59, 59),
//                               ),
//                             ),
//                             controller: passwordContr,
//                             // onChanged: (value) {
//                             //   // password = value;
//                             // },
//                             validator: (value) {
//                               if (value!.length < 6) {
//                                 return "please provide atleast 8 characters";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             obscureText: true,
//                           ),
//                           const SizedBox(
//                             height: 50,
//                           ),
//                           TextButton(
//                             onPressed: () async{
//                              if(formkey.currentState!.validate()){
//                               final res = await AuthMethods().signUpUser(
//                                   email: emailContr.text.trim(),
//                                   password: passwordContr.text.trim(),
//                                   fullName: fullnameContr.text.trim(),
//                                   mobileNumber: phoneContr.text.trim(),
//                                   image: image);
//                               if (res == 'Sucess') {
//                                 Get.off(HomePage());
//                                 Get.showSnackbar(const GetSnackBar(
//                                   duration: Duration(seconds: 1),
//                                   title: 'Sucess',
//                                   message: 'Account Created Sucessfully',
//                                 ));
//                               } else {
//                                 Get.showSnackbar(const GetSnackBar(
//                                   duration: Duration(seconds: 1),
//                                   title: 'Error',
//                                   message:
//                                       'Please check your internet connection',
//                                 ));
//                               }
//                             }},
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all(
//                                 const Color.fromARGB(255, 0, 0, 0),
//                               ),
//                               shape: MaterialStateProperty.all<
//                                   RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),
//                               ),
//                             ),
//                             child: const Text(
//                               'Sign up',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all(
//                                 const Color.fromARGB(255, 0, 0, 0),
//                               ),
//                               shape: MaterialStateProperty.all<
//                                   RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: const Icon(Icons.g_mobiledata_rounded),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_test/controller/auth-helper.dart';
import 'package:firebase_auth_test/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailContr = TextEditingController();
  TextEditingController fullnameContr = TextEditingController();
  TextEditingController passwordContr = TextEditingController();
  TextEditingController phoneContr = TextEditingController();
  String verficationIdreceived = "";

  FilePickerResult? image;
  String? imagePath;

  final formkey = GlobalKey<FormState>();
  Future getImage() async {
    image = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.any);
    if (image == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No file selected')));
    }
    imagePath = await FirebaseAuth.instance.currentUser!.photoURL;
    // final ImagePicker image = ImagePicker();
    // _image = await image.pickImage(source: ImageSource.gallery);

    // setState(() {
    //   if (_image != null) {
    //     imagePath = _image!.path;
    //   }
    //   return null;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Create an Account",
          style: TextStyle(
              color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(205, 246, 243, 243),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromARGB(205, 246, 243, 243)),
          child: Column(
            children: [
              Form(
                  key: formkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SizedBox(
                    width: 320,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            imagePath == null
                                ? const CircleAvatar(
                                    radius: 75,
                                    backgroundColor: Colors.grey,
                                    child: Text(
                                      "Add Image",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      //Get.to(ViewImage(imagepath: imagePath));
                                    },
                                    child: ClipOval(
                                      child: Image.network(
                                        imagePath.toString(),
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(0.2),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.black,
                                  ),
                                  onPressed: getImage,
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color.fromARGB(193, 85, 81, 81),
                          ),
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            //filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(105, 97, 97, 103),
                                  width: 0.7),
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
                            labelText: "Full name",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(114, 61, 59, 59)),
                          ),
                          controller: fullnameContr,
                          validator: (value) {
                            if (value!.length < 3) {
                              return "Please provide atleast 3 characters";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            //name = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color.fromARGB(193, 85, 81, 81),
                          ),
                          decoration: const InputDecoration(
                            //fillColor: Color.fromARGB(255, 151, 30, 30),
                            //filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(105, 97, 97, 103),
                                  width: 0.7),
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
                            labelStyle: TextStyle(
                              color: Color.fromARGB(114, 61, 59, 59),
                            ),
                          ),
                          controller: emailContr,
                          // onChanged: (value) {
                          //   //email = value;
                          // },
                          validator: (value) {
                            if (RegExp(
                                    "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                                .hasMatch(value!)) {
                              return null;
                            } else {
                              return "please provide a valid email address";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color.fromARGB(193, 85, 81, 81),
                          ),
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            //filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(105, 97, 97, 103),
                                  width: 0.7),
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
                            labelText: "Phone",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(114, 61, 59, 59)),
                          ),
                          controller: phoneContr,
                          // onChanged: (value) {
                          //   // phone = value;
                          // },
                          validator: (value) {
                            if (value!.length < 10) {
                              return "Enter a valid number";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(
                            color: Color.fromARGB(193, 85, 81, 81),
                          ),
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            //filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(105, 97, 97, 103),
                                  width: 0.7),
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
                            labelStyle: TextStyle(
                                color: Color.fromARGB(114, 61, 59, 59)),
                          ),
                          controller: passwordContr,
                          // onChanged: (value) {
                          //   // password = value;
                          // },
                          validator: (value) {
                            if (value!.length < 6) {
                              return "please provide atleast 8 characters";
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ))),
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              final res = await AuthMethods().signUpUser(
                                  email: emailContr.text.trim(),
                                  password: passwordContr.text.trim(),
                                  fullName: fullnameContr.text.trim(),
                                  mobileNumber: phoneContr.text.trim(),
                                  image: image);
                              if (res == 'Sucess') {
                                Get.off(HomePage());
                                Get.showSnackbar(const GetSnackBar(
                                  duration: Duration(seconds: 1),
                                  title: 'Sucess',
                                  message: 'Account Created Sucessfully',
                                ));
                              } else {
                                Get.showSnackbar(
                                  GetSnackBar(
                                    duration: Duration(seconds: 1),
                                    title: 'Error',
                                    message: res.toString(),
                                  ),
                                );
                              }
                            }
                            //signUp(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 57,
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 0, 0, 0)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                          ),
                          onPressed: () {},
                          child: SizedBox(
                            height: 57,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  // child: Image.asset(
                                  //   "assets/images/google_logo.png",
                                  //   height: 30,
                                  //   fit: BoxFit.fill,
                                  // ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Sign up with Google',
                                  style: TextStyle(
                                    wordSpacing: 2,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  // Future signUp(BuildContext context) async {
  //   bool showLoading;
  //   final isvalid = formkey.currentState!.validate();
  //   if (!isvalid) return;
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => const Center(
  //             child: CircularProgressIndicator(),
  //           ));
  //   try {

  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailContr.text.trim(), password: passwordContr.text.trim()).then((value) =>  Get.off(()=>BottomNavigationSeller()));

  //   } on FirebaseAuthException catch (e) {
  //     print(e);

  //     Utils.showSnackBar(e.message);
  //   }
  // }
}
