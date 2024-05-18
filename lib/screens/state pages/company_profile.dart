import 'package:flutter/material.dart';

import 'package:ssen_user/utils/constants/colors.dart';

import '../../Models/company_profile_model.dart';
import '../../utils/helper_function.dart';
import '../components/company_profile_home.dart';
import '../components/company_profile_news.dart';
import '../components/company_profile_overview.dart';

class Companyprofile extends StatelessWidget {
  const Companyprofile({super.key, required this.company});
  final CompanyProfileModel company;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: dark ? Colors.black : Colors.white,
          elevation: 0,
          title: Text(
            company.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [Icon(Icons.search)],
          bottom: const TabBar(labelColor: Colors.blue, tabs: [
            Tab(
              text: "Home",
            ),
            Tab(
              text: "Overview",
            ),
            Tab(
              text: "News",
            ),
          ]),
        ),
        body: (TabBarView(children: [
          CompanyHome(
            company: company,
          ),
          CompanyOverview(
            company: company,
          ),
          CompanyNews(
            company: company,
          ),
        ])),
      ),
    );
  }
}
