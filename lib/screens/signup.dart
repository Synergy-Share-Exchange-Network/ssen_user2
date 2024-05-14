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
