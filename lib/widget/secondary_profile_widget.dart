import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/secondry_post_share.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/screens/secondary_user_profile.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/utils/utils.dart';

import '../../services/theme/text_theme.dart';

class SecondaryProfileWidget extends StatelessWidget {
  const SecondaryProfileWidget(
      {Key? key,
      required this.secondary,
      required this.company,
      required this.user})
      : super(key: key);
  final SecondryPostShareModel secondary;
  final CompanyProfileModel company;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: ((context) => SecondaryUserProfile())));
      },
      child: Card(
        elevation: 0.5,
        color: SColors.lighGrey,
        child: Container(
          height: 110,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              const SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  (user.profilePicture[0] != "")
                      ? CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              NetworkImage(getImage(user.profilePicture[0])),
                        )
                      : CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage('asset/default avatar.jpg'),
                        ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      company.name,
                      // style: STextTheme.lightTextTheme.bodySmall
                      //     ?.copyWith(color: Colors.blue),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Iconsax.dollar_circle,
                              color: Colors.blue,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${secondary.numberOfShare} shares to sell ",
                              style: STextTheme.lightTextTheme.bodySmall!
                                  .copyWith(color: Colors.blue),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Iconsax.dollar_circle,
                              color: Colors.blue,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${secondary.pricePerShare} birr unit price",
                              style: STextTheme.lightTextTheme.bodySmall!
                                  .copyWith(color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
