import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ssen_user/services/theme/text_theme.dart';
import 'package:ssen_user/utils/constants/colors.dart';

import '../screens/share_detail.dart';
import '../screens/state pages/company_profile.dart';
import '../utils/constants.dart';
import '../utils/helper_function.dart';
import 'analytics/graph1.dart';
import 'analytics/graph_share_widget.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = SHelperFunction.isDarkMode(context);
    return Card(
      elevation: 0.5,
      color: isDark ? SColors.darkContainer : SColors.lightContainer,
      child: Container(
        height: 110,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(5),
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
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => Companyprofile())));
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('asset/logo_image/goat.jpg'),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ShareDetail())));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Habesha Breweries ",
                            style: isDark
                                ? STextTheme.darkTextTheme.headlineSmall
                                : STextTheme.lightTextTheme.headlineSmall),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width > phoneSize)
                              ? 200
                              : 50,
                        ),
                        Container(
                            height:
                                (MediaQuery.of(context).size.width > phoneSize)
                                    ? 30
                                    : 30,
                            width:
                                (MediaQuery.of(context).size.width > phoneSize)
                                    ? 100
                                    : 20,
                            child: LineChartgraphShare())
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.location,
                          // color: Colors.black,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Addis Ababa, Ethiopia",
                          // style: STextTheme.lightTextTheme.bodySmall
                          //     ?.copyWith(color: Colors.blue),
                          style: isDark
                              ? STextTheme.darkTextTheme.bodySmall
                              : STextTheme.lightTextTheme.bodySmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width > phoneSize)
                              ? 550
                              : 270,
                          child: LinearPercentIndicator(
                            animation: true,
                            animationDuration: 2000,
                            lineHeight: 6,
                            percent: 0.8,
                            progressColor: Colors.green,
                            backgroundColor: Colors.green.shade200,
                          ),
                        ),
                      ],
                    ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 151, 213, 242),
                          borderRadius: BorderRadius.circular(3)),
                      child: Text("latest price: Br 500",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
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
