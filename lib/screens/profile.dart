import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/Screens/edit_profile.dart';
import 'package:ssen_user/provider/user_provider.dart';
import 'package:ssen_user/screens/assets.dart';
import 'package:ssen_user/screens/history.dart';
import 'package:ssen_user/screens/login.dart';
import 'package:ssen_user/screens/setting.dart';
import 'package:ssen_user/services/theme/text_theme.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/utils/constants/size.dart';
import 'package:ssen_user/utils/constants/text_string.dart';

import '../utils/constants/navbar.dart';
import '../utils/helper_function.dart';
import '../utils/utils.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = SHelperFunction.isDarkMode(context);
    UserModel user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      drawer: NavBar(),
      appBar: (MediaQuery.of(context).size.width > phoneSize)
          ? PreferredSize(preferredSize: Size.zero, child: AppBar())
          : AppBar(
              actions: const [
                Icon(Iconsax.notification),
                SizedBox(
                  width: 10,
                ),
                Icon(Iconsax.search_normal),
                SizedBox(
                  width: 20,
                )
              ],
              backgroundColor:
                  (!isDark) ? SColors.lighGrey : SColors.homePageNavBar,

              // elevation: 1,
            ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 600,
            padding: const EdgeInsets.all(SSizes.defaultSpace),
            child: Column(
              children: [
                Stack(children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: (user.profilePicture[0] != "")
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(
                                image: NetworkImage(
                                    getImage(user.profilePicture[0]))),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(
                                image: AssetImage('asset/default avatar.jpg')),
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: SColors.primaryColor),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${SText.firstName}: ${user.firstName} ${user.lastName}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '${SText.shares} :1000',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditProfile()));
                        },
                        child: const Text('Edit profile'))),
                const SizedBox(
                  height: 30,
                ),
                ProfileMenuWidget(
                    endicon: true,
                    icon: Iconsax.eye,
                    onpress: () {},
                    textcolor: Colors.blue,
                    title: 'Preview'),
                const SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                ProfileMenuWidget(
                    endicon: true,
                    icon: Iconsax.people,
                    onpress: () {},
                    textcolor: Colors.blue,
                    title: 'Posts'),
                const SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                ProfileMenuWidget(
                    endicon: true,
                    icon: Iconsax.data,
                    onpress: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: ((context) => History())));
                    },
                    textcolor: Colors.blue,
                    title: 'History'),
                const SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                ProfileMenuWidget(
                    endicon: true,
                    icon: Iconsax.setting,
                    onpress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Assets())));
                    },
                    textcolor: Colors.blue,
                    title: 'Assets'),
                const SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                ProfileMenuWidget(
                    endicon: true,
                    icon: Iconsax.setting,
                    onpress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) => Setting())));
                    },
                    textcolor: Colors.blue,
                    title: 'Setting'),
                const SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                ProfileMenuWidget(
                    endicon: false,
                    icon: Iconsax.logout,
                    onpress: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Log out"),
                          content:
                              const Text("Are You sure you want to log out?"),
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
                    textcolor: Colors.red,
                    title: 'Sign Out')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onpress;
  final bool endicon;
  final Color? textcolor;
  const ProfileMenuWidget(
      {super.key,
      required this.endicon,
      required this.icon,
      required this.onpress,
      required this.textcolor,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            width: 1, color: Colors.grey), // Adjust border properties as needed
      ),
      child: ListTile(
          onTap: onpress,
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.blue.withOpacity(0.1),
            ),
            child: Icon(
              icon,
              color: SColors.primary,
              size: 30,
            ),
          ),
          title: Text(
            title,
            style: dark
                ? STextTheme.darkTextTheme.bodyLarge
                : STextTheme.lightTextTheme.bodyLarge,
          ),
          trailing: endicon
              ? Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.grey,
                  ),
                )
              : null),
    );
  }
}
