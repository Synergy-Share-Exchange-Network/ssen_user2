import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ssen_user/Repository/firebase/service%20methods/auth/auth_methods.dart';
import 'package:ssen_user/responsive.dart';
import 'package:ssen_user/screens/signup.dart';

import '../utils/helper_function.dart';
import '../utils/utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const route = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    // String res = await FirebaseAuthMethod().loginUser(
    //     email: emailController.text.trim(), password: passwordController.text);
    String res = await AuthMethods().loginUser(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });
    if (res != "Success") {
      showSnackBar(res, context);
    } else {
      showSnackBar(res, context);
      Navigator.pushNamed(context, Responsive.route);
      print("Should be logging");
    }
  }

  @override
  Widget build(BuildContext context) {
     final dark = SHelperFunction.isDarkMode(context);
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
                        'Log In',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.blue,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration:  BoxDecoration(
                        // border: Border.all(
                        //     color: Color.fromARGB(198, 255, 153, 0),
                        //     width: 10.0),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(dark
                              ? 'asset/logo_image/Synergydark.png'
                              : 'asset/logo_image/Synergylight.png'))),
                  ),
                  // Container(
                  //   width: 150,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(
                  //     color: Colors.orange,
                  //     width: 3.0,
                  //   )),
                  //   child: const Center(
                  //     child:
                  //      Text(
                  //       'Geze',
                  //       style: TextStyle(
                  //           decoration: TextDecoration.none,
                  //           color: Colors.orange,
                  //           fontSize: 50,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // ),
                  const Text(
                    'Synergy Share Exchage and Donation platform',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Color.fromARGB(96, 0, 0, 0),
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    // height: 280,
                    width: 370,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        // color: Colors.amber
                        border: Border.all(
                            color: Color.fromARGB(46, 177, 165, 165),
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
                            obscureText: true,
                            autofocus: false,
                            decoration: const InputDecoration(
                              label: Text('Password'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(color: Colors.blue),
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
                                    onPressed: loginUser,
                                    child: (_isLoading)
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text("Sign in")),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 13),
                                child: IconButton(
                                  onPressed: () {
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (_) =>
                                    //         const FingerprintLogin());
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
                              child: Text('Or LogIn With'),
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
                              color: Colors.blue,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook),
                                color: Colors.blue),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook),
                                color: Colors.blue),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.facebook),
                                color: Colors.blue),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Don't Have An Account?",
                          style: TextStyle(color: Color.fromARGB(64, 0, 0, 0)),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, Signup.route),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:ssen_user/Screens/signup.dart';
// import 'package:ssen_user/utils/constants.dart';
// import 'package:ssen_user/utils/constants/colors.dart';
// import 'package:ssen_user/utils/constants/image_Strings.dart';
// import 'package:ssen_user/utils/constants/text_string.dart';
// import 'package:ssen_user/utils/helper_function.dart';

