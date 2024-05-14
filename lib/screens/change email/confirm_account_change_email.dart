import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ssen_user/utils/constants/colors.dart';

class ConfirmAccountChangeEmail extends StatefulWidget {
  const ConfirmAccountChangeEmail({super.key});
  static const route = "confirm_account_change_email";

  @override
  State<ConfirmAccountChangeEmail> createState() =>
      _ConfirmAccountChangeEmailState();
}

class _ConfirmAccountChangeEmailState extends State<ConfirmAccountChangeEmail> {
  final OTPController = TextEditingController();

  bool _isLoading = false;
  @override
  void dispose() {
    OTPController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: const Icon(Icons.menu, color: Colors.blue)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Confirm Account',
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.blue,
              fontSize: 27,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        top: true,
        bottom: false,
        left: false,
        right: false,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 370,
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 10),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter OTP",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: SColors.darkerGery),
                          ),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.blue),
                          controller: OTPController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          autofocus: false,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade300)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "please enter the otp that is sent to your on your new email account",
                            style: TextStyle(color: SColors.darkerGery),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 280,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: _isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text("Confirm")),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
