import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/provider/user_provider.dart';
import 'package:ssen_user/screens/edit_profile.dart';
import 'package:ssen_user/screens/login.dart';
import 'package:ssen_user/screens/terms%20and%20condition.dart';
import 'package:ssen_user/utils/utils.dart';

import '../../screens/desktop_responsive.dart';

import '../../screens/setting.dart';
import '../../screens/state pages/process.dart';
import 'image_Strings.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).getUser;

    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 10),
              // const Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       "Wubet Ayalew",
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     )),
              const SizedBox(
                height: 20,
              ),

              Center(
                child: InkWell(
                  onTap: () {
                    // print('fddddddddddddddddddddddddddddddddd');
                    // print(user.toString());
                    // print(user.profilePicture[0]);
                    Navigator.pop(context);
                  },
                  child: (user.profilePicture[0] != "")
                      ? Container(
                          width: 130,
                          height: 130,
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 3),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      getImage(user.profilePicture[0])))),
                        )
                      : Container(
                          width: 130,
                          height: 130,
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 3),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('asset/default avatar.jpg'))),
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: InkWell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${user.firstName} ${user.lastName}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(user.email)
                    ],
                  ),
                ),
              ),

              const Divider(),
              DrawerItem(
                icon: Icons.person,
                title: "Edit Profile",
                callback: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
              ),
              DrawerItem(
                icon: Icons.location_on,
                title: "Process",
                callback: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProcessPage()));
                },
              ),
              DrawerItem(
                icon: Icons.info,
                title: "About Us",
                callback: () {
                  // setState(() {
                  //   index = 7;
                  // });
                  Navigator.pop(context);
                  // Navigator.pushNamed(context, AboutUs.route);
                },
              ),
              DrawerItem(
                icon: Icons.logout,
                title: "Log Out",
                callback: () {
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
              ),
              DrawerItem(
                icon: Icons.exit_to_app,
                title: "Exit",
                callback: () {
                  // setState(() {
                  //   index = 9;
                  // });
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              DrawerItem(
                icon: Icons.settings,
                title: "Settings",
                callback: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Setting.route);
                },
              ),

              DrawerItem(
                icon: Icons.format_align_center,
                title: "Terms and Condition",
                callback: () {
                  // setState(() {
                  //   index = 11;
                  // });

                  // Navigator.pop(context);
                  Navigator.pushNamed(context, TermsAndConditionsPage.route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class CustomDrawer extends StatefulWidget {
//   const CustomDrawer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CustomDrawer> createState() => _CustomDrawerState();
// }

// class _CustomDrawerState extends State<CustomDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     // UserModel user = Provider.of<UserProvider>(context).getUser;

//     return Drawer(
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 30,
//             ),
//             InkWell(
//               // onTap: () => Navigator.pushNamed(context, ProfilePageState.route),
//               child: Container(
//                 width: 130,
//                 height: 130,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.orange, width: 3),
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(
//                            ''))),
//                 // child: FadeInImage.assetNetwork(
//                 //     fit: BoxFit.cover,
//                 //     placeholder: user.image![0].split('<thumbnail>')[1],
//                 //     image: user.image![0].split('<thumbnail>')[0]),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             InkWell(

//                     // Navigator.pushNamed(context, ProfilePageState.route),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "",
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Text("user.email!")
//                   ],
//                 )),
//             const Divider(),
//             InkWell(
//               // onTap: () => Navigator.pushNamed(context, ProfilePageState.route),
//               child: Row(
//                 children: const [
//                   Icon(Icons.person, color: Colors.orange),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Text(
//                     "Edit Profile",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   Expanded(child: SizedBox()),
//                   Icon(
//                     Icons.keyboard_arrow_right_outlined,
//                     color: Colors.orange,
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             InkWell(
//               // onTap: () => Navigator.pushNamed(context, Location.route),
//               child: Row(
//                 children: const [
//                   Icon(
//                     Icons.location_on,
//                     color: Colors.orange,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text("My Adderss", style: TextStyle(fontSize: 16)),
//                   Expanded(child: SizedBox()),
//                   Icon(
//                     Icons.keyboard_arrow_right_outlined,
//                     color: Colors.orange,
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Divider(),
//             InkWell(
//               // onTap: () => Navigator.pushNamed(context, AboutUs.route),
//               child: Row(
//                 children: const [
//                   Icon(Icons.info, color: Colors.orange),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text("About Us", style: TextStyle(fontSize: 16)),
//                   Expanded(child: SizedBox()),
//                   Icon(
//                     Icons.keyboard_arrow_right_outlined,
//                     color: Colors.orange,
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (ctx) => AlertDialog(
//                     title: const Text("Log out"),
//                     content: const Text("Are You sure you want to log out?"),
//                     actions: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(ctx).pop();
//                             },
//                             child: Container(
//                               // color: Colors.green,
//                               padding: const EdgeInsets.all(14),
//                               child: const Text("Cancel"),
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               // FirebaseAuth.instance.signOut();
//                               // Navigator.pushReplacementNamed(
//                               //     context, Login.route);
//                             },
//                             child: Container(
//                               // color: Colors.green,
//                               padding: const EdgeInsets.all(14),
//                               child: const Text("Okay"),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: Row(
//                 children: const [
//                   Icon(Icons.logout, color: Colors.orange),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text("Log Out", style: TextStyle(fontSize: 16)),
//                   Expanded(child: SizedBox()),
//                   Icon(
//                     Icons.keyboard_arrow_right_outlined,
//                     color: Colors.orange,
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             InkWell(
//               // onTap: () => Navigator.pushNamed(context, CommingSoon.route),
//               child: Row(
//                 children: const [
//                   Icon(Icons.exit_to_app_outlined, color: Colors.orange),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text("Exit", style: TextStyle(fontSize: 16)),
//                   Expanded(child: SizedBox()),
//                   Icon(
//                     Icons.keyboard_arrow_right_outlined,
//                     color: Colors.orange,
//                   )
//                 ],
//               ),
//             ),
//             const Expanded(child: SizedBox()),
//             // const Divider(),
//             InkWell(
//               // onTap: () => Navigator.pushNamed(context, Setting.route),
//               child: Row(
//                 children: const [
//                   Icon(Icons.settings, color: Colors.orange),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "Settings",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             InkWell(
//               // onTap: () => Navigator.pushNamed(context, TermAndCondition.route),
//               child: Row(
//                 children: const [
//                   Icon(Icons.format_align_center, color: Colors.orange),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "Terms and Condition",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Center(
//                 child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Text(
//                       "All Right reserved",
//                       style: TextStyle(fontSize: 10),
//                     ),
//                     Icon(
//                       Icons.copyright,
//                       size: 15,
//                     )
//                   ],
//                 ),
//                 const Text(
//                   "Geze Online Marketig System.",
//                   style: TextStyle(fontSize: 10),
//                 ),
//               ],
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
