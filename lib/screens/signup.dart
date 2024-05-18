// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:ssen_user/screens/OTP.dart';
// import 'package:ssen_user/utils/constants.dart';
// import 'package:ssen_user/utils/constants/size.dart';
// import 'package:ssen_user/utils/constants/text_string.dart';
// import 'package:ssen_user/utils/helper_function.dart';

// class SignUp extends StatelessWidget {
//   const SignUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = SHelperFunction.isDarkMode(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back_ios_new_sharp),
//         title: Text("SignUp"),
//       ),
//       body: SingleChildScrollView(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (MediaQuery.of(context).size.width > phoneSize)
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width - 400,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage('asset/signup.jpg'))),
//               ),
//             Container(
//               width: 400,
//               child: Padding(
//                 padding: const EdgeInsets.all(SSizes.defaultSpace),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       SText.signUpTitle,
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),
//                     const SizedBox(
//                       height: SSizes.spaceBtwItems,
//                     ),
//                     Form(
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   decoration: const InputDecoration(
//                                       prefixIcon: Icon(Iconsax.user),
//                                       labelText: SText.firstName),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: SSizes.spaceBtwInputField,
//                               ),
//                               Expanded(
//                                 child: TextFormField(
//                                   decoration: const InputDecoration(
//                                       prefixIcon: Icon(Iconsax.user),
//                                       labelText: SText.lastName),
//                                 ),
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwInputField,
//                           ),
//                           TextFormField(
//                             decoration: const InputDecoration(
//                                 prefixIcon: Icon(Iconsax.user_edit),
//                                 labelText: SText.userName),
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwInputField,
//                           ),
//                           TextFormField(
//                             decoration: const InputDecoration(
//                                 prefixIcon: Icon(Iconsax.direct),
//                                 labelText: SText.email),
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwInputField,
//                           ),
//                           TextFormField(
//                             decoration: const InputDecoration(
//                                 prefixIcon: Icon(Iconsax.call),
//                                 labelText: SText.phoneNumber),
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwInputField,
//                           ),
//                           TextFormField(
//                             decoration: const InputDecoration(
//                                 prefixIcon: Icon(Iconsax.eye_slash),
//                                 labelText: SText.password),
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwItems,
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: 24,
//                                 height: 24,
//                                 child: Checkbox(
//                                     value: true, onChanged: (value) {}),
//                               ),
//                               const SizedBox(
//                                 width: SSizes.spaceBtwItems,
//                               ),
//                               Text.rich(TextSpan(children: [
//                                 TextSpan(
//                                     text: SText.iAgree,
//                                     style:
//                                         Theme.of(context).textTheme.bodySmall),
//                                 TextSpan(
//                                     text: ' ${SText.privacy}  ',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium!
//                                         .apply(
//                                             color: dark
//                                                 ? Colors.white
//                                                 : Colors.blue,
//                                             decoration:
//                                                 TextDecoration.underline,
//                                             decorationColor: dark
//                                                 ? Colors.white
//                                                 : Colors.blue)),
//                                 TextSpan(
//                                     text: 'and',
//                                     style:
//                                         Theme.of(context).textTheme.bodySmall),
//                                 TextSpan(
//                                     text: ' ${SText.termCondition}  ',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium!
//                                         .apply(
//                                             color: dark
//                                                 ? Colors.white
//                                                 : Colors.blue,
//                                             decoration:
//                                                 TextDecoration.underline,
//                                             decorationColor: dark
//                                                 ? Colors.white
//                                                 : Colors.blue)),
//                               ])),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwItems,
//                           ),
//                           SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => OTP()));
//                                   },
//                                   child: Text('Create Account')))
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ssen_admin/Models/log_model.dart';
// import 'package:ssen_admin/Models/user_model.dart';
// import 'package:ssen_admin/Repository/firebase/model%20methods/firebase_user_methods.dart';
// import 'package:ssen_admin/Repository/firebase/service%20methods/auth/auth_methods.dart';
// import 'package:ssen_admin/responsive.dart';
// import 'package:ssen_admin/utils/constants.dart';
// import 'package:ssen_admin/utils/constants/size.dart';
// import 'package:ssen_admin/utils/constants/text_string.dart';
// import 'package:ssen_admin/utils/helper_function.dart';
// import 'package:ssen_admin/utils/utils.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//   static const route = "signup";

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   @override
//   Widget build(BuildContext context) {
//     final dark = SHelperFunction.isDarkMode(context);
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();
//     final phoneNumberController = TextEditingController();
//     final firstNameController = TextEditingController();
//     final lastNameController = TextEditingController();
//     Uint8List? _image;
//     bool _isLoading = false;
//     @override
//     void dispose() {
//       emailController.dispose();
//       passwordController.dispose();
//       phoneNumberController.dispose();

//       super.dispose();
//     }

//     void selectImage() async {
//       Uint8List im = await pickImage(ImageSource.gallery);
//       setState(() {
//         _image = im;
//       });
//     }

//     void signUpUser() async {
//       setState(() {
//         _isLoading = true;
//       });
//       // String res = await AuthMethods().signUpUser(user: user, password: password, file: file)
//       UserModel user = UserModel(
//           firstName: firstNameController.text.trim(),
//           lastName: lastNameController.text.trim(),
//           phoneNumber: phoneNumberController.text.trim(),
//           role: UserRole.user,
//           email: emailController.text.trim());
//       String res = await AuthMethods().signUpUser(
//         user: user,
//         password: passwordController.text,
//       );

//       // String res = await FirebaseAuthMethod().signUpUser(
//       //     firstName: firstNameController.text.trim(),
//       //     lastName: lastNameController.text.trim(),
//       //     password: passwordController.text,
//       //     email: emailController.text.trim(),
//       //     file: _image!);
//       setState(() {
//         _isLoading = false;
//       });
//       if (res != "success") {
//         showSnackBar(res, context);
//       } else {
//         showSnackBar(res, context);
//         Navigator.pushNamed(context, Responsive.route);
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back_ios_new_sharp),
//         title: Text("SignUp"),
//       ),
//       body: SingleChildScrollView(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (MediaQuery.of(context).size.width > phoneSize)
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width - 400,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage('asset/signup.jpg'))),
//               ),
//             Container(
//               width: 400,
//               child: Padding(
//                 padding: const EdgeInsets.all(SSizes.defaultSpace),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       SText.signUpTitle,
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),
//                     const SizedBox(
//                       height: SSizes.spaceBtwItems,
//                     ),
//                     Form(
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   controller: firstNameController,
//                                   decoration: const InputDecoration(
//                                       prefixIcon: Icon(Icons.people),
//                                       labelText: SText.firstName),
//                                 ),
//                               ),
//                               const SizedBox(
//                                 width: SSizes.spaceBtwInputField,
//                               ),
//                               Expanded(
//                                 child: TextFormField(
//                                   controller: lastNameController,
//                                   decoration: const InputDecoration(
//                                       prefixIcon: Icon(Icons.people),
//                                       labelText: SText.lastName),
//                                 ),
//                               )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwInputField,
//                           ),
//                           TextFormField(
//                             decoration: const InputDecoration(
//                                 prefixIcon: Icon(Icons.edit),
//                                 labelText: SText.userName),
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwInputField,
//                           ),
//                           TextFormField(
//                             controller: emailController,
//                             decoration: const InputDecoration(
//                                 prefixIcon: Icon(Icons.directions),
//                                 labelText: SText.email),
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwInputField,
//                           ),
//                           TextFormField(
//                             controller: phoneNumberController,
//                             decoration: const InputDecoration(
//                                 prefixIcon: Icon(Icons.call),
//                                 labelText: SText.phoneNumber),
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwInputField,
//                           ),
//                           TextFormField(
//                             controller: passwordController,
//                             decoration: const InputDecoration(
//                                 prefixIcon: Icon(Icons.remove_red_eye),
//                                 labelText: SText.password),
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwItems,
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: 24,
//                                 height: 24,
//                                 child: Checkbox(
//                                     value: true, onChanged: (value) {}),
//                               ),
//                               const SizedBox(
//                                 width: SSizes.spaceBtwItems,
//                               ),
//                               Text.rich(TextSpan(children: [
//                                 TextSpan(
//                                     text: SText.iAgree,
//                                     style:
//                                         Theme.of(context).textTheme.bodySmall),
//                                 TextSpan(
//                                     text: ' ${SText.privacy}  ',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium!
//                                         .apply(
//                                             color: dark
//                                                 ? Colors.white
//                                                 : Colors.blue,
//                                             decoration:
//                                                 TextDecoration.underline,
//                                             decorationColor: dark
//                                                 ? Colors.white
//                                                 : Colors.blue)),
//                                 TextSpan(
//                                     text: 'and',
//                                     style:
//                                         Theme.of(context).textTheme.bodySmall),
//                                 TextSpan(
//                                     text: ' ${SText.termCondition}  ',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium!
//                                         .apply(
//                                             color: dark
//                                                 ? Colors.white
//                                                 : Colors.blue,
//                                             decoration:
//                                                 TextDecoration.underline,
//                                             decorationColor: dark
//                                                 ? Colors.white
//                                                 : Colors.blue)),
//                               ])),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: SSizes.spaceBtwItems,
//                           ),
//                           SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                   onPressed: signUpUser,
//                                   child: _isLoading
//                                       ? const Center(
//                                           child: CircularProgressIndicator(
//                                             color: Colors.white,
//                                           ),
//                                         )
//                                       : const Text("Create account")))
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ssen_user/Models/log_model.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/Repository/firebase/service%20methods/auth/auth_methods.dart';
import 'package:ssen_user/screens/login.dart';

