import 'package:flutter/material.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';

import '../components/company_profile_home.dart';
import '../components/company_profile_news.dart';
import '../components/company_profile_overview.dart';
import '../partial screen/process requests/Payment_pending_request.dart';
import '../partial screen/process requests/payment_verified.dart';
import '../partial screen/process requests/request_history.dart';

class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer:
            (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:
              dark ? SColors.darkContainer : SColors.lightContainer,
          elevation: 0,
        
          centerTitle: true,
          bottom: TabBar(
            labelColor: dark ? SColors.white : SColors.black,
            tabs: const [
              Tab(
                child: Text(
                  "Pending ",
                  style:
                      TextStyle(fontWeight: FontWeight.bold), // Make text bold
                ),
              ),
              Tab(
                child: Text(
                  "waiting payment",
                  style:
                      TextStyle(fontWeight: FontWeight.bold), // Make text bold
                ),
              ),
              Tab(
                child: Text(
                  "waiting verifay",
                  style:
                      TextStyle(fontWeight: FontWeight.bold), // Make text bold
                ),
              ),
              Tab(
                child: Text(
                  "History",
                  style:
                      TextStyle(fontWeight: FontWeight.bold), // Make text bold
                ),
              ),
            ],
          ),
        ),
        body: (TabBarView(children: [
          PaymentPendingRequest(),
          PaymentVerified(),
          RequestHistory(),
          RequestHistory()
        ])),
      ),
    );
  }
}
