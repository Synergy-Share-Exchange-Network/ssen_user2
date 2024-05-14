import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/services/theme/text_theme.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/utils/constants/colors.dart';

import 'analytics/graph_share_widget.dart';

class DonationWidget extends StatelessWidget {
  const DonationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: SColors.lighGrey,
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
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('asset/logo_image/goat.jpg'),
              ),
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
                          "Mekedoniya  A. ",
                          style: STextTheme.lightTextTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width > phoneSize)
                              ? 300
                              : 80,
                        ),
                        Container(
                          height:
                              (MediaQuery.of(context).size.width > phoneSize)
                                  ? 30
                                  : 30,
                          width: (MediaQuery.of(context).size.width > phoneSize)
                              ? 100
                              : 43,
                        ) // child: LineChartgraphShare())
                      ],
                    ),
                    Row(
                      children: [
                        Text("home for the elderly and mentally disabeld",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
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
                          "Addis Ababa, Ethiopia",
                          // style: STextTheme.lightTextTheme.bodySmall
                          //     ?.copyWith(color: Colors.blue),
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(3)),
                            child: const Center(
                              child: Text("Donate Now",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10)),
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
      ),
    );
  }
}