import '../responsive.dart';
import '../utils/utils.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  static const route = "signup";

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();

    super.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    // String res = await FirebaseAuthMethod().signUpUser(
    //     firstName: firstNameController.text.trim(),
    //     lastName: lastNameController.text.trim(),
    //     password: passwordController.text,
    //     email: emailController.text.trim(),
    //     file: _image!);
    UserModel user = UserModel(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        // phoneNumber: phoneNumberController.text.trim(),
        role: 'user',
        email: emailController.text.trim(),
        phoneNumber: '090000000000');
    String res = await AuthMethods().signUpUser(
        user: user, password: passwordController.text, file: _image!);
    setState(() {
      _isLoading = false;
    });
    if (res != "success") {
      showSnackBar(res, context);
    } else {
      showSnackBar(res, context);
      Navigator.pushNamed(context, Responsive.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: SafeArea(
            top: true,
            bottom: false,
            left: false,
            right: false,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      // AppBarButton(
                      //   callback: () => Navigator.pushReplacementNamed(
                      //       context, Index.route),
                      //   icon: Icons.arrow_back_ios_new_sharp,
                      // ),
                      const SizedBox(
                        width: 50,
                      ),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.orange,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      (_image != null)
                          ? Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white38, width: 5.0),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: MemoryImage(_image!))),
                            )
                          : Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white38, width: 5.0),
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('images/person6.jpg'))),
                            ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(
                              Icons.camera,
                              size: 30,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 405,
                    width: 370,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        // color: Colors.amber
                        border: Border.all(
                            color: const Color.fromARGB(47, 0, 0, 0),
                            width: 0.01,
                            style: BorderStyle.solid),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(19, 0, 0, 0),
                              offset: Offset(0.5, 0.5),
                              blurRadius: 0.5,
                              spreadRadius: 1),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0)
                        ]),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        children: [
                          TextField(
                            controller: firstNameController,
                            autofocus: false,
                            decoration: const InputDecoration(
                              label: Text('First Name'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: lastNameController,
                            autofocus: false,
                            decoration: const InputDecoration(
                              label: Text('Last Name'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: emailController,
                            autofocus: false,
                            decoration: const InputDecoration(
                              label: Text('Email or Phone Number'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: passwordController,
                            autofocus: false,
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text('Password'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: repasswordController,
                            autofocus: false,
                            obscureText: true,
                            decoration: const InputDecoration(
                              label: Text('Re-Password'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(color: Colors.orange),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 280,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: signUpUser,
                                    child: _isLoading
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : const Text("Sign up")),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 13),
                                child: IconButton(
                                  onPressed: () {
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (_) =>
                                    //         const FingerprintSignup());
                                  },
                                  icon: const Icon(
                                    Icons.fingerprint,
                                    size: 50,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 370,
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(
                                child: SizedBox(
                                    width: 40,
                                    child: Divider(
                                      thickness: 2,
                                    ))),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Text('Or Sign Up With'),
                            ),
                            Expanded(
                                child: SizedBox(
                                    width: 40,
                                    child: Divider(
                                      thickness: 2,
                                    )))
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.facebook),
                              color: Colors.orange,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook),
                                color: Colors.orange),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook),
                                color: Colors.orange),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook),
                                color: Colors.orange),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Already Have An Account?",
                          style: TextStyle(color: Color.fromARGB(64, 0, 0, 0)),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, Login.route),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
