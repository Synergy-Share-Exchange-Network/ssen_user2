import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/screens/donation_detail.dart';
import 'package:ssen_user/services/theme/text_theme.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/utils/constants/colors.dart';

import '../utils/helper_function.dart';
import '../utils/utils.dart';
import 'analytics/graph_share_widget.dart';

class DonationWidget extends StatelessWidget {
  const DonationWidget({Key? key, required this.company}) : super(key: key);
  final CompanyProfileModel company;

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);

    return (MediaQuery.of(context).size.width < phoneSize)
        ? InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DonationDetail(
                            company: company,
                          )));
            },
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

              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(14),
              //   border: Border.all(
              //       width: 1,
              //       color: Colors.grey), // Adjust border properties as needed
              // ),
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
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                company.name,
                                style: STextTheme.lightTextTheme.headlineSmall,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width >
                                        phoneSize)
                                    ? 300
                                    : 80,
                              ),
                              Container(
                                height: (MediaQuery.of(context).size.width >
                                        phoneSize)
                                    ? 30
                                    : 30,
                                width: (MediaQuery.of(context).size.width >
                                        phoneSize)
                                    ? 100
                                    : 43,
                              ) // child: LineChartgraphShare())
                            ],
                          ),
                          Row(
                            children: [
                              Text(company.email,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Iconsax.location,
                                // color: Colors.black,
                                size: 11,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                company.locationDescription,
                                // style: STextTheme.lightTextTheme.bodySmall
                                //     ?.copyWith(color: Colors.blue),
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : InkWell(
            onTap: () {},
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

              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(14),
              //   border: Border.all(
              //       width: 1,
              //       color: Colors.grey), // Adjust border properties as needed
              // ),
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
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                company.name,
                                style: STextTheme.lightTextTheme.headlineSmall,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width >
                                        phoneSize)
                                    ? 300
                                    : 80,
                              ),
                              Container(
                                height: (MediaQuery.of(context).size.width >
                                        phoneSize)
                                    ? 30
                                    : 30,
                                width: (MediaQuery.of(context).size.width >
                                        phoneSize)
                                    ? 100
                                    : 43,
                              ) // child: LineChartgraphShare())
                            ],
                          ),
                          Row(
                            children: [
                              Text(company.email,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Iconsax.location,
                                // color: Colors.black,
                                size: 11,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                company.locationDescription,
                                // style: STextTheme.lightTextTheme.bodySmall
                                //     ?.copyWith(color: Colors.blue),
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
