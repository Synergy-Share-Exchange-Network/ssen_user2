import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/services/theme/text_theme.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/widget/analytics/graph1_mini.dart';
import 'package:ssen_user/widget/analytics/graph2.dart';

import '../screens/share_detail.dart';
import '../screens/state pages/company_profile.dart';
import '../utils/constants.dart';
import '../utils/helper_function.dart';
import 'analytics/graph1.dart';
import 'analytics/graph_share_widget.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget({Key? key, required this.company, required this.share})
      : super(key: key);
  final CompanyProfileModel company;
  final ShareModel share;

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return (MediaQuery.of(context).size.width < phoneSize)
        ? GestureDetector(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShareDetail(
                            company: company,
                            share: share,
                          )));
            }),
            child: Container(
              height: 110,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: dark ? SColors.darkContainer : SColors.lightContainer,
                border: Border.all(
                  width: 3,
                  color: dark ? SColors.darkContainer : SColors.lightContainer,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  (company.logoImage[0] != '')
                      ? Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 3),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(company.logoImage[0]))),
                        )
                      : Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 3),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'asset/default avatar.jpg'))),
                        ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(company.name,
                                  style: dark
                                      ? STextTheme.darkTextTheme.headlineSmall
                                          ?.copyWith(fontSize: 15.0)
                                      : STextTheme.lightTextTheme.headlineSmall
                                          ?.copyWith(fontSize: 15.0)),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 15,
                                width: 60,
                                child: graph1mini(id: company.identification),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                company.locationDescription,
                                style: dark
                                    ? STextTheme.darkTextTheme.bodySmall
                                        ?.copyWith(fontSize: 11)
                                    : STextTheme.lightTextTheme.bodySmall
                                        ?.copyWith(fontSize: 11),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: PercentIndicator(
                                company: company, lineheight: 2.0),
                            // child: LinearPercentIndicator(
                            //   animation: true,
                            //   animationDuration: 2000,
                            //   lineHeight: 2,
                            //   percent: 0.8,
                            //   progressColor: Colors.green,
                            //   backgroundColor: Colors.green.shade200,
                            // ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 151, 213, 242),
                                borderRadius: BorderRadius.circular(3)),
                            child: Text(
                                "Latest price: Br ${share.unitSharePrice}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShareDetail(
                            company: company,
                            share: share,
                          )));
            },
            child: Container(
              height: 110,
              width: MediaQuery.of(context).size.width * 0.6,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: dark ? SColors.darkContainer : SColors.lightContainer,
                border: Border.all(
                  width: 1,
                  color: dark ? Colors.black : Colors.white,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  (company.logoImage[0] != '')
                      ? Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 3),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(company.logoImage[0]))),
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 3),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'asset/default avatar.jpg'))),
                        ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShareDetail(
                                      company: company,
                                      share: share,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  company.name,
                                  style: dark
                                      ? STextTheme.darkTextTheme.headlineSmall
                                      : STextTheme.lightTextTheme.headlineSmall,
                                ),
                                Container(
                                  height: 30,
                                  width: 100,
                                  child: graph1mini(id: company.identification),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  company.locationDescription,
                                  style: dark
                                      ? STextTheme.darkTextTheme.bodySmall
                                      : STextTheme.lightTextTheme.bodySmall,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: PercentIndicator(
                                  company: company, lineheight: 6.0),

                              // child: LinearPercentIndicator(
                              //   animation: true,
                              //   animationDuration: 2000,
                              //   lineHeight: 6,
                              //   percent: 0.8,
                              //   progressColor: Colors.green,
                              //   backgroundColor: Colors.green.shade200,
                              // ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 1),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 151, 213, 242),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Text(
                                  "Latest price: Br ${share.unitSharePrice}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
