import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
// import 'package:ssen_user/custom_responsive.dart';
import 'package:ssen_user/screens/announcment_detail.dart';
// import 'package:ssen_user/screens/state%20pages/shareholders_subscribers.dart';
import 'package:ssen_user/utils/utils.dart';

import '../Models/announcement_model.dart';
import '../services/theme/text_theme.dart';
import '../utils/helper_function.dart';

class AnnouncmentWidget extends StatelessWidget {
  const AnnouncmentWidget({
    Key? key,
    required this.announcement,
    required this.company,
  }) : super(key: key);
  final AnnouncementModel announcement;
  final CompanyProfileModel company;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return GestureDetector(
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
                            width: MediaQuery.of(context).size.width * 0.6,
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
    );
  }
}
