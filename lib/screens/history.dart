import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/Models/history_model.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/utils/helper_function.dart';
import 'package:ssen_user/widget/history_widget.dart';
import 'package:ssen_user/widget/news_widget.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = SHelperFunction.isDarkMode(context);
    HistoryModel history = HistoryModel(
      identification: "12",
      title: "Habesha Breweries S.C",
      description:
          "You have purchased 500 shares valued at Br. 5,000,000 from Habesha SC. at Dec-19-2023  4:13 PM(EAT).",
      userId: "userId",
      historyDate: '02/04/2023',
    );

    return Scaffold(
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
              leading: IconButton(
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                  icon: const Icon(Icons.menu)),

              // elevation: 1,
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HistoryWidget(
              history: history,
            ),
            HistoryWidget(
              history: history,
            ),
            HistoryWidget(
              history: history,
            ),
            HistoryWidget(
              history: history,
            ),
            HistoryWidget(
              history: history,
            ),
            HistoryWidget(
              history: history,
            ),
            HistoryWidget(
              history: history,
            ),
            HistoryWidget(
              history: history,
            ),
            HistoryWidget(
              history: history,
            ),
            HistoryWidget(
              history: history,
            ),
          ],
        ),
      ),
    );
  }
}
