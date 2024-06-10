import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ssen_user/Models/announcement_model.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/faq_model.dart';
import 'package:ssen_user/Models/key_figure_model.dart';
import 'package:ssen_user/Models/testimonial_model.dart';
import 'package:ssen_user/Models/why_invest.dart';
import 'package:ssen_user/Repository/firebase/key%20words/collection_name.dart';
import 'package:ssen_user/screens/components/components/company_profile_home.dart';
import 'package:ssen_user/services/theme/text_theme.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/utils/helper_function.dart';
import 'package:ssen_user/widget/analytics/graph1.dart';

import '../../utils/constants.dart';
import '../components/announcement_company.dart';
import '../components/components/analysis_company.dart';

class Companyprofile extends StatelessWidget {
  static const route = "company_profile";
  // const Companyprofile({super.key});
  const Companyprofile({super.key, required this.company});
  final CompanyProfileModel company;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    // CompanyProfileModel company = Provider.of<UserProvider>(context).getCompany;

    return DefaultTabController(
      length: 3,
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection(CollectionName.organization)
              .doc(company.identification)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              ); // Loading indicator while data is loading.
            }

            CompanyProfileModel newCompany = CompanyProfileModel.fromMap(
                snapshot.data?.data() as Map<String, dynamic>);

            return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection(CollectionName.whyInvest)
                    .orderBy('dateAdded', descending: true)
                    .where('companyId', isEqualTo: newCompany.identification)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  List<WhyInvestModel> whyInvests =
                      snapshot.data!.docs.map((document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return WhyInvestModel.fromMap(data);
                  }).toList();
                  // print("1111111111111111111");
                  // print(whyInvests);
                  // print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

                  return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection(CollectionName.keyFigure)
                          .orderBy('dateAdded', descending: true)
                          .where('companyId',
                              isEqualTo: newCompany.identification)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        List<KeyFigureModel> keyFigure =
                            snapshot.data!.docs.map((document) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          return KeyFigureModel.fromMap(data);
                        }).toList();
                        return StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection(CollectionName.testimonial)
                                .orderBy('dateAdded', descending: true)
                                .where('companyId',
                                    isEqualTo: newCompany.identification)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                print(snapshot.error);
                                return Text('Error: ${snapshot.error}');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              List<TestimonialModel> testimonials =
                                  snapshot.data!.docs.map((document) {
                                Map<String, dynamic> data =
                                    document.data() as Map<String, dynamic>;
                                return TestimonialModel.fromMap(data);
                              }).toList();
                              return StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection(CollectionName.announcement)
                                      .orderBy('publishDate', descending: true)
                                      .where('companyID',
                                          isEqualTo: newCompany.identification)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      print(snapshot.error);
                                      return Text('Error: ${snapshot.error}');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }

                                    List<AnnouncementModel> annaouncements =
                                        snapshot.data!.docs.map((document) {
                                      Map<String, dynamic> data = document
                                          .data() as Map<String, dynamic>;
                                      return AnnouncementModel.fromMap(data);
                                    }).toList();
                                    // print(
                                    //     "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                                    // print(annaouncements);
                                    // print(
                                    //     "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                                    return StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection(CollectionName.faq)
                                            // .orderBy('publishDate',
                                            //     descending: true)
                                            .where('companyId',
                                                isEqualTo:
                                                    newCompany.identification)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            print(snapshot.error);
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          }

                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }

                                          List<FaqModel> faqs = snapshot
                                              .data!.docs
                                              .map((document) {
                                            Map<String, dynamic> data = document
                                                .data() as Map<String, dynamic>;
                                            return FaqModel.fromMap(data);
                                          }).toList();

                                          return Scaffold(
                                            appBar: AppBar(
                                              backgroundColor: dark
                                                  ? SColors.darkContainer
                                                  : SColors.lightContainer,
                                              elevation: 0,
                                              centerTitle: true,
                                              title: Text(
                                                newCompany.name,
                                                style: dark
                                                    ? STextTheme.darkTextTheme
                                                        .headlineSmall
                                                    : STextTheme.lightTextTheme
                                                        .headlineSmall,
                                              ),
                                              // actions: [
                                              //   (MediaQuery.of(context)
                                              //               .size
                                              //               .width >
                                              //           phoneSize)
                                              //       ? Padding(
                                              //           padding:
                                              //               const EdgeInsets
                                              //                   .all(10.0),
                                              //           child: ElevatedButton(
                                              //               onPressed: () {
                                              //                 Navigator.push(
                                              //                   context,
                                              //                   MaterialPageRoute(
                                              //                       builder:
                                              //                           (context) =>
                                              //                               EditCompanyProfile()), // Replace ShareholderDetailPage() with your actual detail page
                                              //                 );
                                              //               },
                                              //               child: Text(
                                              //                   'Edit Profile')),
                                              //         )
                                              //       : ElevatedButton(
                                              //           onPressed: () {
                                              //             Navigator.push(
                                              //               context,
                                              //               MaterialPageRoute(
                                              //                 builder: (context) =>
                                              //                     EditCompanyProfile(),
                                              //               ),
                                              //             );
                                              //           },
                                              //           style: ButtonStyle(
                                              //             padding: MaterialStateProperty.all<
                                              //                     EdgeInsets>(
                                              //                 EdgeInsets.symmetric(
                                              //                     vertical:
                                              //                         15.0,
                                              //                     horizontal:
                                              //                         8)), // Adjust vertical padding
                                              //           ),
                                              //           child: Text(
                                              //               'Edit Profile'),
                                              //         )
                                              // ],
                                              bottom: TabBar(
                                                  labelColor: dark
                                                      ? SColors.lighGrey
                                                      : SColors.darkContainer,
                                                  tabs: const [
                                                    Tab(
                                                      child: Text(
                                                        "Home",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight
                                                                .bold), // Make text bold
                                                      ),
                                                    ),
                                                    Tab(
                                                      child: Text(
                                                        "overview",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight
                                                                .bold), // Make text bold
                                                      ),
                                                    ),
                                                    Tab(
                                                      child: Text(
                                                        "News",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight
                                                                .bold), // Make text bold
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            body: Padding(
                                              padding: (MediaQuery.of(context)
                                                          .size
                                                          .width >
                                                      phoneSize)
                                                  ? EdgeInsets.symmetric(
                                                      horizontal: 0)
                                                  : EdgeInsets.symmetric(
                                                      horizontal: 0),
                                              child: (TabBarView(children: [
                                                CompanyHome(
                                                  whyInvests: whyInvests,
                                                  company: newCompany,
                                                  keyFigure: keyFigure,
                                                  testimonials: testimonials,
                                                  faqs: faqs,
                                                ),
                                                // Container(),
                                                // Container(),
                                                // Anlaytics(),
                                                AnalysisCompany(
                                                    company: company),
                                                AnnouncmentCompany(
                                                  announcements: annaouncements,
                                                ),
                                              ])),
                                            ),
                                          );
                                        });
                                  });
                            });
                      });
                });
          }),
    );
  }
}
