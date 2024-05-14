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
