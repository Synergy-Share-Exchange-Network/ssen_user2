import 'package:flutter/material.dart';
import 'package:ssen_user/screens/change%20password/confirm_account.dart';
import 'package:ssen_user/utils/constants/colors.dart';

class EnterNewPassword extends StatefulWidget {
  const EnterNewPassword({super.key});
  static const route = "enter_new_password";

  @override
  State<EnterNewPassword> createState() => _EnterNewPasswordState();
}

class _EnterNewPasswordState extends State<EnterNewPassword> {
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();

  bool _isLoading = false;
  @override
  void dispose() {
    passwordController.dispose();
    repasswordController.dispose();

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
            icon: const Icon(
              Icons.menu,
              color: Colors.blue,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Change Password',
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
                            "Enter New Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: SColors.darkerGery),
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          autofocus: false,
                          style: TextStyle(color: Colors.blue),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade300)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Confirm Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: SColors.darkerGery),
                          ),
                        ),
                        TextField(
                          style: TextStyle(color: Colors.blue),
                          controller: repasswordController,
                          autofocus: false,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue.shade300)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 280,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, ConfirmAccount.route),
                              child: _isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text("Next")),
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
