import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/Repository/firebase/service%20methods/firebase_company_service_method.dart';
import 'package:ssen_user/provider/user_provider.dart';
// import 'package:ssen_user/custom_responsive.dart';
import 'package:ssen_user/screens/announcment_detail.dart';
// import 'package:ssen_user/screens/state%20pages/shareholders_subscribers.dart';
import 'package:ssen_user/utils/utils.dart';

import '../Models/announcement_model.dart';
import '../services/theme/text_theme.dart';
import '../utils/helper_function.dart';

class AnnouncmentWithCompanyWidget extends StatelessWidget {
  const AnnouncmentWithCompanyWidget({
    Key? key,
    required this.announcement,
    required this.company,
  }) : super(key: key);
  final AnnouncementModel announcement;
  final CompanyProfileModel company;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    UserModel user = Provider.of<UserProvider>(context).getUser;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromARGB(17, 0, 0, 0), width: 1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          InkWell(
            // onTap: () =>
            //     Navigator.pushNamed(context, ChannelShop.route),
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(company.logoImage.isNotEmpty
                            ? company.logoImage[0]
                            : 'https://via.placeholder.com/45'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          company.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          company.lineOfBusiness ?? 'No description available',
                          style: const TextStyle(
                            color: Color.fromARGB(120, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // (!company.subscribersID.contains(user.identification))
                  //     ? Container(
                  //         width: 160,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //           style: ElevatedButton.styleFrom(
                  //             primary: Colors.blueAccent,
                  //           ),
                  //           onPressed: () async {
                  //             await FirebaseCompanyServiceMethod()
                  //                 .subscribeUser(company, user);
                  //             await Provider.of<UserProvider>(context,
                  //                     listen: false)
                  //                 .refreshUser();
                  //           },
                  //           child: const Text(
                  //             "Subscribe",
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.normal,
                  //               fontSize: 20,
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //     : Container(
                  //         width: 160,
                  //         height: 40,
                  //         child: ElevatedButton(
                  //           style: ElevatedButton.styleFrom(
                  //             primary: Colors.blueAccent,
                  //           ),
                  //           onPressed: () async {
                  //             await FirebaseCompanyServiceMethod()
                  //                 .unSubscribeUser(company, user);
                  //             await Provider.of<UserProvider>(context,
                  //                     listen: false)
                  //                 .refreshUser();
                  //           },
                  //           child: const Text(
                  //             "UnSubscribe",
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.normal,
                  //               fontSize: 20,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AnnouncementDetail(
                          announcement: announcement,
                          company: company,
                        )),
              );
              //   Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AnnouncementDetail()),
              // );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 135,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        getImage(announcement.images[0])))),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.pink,
                            margin: EdgeInsets.all(5),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  announcement.title,
                                  maxLines:
                                      1, // Adjust the number of lines you want to show initially
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  // height: 90,
                                  child: Text(
                                    announcement.content,
                                    maxLines:
                                        3, // Adjust the number of lines you want to show initially
                                    overflow: TextOverflow.ellipsis,
                                    style: dark
                                        ? STextTheme.darkTextTheme.bodySmall
                                        : STextTheme.lightTextTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
