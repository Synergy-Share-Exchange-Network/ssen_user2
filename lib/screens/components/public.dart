import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/screens/components/subscribers.dart';
import 'package:ssen_user/widget/share_widget.dart';

import '../../Models/company_profile_model.dart';
import '../../Repository/firebase/key words/collection_name.dart';
import '../../utils/helper_function.dart';

class Public extends StatelessWidget {
  const Public({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = SHelperFunction.isDarkMode(context);
    ScrollController publicScrollController = ScrollController();

    return Scaffold(
        // body: SingleChildScrollView(
        //   controller: publicScrollController,
        //   child: Padding(
        //     padding: EdgeInsets.only(right: 10),
        //     child: Column(
        //       children: [
        //         // ShareWidget(company: null, share: null,),
        //         // ShareWidget(),
        //         // ShareWidget(),
        //         // ShareWidget(),
        //         // ShareWidget(),
        //         // ShareWidget(),
        //         // ShareWidget(),
        //         // ShareWidget(),
        //         // ShareWidget(),
        //         // ShareWidget(),
        //       ],
        //     ),
        //   ),
        // ),
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .orderBy('createdDay', descending: true)
          .where('isPublic', isEqualTo: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        List<CompanyProfileModel> companies = snapshot.data!.docs
            .map((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return CompanyProfileModel.fromMap(data);
            })
            .toList()
            .where((company) => company.shareID != "")
            .toList();

        print(companies.length);

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
              children: companies.map((company) {
            return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection(CollectionName.share)
                    .doc(company.shareID)
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

                  ShareModel share = ShareModel.fromMap(
                      snapshot.data?.data() as Map<String, dynamic>);

                  return ShareWidget(company: company, share: share);
                });
          }).toList()),
        );
      },
    ));
  }
}