// import '../utils/constants/size.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = SHelperFunction.isDarkMode(context);
//     return Scaffold(
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
//                         image: AssetImage('asset/login.jpg'))),
//               ),
//             Container(
//               width: 400,
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     top: SSizes.appBarHeight,
//                     bottom: SSizes.defaultSpace,
//                     left: SSizes.defaultSpace,
//                     right: SSizes.defaultSpace),
//                 child: Column(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image(
//                           height: 100,
//                           image: AssetImage(dark
//                               ? SImages.darkAppLogo
//                               : SImages.lightAppLogo),
//                         ),
//                         Text(
//                           SText.loginScreenTitle,
//                           style: Theme.of(context).textTheme.headlineMedium,
//                         ),
//                         const SizedBox(
//                           height: SSizes.sm,
//                         ),
//                         Text(
//                           SText.loginScreenSubTitle,
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                       ],
//                     ),
//                     Form(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: SSizes.spaceBtwSections),
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               decoration: const InputDecoration(
//                                   prefixIcon: Icon(Iconsax.direct_right),
//                                   labelText: SText.email),
//                             ),
//                             const SizedBox(
//                               height: SSizes.spaceBtwInputField,
//                             ),
//                             TextFormField(
//                               decoration: const InputDecoration(
//                                   suffixIcon: Icon(Iconsax.eye_slash),
//                                   prefixIcon: Icon(Iconsax.password_check),
//                                   labelText: SText.password),
//                             ),
//                             const SizedBox(
//                               height: SSizes.spaceBtwInputField / 2,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Checkbox(
//                                         value: true, onChanged: (value) {}),
//                                     const Text(SText.rememberMe)
//                                   ],
//                                 ),
//                                 TextButton(
//                                     onPressed: () {},
//                                     child: const Text(SText.forgetPassword))
//                               ],
//                             ),
//                             const SizedBox(
//                               height: SSizes.spaceBtwSections,
//                             ),
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: () {},
//                                 child: const Text(SText.signIn),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: SSizes.spaceBtwItems,
//                             ),
//                             SizedBox(
//                               width: double.infinity,
//                               child: OutlinedButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const SignUp()));
//                                   },
//                                   child: const Text(SText.signUp)),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Flexible(
//                             child: Divider(
//                           color: dark ? SColors.darkeGery : SColors.dark,
//                           thickness: 0.5,
//                           indent: 60,
//                           endIndent: 5,
//                         )),
//                         const Text('Or Sign With '),
//                         Flexible(
//                             child: Divider(
//                           color: dark ? SColors.darkeGery : SColors.dark,
//                           thickness: 0.5,
//                           indent: 5,
//                           endIndent: 60,
//                         )),
//                       ],
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
// import 'package:flutter/material.dart';
// import 'package:ssen_admin/screens/signup.dart';
// import 'package:ssen_admin/utils/constants.dart';
// import 'package:ssen_admin/utils/constants/image_Strings.dart';
// import 'package:ssen_admin/utils/constants/text_string.dart';
// import 'package:ssen_admin/utils/helper_function.dart';

// import '../utils/constants/colors.dart';
// import '../utils/constants/size.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//   static const route = "login";

//   @override
//   Widget build(BuildContext context) {
//     final dark = SHelperFunction.isDarkMode(context);
//     return Scaffold(
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
//                         image: AssetImage('asset/login.jpg'))),
//               ),
//             Container(
//               width: 400,
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     top: SSizes.appBarHeight,
//                     bottom: SSizes.defaultSpace,
//                     left: SSizes.defaultSpace,
//                     right: SSizes.defaultSpace),
//                 child: Column(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image(
//                           height: 100,
//                           image: AssetImage(dark
//                               ? SImages.darkAppLogo
//                               : SImages.lightAppLogo),
//                         ),
//                         Text(
//                           SText.loginScreenTitle,
//                           style: Theme.of(context).textTheme.headlineMedium,
//                         ),
//                         const SizedBox(
//                           height: SSizes.sm,
//                         ),
//                         Text(
//                           SText.loginScreenSubTitle,
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                       ],
//                     ),
//                     Form(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: SSizes.spaceBtwSections),
//                         child: Column(
//                           children: [
//                             TextFormField(
//                               decoration: const InputDecoration(
//                                   prefixIcon: Icon(Icons.arrow_right),
//                                   labelText: SText.email),
//                             ),
//                             const SizedBox(
//                               height: SSizes.spaceBtwInputField,
//                             ),
//                             TextFormField(
//                               decoration: const InputDecoration(
//                                   suffixIcon: Icon(Icons.remove_red_eye),
//                                   prefixIcon: Icon(Icons.password),
//                                   labelText: SText.password),
//                             ),
//                             const SizedBox(
//                               height: SSizes.spaceBtwInputField / 2,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Checkbox(
//                                         value: true, onChanged: (value) {}),
//                                     const Text(SText.rememberMe)
//                                   ],
//                                 ),
//                                 TextButton(
//                                     onPressed: () {},
//                                     child: const Text(SText.forgetPassword))
//                               ],
//                             ),
//                             const SizedBox(
//                               height: SSizes.spaceBtwSections,
//                             ),
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: () {},
//                                 child: const Text(SText.signIn),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: SSizes.spaceBtwItems,
//                             ),
//                             SizedBox(
//                               width: double.infinity,
//                               child: OutlinedButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const Signup()));
//                                   },
//                                   child: const Text(SText.signUp)),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Flexible(
//                             child: Divider(
//                           color: dark ? SColors.darkeGery : SColors.dark,
//                           thickness: 0.5,
//                           indent: 60,
//                           endIndent: 5,
//                         )),
//                         const Text('Or Sign With '),
//                         Flexible(
//                             child: Divider(
//                           color: dark ? SColors.darkeGery : SColors.dark,
//                           thickness: 0.5,
//                           indent: 5,
//                           endIndent: 60,
//                         )),
//                       ],
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
