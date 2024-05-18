import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/screens/FAQ.dart';
import 'package:ssen_user/screens/about.dart';
import 'package:ssen_user/screens/login.dart';
import 'package:ssen_user/screens/terms%20and%20condition.dart';
import 'package:ssen_user/widget/setting_elements_widget.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);
  static const route = "Setting";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                size: 20, color: Colors.blue)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.blue,
            // fontSize: 27,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SettingElementsWidget(
              description: 'Frequently Asked Questions',
              icon: Icons.question_mark_outlined,
              name: 'FAQs',
              onpress: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: ((context) => Faq())));
              },
              // function: () {
              //   print("go to faq");
              // },
            ),
            SettingElementsWidget(
              description: 'terms of use, terms of service, or user agreements',
              icon: Icons.format_align_justify,
              name: 'Term And Condition',
              onpress: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) => TermAndCondition())));
              },
              // function: () {
              //   print("go to term and condition");
              // },
            ),
            SettingElementsWidget(
              description: 'description about the system',
              icon: Icons.info,
              name: 'About',
              onpress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => About())));
              },
              // function: () {
              //   print("go to faq");
              // },
            ),
            SettingElementsWidget(
              description: 'a set of predefined styles ',
              icon: Icons.palette,
              name: 'Themes',
              onpress: () {},
              // function: () {
              //   print("go to faq");
              // },
            ),
            SettingElementsWidget(
              description:
                  'retrieving the latest versions of software updates ',
              icon: Icons.update,
              name: 'Check for update',
              onpress: () {},
              // function: () {
              //   print("go to faq");
              // },
            ),
            SettingElementsWidget(
              description: 'terminating the users current session ',
              icon: Icons.logout,
              name: 'Log out',
              onpress: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Log out"),
                    content: const Text("Are You sure you want to log out?"),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Container(
                              // color: Colors.green,
                              padding: const EdgeInsets.all(14),
                              child: const Text("Cancel"),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushReplacementNamed(
                                  context, Login.route);
                            },
                            child: Container(
                              // color: Colors.green,
                              padding: const EdgeInsets.all(14),
                              child: const Text("Okay"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              // function: () {
              //   print("go to faq");
              // },
            ),
          ],
        ),
      ),
    );
  }
}
