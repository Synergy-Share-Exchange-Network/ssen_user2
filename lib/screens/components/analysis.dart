import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/utils/constants.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';
import '../../widget/analytics/graph1.dart';
import '../../widget/analytics/graph2.dart';

class Anlaytics extends StatelessWidget {
  const Anlaytics({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
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
                  dark ? SColors.darkContainer : SColors.lightContainer

              // elevation: 1,
              ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LineChartgraph(),
          ],
        ),
      ),
    );
  }
}
