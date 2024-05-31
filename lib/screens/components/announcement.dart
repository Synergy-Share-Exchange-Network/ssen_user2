import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/Models/announcement_model.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/utils/helper_function.dart';
import 'package:ssen_user/widget/news_widget.dart';

import '../../Repository/firebase/key words/collection_name.dart';
import '../../utils/constants/navbar.dart';

class Announcment extends StatelessWidget {
  const Announcment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = SHelperFunction.isDarkMode(context);
    AnnouncementModel announcement = AnnouncementModel(
        identification: "11",
        content:
            "bitcoin is blomming the social and nural netork before someoe else fount it it is coing  my name is birhan I'm writing this from bottm of my heart.",
        companyID: "companyID",
        title: "cripto is reaching 1Billion people",
        images: [""],
        postedBy: "wubet ayalew",
        publishDate: "dec 26 -2025"
        // images: ["asset/logo_image/goat.jpg"]
        );

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
                  (!isDark) ? SColors.lighGrey : SColors.homePageNavBar,

              // elevation: 1,
            ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(CollectionName.organization)
                .orderBy('createdDay', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<AnnouncementModel> announcement =
                  snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return AnnouncementModel.fromMap(data);
              }).toList();

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  children: [
                    ...announcement.map((company) {
                      return NewsWidget(
                        announcement: announcement[1],
                      );
                    }).toList(),
                    TextButton(
                      onPressed: () {
                        // Add your onPressed code here
                      },
                      child: const Text("View all"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
