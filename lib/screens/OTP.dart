// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pinput/pinput.dart';

// class OTP extends StatefulWidget {
//   const OTP({super.key});
//   static const route = "otp";

//   @override
//   State<OTP> createState() => _OTPState();
// }

// class _OTPState extends State<OTP> {
//   final OTPController = TextEditingController();

//   bool _isLoading = false;
//   @override
//   void dispose() {
//     OTPController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text('Pinput Example'),
//         centerTitle: true,
//         titleTextStyle: const TextStyle(
//           fontSize: 22,
//           fontWeight: FontWeight.w600,
//           color: Color.fromRGBO(30, 60, 87, 1),
//         ),
//       ),
//       body: const FractionallySizedBox(
//         widthFactor: 1,
//         child: PinputExample(),
//       ),
//     );
//   }
// }

// /// This is the basic usage of Pinput
// /// For more examples check out the demo directory
// class PinputExample extends StatefulWidget {
//   const PinputExample({Key? key}) : super(key: key);

//   @override
//   State<PinputExample> createState() => _PinputExampleState();
// }

// class _PinputExampleState extends State<PinputExample> {
//   final pinController = TextEditingController();
//   final focusNode = FocusNode();
//   final formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     pinController.dispose();
//     focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const focusedBorderColor = Colors.blue;
//     const fillColor = Color.fromARGB(45, 33, 149, 243);
//     const borderColor = Colors.grey;

//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: const TextStyle(
//         fontSize: 22,
//         color: Color.fromRGBO(30, 60, 87, 1),
//       ),
//       decoration: BoxDecoration(
//         color: Color.fromARGB(19, 158, 158, 158),
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: borderColor),
//       ),
//     );

//     /// Optionally you can use form to validate the Pinput
//     return Form(
//       key: formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text("Verification",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25)),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text("Enter The code that is sent to the number",
//               style: TextStyle(
//                   color: Colors.grey,
//                   fontWeight: FontWeight.normal,
//                   fontSize: 15)),
//           const Text("+251939658475",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15)),
//           const SizedBox(
//             height: 40,
//           ),
//           Pinput(
//             length: 6,
//             controller: pinController,
//             focusNode: focusNode,
//             androidSmsAutofillMethod:
//                 AndroidSmsAutofillMethod.smsUserConsentApi,
//             listenForMultipleSmsOnAndroid: true,
//             defaultPinTheme: defaultPinTheme,
//             validator: (value) {
//               return value == '2222' ? null : 'Pin is incorrect';
//             },
//             hapticFeedbackType: HapticFeedbackType.lightImpact,
//             onCompleted: (pin) {
//               debugPrint('onCompleted: $pin');
//             },
//             onChanged: (value) {
//               debugPrint('onChanged: $value');
//             },
//             cursor: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(bottom: 9),
//                   width: 22,
//                   height: 1,
//                   color: focusedBorderColor,
//                 ),
//               ],
//             ),
//             focusedPinTheme: defaultPinTheme.copyWith(
//               decoration: defaultPinTheme.decoration!.copyWith(
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: focusedBorderColor),
//               ),
//             ),
//             submittedPinTheme: defaultPinTheme.copyWith(
//               decoration: defaultPinTheme.decoration!.copyWith(
//                 color: fillColor,
//                 borderRadius: BorderRadius.circular(19),
//                 border: Border.all(color: focusedBorderColor),
//               ),
//             ),
//             errorPinTheme: defaultPinTheme.copyBorderWith(
//               border: Border.all(color: Colors.redAccent),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text("Didn't receive code?",
//               style: TextStyle(
//                   color: Color.fromARGB(255, 8, 67, 116),
//                   fontWeight: FontWeight.normal,
//                   fontSize: 15)),
//           TextButton(
//               onPressed: () {},
//               child: const Text(
//                 "Resend",
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 8, 67, 116),
//                   decoration: TextDecoration.underline,
//                   decorationColor: Color.fromARGB(255, 8, 67, 116),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
