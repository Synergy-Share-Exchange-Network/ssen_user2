import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/announcement_model.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/purchase_model.dart';
import 'package:ssen_user/screens/partial%20screen/process%20requests/payment__waiting.dart';
import 'package:ssen_user/widget/announcement_widget.dart';
import 'package:ssen_user/widget/announcement_with_company_widget.dart';

import '../../Models/user_model.dart';
import '../../Repository/firebase/key words/collection_name.dart';
import '../../provider/user_provider.dart';
import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';

import '../partial screen/process requests/Payment_pending_request.dart';
import '../partial screen/process requests/payment_verified.dart';
import '../partial screen/process requests/request_history.dart';

class Announcment extends StatelessWidget {
  const Announcment({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    UserModel user = Provider.of<UserProvider>(context).getUser;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer:
            (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
        appBar: AppBar(
          backgroundColor:
              dark ? SColors.darkContainer : SColors.lightContainer,
          elevation: 0,
          centerTitle: true,
          bottom: TabBar(
            labelColor: dark ? SColors.white : SColors.black,
            tabs: const [
              Tab(
                child: Text(
                  "Sharehold",
                  style:
                      TextStyle(fontWeight: FontWeight.bold), // Make text bold
                ),
              ),
              Tab(
                child: Text(
                  "Subscribe",
                  style:
                      TextStyle(fontWeight: FontWeight.bold), // Make text bold
                ),
              ),
              Tab(
                child: Text(
                  "General",
                  style:
                      TextStyle(fontWeight: FontWeight.bold), // Make text bold
                ),
              ),
            ],
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(CollectionName.announcement)
                .orderBy('publishDate', descending: true)
                // .where('userID', isEqualTo: user.identification)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<AnnouncementModel> announcements =
                  snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return AnnouncementModel.fromMap(data);
              }).toList();
              List<AnnouncementModel> subcribed = [];
              List<AnnouncementModel> shareHold = [];
              for (var announcement in announcements) {
                if (user.companiesId.contains(announcement.companyID)) {
                  subcribed.add(announcement);
                }
                // if (user..contains(announcement.companyID)) {
                //   subcribed.add(announcement);
                // }

              }

              return TabBarView(children: [
                SingleChildScrollView(
                  child: (announcements.isEmpty)
                      ? const Center(
                          child: Text("No Data"),
                        )
                      : Column(
                          children: subcribed.map((announcment) {
                            return StreamBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                stream: FirebaseFirestore.instance
                                    .collection(CollectionName.organization)
                                    .doc(announcment.companyID)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    print(snapshot.error);
                                    return Text('Error: ${snapshot.error}');
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    ); // Loading indicator while data is loading.
                                  }

                                  CompanyProfileModel company =
                                      CompanyProfileModel.fromMap(snapshot.data
                                          ?.data() as Map<String, dynamic>);
                                  return AnnouncmentWithCompanyWidget(
                                    announcement: announcment,
                                    company: company,
                                  );
                                });
                          }).toList(),
                        ),
                ),
                SingleChildScrollView(
                  child: (announcements.isEmpty)
                      ? const Center(
                          child: Text("No Data"),
                        )
                      : Column(
                          children: subcribed.map((announcment) {
                            return StreamBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                stream: FirebaseFirestore.instance
                                    .collection(CollectionName.organization)
                                    .doc(announcment.companyID)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    print(snapshot.error);
                                    return Text('Error: ${snapshot.error}');
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    ); // Loading indicator while data is loading.
                                  }

                                  CompanyProfileModel company =
                                      CompanyProfileModel.fromMap(snapshot.data
                                          ?.data() as Map<String, dynamic>);
                                  return AnnouncmentWithCompanyWidget(
                                    announcement: announcment,
                                    company: company,
                                  );
                                });
                          }).toList(),
                        ),
                ),
                SingleChildScrollView(
                  child: (announcements.isEmpty)
                      ? const Center(
                          child: Text("No Data"),
                        )
                      : Column(
                          children: announcements.map((announcment) {
                            return StreamBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                stream: FirebaseFirestore.instance
                                    .collection(CollectionName.organization)
                                    .doc(announcment.companyID)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    print(snapshot.error);
                                    return Text('Error: ${snapshot.error}');
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    ); // Loading indicator while data is loading.
                                  }

                                  CompanyProfileModel company =
                                      CompanyProfileModel.fromMap(snapshot.data
                                          ?.data() as Map<String, dynamic>);
                                  return AnnouncmentWithCompanyWidget(
                                    announcement: announcment,
                                    company: company,
                                  );
                                });
                          }).toList(),
                        ),
                ),
              ]);
            }),
      ),
    );
  }
}
