import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/log_model.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/provider/user_provider.dart';
import 'package:ssen_user/utils/constants.dart';

import '../utils/constants/colors.dart';
import '../utils/constants/size.dart';
import '../utils/constants/text_string.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // UserModel user = UserModel(
    //   identification: "99",
    //   firstName: "dawit",
    //   lastName: "nigus",
    //   phoneNumber: "0942378653",
    //   email: "dawitnigus55@gmail.com",
    //   region: "oromia",
    //   woreda: "02",
    //   profilePicture: ["asset/demo_image/demo1.JPG"],
    //   address: ["bishoftu"],
    //   role: UserRole.user,
    // );
    UserModel user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
        appBar: (MediaQuery.of(context).size.width < phoneSize)
            ? AppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_sharp),
                ),
                title: Text(
                  SText.Editprofile,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                centerTitle: true,
              )
            : AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: SSizes.defaultSpace,
                  vertical: SSizes.defaultSpace),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(
                                image: AssetImage(user.profilePicture[0])),
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
                              Icons.camera_alt_sharp,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.call),
                            labelText: user.firstName),
                      ),
                    ],
                  ),
                  //// e
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.call),
                            labelText: user.lastName),
                      ),
                    ],
                  ),
                  //// end
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.call),
                            labelText: user.email),
                      ),
                    ],
                  ),
                  //// end
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.call),
                            labelText: user.region),
                      ),
                    ],
                  ),
                  //// end
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.call),
                            labelText: user.woreda),
                      ),
                    ],
                  ),
                  //// end
                  const SizedBox(
                    height: SSizes.spaceBtwInputField,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.call),
                            labelText: user.address[0]),
                      ),
                    ],
                  ),
                  //// end
                ],
              ),
            ),
          ),
        ));
  }
}
